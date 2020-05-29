Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB61E7770
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A986E88A;
	Fri, 29 May 2020 07:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1016E88A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:49:12 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id e125so742131lfd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=r7PhtihFNUn5NDZ2B6LCfVfhZuwQTWoiNq89k9Uqsok=;
 b=QjrPS8G+a5iDrV7sl3CERcNxq221O0m5JMxXwAYN1THD7wPS0sWAMxH4Ve/GxEEPr8
 PTewak384EyuCv+juXt1pRWGJ9DFTDid9Jm7nSKSDCGLjcFNxRrVsX6mBGPUbQvGSwJR
 fZ3lkv4RVAOWE45iWSod6VXHHfVdErtliHcmtjXE/n5k7jZ+14IEvHYnHmcsBu7gH/fH
 vg3aMCwMmy9voM8JDfyWBAVYPJZqhQWb2JMjuFnlwzUm3yEJD5koOM/YM9gOJMI/SjoO
 byGcORZ3e+F0p9+eIFKUMv0q/dqIKVmDjLmIbfpANswRQMY9r6CW/eItDPI/v+P3aCU6
 Gy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=r7PhtihFNUn5NDZ2B6LCfVfhZuwQTWoiNq89k9Uqsok=;
 b=PxgqJmieFf8rHiof/dIoWY+EcsDWBDlwtTLhcKy6eq92b8eced83bFzNkH3CNSuOeJ
 vLz4ZcVxuzZr1GzMbqgJBaKGmTOPZYdTJmUroXr0LWhmP9lbgjaPVF2X49gCsxM1GOHG
 WHsp2dBpZ1+IxCfkhneLBsyhfYEuP1xF3Y9hGNj8yG/5Q9vsIWj1slaTXr58AQGbSBBR
 PrVe8Gh0FXvWt8MLaS0wEJNhXVSN+83dK5Y55Emg4gHOPa79eGOcmyazbvodVyrfXvfl
 UYRsu2N2gap5voscdc0QHnQc5cWhVdV8OJJ3p88L2d0iTQp9Kb8JzXUrLCU8T0jAtmPv
 M3ZQ==
X-Gm-Message-State: AOAM533o2uVUdLfDAeXLSxKqApqyPc60wrqm9arRe/s1goyhVyR68bDe
 NuelEgMT2yHBasfSBz97aLI=
X-Google-Smtp-Source: ABdhPJzJTexBI5JzL2gsnIUCLjWuct5hDlkFBl5lUeNLtRhpboSrIQgjnTriJsZdBoSalP8MoOsd6Q==
X-Received: by 2002:ac2:4471:: with SMTP id y17mr3757663lfl.178.1590738550341; 
 Fri, 29 May 2020 00:49:10 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b15sm2085437lfa.74.2020.05.29.00.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:49:10 -0700 (PDT)
Date: Fri, 29 May 2020 10:48:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Chih-Wei Huang <cwhuang@linux.org.tw>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
Message-ID: <20200529104859.33af5eed@eldfell.localdomain>
In-Reply-To: <CAHUn7wPfaEuWAc7iDGtfCdT71dwYkt7fNgMdPtfZL=COmKBaiQ@mail.gmail.com>
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
 <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
 <2xZF5q7722pK-_L_0jQjYv33oMS6WS4Jm06tbVwUo9SQO9QBv48_HaVhzVHTb2OLnz3JUj3O1uRYn_y-JWGrWpD3c8J0y8Mr_qgwbNzsxDE=@emersion.fr>
 <CAHUn7wPfaEuWAc7iDGtfCdT71dwYkt7fNgMdPtfZL=COmKBaiQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0699841403=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0699841403==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tEb8=QI2f88LXbrwAepRUP="; protocol="application/pgp-signature"

--Sig_/tEb8=QI2f88LXbrwAepRUP=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2020 17:46:08 +0800
Chih-Wei Huang <cwhuang@linux.org.tw> wrote:

