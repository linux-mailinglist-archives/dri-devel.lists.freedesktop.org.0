Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E035E56D004
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4F514B7E3;
	Sun, 10 Jul 2022 16:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C2711A9B7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 16:19:09 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id 18so709129vkz.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=JT+MfNG8/AjSUk9JU9B+SNCSgv7XBbsvfkU2vwy/KPI=;
 b=WTLuTcLGQK/fepOMn+Fs4xMLYZtnh6oHk5nQZkB1UUbWUB3QECMuxROi+/W/XBtwCG
 /Yb5CMK+7+EFvyxIrcAQ3itmEKbAbQj3LAcUWhkPmKzsh0D0ykxTV44VW82GS95ZWTuU
 A2tpbQ8Egpivo1qt069LCM7ptHHecN2esc4k79pBNlLVUfC4E89bZCTuqK+Dz2bKy3U6
 YEZXIF+P5Xz9uDhIz1endavdQo4vBlEtAlY4pxR1GntZtdsSitygFclG8AWRcfs9VVFc
 z3Qa2Gbx+eZOeDD7S3N6AauFbYpdUsKdSvebVz5Q3hnS3FyxAtk3+yyNnq7Hj47MoL5R
 ZK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JT+MfNG8/AjSUk9JU9B+SNCSgv7XBbsvfkU2vwy/KPI=;
 b=4MxYa6+d16vZvKGDUJbqx0p6/T5Z1pGFaDlXuBgt1EioR/qnwChDGf1u6KaI7IzVI5
 G5FPWqeOZhCgyJtdq4hatNGB1DO2BozMGqn32B1fdBvfSVmPt05xAd5NWZhaeo9yFlHW
 FVvM9oRvmHmgBrp218SXaq64xZMZE6mlX8pviu+vOuvhCe5pHLI/OTrMDGl1tV+XiOVf
 s2lKM+ovcEMFTrfLNYsWWhRITGDqcF4drxBkVVOM7VJgiamh+CokDu55WxDMy925nry1
 tkOT3pIwtt33wEv10XqNFnRIpExfReAJBYiC2irtX9+tJjddM4N0kRTpjVr1Ad9VgSpp
 6SPA==
X-Gm-Message-State: AJIora/6xDbMN0/vhPdWJ4ReK/cxQAa1YPNLNyf4N6gvvPYZmmNd7CkP
 y6UZfmkmuxiUHzxou62z/UcEuImM7qPEWZOS2gWEHDYchQw=
X-Google-Smtp-Source: AGRyM1szbVN+9tGWuxGRQmPw3bejAewCGhtHddIMC9JBZyaBDMJ+YjJaopGKdn7QYHm7D7VQVxdjBBZT4RLOqqgCBkw=
X-Received: by 2002:a1f:1c4f:0:b0:370:daa1:a535 with SMTP id
 c76-20020a1f1c4f000000b00370daa1a535mr4032369vkc.3.1657383548275; Sat, 09 Jul
 2022 09:19:08 -0700 (PDT)
MIME-Version: 1.0
From: Mohd Yusuf Abdul Hamid <mohdyusuf@gmail.com>
Date: Sat, 9 Jul 2022 09:18:32 -0700
Message-ID: <CALKsAjAGKWgwkZy2q7i+Y_ifootB1EmpFmjU8HQ=N3RzCowF3w@mail.gmail.com>
Subject: VKMS driver Kernel 5.4 - vkms_vblank_simulate: vblank timer overrun
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a6d07f05e361ad84"
X-Mailman-Approved-At: Sun, 10 Jul 2022 16:16:20 +0000
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

--000000000000a6d07f05e361ad84
Content-Type: text/plain; charset="UTF-8"

Hi Developers,
I am seeing thrashing of errors print once Android kernel trying to enable
SurfaceFlinger (swiftshader) stuff.

[drm:drm_calc_timestamping_constants] *ERROR* crtc 32: Can't calculate
constants, dotclock = 0!
[   19.985323][    C0] vkms_vblank_simulate: vblank timer overrun
[   19.991839][    C0] vkms_vblank_simulate: vblank timer overrun
[   19.998235][    C0] vkms_vblank_simulate: vblank timer overrun
[   20.024009][    C0] vkms_vblank_simulate: vblank timer overrun
...

I am afraid I am new to all of these - I have access to Lauterbach debugger
and can debug in code. I would love to get some perspective or pointers of
areas I could look into.

Other details:
I was able to use Kernel 5.10 + VKMS + SwiftShader in Android 12 in
Raspberry Pi 4. However, in my new dev board, I cant get all the
gpio/pinctrl/sdcard drivers working in Kernel 5.10, I had to stay w/ 5.4.

Thanks for all the help in advance.
Mohd Yusuf Abdul Hamid

--000000000000a6d07f05e361ad84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Developers,</div><div>I am seeing thrashing=C2=A0o=
f errors print once Android kernel trying to enable SurfaceFlinger (swiftsh=
ader) stuff.</div><div><br></div><div>[drm:drm_calc_timestamping_constants]=
 *ERROR* crtc 32: Can&#39;t calculate constants, dotclock =3D 0!<br></div><=
div>[ =C2=A0 19.985323][ =C2=A0 =C2=A0C0] vkms_vblank_simulate: vblank time=
r overrun<br>[ =C2=A0 19.991839][ =C2=A0 =C2=A0C0] vkms_vblank_simulate: vb=
lank timer overrun<br>[ =C2=A0 19.998235][ =C2=A0 =C2=A0C0] vkms_vblank_sim=
ulate: vblank timer overrun<br>[ =C2=A0 20.024009][ =C2=A0 =C2=A0C0] vkms_v=
blank_simulate: vblank timer overrun<br></div><div>...</div><div><br></div>=
<div>I am afraid I am new to all of these - I have access to Lauterbach deb=
ugger and can debug in code. I would love to get some perspective or pointe=
rs of areas I could look into.</div><div></div><div><br></div><div>Other de=
tails:</div><div>I was able to use Kernel 5.10 + VKMS=C2=A0+ SwiftShader in=
 Android 12 in Raspberry Pi 4. However, in my new dev board, I cant=C2=A0ge=
t all the gpio/pinctrl/sdcard drivers working in Kernel 5.10, I had to stay=
 w/ 5.4.</div><div><br></div><div>Thanks for all the help in advance.</div>=
<div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature">Mohd Yusuf Abdul Hamid</div></div></div>

--000000000000a6d07f05e361ad84--
