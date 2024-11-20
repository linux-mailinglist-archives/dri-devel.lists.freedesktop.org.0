Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8A69D3B1E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA25898F5;
	Wed, 20 Nov 2024 12:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ZwR0mKKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00F610E75E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:52:30 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e388ff24cfeso3258096276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 04:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732107149; x=1732711949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpniUB5o/fPazy2F/pvQQGg6mhVCDrZ2tKVVHHzL4Eg=;
 b=ZwR0mKKxR9jV3uLkOeSUl+86+5QWWuUeFMhNaYGqcQ2oy9CmobD5d8vMmKFL+cFSrp
 2VGN1t5NnbzSwsF85I94yikivrNCI7go1PWF5uQdhf5m7ULLGcFvYZZ5V+N9m6FHOP47
 WJ1tEMnLA5V/EKBxs9Wx5c+4nRFRMLr2QiDFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732107149; x=1732711949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZpniUB5o/fPazy2F/pvQQGg6mhVCDrZ2tKVVHHzL4Eg=;
 b=XWnluPTGoPWUo41zAJVrdfkQMHeBYcE28N2JjkW77yo9VY3yX3M7DWocCIJ30aM6tq
 /IWQB4LLY1SA1t8Du6NVAACQvyA1jDqJXVWUXDN+bsmyU+2HmbQUc89F022p1DTw4Xge
 Ke5dQ2SQWulWtsimxi4A5WjTcxH0TTJGcI+3iLNlH32plG0qdJ9Q6ookGkEVKuplkVu9
 FJd164qZIZIm5ukIFku9tUXjfUmTy1Cl76UmiP0KZQWOAfimkp+IqyjdnwNT5U49/s2u
 1xXozp5nOSxEsjZxLyEiyUiVqe184/wECPdyrnI4sN2S3bsz4ZnOFa3FbmGkDVet2iWZ
 C3AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoMShHd+zVHVFVSmeDdx49qPaK9D7WBY77ROOB21VLqe+4hoIUFoPEcrrWtkm7IKpFtEFfkPw2ufc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBPFnMIeD09KWpfEmy2JsJ/eww7tyYDkoorWQoqofgZXB2Jw2P
 tTrZj/x99SX9GquJk6M+gg6nEMVw61LBN0qTNUizex+cymsISqQx22Hf1vU9qi0p/5e+bRPPN40
 jcpXl0wTKAMVoVG4eh/9brqqAWilHrGpDqiXJ
X-Google-Smtp-Source: AGHT+IHEurChf8CBegBDAj2NTzN3f97GbLAZr1qq40E/7qmbA3o2L6cL+igslOkHiz0a5+uQxhImeFWxxYLa+6CrjfA=
X-Received: by 2002:a05:6902:e04:b0:e38:b2ba:829c with SMTP id
 3f1490d57ef6-e38cb56f773mr2210742276.20.1732107149403; Wed, 20 Nov 2024
 04:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de> <878qte2oj3.fsf@intel.com>
In-Reply-To: <878qte2oj3.fsf@intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 20 Nov 2024 07:52:18 -0500
Message-ID: <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Ian Forbes <ian.forbes@broadcom.com>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 20, 2024 at 5:22=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi
> >
> >
> > Am 19.11.24 um 20:40 schrieb Ian Forbes:
> >> Most compositors are using a change in EDID as an indicator to
> >> refresh their connector information on hotplug regardless of whether t=
he
> >> connector was previously connected. Originally the hotplug_mode_update
> >> property was supposed to provide a hint to userspace to always refresh
> >> connector info on hotplug as virtual devices such as vmwgfx and QXL
> >> changed the connector without disconnecting it first. This was done to
> >> implement Autofit. Unfortunately hotplug_mode_update was not widely
> >> adopted and compositors used other heuristics to determine whether to
> >> refresh the connector info.
> >>
> >> Currently a change in EDID is the one heuristic that seems to be unive=
rsal.
> >> No compositors currently implement hotplug_mode_update correctly or at=
 all.
> >> By implementing a fake EDID blob we can ensure that our EDID changes o=
n
> >> hotplug and therefore userspace will refresh the connector info so tha=
t
> >> Autofit will work. This is the approach that virtio takes.
> >>
> >> This also removes the need to add hotplug_mode_update support for all
> >> compositors as traditionally this niche feature has fallen on
> >> virtualized driver developers to implement.
> >
> > Why don't you fix the compositors instead?
> >
> > I feel like NAK'ing this patch. The code itself is not so much a
> > problem, but the commit message.
>
> Oh, I think the code is problematic too.
>
> Please avoid all struct edid based interfaces, in this case
> drm_connector_update_edid_property(). They will be removed in the
> future, and adding more is counter-productive. Everything should be
> struct drm_edid based going forward.
>
> Of course, actually grafting the EDID needs struct edid. And that's kind
> of annoying too. Do we really want to spread the EDID details all over
> the place? This one combines drm_edid.h structs and magic numbers in a
> jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
> though that's a long road. But we've made a lot of progress towards it,
> there aren't that many places left that directly look at the guts of
> EDID, and most of it is centralized in drm_edid.c.
>
> Of course, not using the standard drm_edid_read* interfaces also lacks
> on features such as providing the EDID via the firmware loader or
> debugfs, which can be handy for testing and debugging, but that's a
> minor issue.
>
> > Maybe it resolves problems with
> > compositors, but it is a step backwards for the overall ecosystem. If
> > the connector changes, your driver should increment the epoch counter.
> > [1] That will send a hotplug event to userspace. The EDID alone does no=
t
> > say anything about connector status.
>
> Yeah, unplugging and replugging the same display with the same EDID
> isn't a problem for other drivers, and they don't have to do this kind
> of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
> hotplugs better?

I don't think that's what Ian is trying to fix. There's two different issue=
s:
1) The code using struct edid which is frowned upon.
2) The virtualized drivers not behaving like real GPU's and thus
breaking userspace.

vmwgfx and qxl do not provide edid at all. It's null. But every time
someone resizes a host side window in which the para-virtualized
driver is displaying, the preferred mode changes. Userspace kept
checking whether the edid changes on each hotplug event to figure out
if it got new modes and refresh if it noticed that edid changed.
Because on qxl and vmwgfx the edid never changes (it's always null)
Dave added hotplug_mode_update property which only qxl and vmwgfx send
and its presence indicates that the userspace should refresh modes
even if edid didn't change.

Because that property is only used by qxl and vmwgfx everyone gets it
wrong. The property was specifically added to fix gnome and Ian
noticed that currently even gnome is broken:
https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-=
kms-connector.c#L940
hotplug_mode_update doesn't change, it's just a flag that indicates
that userspace needs a  full mode rescan.

virtiogpu deals with it by providing a fake edid hostside and not
using hotplug_mode_update.

So there are two different arguments to be made with this patch:
1) "You should provide the fake edid hostside like virtiogpu". But
that means that we'd still be using the broken hotplug_mode_update on
everything that's been released.
2) "You should fix all of userspace". Which is not realistic because
vast majority of people are not running on qxl or vmwgfx so basically
everyone either doesn't support hotplug_mode_update at all (e.g. kwin,
window maker, weston) or they handle it incorrectly (e.g. mutter).
It's not terribly realistic to be monitoring every compositor out
there for breaking changes.

I don't love the code and I'm not excited about putting this in the
driver, but also I don't see a better way of fixing the core issue
(which is that some virtualized drivers just do not behave like real
gpu's).

z
