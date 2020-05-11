Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE421CE874
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51B6E7E6;
	Mon, 11 May 2020 22:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0A189ABE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 19:56:19 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l19so10963449lje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 12:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=twrh0eXh5joVqZp0VxRAs/oUk/YehIWffye6JGuwDDA=;
 b=IThxMhNZByJDKLb07gmANVEAl37FJvsRy4wkLxlDeoTpwGNqCgXc/MLZQMb+OO2Wsy
 vQQGV28dvSHXuy6QMbHVWb/Iwu2odwH/a+gzt9f4Nv4u/K7n4THv+Q5xTqxBnR5VTQ1S
 BlkjDHxv9PvEAnxTaD1E7UpBhmmgfZRg/7IkE0ybq+lfSgkB4FovFaHHRMJq5c878Sgv
 pnu8SqEiYQmcBQNUuqdQ9VfMjJo0ZE6CiA1H6ppGXMQ72sx564zw6eP69B4w9kGX4Z++
 PYcUPr4Qsi4EmF4qBYh6V6hO7zxDCCcZv8RWR+NDaLkWvQLmUEQuQTiEBtD1KhMvSvUU
 DsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twrh0eXh5joVqZp0VxRAs/oUk/YehIWffye6JGuwDDA=;
 b=M+eMyYk8Huw4Y8bK9b4GrL30IxnTncIoRYDnyd3V3nLOLTCf8o+djoe7IR/hokSs4I
 zEyR9Swi4xaC01zcnZFwkLOozdMTld9hq9jkPeGnI1N42dT1fCkbKgzBH1lJJhps8zhg
 9L2FeXgElY+sqdoWJtPZmqLv1EGstKfUrmk5lljiAiOycZHfL1297jWkbPHeHzTOr/r4
 /cRc/lzn6T1JAb3Znc/KjnlRyA2Ac4kPaDnArdAOYR3P42qapaEnxxD+ghxZ8EK9ED+9
 LdcYmGElQ3vBu2FA2R8xc9phGRXh/FSk7HQhfdHCbcPgrmSRYC5Yehic8NCDspIlGPJw
 OvLg==
X-Gm-Message-State: AOAM5301EBoQQK54p/DzrJh7r8Dt5jSJb1AxdoYnRxEytuQP7gmW9yP0
 NGx7UENT7nGKhllddpZA6iCjBc3CJnpaScryW6aygg==
X-Google-Smtp-Source: ABdhPJy1hpOvBc+JZDfBLkSZyi4nmPT5hdvElGJn2r0RdoUGot/PBEP+aWnb3ByIbkzytK85NtcUzHV/BpfSLVGE2sI=
X-Received: by 2002:a2e:910e:: with SMTP id m14mr10426291ljg.141.1589226977122; 
 Mon, 11 May 2020 12:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200511174724.21512-1-hdegoede@redhat.com>
In-Reply-To: <20200511174724.21512-1-hdegoede@redhat.com>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 11 May 2020 12:55:40 -0700
Message-ID: <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jared Dominguez <jaredz@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============1285374810=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1285374810==
Content-Type: multipart/alternative; boundary="00000000000070ad0c05a564bd09"

--00000000000070ad0c05a564bd09
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

On Mon, May 11, 2020 at 10:47 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Hi All,
>
> This RFC takes Rajat's earlier patch for adding privacy-screen properties
> infra to drm_connector.c and then adds the results of the discussion from
> the "RFC: Drm-connector properties managed by another driver / privacy
> screen support" mail thread on top, hence the v2.
>

Thank you so much for doing this. I was following the said discussion and
eventually it became quite complex for me to understand and follow :-)


>
> The most important thing here is big kernel-doc comment which gets added in
> the first patch-chunk modifying drm_connector.c, this summarizes, or at
> least tries to summarize, the conclusions of our previous discussion on
> the userspace API and lays down the ground rules for how the 2 new
> "privacy-screen sw-state" and  "privacy-screen hw-state" properties are
> to be used both from the driver side as well as from the userspace side.
>
> Other then that this modifies Rajat's patch to add 2 properties instead
> of one, without much other changes.
>
> Rajat, perhaps you can do a new version of your patch-set integration /
> using this version of the properties and then if everyone is ok with
> the proposed userspace API Jani can hopefully merge the whole set
> through the i915 tree sometime during the 5.9 cycle.
>

SGTM. I have actually moved to working on something else now, so I will
most likely wait for this patch to get merged, before rebasing my other /
remaining patches on top of that.

Thanks & Best Regards,

Rajat


