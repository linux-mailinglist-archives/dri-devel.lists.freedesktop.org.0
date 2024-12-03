Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350BD9E2782
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867C810E472;
	Tue,  3 Dec 2024 16:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RaNyZVGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AE389CAD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 16:32:08 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso73068741fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733243527; x=1733848327; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UFHiJa3AMDhRniksVJKi0pwmhYIQVKTK0JUgTqaDvsE=;
 b=RaNyZVGgNQdYskLnx3sOh3qHsd80pYIvwLppBGwRsSTxnWSc6IqpipBFB9+P+kSoH8
 yvEaXJJCAvKlfHGaAJHEgwLmxhW65BVjwDm6Rgo5q5B7PjbmtQS7u/rr8kN+O+NmlalG
 VGde2hRnTzeI5Em0sQk8y4Dm5TQqKg5t2lTOQPe9opjLCmRA7Lfi1M9d0Gpy5pSunlge
 9InYwPjq4u9f243k8/WAFtC81IQsbEMI1eigkzwLKchI0IOd/W7rFoNXC9eq6P51PZn6
 XhV/NxvU2EBJcfF3TJBd6khxnjqEvTU80cVSq3QoOY3IAB0dyGbGH64b/LGYg2d+5isb
 1V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733243527; x=1733848327;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UFHiJa3AMDhRniksVJKi0pwmhYIQVKTK0JUgTqaDvsE=;
 b=xAZbYspZidiD1+0jWXe2eyuHydUPd5uQdupcayJkSCoGNELEqMlVmLn2KC6meUEBVR
 kg3kXmF4le+2tkwJXOFHmpT/kwVgImF0vGyb+yYEhI277Q7mIlRfTs/Ti0bO0FBtZ0T6
 i8HdTOrpm9kyEv2oK1PuwMbkWCJZsHIRbdubZg0MVIL2dF7nV7PAYd5RTOwh3V/Q0TKm
 MHfq9X0Q4NdfupOXFuMcjpIgUkUjwEm7FCSEHV4ZBd0oE6Yo1rk/xVXPnUV8iWDggfEK
 kW0AZMwGj8sYpWh4WGtqQWe5r70EY4EYYTPs7nNzxU/qM77vNBeELU7GRgDoDJV2x3nx
 0yDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB/YT5slBgASAZfSfy+lKtmAV/iqoKJJgwzeETpedupWCd9910wL5uoeCcYprZTRwFegJYTG9j1nQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaub7vIs0QPQYtDywVh7rjWfEOVHgKMtmjN0KeC/zTAM2kNXdd
 nFIBNGaRFGBeq1ExR8XMaxcYtURWAxpiIMcp8BGgnqCTup5NO1gF
X-Gm-Gg: ASbGncsyo4EkNyHlkOPhsK3TJ7llQJezpw/y7f11h/HV5sM4twv3fb/3+CPqKwAKr+e
 nRmfVFXcKP8dvmbkNeCJKvSD1vixQaBghVHre6gUeqxO2Zjb3eeOIWVC2RYAfTzI1PBkX5GveCW
 PVOcGenNlDCh8dGa5vJ9JyFcx39AQZunr5cvwAJREaZsQoC/5VQLkXTAwLR+9q3OAv2bj1ObnQv
 5zhtzByccx4p4SMXVsxSKIHh7spc8HJzQyigTJHHKTrYpg63UVv+Bs2jG8i68WS59MJz2GEOR+g
 5I0OVy4ANjis
X-Google-Smtp-Source: AGHT+IHM8qckEorWW7ju/XiH2kC8pgoyOAOfUQgpNeyLw5XQN3LSBtVy9xztlnDExMVuzI/oMQOSEA==
X-Received: by 2002:a2e:b8d2:0:b0:300:8de:d2a4 with SMTP id
 38308e7fff4ca-30009c52bacmr22726131fa.17.1733243526231; 
 Tue, 03 Dec 2024 08:32:06 -0800 (PST)
