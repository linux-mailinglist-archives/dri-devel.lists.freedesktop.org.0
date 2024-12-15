Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457149F261B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 21:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7D310E2D6;
	Sun, 15 Dec 2024 20:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kA4HoXG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A403210E042;
 Sun, 15 Dec 2024 20:53:53 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3cd821c60so455555a12.3; 
 Sun, 15 Dec 2024 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734296032; x=1734900832; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2+FqJZ0WnN20yWus5paC8TaBuCsMhAhFdtfoZXH3IvA=;
 b=kA4HoXG3yBI/9+GfU2hy0T8U7YcLQMl0Ic0lIX4D+civeVgOGwdEWCZL8nI0s3e4LH
 fzow93DdMininQK8TEMh6CXL7y/GG4k96JVS/7d2NlMowVkmdRfZeOgg7DuzBD4o3tKx
 8Dog9509MZY9hekFlOp0dzNDF+pkqRPjQtYzmGuUlDcfkZXXGKKVImZDa0QF4bGeaBAE
 GSkj8BLkAVD7ewDPTIFlN5zjfj2Zh+cAx0Yq4lki7CDPHEOFPOx/XLLIEJmYOIXc1w8K
 zWVE56F28vpiW/Zrnb7huAFLJHJvous8dt5awUNjdCvWzw00wrHdWNfwb5jPijkfk7LL
 hgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734296032; x=1734900832;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2+FqJZ0WnN20yWus5paC8TaBuCsMhAhFdtfoZXH3IvA=;
 b=hvudNwoVM9mOUJpYkQJ9oYsrbmAHb57cW408lzmlKJUPQH0VayMpKCqetH3hRmvqxp
 6V3nlx4ukLRvSYTuBTP5oFvD1ix5/cDns+iAtvpAUTKJBHM6RgScgxGH9GGYdc80OCUB
 BV0AgWbv6TbuRmXlbu8vww8Qhffjuc6y88XC6qaaUumYjZQgJOU7e1KMPIGhcuiegz9i
 XlyopoxJMNgRMUBfI/E4oowWvMTB9WQuzw8Lsi/U8nViunMAE2+20PBq7q4kkZbQLEhC
 kf7rOB8Vgq5KX2MwfSl4mcrvmBLCBQrHObCUFzj5qbCHiWLu+GgsuXfIfUWq03zEjCCD
 f1Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhRUtZ0c11BYOJHIwqxDBApgmr7IyBLh7IgVDzmxA6IhxuthI75kBXVkgn+cT9+fIsy85TSpBH@lists.freedesktop.org,
 AJvYcCXW6+CJWdIpNRuFG6SK+/UHetky9ISby5iiNSeNzd10j7Pth+vjVy4kGuiKskbc/dYX85Fh4z1d1Ic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh8yonIHpQPLVsmSmXEcoTAEP7VJUYaVT+W6Jeh3gzDi9p82Y4
 RwJYCmM0kD7lsGKxQSxcYa9T7J2pMnXUpdv4YSJubixaPYoiRT092wMA6kpIek82LbaCa5kfDDU
 RhbsSZYtigsbiUHUCPMJaGWDlHjPF7J6Y
X-Gm-Gg: ASbGnct4vD7QcR2ySglwnrmBN1OXD+yVjX33VUJ6CFTQnZVRE1jBrPYIxZdotbp2Dfk
 uuFswWl9bjHj6u27AHEDh3TTJsJ2DWD9MWAmepM1J
X-Google-Smtp-Source: AGHT+IEU63Y28K2w7blcYDp/+dS0AGZliyLQ776SYz1U0vvW1jEGL9cB7LS4hbDRrHeb+if+EQZD/SMst7LEzfMgDI4=
X-Received: by 2002:a05:6402:50cc:b0:5cf:f1fd:c688 with SMTP id
 4fb4d7f45d1cf-5d63c2e81f5mr3482687a12.1.1734296030000; Sun, 15 Dec 2024
 12:53:50 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sun, 15 Dec 2024 15:53:14 -0500
Message-ID: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
Subject: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch alignment
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000cdc31d062955429c"
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

--000000000000cdc31d062955429c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The comment explains the problem with DRM_FORMAT_MOD_LINEAR.

Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 78abd819fd62e..8ec4163429014 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -484,9 +484,27 @@ extern "C" {
  * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2
ioctl),
  * which tells the driver to also take driver-internal information into
account
  * and so might actually result in a tiled framebuffer.
+ *
+ * WARNING:
+ * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
+ * support a certain pitch alignment and can't import images with this
modifier
+ * if the pitch alignment isn't exactly the one supported. They can howeve=
r
+ * allocate images with this modifier and other drivers can import them
only
+ * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR i=
s
+ * fundamentically incompatible across devices and is the only modifier
that
+ * has a chance of not working. The PITCH_ALIGN modifiers should be used
+ * instead.
  */
 #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)

+/* Linear layout modifiers with an explicit pitch alignment in bytes.
+ * Exposing this modifier requires that the pitch alignment is exactly
+ * the number in the definition.
+ */
+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)

--000000000000cdc31d062955429c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The comment explains the problem with DRM_FORMAT_MOD_LINEA=
R.<br>=C2=A0 =C2=A0 <br>Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D=
"mailto:marek.olsak@amd.com">marek.olsak@amd.com</a>&gt;<br><br>diff --git =
a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<br>index 78=
abd819fd62e..8ec4163429014 100644<br>--- a/include/uapi/drm/drm_fourcc.h<br=
>+++ b/include/uapi/drm/drm_fourcc.h<br>@@ -484,9 +484,27 @@ extern &quot;C=
&quot; {<br>=C2=A0 * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in th=
e DRM_ADDFB2 ioctl),<br>=C2=A0 * which tells the driver to also take driver=
-internal information into account<br>=C2=A0 * and so might actually result=
 in a tiled framebuffer.<br>+ *<br>+ * WARNING:<br>+ * There are drivers ou=
t there that expose DRM_FORMAT_MOD_LINEAR, but only<br>+ * support a certai=
n pitch alignment and can&#39;t import images with this modifier<br>+ * if =
the pitch alignment isn&#39;t exactly the one supported. They can however<b=
r>+ * allocate images with this modifier and other drivers can import them =
only<br>+ * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_=
LINEAR is<br>+ * fundamentically incompatible across devices and is the onl=
y modifier that<br>+ * has a chance of not working. The PITCH_ALIGN modifie=
rs should be used<br>+ * instead.<br>=C2=A0 */<br>=C2=A0#define DRM_FORMAT_=
MOD_LINEAR =C2=A0fourcc_mod_code(NONE, 0)<br>=C2=A0<br>+/* Linear layout mo=
difiers with an explicit pitch alignment in bytes.<br>+ * Exposing this mod=
ifier requires that the pitch alignment is exactly<br>+ * the number in the=
 definition.<br>+ */<br>+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B four=
cc_mod_code(NONE, 1)<br></div>

--000000000000cdc31d062955429c--