> The main problem we're trying to solve is to
> find the DRM device of the primary framebuffer (fb0).

Hi,

I would say that is a completely wrong starting point. Please, let
fbdev die in peace/pieces. Do not make any new code that relies on
fbdev existing.

Why do you think you want to follow the setup fbdev has? How do you
know fb0 is the device you want and not fb1? How do you guarantee that
fb0 is the device you want?

"It was right on where I tested it" is no guarantee if you do not
understand how it actually is chosen under the hood. If you know how it
is chosen under the hood, you can do the same yourself without relying
on deprecated stuff (fbdev).

It is fbdev that should follow the DRM setup, not pick a DRM device
based on fbdev.

People already mentioned looking at device properties via libudev API.
If you cannot have libudev (I believe it does not need udev daemon,
btw.), then you can look at the same information directly in sysfs. Use
the information about the DRM devices themselves from sysfs to decide
which one to pick, and never look at fbdev anything. Or polish the
patch Emil proposed if boot_vga indeed matches what you actually want
to find.

I think Daniel Vetter explained nicely what boot_vga means. Is your
problem that the device may not be a PCI device, but a platform device
for instance?

Display servers use heuristics, for example if no device has boot_vga,
then pick the platform device (since there usually is only one with KMS
capabilities). Here are couple of examples.

Weston wants a device with KMS capabilities, because it currently
doesn't support using more than one KMS device and it also doesn't
explicitly support a separate render device:
https://gitlab.freedesktop.org/wayland/weston/-/blob/8.0.0/libweston/backen=
d-drm/drm.c#L2546-2631

Mutter is primarily looking for a hardware rendering capable device,
because it can use any number of KMS devices in addition to a rendering
device, separate or same device:
https://gitlab.gnome.org/GNOME/mutter/-/blob/3.37.1/src/backends/native/met=
a-renderer-native.c#L3904-3953

Neither is probably perfect, but they are totally better than picking
based on fb0.


Thanks,
pq

--Sig_/tEb8=QI2f88LXbrwAepRUP=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7QvmwACgkQI1/ltBGq
qqeTAxAAlPa8m2HAvmm0z+vJvOWeRFBefIYrS4TVcocIgd7XoK9J2NK7gNMq9p01
+aSchRz6RnAwQQrujYtxl1CG2Lgu/XEr7/LX7IUmVIuFktYmRw7ceaTrRXonWpaC
43lMgvrPoWaSkDBJXbmV9wVl97ZZswB7vL31BM/UVNnF7NXE2MCT6INFRPKYIgOO
DxWqs0ba5Ck7w9UnTK9JrdxPmld3VXd1LByI4njpquImWQCRneEST2Cm548kawyE
rPkiOO0VY8dtQp/OllyyIsLc7uxRCYxX8cX5peQadfUaMJRZUeaLkX+kXPSFKEZe
ZTMQzbKrBOLm2aETWy4esKcqU/ycFUzXFGzPiXDdodJOCt8faEYO1IW6Db9JT0zm
JtPx3VnKWaDgCIV2deDhK3TqCEUj0zpZdS0rQS/y9/nlVlm7NZEoBFJpPaQtIhrv
ks8gWvcPzpGgNTi5yn90vKEL1SLKS4yyh7fiQ7Sv+aA/cy0x1dToeQn7S/L35JmX
VkYca0B/PVVBC3HdWWmvvj/quciMQKJitNWVcvSoqKIucyCl35NhH0j1UtLf7CZc
yew8aIcFIWkDbdKqUhebaxazuwDflGf2slJYRrKspkBPw3x6NI2QxqePziL/XnKG
PpRyiEV/rmpTJcO57wecvHZNiW8EOnz8GRKZ+zDBoGULtBZm5Xg=
=J/jl
-----END PGP SIGNATURE-----

--Sig_/tEb8=QI2f88LXbrwAepRUP=--

--===============0699841403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0699841403==--