Received: from gmail.com (host-95-193-101-79.mobileonline.telia.com.
 [95.193.101.79]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbeafeesm16936121fa.40.2024.12.03.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 08:32:05 -0800 (PST)
Date: Tue, 3 Dec 2024 17:32:03 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
Message-ID: <Z08ygwwkmNp8dnHy@gmail.com>
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de>
 <878qte2oj3.fsf@intel.com>
 <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
 <Z08qdJUuerXOV-dR@gmail.com>
 <CABQX2QOy0sD3QrmG-hxdDgwTrffz0tnPzqvs2BhORQ1w2pTgww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QOy0sD3QrmG-hxdDgwTrffz0tnPzqvs2BhORQ1w2pTgww@mail.gmail.com>
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

On Tue, Dec 03, 2024 at 11:27:52AM -0500, Zack Rusin wrote:
> On Tue, Dec 3, 2024 at 10:57 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> >
> > On Wed, Nov 20, 2024 at 07:52:18AM -0500, Zack Rusin wrote:
> > > On Wed, Nov 20, 2024 at 5:22 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > >
> > > > On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > Hi
> > > > >
> > > > >
> > > > > Am 19.11.24 um 20:40 schrieb Ian Forbes:
> > > > >> Most compositors are using a change in EDID as an indicator to
> > > > >> refresh their connector information on hotplug regardless of whether the
> > > > >> connector was previously connected. Originally the hotplug_mode_update
> > > > >> property was supposed to provide a hint to userspace to always refresh
> > > > >> connector info on hotplug as virtual devices such as vmwgfx and QXL
> > > > >> changed the connector without disconnecting it first. This was done to
> > > > >> implement Autofit. Unfortunately hotplug_mode_update was not widely
> > > > >> adopted and compositors used other heuristics to determine whether to
> > > > >> refresh the connector info.
> > > > >>
> > > > >> Currently a change in EDID is the one heuristic that seems to be universal.
> > > > >> No compositors currently implement hotplug_mode_update correctly or at all.
> > > > >> By implementing a fake EDID blob we can ensure that our EDID changes on
> > > > >> hotplug and therefore userspace will refresh the connector info so that
> > > > >> Autofit will work. This is the approach that virtio takes.
> > > > >>
> > > > >> This also removes the need to add hotplug_mode_update support for all
> > > > >> compositors as traditionally this niche feature has fallen on
> > > > >> virtualized driver developers to implement.
> > > > >
> > > > > Why don't you fix the compositors instead?
> > > > >
> > > > > I feel like NAK'ing this patch. The code itself is not so much a
> > > > > problem, but the commit message.
> > > >
> > > > Oh, I think the code is problematic too.
> > > >
> > > > Please avoid all struct edid based interfaces, in this case
> > > > drm_connector_update_edid_property(). They will be removed in the
> > > > future, and adding more is counter-productive. Everything should be
> > > > struct drm_edid based going forward.
> > > >
> > > > Of course, actually grafting the EDID needs struct edid. And that's kind
> > > > of annoying too. Do we really want to spread the EDID details all over
> > > > the place? This one combines drm_edid.h structs and magic numbers in a
> > > > jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
> > > > though that's a long road. But we've made a lot of progress towards it,
> > > > there aren't that many places left that directly look at the guts of
> > > > EDID, and most of it is centralized in drm_edid.c.
> > > >
> > > > Of course, not using the standard drm_edid_read* interfaces also lacks
> > > > on features such as providing the EDID via the firmware loader or
> > > > debugfs, which can be handy for testing and debugging, but that's a
> > > > minor issue.
> > > >
> > > > > Maybe it resolves problems with
> > > > > compositors, but it is a step backwards for the overall ecosystem. If
> > > > > the connector changes, your driver should increment the epoch counter.
> > > > > [1] That will send a hotplug event to userspace. The EDID alone does not
> > > > > say anything about connector status.
> > > >
> > > > Yeah, unplugging and replugging the same display with the same EDID
> > > > isn't a problem for other drivers, and they don't have to do this kind
> > > > of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
> > > > hotplugs better?
> > >
> > > I don't think that's what Ian is trying to fix. There's two different issues:
> > > 1) The code using struct edid which is frowned upon.
> > > 2) The virtualized drivers not behaving like real GPU's and thus
> > > breaking userspace.
> > >
> > > vmwgfx and qxl do not provide edid at all. It's null. But every time
> > > someone resizes a host side window in which the para-virtualized
> > > driver is displaying, the preferred mode changes. Userspace kept
> > > checking whether the edid changes on each hotplug event to figure out
> > > if it got new modes and refresh if it noticed that edid changed.
> > > Because on qxl and vmwgfx the edid never changes (it's always null)
> > > Dave added hotplug_mode_update property which only qxl and vmwgfx send
> > > and its presence indicates that the userspace should refresh modes
> > > even if edid didn't change.
> > >
> > > Because that property is only used by qxl and vmwgfx everyone gets it
> > > wrong. The property was specifically added to fix gnome and Ian
> > > noticed that currently even gnome is broken:
> > > https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-kms-connector.c#L940
> > > hotplug_mode_update doesn't change, it's just a flag that indicates
> > > that userspace needs a  full mode rescan.
> >
> > The linked line just means the property value itself not changing
> > doesn't result in a full compositor side monitor reconfiguration.
> 
> Right, that's exactly the point I'm making :) The property isn't used
> correctly because the full-rescan is expected when that property is
> present, not if it changed.

Well, a full rescan did happen, and the linked code only determines if
anything actually did change, including currently advertised modes, that
will have any potential effect on the final monitor configuration.

So I'm still unsure what the problem you are seeing is. If any mode
changed in any way, after having freshly queried drm for all connector
associated state, we'd do the monitor reconfiguration.


Jonas

> 
> z


