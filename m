Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F57E077F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 18:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D28010EA42;
	Fri,  3 Nov 2023 17:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4931E10EA33;
 Fri,  3 Nov 2023 16:37:56 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so3907995a12.2; 
 Fri, 03 Nov 2023 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699029475; x=1699634275; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0oO/80ZeYt4KVkN4kDuX7GkoCNLaCgmInxlkENKg9eo=;
 b=VxeNYgEhAJodqmhRkCiSReqR+/NPJrwN0NxXVTk9QYEGFPJ31EanBZqZ8hSKXpGR2b
 tVwjwhfZnHsE9pgd33WK7uU/Hub/8NxBmL2H7pERDzEwTsQ+70k1OPTISG+udrs5lUMO
 z9OJme84NUzggtDDU56epBilVYdjmlm2hiUjTfltGRMUt2IwdoxJUZdER/+1NAmMs/co
 jmU2XN0z2U/T6b1KgBEMweuNNYU94lpbBDJoO/WuB6cResInfO2bxEm56KK1wjV2iu32
 egtw0dVSW7kh2/JNrGPsvp5/5q5ShoGUGe+3hanm1xkMRexYI5AXPXdmNSPtsurpFLBQ
 CNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699029475; x=1699634275;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0oO/80ZeYt4KVkN4kDuX7GkoCNLaCgmInxlkENKg9eo=;
 b=g9Ll3NpjIOVN5amqX7XEUOKO8Kf/GthWveuZ3CL/loTL73sddTG7f0cW6in9d3Xunn
 7fbnQeLZ3+1ixZ+g66xY8nZxGtPv0L+a2fjyXzRvgXXDL0M9Yy7GEXqvEVrYbKGo+PvT
 x12qH9UssIrBqZM8gxg26psdFBUmtiM7tJioE6ZmmJJSvvAr0w6hyhPdpcxBTwbIFmnT
 QQW0CqAl5zEP+MFr7GWRi8/Z8au1VtuB13t+ekTy2NrJHKL63uTY5xw6YxMKrygiwv+2
 V1W8xSHkoFEAolqZW8b8XzQ60dHTdt//TuaUKp9I0Y/tZ+oQYOFtu+Kkz5h3818IKdiO
 oR8g==
X-Gm-Message-State: AOJu0YxHeKsc2ePvUzdCIwPqVo8yY+zrpP+PAiLEjFaTyDktGxm4LTjP
 +yjWJ7TRCzDEnSSLsA50zRvzvIt+xql9W9vYHAhW3vKm86E=
X-Google-Smtp-Source: AGHT+IGpYR9a74iT7ijf7bUPi/PqW6G6CZfJCgU+gck2RDBa1GYYKLt9m+XZks9UCsHS9F2yZVz/Nwt5eooE6CbvYSQ=
X-Received: by 2002:a05:6402:a43:b0:540:2ece:79 with SMTP id
 bt3-20020a0564020a4300b005402ece0079mr18023886edb.10.1699029474367; Fri, 03
 Nov 2023 09:37:54 -0700 (PDT)
MIME-Version: 1.0
From: David Edelsohn <dje.gcc@gmail.com>
Date: Fri, 3 Nov 2023 12:37:43 -0400
Message-ID: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000485e730609422002"
X-Mailman-Approved-At: Fri, 03 Nov 2023 17:35:37 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000485e730609422002
Content-Type: text/plain; charset="UTF-8"

Dual-license drm_gpuvm to GPL-2.0 OR MIT.

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 02ce6baacdad..08c088319652 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
<https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=6f2eeef4a0aa9791bbba9d353641a6e067bb86c1>
+++ b/drivers/gpu/drm/drm_gpuvm.c
<https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=f7749a549b4f4db0c02e6b3d3800ea400dd76c12>
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (c) 2022 Red Hat.
  *

The above SPDX License Identifier change is incorrect and no longer
valid.  The change misunderstood the syntax of SPDX license identifiers
and boolean operations.  GPL-2.0-only is the name of the license and means
GPL 2.0 only, as opposed to GPL 2.0 or later.  The "only" does not
refer to restrictions on other licenses in the identifier and should
not have been
removed.  The hyphens designated that the name was a single unit.
The SPDX License Identifier boolean operators, such as OR, are a separate layer
of syntax.

