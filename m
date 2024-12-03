Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDAC9E252E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E1410EA7F;
	Tue,  3 Dec 2024 15:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZTpIKVpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983C010EA7E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 15:57:46 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53de035ea13so5897710e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733241465; x=1733846265; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mnb7uPsU9r3loHj1crOFHXy1cRSjjpWxijx02Zmv/9o=;
 b=ZTpIKVpiU1TPpMbjXiDU0yQW2zL62zVIP2jlfUkzdVFqsOH8UpnNn+40OhH0Fmdjtq
 rl8h2SrmSnFHOJr9S+3OvqQoXOPeh7D1kJxuTSfkCaYSspBrad9F0ekEogMYS0SQEfad
 91A6UIRqQt3CPrR5wPJPN0R3uJB+BIOnC/hIdNoF39IgyOhi6qwsRPibcE/oYj4J+37Z
 GpXaXkhc8vtCE26pW/51Ujw+UkWFkzj2gY4TnC8MRRSx4ztWb8WJC5blGVNkJvtGZ8ct
 19KICI3hbqp7HB90iXHeChNvAm5W3kgqtIMZA0FmjLCx/N4XD8sDW1U8eoecfU/zQzbo
 NE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733241465; x=1733846265;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mnb7uPsU9r3loHj1crOFHXy1cRSjjpWxijx02Zmv/9o=;
 b=doZBI1NOE+GilAaGQsbAkj/cWLFRlChrBSr4kmmJxE7f6+JytmpKlX/fy33ayH/q2a
 THtWSvgrxD4m9EV9mgtI/3JZStTZAhlWJCEP8rI0NpEP65JhA+nXVERpjEOJAW0LfyI+
 RcAUTRWd1tIH3Vz27N+13P6FwdrP7W06z0rt/gYNAeVryyH+QPzIoqgUkeOBCyYYE3km
 Zuczu9wxczRFr0tCFiTWAUEwCN+W1tsd25NB2lX/hlH+vVEnhf5tSBYvlgsgRvQqQ5Id
 0EYsFvonlGZ0CQJ0RfxH3rJ3wB1WOZ5JJJWc1YF3Hl9oOpQFubDx37KZFAb35ZPbU/cJ
 jqTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3i6ytwwfnPIc+aKayOCuZJUtxoG3LgIIlbn9MA6dS0PtfrflAsKLAKJR5dmwOTIn3j5y2/Gf4BYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4Sedq8CTeq4gHctTJdPE/2Yf8HSeaNYFmbqb+ibS56do0XQbm
 zL8v5JMFWLUmtf9+8JlpfxdXFdD1PPuGmNqGbVBIWzchnKk8cSbLAjPT8Kcw
X-Gm-Gg: ASbGncsFb6L52rilAzGyFM9o0KWe9Ley5pWTKFv9evJa59GNYZDLG3d6swfPbWMkCcm
 i5zBdENbSDfRVwjLivwwbOef3QX1uPvKosUk5F3zvjTOtVFBWmBniCjl3UET4V8BtuoU3/uNGfs
 wMdZZ7UjJPeVa0sgbG+eTwF+kp248sDe4gdZxfgJurtu8nshDpJVKzX/UZO24tSeyZ2HgwnwH2C
 jLrSqJEXiRXhzucT2KNndNHNSU8NHQAd63BwaBO8eyzxg+/TNE9Yyk8yNuIwGn5clXbRJByhhGk
 vpP7bEZEo7ZR
X-Google-Smtp-Source: AGHT+IHsRO4/1a9gi4etj6aClnzjtq+H3P+RjDQ49BtjYp50YxM4KDZ3eXdbM39EZT4F6xy39dwB3A==
X-Received: by 2002:a05:6512:6d6:b0:53d:d405:14a5 with SMTP id
 2adb3069b0e04-53e129f0032mr1577364e87.11.1733241464404; 
 Tue, 03 Dec 2024 07:57:44 -0800 (PST)
