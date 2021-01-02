Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2B2E91E5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5089C46;
	Mon,  4 Jan 2021 08:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA0F8985A;
 Sat,  2 Jan 2021 18:50:46 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id y5so21363913iow.5;
 Sat, 02 Jan 2021 10:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=U+nEvYMhuyW6PaypDd/7+1xbjn6+DExMKU2y+xWKoMo=;
 b=te0bgvD5lXMSmA27Y4VuxPXH10PKMeYY9RkBMBuyMV+Nf6f6Eeny3sufT1EhnoCGif
 kdgQxyoiocUKZt8s1JWEUpFSn6tw/HTe4KLWuJlUTJndO1d4rRDk/d67ieREb0xyp0yJ
 dYiVeg5D2UlKH2KRuaxxFCP9t0eumiz3E2T9zChkpmXcq0U+vDL5NcyK5SSrg012Gia9
 oFOyq3I+mY1B7iQCUk3OWlxAvXzu8Z6xDA49xok72K9TUPPvfrbWu4RQkOEipq072e+5
 /KN3TTW9sTtbb+jBJd2Ju45m3VJIeDHcdudLU20eNLndB3qcTK7IbERyolQ2xF1WAJel
 X3qQ==
X-Gm-Message-State: AOAM530/tKkjGP/GyoRP1VStmCB4GTSs+b82355QZZpi7OwnMmcnqWnr
 LQJxUcD498kUgwQ3zw39eYY/z1YRu/tLvkJtktc=
X-Google-Smtp-Source: ABdhPJzTLhFY/dKxIbceehQmCOBJtPtQzWWGyD8lzHgA4m5oZrHUCB8Jn4aoAVTEVSdnhN9SzqBiWsAIbRcoiVde09o=
X-Received: by 2002:a5e:de4a:: with SMTP id e10mr7994789ioq.52.1609613445496; 
 Sat, 02 Jan 2021 10:50:45 -0800 (PST)
MIME-Version: 1.0
From: Davide Corrado <davide@davidecorrado.eu>
Date: Sat, 2 Jan 2021 19:50:33 +0100
Message-ID: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
Subject: amdgpu does not support 3840x2160@30Hz on kaveri apu
To: alexander.deucher@amd.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1873009562=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1873009562==
Content-Type: multipart/alternative; boundary="000000000000a5062005b7ef5591"

--000000000000a5062005b7ef5591
Content-Type: text/plain; charset="UTF-8"

hello, I'd like to report this issue that I am having since I updated my
display (samsung U28E590). The amdgpu does not support the native
resolution of my new monitor, which is 3840x2160*.* Using a HDMI or DVI
connection (I tried both, same results), the maximum supported refresh is
30Hz, so I'm stuck with that (don't have a displayport). The radeon module
works fine, I'm having this issue just when I use amdgpu (which I'd like
to, because performance is better).

Some info of my hardware:

cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G
kernel version (I tried different ones and different linux distros, same
results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020
x86_64 x86_64 x86_64 GNU/Linux
Monitor: Samsung U28E590.

description:
If I boot the system using amdgpu and no video mode selection, the system
boots but I don't get a screen during boot and in wayland. I can connect
using ssh, so the system is running fine, just no display; If I force a
full HD resolution with "video:" in the kernel line, I can see the boot
process but the screen disappears when wayland starts (because the default
resolution is 3840x2160@30Hz). Using a full HD monitor results in no
issues, so it must be related to this very 4k resolution.

As I have already stated, radeon module works with the same
software/hardware configuration.
thanks you so much for your time :-)

-- 
Davide Corrado
UNIX Team Leader

Via Abramo Lincoln, 25
20129 Milano

Tel +39 3474259950

--000000000000a5062005b7ef5591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hello, I&#39;d like to report this issue that I am ha=
ving since I updated my display (samsung U28E590). The amdgpu does not supp=
ort the native resolution of my new monitor, which is 3840x2160<i>.</i> Usi=
ng a HDMI or DVI connection (I tried both, same results), the maximum suppo=
rted refresh is 30Hz, so I&#39;m stuck with that (don&#39;t have a displayp=
ort). The radeon module works fine, I&#39;m having this issue just when I u=
se amdgpu (which I&#39;d like to, because performance is better).</div><div=
><br></div><div>Some info of my hardware:</div><div><br></div><div>cpu: AMD=
 A10-7870K Radeon R7, 12 Compute Cores 4C+8G</div><div>kernel version (I tr=
ied different ones and different linux distros, same results!): 5.9.16-200.=
fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020 x86_64 x86_64 x86_64 GNU/Li=
nux</div><div>Monitor: Samsung U28E590.</div><div><br></div><div>descriptio=
n:<br></div><div>If I boot the system using amdgpu and no video mode select=
ion, the system boots but I don&#39;t get a screen during boot and in wayla=
nd. I can connect using ssh, so the system is running fine, just no display=
; If I force a full HD resolution with &quot;video:&quot; in the kernel lin=
e, I can see the boot process but the screen disappears when wayland starts=
 (because the default resolution is 3840x2160@30Hz). Using a full HD monito=
r results in no issues, so it must be related to this very 4k resolution.<b=
r></div><div><br></div><div>As I have already stated, radeon module works w=
ith the same software/hardware configuration.<br></div>thanks you so much f=
or your time :-)<br><div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">Davide Corrado<br><div=
>UNIX Team Leader<span><br></span></div><div><br></div>Via Abramo Lincoln, =
25<br>20129 Milano<br><br>Tel +39 3474259950<br></div></div></div></div></d=
iv></div></div></div></div></div></div>

--000000000000a5062005b7ef5591--

--===============1873009562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1873009562==--
