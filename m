Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BC79D42CE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 20:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2952B10E17B;
	Wed, 20 Nov 2024 19:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Ajw4PRFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3754510E065
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 19:59:15 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38246333e12so66292f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732132753; x=1732737553;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3pte7cwv6DSdK6e5IxmejsCXdriL4Ba8Sr+OKxyoViY=;
 b=Ajw4PRFFDFD7P41npxAkNsfDX2owTk2+1LtJSXqWFrx0xvev4rYNsGzesvbrec0EGr
 zHvL+UIfbwK1k3UHMz+V+9ZjRk/4UjPqYrmqTCwXC8Tec7kz7as1+dg0b+yvxR2TWLtN
 i77fMmaeyotkjkNC9Qcp+BrYk4NQmpyRX/D14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732132753; x=1732737553;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3pte7cwv6DSdK6e5IxmejsCXdriL4Ba8Sr+OKxyoViY=;
 b=nGNGGcBdM0npdceej1FjO8pvTg+Q0Qx4JmIUHKI35XRnnMRK0O9GafZ/TnEcIteDo4
 uIAWj80hB1voJp8qFffSb/+FON9CuSNaSCF1l+yB6TKcse66oyrYUXHMe+jlXW2vGtSu
 Ku/gFihL392oJjNs4Ooytya3F3R9W1a3ULKk2Dnv1JMiUbUpZE2uwPS3v+K2+1XjL3hF
 x00j44UVcLr5t2KWhTsUwKbO9jp7s/USmhG7vDbwbiUKkfPbdBwZuubKuEskAu9XNfu/
 1cab8G98lnsi46z+FgRVIYC8LVXoxoW8kw/Nd6KeaJPO/YG42XEBM3T1Um7ONuqQxGRn
 ySLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx0CqRxB+fW81h+zBzKO5QXn8FeLz9JGP1pGnBS8rARUlU5edDA0vyKIL3og46TXSVCv0QirYrgn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2EPjJLcFLvytWrj0BWPpDBSU+ei/pC+ga8tP6JLvsbbqiAzh4
 erYA9bTWPst3PrrWNcK0JIxbm8sIwbgK/UzAqzHLzQwAd/NLgqH5fuSen7ImhsfCTuODD1bVxik
 UjRT6Ui4WTQ9aApCwJiJUo+b3+nrjwQqohjb/
X-Google-Smtp-Source: AGHT+IHogXVvf8z0gmM2fFiRFnOr0ZtP8NwWO3Nf5oy2bOzwX/1UU7k7WK/HQ1u95uUFC12rTL6MIyWGAjKapckJUUc=
X-Received: by 2002:a5d:648a:0:b0:382:3c1d:ebc9 with SMTP id
 ffacd0b85a97d-38254b1b48emr4091067f8f.49.1732132753258; Wed, 20 Nov 2024
 11:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de> <878qte2oj3.fsf@intel.com>
In-Reply-To: <878qte2oj3.fsf@intel.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Wed, 20 Nov 2024 13:59:01 -0600
Message-ID: <CAO6MGtiP4iCwLh1ZbYWqCwCgqzcgTnX=bZ25ow4ED8hc1JdGKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/alternative; boundary="000000000000766f2506275d95e1"
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

--000000000000766f2506275d95e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 4:22=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com>
wrote:
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

drm_edid isn't exported so we can't use it. I know you've read the EDID
spec so complaining about the magic numbers is silly.
I didn't choose to make the whole spec based on bizarrely packed 10 and 12
bit numbers, they are unavoidable.

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
>
> And preferrably let the EDID functions handle epoch counter updates
> instead of doing it yourself, if at all possible.
>
> BR,
> Jani.
>

You're both missing the fact that virtual devices never disconnect active
displays. We don't have to do a disconnect/connect cycle like a physical
monitor and we wouldn't want to because it would be poor user experience.
The issue is not sending the hotplug event, it's that userspace will ignore
hotplug events on connectors that were previously connected because they
assume a disconnect/connect cycle must occur for changes to occur. The
whole point of hotplug_mode_update was as a hint to userspace that the
display can be "re-plugged" without a disconnect first and to always rescan
the connector for changes on hotplug.

Currently compositors are taking an arbitrary set of connector properties
that they've organically collected over the years and doing a diff to
trigger a refresh in the modes/display layout. EDID is the only property
that they universally agree should trigger a display layout change. The
fact that Autofit works on any compsitors using vmwgfx, qxl, or virtio is
completely by accident.