Received: from gmail.com (host-95-193-101-79.mobileonline.telia.com.
 [95.193.101.79]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1b220d7dsm105683e87.104.2024.12.03.07.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 07:57:43 -0800 (PST)
Date: Tue, 3 Dec 2024 16:57:40 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
Message-ID: <Z08qdJUuerXOV-dR@gmail.com>
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de>
 <878qte2oj3.fsf@intel.com>
 <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
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

On Wed, Nov 20, 2024 at 07:52:18AM -0500, Zack Rusin wrote:
> On Wed, Nov 20, 2024 at 5:22 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Hi
> > >
> > >
> > > Am 19.11.24 um 20:40 schrieb Ian Forbes:
> > >> Most compositors are using a change in EDID as an indicator to
> > >> refresh their connector information on hotplug regardless of whether the
> > >> connector was previously connected. Originally the hotplug_mode_update
> > >> property was supposed to provide a hint to userspace to always refresh
> > >> connector info on hotplug as virtual devices such as vmwgfx and QXL
> > >> changed the connector without disconnecting it first. This was done to
> > >> implement Autofit. Unfortunately hotplug_mode_update was not widely
> > >> adopted and compositors used other heuristics to determine whether to
> > >> refresh the connector info.
> > >>
> > >> Currently a change in EDID is the one heuristic that seems to be universal.
> > >> No compositors currently implement hotplug_mode_update correctly or at all.
> > >> By implementing a fake EDID blob we can ensure that our EDID changes on
> > >> hotplug and therefore userspace will refresh the connector info so that
> > >> Autofit will work. This is the approach that virtio takes.
> > >>
> > >> This also removes the need to add hotplug_mode_update support for all
> > >> compositors as traditionally this niche feature has fallen on
> > >> virtualized driver developers to implement.
> > >
> > > Why don't you fix the compositors instead?
> > >
> > > I feel like NAK'ing this patch. The code itself is not so much a
> > > problem, but the commit message.
> >
> > Oh, I think the code is problematic too.
> >
> > Please avoid all struct edid based interfaces, in this case
> > drm_connector_update_edid_property(). They will be removed in the
> > future, and adding more is counter-productive. Everything should be
> > struct drm_edid based going forward.
> >
> > Of course, actually grafting the EDID needs struct edid. And that's kind
> > of annoying too. Do we really want to spread the EDID details all over
> > the place? This one combines drm_edid.h structs and magic numbers in a
> > jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
> > though that's a long road. But we've made a lot of progress towards it,
> > there aren't that many places left that directly look at the guts of
> > EDID, and most of it is centralized in drm_edid.c.
> >
> > Of course, not using the standard drm_edid_read* interfaces also lacks
> > on features such as providing the EDID via the firmware loader or
> > debugfs, which can be handy for testing and debugging, but that's a
> > minor issue.
> >
> > > Maybe it resolves problems with
> > > compositors, but it is a step backwards for the overall ecosystem. If
> > > the connector changes, your driver should increment the epoch counter.
> > > [1] That will send a hotplug event to userspace. The EDID alone does not
> > > say anything about connector status.
> >
> > Yeah, unplugging and replugging the same display with the same EDID
> > isn't a problem for other drivers, and they don't have to do this kind
> > of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
> > hotplugs better?
> 
> I don't think that's what Ian is trying to fix. There's two different issues:
> 1) The code using struct edid which is frowned upon.
> 2) The virtualized drivers not behaving like real GPU's and thus
> breaking userspace.
> 
> vmwgfx and qxl do not provide edid at all. It's null. But every time
> someone resizes a host side window in which the para-virtualized
> driver is displaying, the preferred mode changes. Userspace kept
> checking whether the edid changes on each hotplug event to figure out
> if it got new modes and refresh if it noticed that edid changed.
> Because on qxl and vmwgfx the edid never changes (it's always null)
> Dave added hotplug_mode_update property which only qxl and vmwgfx send
> and its presence indicates that the userspace should refresh modes
> even if edid didn't change.
> 
> Because that property is only used by qxl and vmwgfx everyone gets it
> wrong. The property was specifically added to fix gnome and Ian
> noticed that currently even gnome is broken:
> https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-kms-connector.c#L940
> hotplug_mode_update doesn't change, it's just a flag that indicates
> that userspace needs a  full mode rescan.

The linked line just means the property value itself not changing
doesn't result in a full compositor side monitor reconfiguration. A few
lines below it also checks whether the advertised modes changed in any
way, and if they did, trigger a monitor reconfiguration, so it's not
clear what is not working, since it should have done a full mode rescan,
and reconfigured everything if anything changed.


Jonas

> 
> virtiogpu deals with it by providing a fake edid hostside and not
> using hotplug_mode_update.
> 
> So there are two different arguments to be made with this patch:
> 1) "You should provide the fake edid hostside like virtiogpu". But
> that means that we'd still be using the broken hotplug_mode_update on
> everything that's been released.
> 2) "You should fix all of userspace". Which is not realistic because
> vast majority of people are not running on qxl or vmwgfx so basically
> everyone either doesn't support hotplug_mode_update at all (e.g. kwin,
> window maker, weston) or they handle it incorrectly (e.g. mutter).
> It's not terribly realistic to be monitoring every compositor out
> there for breaking changes.
> 
> I don't love the code and I'm not excited about putting this in the
> driver, but also I don't see a better way of fixing the core issue
> (which is that some virtualized drivers just do not behave like real
> gpu's).
> 
> z
