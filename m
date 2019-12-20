Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C8128116
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 18:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2B06E0FE;
	Fri, 20 Dec 2019 17:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9271A6E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 17:06:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a5so9660794wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZYGkEsWZa4CqfafTQfNo+lumsR9hQExUaseHAWajZa8=;
 b=iYAzW60lCm4RDzkRqt+FKWZzJrRxchgbGZ60MzOtxh+nBWEg7raiEQJJ0wKve1AmD8
 6rCTExhMGV7b5tIf9TEKA+dZmgTdi6zdKXq18udnkblCy2rFuS6+2MVwmk1snF20dSbX
 1OrHx9aa+3tXy+8WjdrD4tq+oWarhZmAomCwjGWkS3Eg76ubqlqerWhJ2RYl/RpoyhP0
 0xiM/2K+EZM7B+76TdpcNOGI6VrgRzVaTDs6IUwgK0LEMO1Rjn0c46mQOl4I0VajHPqF
 P0peFAE5w3+X9JTYH7AJ6U8bvXUBEnnnDSNlQgFw03Wz6nyh58+MX9rB2xddT4wEcUHx
 2vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZYGkEsWZa4CqfafTQfNo+lumsR9hQExUaseHAWajZa8=;
 b=lT2dM9PRJPhAU/kI3o8mkx1HKz3TQYJIcPHKPmGVsyMrRC6BiOjIuKyGKmiCi/JKB5
 MnZTN2pnFlyhlME4yi3fNNe8Q1dw3tQCqsomn4CADbzgf8+gB6KOzOfK0yblRswSd4j4
 NNzs72XXbZJziSA06UMcHJJrehHkGh2gKWAVkSbOIZ0JICCIvdXR9qXz0kbD4N08hCbV
 r+0YGY/hXxZ0mO92YX2Kj0bMl4ve5tt71XmZxWpFTQf8QcifGPfdvVqr7NIODLqfuTd1
 kWt8JvUoZyiVCj77653iXv0y+b5kREctj6HqBk5bjKPjFoXDhjQJPLupO/xXYtWfwMyX
 hqLg==
X-Gm-Message-State: APjAAAXwsVphgmJnxn+sqIqh+KYKcARbkLGwU/XJP5bW8UwIijs76BPM
 NrDFg8OWEpDvz3BHUI2n1xhJ2IJxmvrwcLczl7UiueYb
X-Google-Smtp-Source: APXvYqz9lDU4s3KnDdGQhKOG1+bQ4cbOua3u7W4pB2gN+D0YT4T8zfG0aWHOvD9b9dSHz/yesYwbENguGY800RshWgU=
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr17779134wmg.157.1576861570702; 
 Fri, 20 Dec 2019 09:06:10 -0800 (PST)
MIME-Version: 1.0
From: TAEHO NAM <kl0ud3v@gmail.com>
Date: Sat, 21 Dec 2019 02:05:59 +0900
Message-ID: <CACcQa5=1vdWTUGfmN+oEY5rARTX5p6SvDbzQt+bzYHmZ=2hBgg@mail.gmail.com>
Subject: Why eglGetDisplay(EGL_DEFAULT_DISPLAY) returns EGL_NO_DISPLAY?
To: dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============1966267922=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1966267922==
Content-Type: multipart/alternative; boundary="000000000000c82318059a25b169"

--000000000000c82318059a25b169
Content-Type: text/plain; charset="UTF-8"

Hi, I'm new to dri-devel and sorry if this question doesn't fit here.
In my code, the case 1 of getting eglDisplay using EGL_DEFAULT_DISPLAY
failed, but, the case 2 succeeded.

// Case 1
egl_.display = eglGetDisplay (EGL_DEFAULT_DISPLAY);

// Case 2
struct gbm_device * gbm_device_;
gbm_device_ = gbm_create_device (drm _-> GetFD ());
egl_.display = eglGetDisplay ((EGLNativeDisplayType) gbm_device_);

I don't know if EGL_DEFAULT_DISPLAY is missing or it's a problem with my
machine.
The output of lspci is :

VGA compatible controller: Intel Corporation Device 5906 (rev 02)

Thank you for any comments or links to related documents.

--000000000000c82318059a25b169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, I&#39;m new to dri-devel and sorry if this questi=
on doesn&#39;t fit here.<br>In my code, the case 1 of getting eglDisplay us=
ing EGL_DEFAULT_DISPLAY failed, but, the case 2 succeeded.</div><div><br></=
div><div>// Case 1</div><div>egl_.display =3D eglGetDisplay (EGL_DEFAULT_DI=
SPLAY);<br><br></div><div>// Case 2</div><div>struct gbm_device * gbm_devic=
e_;<br>gbm_device_ =3D gbm_create_device (drm _-&gt; GetFD ());<br>egl_.dis=
play =3D eglGetDisplay ((EGLNativeDisplayType) gbm_device_);<br></div><div>=
<br></div><div>I don&#39;t know if EGL_DEFAULT_DISPLAY is missing or it&#39=
;s a problem with my machine.<br>The output of lspci is :<br></div><div><br=
></div><div>VGA compatible controller: Intel Corporation Device 5906 (rev 0=
2)<br></div><div><br></div><div>Thank you for any comments or links to rela=
ted documents.</div></div>

--000000000000c82318059a25b169--

--===============1966267922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1966267922==--