> This RFC takes Rajat's earlier patch for adding privacy-screen properties
> infra to drm_connector.c and then adds the results of the discussion from
> the "RFC: Drm-connector properties managed by another driver / privacy
> screen support" mail thread on top, hence the v2.
>
> The most important thing here is big kernel-doc comment which gets added in
> the first patch-chunk modifying drm_connector.c, this summarizes, or at
> least tries to summarize, the conclusions of our previous discussion on
> the userspace API and lays down the ground rules for how the 2 new
> "privacy-screen sw-state" and  "privacy-screen hw-state" properties are
> to be used both from the driver side as well as from the userspace side.
>
> Other then that this modifies Rajat's patch to add 2 properties instead
> of one, without much other changes.
>
> Rajat, perhaps you can do a new version of your patch-set integration /
> using this version of the properties and then if everyone is ok with
> the proposed userspace API Jani can hopefully merge the whole set
> through the i915 tree sometime during the 5.9 cycle.
>
> Regards,
>
> Hans
>
> p.s.
>
> I plan to start working on the lcdshadow subsystem next. As discussed the
> plan for this subsystem is to allow drivers outside of the DRM subsys, such
> as for example the thinkpad_acpi driver, to register a lcdshadow device,
> which DRM drivers can then get a reference to and use to implement these
> properties.
>
>

--00000000000070ad0c05a564bd09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Hans,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, May 11, 2020 at 10:47 AM Hans de Goed=
e &lt;<a href=3D"mailto:hdegoede@redhat.com">hdegoede@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi All,<br>
<br>
This RFC takes Rajat&#39;s earlier patch for adding privacy-screen properti=
es<br>
infra to drm_connector.c and then adds the results of the discussion from<b=
r>
the &quot;RFC: Drm-connector properties managed by another driver / privacy=
<br>
screen support&quot; mail thread on top, hence the v2.<br></blockquote><div=
><br></div><div>Thank you so much for doing this. I was following the said =
discussion and eventually it became quite complex for me to understand and =
follow :-)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
The most important thing here is big kernel-doc comment which gets added in=
<br>
the first patch-chunk modifying drm_connector.c, this summarizes, or at<br>
least tries to summarize, the conclusions of our previous discussion on<br>
the userspace API and lays down the ground rules for how the 2 new<br>
&quot;privacy-screen sw-state&quot; and=C2=A0 &quot;privacy-screen hw-state=
&quot; properties are<br>
to be used both from the driver side as well as from the userspace side.<br=
>
<br>
Other then that this modifies Rajat&#39;s patch to add 2 properties instead=
<br>
of one, without much other changes.<br>
<br>
Rajat, perhaps you can do a new version of your patch-set integration /<br>
using this version of the properties and then if everyone is ok with<br>
the proposed userspace API Jani can hopefully merge the whole set<br>
through the i915 tree sometime during the 5.9 cycle.<br></blockquote><div><=
br></div><div>SGTM. I have actually moved to working on something else now,=
 so I will most likely wait for this patch to get merged, before rebasing m=
y other / remaining patches on top of that.</div><div><br></div><div>Thanks=
 &amp; Best Regards,</div><div><br></div><div>Rajat</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">This RFC takes Rajat&#39;s=
 earlier patch for adding privacy-screen properties<br>infra to drm_connect=
or.c and then adds the results of the discussion from<br>the &quot;RFC: Drm=
-connector properties managed by another driver / privacy<br>screen support=
&quot; mail thread on top, hence the v2.<br><br>The most important thing he=
re is big kernel-doc comment which gets added in<br>the first patch-chunk m=
odifying drm_connector.c, this summarizes, or at<br>least tries to summariz=
e, the conclusions of our previous discussion on<br>the userspace API and l=
ays down the ground rules for how the 2 new<br>&quot;privacy-screen sw-stat=
e&quot; and =C2=A0&quot;privacy-screen hw-state&quot; properties are<br>to =
be used both from the driver side as well as from the userspace side.<br><b=
r>Other then that this modifies Rajat&#39;s patch to add 2 properties inste=
ad<br>of one, without much other changes.<br><br>Rajat, perhaps you can do =
a new version of your patch-set integration /<br>using this version of the =
properties and then if everyone is ok with<br>the proposed userspace API Ja=
ni can hopefully merge the whole set<br>through the i915 tree sometime duri=
ng the 5.9 cycle.<br>
<br>
Regards,<br>
<br>
Hans<br>
<br>
p.s.<br>
<br>
I plan to start working on the lcdshadow subsystem next. As discussed the<b=
r>
plan for this subsystem is to allow drivers outside of the DRM subsys, such=
<br>
as for example the thinkpad_acpi driver, to register a lcdshadow device,<br=
>
which DRM drivers can then get a reference to and use to implement these<br=
>
properties.<br>
<br>
</blockquote></div></div>

--00000000000070ad0c05a564bd09--

--===============1285374810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1285374810==--