The SPDX License Identifier should be

GPL-2.0-only OR MIT

Thanks, David

--000000000000485e730609422002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-b" style=3D"font-size:13px;background-ima=
ge:initial;background-position:initial;background-size:initial;background-r=
epeat:initial;background-origin:initial;background-clip:initial;color:rgb(0=
,0,51)">Dual-license drm_gpuvm to GPL-2.0 OR MIT.</pre><pre id=3D"gmail-b" =
style=3D"font-size:13px;background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;color:rgb(0,0,51)"><div class=3D"gmail-head" sty=
le=3D"font-weight:bold;margin-top:1em;color:black;font-size:13.3333px">diff=
 --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c<br>index=
 02ce6baacdad..08c088319652 100644<br>--- a/<a href=3D"https://cgit.freedes=
ktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3D6f2eeef4a0aa979=
1bbba9d353641a6e067bb86c1" style=3D"color:blue;text-decoration-line:none">d=
rivers/gpu/drm/drm_gpuvm.c</a><br>+++ b/<a href=3D"https://cgit.freedesktop=
.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3Df7749a549b4f4db0c02=
e6b3d3800ea400dd76c12" style=3D"color:blue;text-decoration-line:none">drive=
rs/gpu/drm/drm_gpuvm.c</a></div><div class=3D"gmail-hunk" style=3D"color:rg=
b(0,0,153);font-size:13.3333px">@@ -1,4 +1,4 @@</div><div class=3D"gmail-de=
l" style=3D"color:red;font-size:13.3333px">-// SPDX-License-Identifier: GPL=
-2.0-only</div><div class=3D"gmail-add" style=3D"color:green;font-size:13.3=
333px">+// SPDX-License-Identifier: GPL-2.0 OR MIT</div><div class=3D"gmail=
-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"> /*</div><div class=
=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px">  * Copyri=
ght (c) 2022 Red Hat.</div><div class=3D"gmail-ctx" style=3D"color:rgb(51,5=
1,51);font-size:13.3333px">  *</div><div class=3D"gmail-ctx" style=3D"color=
:rgb(51,51,51);font-size:13.3333px"><br></div><div class=3D"gmail-ctx" styl=
e=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sans-ser=
if">The above SPDX License Identifier change is incorrect and no longer</fo=
nt></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13=
.3333px"><font face=3D"arial, sans-serif">valid.  The change misunderstood =
the syntax of SPDX license identifiers</font></div><div class=3D"gmail-ctx"=
 style=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, san=
s-serif">and boolean operations.  GPL-2.0-only is the name of the license a=
nd means</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);=
font-size:13.3333px"><font face=3D"arial, sans-serif">GPL 2.0 only, as oppo=
sed to GPL 2.0 or later.  The &quot;only&quot; does not</font></div><div cl=
ass=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"><font f=
ace=3D"arial, sans-serif">refer to restrictions on other licenses in the id=
entifier and should not have been</font></div><div class=3D"gmail-ctx" styl=
e=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sans-ser=
if">removed.  The hyphens designated that the name was a single unit.</font=
></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3=
333px"><font face=3D"arial, sans-serif">The SPDX License Identifier boolean=
 operators, such as OR, are a separate layer</font></div><div class=3D"gmai=
l-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D"aria=
l, sans-serif">of syntax. </font></div><div class=3D"gmail-ctx" style=3D"co=
lor:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sans-serif"><br=
></font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-si=
ze:13.3333px"><font face=3D"arial, sans-serif">The SPDX License Identifier =
should be</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51)=
;font-size:13.3333px"><font face=3D"arial, sans-serif"><br></font></div><di=
v class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"><fo=
nt face=3D"arial, sans-serif">GPL-2.0-only OR MIT</font></div><div class=3D=
"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D=
"arial, sans-serif"><br></font></div><div class=3D"gmail-ctx" style=3D"colo=
r:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sans-serif">Thank=
s, David</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);=
font-size:13.3333px"><br></div></pre></div>

--000000000000485e730609422002--