EDID is also a standardized connector property so it's not really fair to
say that all devices should export this property and then when we fix our
deficiency to block it. Now that it's standardized it is part of the uapi
and if userspace does weird things with it it's not really our concern. The
fact that it's standardized is also likely the reason it is being used in
such a fashion.

Ian,

--000000000000766f2506275d95e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Nov 20, 2024 at 4:22=E2=80=AFAM Jani Nikul=
a &lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.nikula@linux.inte=
l.com</a>&gt; wrote:<br>&gt;<br>&gt; Please avoid all struct edid based int=
erfaces, in this case<br>&gt; drm_connector_update_edid_property(). They wi=
ll be removed in the<br>&gt; future, and adding more is counter-productive.=
 Everything should be<br>&gt; struct drm_edid based going forward.<br>&gt;<=
br>&gt; Of course, actually grafting the EDID needs struct edid. And that&#=
39;s kind<br>&gt; of annoying too. Do we really want to spread the EDID det=
ails all over<br>&gt; the place? This one combines drm_edid.h structs and m=
agic numbers in a<br>&gt; jumble. I&#39;m kind of hoping we&#39;d get rid o=
f driver usage of struct edid,<br>&gt; though that&#39;s a long road. But w=
e&#39;ve made a lot of progress towards it,<br>&gt; there aren&#39;t that m=
any places left that directly look at the guts of<br>&gt; EDID, and most of=
 it is centralized in drm_edid.c.<br>&gt;<br><br><div>drm_edid isn&#39;t ex=
ported so we can&#39;t use it. I know you&#39;ve read the EDID spec so comp=
laining about the magic numbers is silly.</div><div>I didn&#39;t choose to =
make the whole spec based on bizarrely packed 10 and 12 bit numbers, they a=
re unavoidable.</div><br>&gt;<br>&gt; &gt; Maybe it resolves problems with<=
br>&gt; &gt; compositors, but it is a step backwards for the overall ecosys=
tem. If<br>&gt; &gt; the connector changes, your driver should increment th=
e epoch counter.<br>&gt; &gt; [1] That will send a hotplug event to userspa=
ce. The EDID alone does not<br>&gt; &gt; say anything about connector statu=
s.<br>&gt;<br>&gt; Yeah, unplugging and replugging the same display with th=
e same EDID<br>&gt; isn&#39;t a problem for other drivers, and they don&#39=
;t have to do this kind<br>&gt; of stuff to trick userspace. Maybe vmwgfx s=
hould handle (or simulate)<br>&gt; hotplugs better?<br>&gt;<br>&gt; And pre=
ferrably let the EDID functions handle epoch counter updates<br>&gt; instea=
d of doing it yourself, if at all possible.<br>&gt;<br>&gt; BR,<br>&gt; Jan=
i.<br>&gt;<br><br>You&#39;re both missing the fact that virtual devices nev=
er disconnect active displays. We don&#39;t have to do a disconnect/connect=
 cycle like a physical monitor and we wouldn&#39;t want to because it would=
 be poor user experience. The issue is not sending the hotplug event, it&#3=
9;s that userspace will ignore hotplug events on connectors that were previ=
ously connected because they assume a disconnect/connect cycle must occur f=
or changes to occur. The whole point of hotplug_mode_update was as a hint t=
o userspace that the display can be &quot;re-plugged&quot; without a discon=
nect first and to always rescan the connector for changes on hotplug.<br><b=
r>Currently compositors are taking an arbitrary set of connector properties=
 that they&#39;ve organically collected over the years and doing a diff to =
trigger a refresh in the modes/display layout. EDID is the only property th=
at they universally agree should trigger a display layout change. The fact =
that Autofit works on any compsitors using vmwgfx, qxl, or virtio is comple=
tely by accident.<br><br>EDID is also a standardized connector property so =
it&#39;s not really fair to say that all devices should export this propert=
y and then when we fix our deficiency to block it. Now that it&#39;s standa=
rdized it is part of the uapi and if userspace does weird things with it it=
&#39;s not really our concern. The fact that it&#39;s standardized is also =
likely the reason it is being used in such a fashion. <br><br>Ian,<br></div=
>

--000000000000766f2506275d95e1--
