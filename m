Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A693E44E397
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABF56EB48;
	Fri, 12 Nov 2021 09:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF056E563
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:23:42 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q124so15446560oig.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 19:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qR20Sa3oDqjywVsFcz4uHPOq3UnNPTSGJ7C6D0RwNDw=;
 b=pUa3GI13XA2IbfFaXdMuqGFxBb/YR07A/vliyPjn1eeXDXq4ArJANQig33X5AYtQlA
 iaIqq6axsqO8NGZ1FonYGXE6kbkKcUDp7WEySSRliNI8CNmp+lZX09n/JaGiPpAzcnGy
 Hh31xVUbqrbGQgM9hYEqQd/9FutK+0800EOOdvO2LQK6dwTCOpx8lSXXn6a+umuqe2YK
 1BtT8N+GsdTWO6UAGfHq99QMOwxwhwchTkYYJWi4O53eN5/2KcO6sU2RTdwmR3ddUqdc
 QDLnR2UyHrSwziO4jGifShzirNyBz7UW2eetKiIEaxDH0u6qB1D3Z3HbqFtZ/kYvjnjB
 IXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qR20Sa3oDqjywVsFcz4uHPOq3UnNPTSGJ7C6D0RwNDw=;
 b=FiwQ310OOtTl5qznUTWonH+aS/VWT2Mnf0Ilc+7dDMF0akLatXGt4foNvx6HiVJIWE
 vhbFimMj0N1aA9BVPFxzCwgq+7nIA1GRlOv/TE9MfUPdeDbDaMyjT49uD1526MWjN++b
 z6HOmT8SxIa3RLFn9PrQcDY/8qiktu4UsPeaRf1OwAFgUMHuY4ojnSH0NwP7HyK1/i/n
 c02ph3IeqCQwA+iYuPxn6kZEXv7LdupoZDXe8wGLPXSsN8kBCrekAHu0pONQd2/EXkkG
 0nikOedz2ag7kuf2Hrp8wZD+Chsytf32n/SMerENpzJQpVmlUD/6PKvQzyfLI38M2Gi6
 EwIQ==
X-Gm-Message-State: AOAM533OZrEtMWtbkm5Q+jabdYhut6wQZ18lLAh/K7YvGPqnG9Pz+sjQ
 nwjT8pjqxUMAXzYArxRcGZzbXTOMeIyvoOOGQcDaIg==
X-Google-Smtp-Source: ABdhPJx6HRGy27ZBnNDrtf+9EIkLkQe5bM02bOB4VC95LCQKju+OmkI5MZzs7cSXqL/vqvAXI+nmIlpxuCigsZMLJ5s=
X-Received: by 2002:a05:6808:30a0:: with SMTP id
 bl32mr10267898oib.77.1636687421300; 
 Thu, 11 Nov 2021 19:23:41 -0800 (PST)
MIME-Version: 1.0
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Fri, 12 Nov 2021 11:22:49 +0800
Message-ID: <CAPpJ_ecMSA8A=c=3KDOb59M=+go7DYH4dNNbE2cqYgDioO=MRQ@mail.gmail.com>
Subject: [BUG] VC4 DRM waiting for flip down makes UI freeze a while with
 kernel 5.15
To: Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000005af3b705d08efcbd"
X-Mailman-Approved-At: Fri, 12 Nov 2021 09:03:36 +0000
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux@endlessos.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005af3b705d08efcbd
Content-Type: text/plain; charset="UTF-8"

Hi,

I tested Linux mainline kernel 5.15 (aarch64) with enabled VC4 on RPi 4B. I
notice UI freezes a while (about 10 seconds) some times.

The kernel shows the error message during the time:

[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:68:crtc-3]
flip_done timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:68:crtc-3]
commit wait timed out
[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit

Here is the full log:
https://github.com/lategoodbye/rpi-zero/files/7518076/dmesg-5.15.log

It is easy to reproduce this issue by invoking GL related things, for
example "es2gears".

After detail test, I found it is related to these commits:
* f3c420fe19f8 ("drm/vc4: kms: Convert to atomic helpers")
* 82faa3276012 ("drm/vc4: kms: Remove async modeset semaphore")

This issue cannot be reproduced after I revert the commits.

Jian-Hong Pan

--0000000000005af3b705d08efcbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>I tested Linux mainline kerne=
l 5.15 (aarch64) with enabled VC4 on RPi 4B. I notice UI freezes a while (a=
bout 10 seconds) some times.<div><br>The kernel shows the error message dur=
ing the time:</div><div><br>[drm:drm_crtc_commit_wait] *ERROR* flip_done ti=
med out<br>[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:68:crtc=
-3] flip_done timed out<br>[drm:drm_atomic_helper_wait_for_dependencies] *E=
RROR* [CRTC:68:crtc-3] commit wait timed out<br>[drm:drm_crtc_commit_wait] =
*ERROR* flip_done timed out<br>vc4-drm gpu: [drm] *ERROR* Timed out waiting=
 for commit<br><br>Here is the full log:<br><a href=3D"https://github.com/l=
ategoodbye/rpi-zero/files/7518076/dmesg-5.15.log">https://github.com/latego=
odbye/rpi-zero/files/7518076/dmesg-5.15.log</a><div><br></div><div><span st=
yle=3D"color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&qu=
ot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,=
&quot;Segoe UI Emoji&quot;;font-size:14px">It is easy to reproduce this iss=
ue by invoking GL related things, for example &quot;es2gears&quot;.</span><=
br></div><div><span style=3D"color:rgb(36,41,47);font-family:-apple-system,=
BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Ap=
ple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span=
></div><div><span style=3D"color:rgb(36,41,47);font-family:-apple-system,Bl=
inkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">After detail=
 test, I found it is related to these commits:</span></div><div><span style=
=3D"color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">* f3c420fe19f8 (&quot;drm/vc4: kms:=
 Convert to atomic helpers&quot;)</span></div><div><span style=3D"color:rgb=
(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;;font-size:14px">* 82faa3276012 (&quot;drm/vc4: kms: Remove async=
 modeset semaphore&quot;)</span></div><div><span style=3D"color:rgb(36,41,4=
7);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvet=
ica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quo=
t;;font-size:14px"><br></span></div><div><span style=3D"color:rgb(36,41,47)=
;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetic=
a,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;=
;font-size:14px">This issue cannot be reproduced after I revert the commits=
.</span><span style=3D"color:rgb(36,41,47);font-family:-apple-system,BlinkM=
acSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div=
><div><span style=3D"color:rgb(36,41,47);font-family:-apple-system,BlinkMac=
SystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><=
div><span style=3D"color:rgb(36,41,47);font-family:-apple-system,BlinkMacSy=
stemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Jian-Hong Pan</span>=
</div></div></div>

--0000000000005af3b705d08efcbd--
