Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81684A3712
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 15:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA561121A6;
	Sun, 30 Jan 2022 14:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EF81121A2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 14:57:23 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso2426107otv.13
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stapelberg.ch; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xS/oYGX/icmUWtHjoHCicgesS0K0v0lc6WGFBnrB9cY=;
 b=JEEy4pQqh9z7urIzHKDNF5i95gpzER3wBZc9bllMmCiZBrEHHTbemCwHJbcbgZLPTO
 GGgB7FwMp+pKGr8IK/rW48VVPwJO7iqG1PQgIOuYYTjTajZ8JJaWJSZZ81dEI1FVS6lv
 Do9zMoc4ZPcbawhjNMl6oqHnSLzmOrw2ddC58t88tDWKdXY13pmrunBbAEKCOLndVGBo
 abaDTgXqvnceCTeUBd0P+oc5U7aCuemCJndDk+85C6dt7nS+MDLa64GSLFelXnxVd57G
 YisxdBAzN659iyL7MDu1eom+hywLtB7zEgPBE+u+h+TXmFmegmAEHXLDZtyVhrrMZYeC
 cJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xS/oYGX/icmUWtHjoHCicgesS0K0v0lc6WGFBnrB9cY=;
 b=BGgeyGgnVIADGscp7u/bbi2f4BE4UqOH44WpBnISNZWHkB1LuksdtXR0OeftxCiryY
 BXecpgQKbp7BbD3oqJpwl4rnwif/8rUYxeOTXEelqJv2etMpLEX8MI5aj0r4SWK3CeYm
 1bQUS83MuX5wU7176lH9Op09peXrOrrQy8Vd/u3gKfARY0iDXBkRotlBRfWprifmlwNJ
 eVeg26TQEXaqXlb/IPvPKHakZZDimAUW3A9AAczXR0UDElf73jiwLgVS6AePZSnxez1f
 s+4B/gjb5aK7BcN8YaVJNXzBZJROFUmCHqxkbvp/AgzoElzu0fZHDZGw/L1UWjA77taR
 fLLA==
X-Gm-Message-State: AOAM533Woe6lkVHVIhe47qK4DrEAsxdGfrkG95zYPvKeTg5TsICYo4kU
 ZZXQ8TzzpLG2mxu7DOwMhIaJ5TD6FcX4aikhxqoEFt4+aa4CPg==
X-Google-Smtp-Source: ABdhPJw/VZYHu6AuuLrRYeRXBfr1s9ylq1qo0zakWQllxWLv5OATa7R204Z9kTUXqkq8qHvIEvowEIbQQWk8EtPIX0U=
X-Received: by 2002:a9d:4047:: with SMTP id o7mr9363005oti.57.1643554643072;
 Sun, 30 Jan 2022 06:57:23 -0800 (PST)
MIME-Version: 1.0
From: Michael Stapelberg <michael+drm@stapelberg.ch>
Date: Sun, 30 Jan 2022 15:57:07 +0100
Message-ID: <CANnVG6=ERdWhbEsNKY4r=QNmaUWPeqcQ9fwWa05SyuT8ETeFHw@mail.gmail.com>
Subject: Linux 5.16.3 breaks headless Raspberry Pi 3 boot, again
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000ab6dd505d6cde255"
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
Cc: Felix Kuehling <felix.kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ab6dd505d6cde255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

I am facing the exact same symptoms as last September:
https://lists.freedesktop.org/archives/dri-devel/2021-September/324008.html

=E2=80=A6meaning my (headless) Raspberry Pi 3 B and Raspberry Pi 3 B+ no lo=
nger
boot with Linux 5.16.3, while the (headless) Raspberry Pi 4 still boots.

This issue is not fixed with the latest Linux 5.16.4 either.

If needed, I can git-bisect it, but perhaps you have a hunch already?

With 5.16.2 (working), I see the following serial console output:
[    2.493456] fb0: switching to vc4 from simple
[    2.500306] Console: switching to colour dummy device 80x25
[    2.507204] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
[    2.517617] vc4-drm soc:gpu: [drm] Cannot find any crtc or sizes
[   12.517962] vc4-drm soc:gpu: [drm] Cannot find any crtc or sizes

With 5.16.3 (broken), I see:
[    2.485311] fb0: switching to vc4 from simple
[    2.492167] Console: switching to colour dummy device 80x25
[    2.499148] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
<boot hangs>

Thanks in advance
Best regards
Michael

--000000000000ab6dd505d6cde255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello again,<div><br></div><div>I am facing the exact same=
 symptoms as last September:</div><div><a href=3D"https://lists.freedesktop=
.org/archives/dri-devel/2021-September/324008.html">https://lists.freedeskt=
op.org/archives/dri-devel/2021-September/324008.html</a><br></div><div><br>=
</div><div>=E2=80=A6meaning my (headless) Raspberry Pi 3 B and Raspberry Pi=
 3 B+ no longer boot with Linux 5.16.3, while the (headless) Raspberry Pi 4=
 still boots.</div><div><br></div><div>This issue is not fixed with the lat=
est Linux 5.16.4 either.</div><div><br></div><div>If needed, I can git-bise=
ct it, but perhaps you have a hunch already?</div><div><br></div><div>With =
5.16.2 (working), I see the following serial console output:</div><div>[ =
=C2=A0 =C2=A02.493456] fb0: switching to vc4 from simple<br>[ =C2=A0 =C2=A0=
2.500306] Console: switching to colour dummy device 80x25<br>[ =C2=A0 =C2=
=A02.507204] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0<br=
>[ =C2=A0 =C2=A02.517617] vc4-drm soc:gpu: [drm] Cannot find any crtc or si=
zes<br>[ =C2=A0 12.517962] vc4-drm soc:gpu: [drm] Cannot find any crtc or s=
izes<br></div><div><br></div><div>With 5.16.3 (broken), I see:</div><div>[ =
=C2=A0 =C2=A02.485311] fb0: switching to vc4 from simple<br>[ =C2=A0 =C2=A0=
2.492167] Console: switching to colour dummy device 80x25<br>[ =C2=A0 =C2=
=A02.499148] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0<br=
>&lt;boot hangs&gt;<br></div><div><br></div><div>Thanks in advance</div><di=
v>Best regards</div><div>Michael</div></div>

--000000000000ab6dd505d6cde255--
