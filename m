Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A482A3EA6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FACB6EC47;
	Tue,  3 Nov 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231E6E41A;
 Tue,  3 Nov 2020 03:44:17 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v19so12527700lji.5;
 Mon, 02 Nov 2020 19:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PWQ8NTeZLFQdv/5YUa7psjB27IntvMdSU7mW9fezuLM=;
 b=r9pCOorFPx1U7iOcPRDRhubqANLsHcFODnILtaTQPwKltnK37lGvUrbvOREwyet4YM
 lSCA86a8gNjX3pW/KCcxc8aP1RDmE/d6yQlbWCdGrNV6Ci4byjlhEXV3ExRzbVeXtqlB
 eb+Fc1WJxivbOmR8GFX7OFD07T6hfaZkZ8sCykMO88A9UC84i5EuAj//D/T0iyGne9Sq
 PgWwx1g6QEoej/JbEvpm06UwrhbJcj8k5mtJBRfNKJeXj8RGUTeEpq0cVnJFTUgm1eTv
 LhCAoIcfrNJZ/aeQuRZv46f/72WyTdf1rr2yW0rBn9dBI/XuLEJsl3Waje+P1nLHzLSS
 Zf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PWQ8NTeZLFQdv/5YUa7psjB27IntvMdSU7mW9fezuLM=;
 b=LgK/VAzw1EREPQA7/M+k0/Lj5O8rLiwZKTAXZtS9maLZO8ui8crKd0oOpCynaalf2j
 4I8+RmHtYP7K+qyYKqNJ8h70tu9J73a/dEX8PNVQDISx9eQTy6td3YzAbtl1XEj1J6+2
 lKefzMtNUhlW52MjpSKRjJthoKAVQtgKNEpHL0psVxtk/9THZDkl0Tj3+KDFAJFDFwoK
 W2JTdjMyyrmRBVW1Ql5QpHoCYNDqxh2ruePJMgZephi03hWZX9YiiT04RmDCK45D0k8m
 6YB08JORQ1x8B7IwzRBuNRiaYCl5JZD+vYeaxZ3J/9ktXvmGu8HIJIDnhBz990OmXxx7
 cDvw==
X-Gm-Message-State: AOAM530wPupMNatxkgwgYhjrCaoXqfSl51nI/h16t9vRJtyE2ayW6nfz
 7WJzHYoyI8T9MBrqPAiSYPQxQygJZIAtT8vnhmQ=
X-Google-Smtp-Source: ABdhPJxhl/OwORCpXDTfvs2MFrtCDs/0VZHFQjX+F9UZYF2b2fzm3IRy1qfoFWu91md0M1ac8H7+zQabn+zz3vYW+kg=
X-Received: by 2002:a2e:50a:: with SMTP id 10mr7332878ljf.55.1604375055534;
 Mon, 02 Nov 2020 19:44:15 -0800 (PST)
MIME-Version: 1.0
From: dev god <g0d3ph@gmail.com>
Date: Tue, 3 Nov 2020 11:44:04 +0800
Message-ID: <CAKWwwMhUPk3hAs6oPKHxvV7jVgHh4WP3bvZGYOkPaSF9fRRh9Q@mail.gmail.com>
Subject: [PATCH] drivers: drm: fix msm_drv.h warning
To: trivial@kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, 
 Vara Reddy <varar@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Zheng Bin <zhengbin13@huawei.com>, Chandan Uddaraju <chandanu@codeaurora.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Content-Type: multipart/mixed; boundary="===============1136580562=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1136580562==
Content-Type: multipart/alternative; boundary="000000000000458d0e05b32badd7"

--000000000000458d0e05b32badd7
Content-Type: text/plain; charset="UTF-8"

Hi

fix implicit declaration of function error.

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1229:7: error: implicit
declaration of function 'msm_dp_display_pre_disable'
[-Werror,-Wimplicit-function-declaration]
                   if (msm_dp_display_pre_disable(priv->dp, drm_enc))
                       ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1229:7: note: did you mean
'msm_dp_display_disable'?
   drivers/gpu/drm/msm/msm_drv.h:420:19: note: 'msm_dp_display_disable'
declared here
   static inline int msm_dp_display_disable(struct msm_dp *dp,
                     ^
   1 error generated.

Signed-off-by: Gah0 <g0d3ph@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c258b553..52d9a82fb64f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -14,7 +14,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>

-#include "msm_drv.h"
+#include "../../msm_drv.h"
 #include "dpu_kms.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
-- 
2.25.1

--000000000000458d0e05b32badd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div><div>fix implicit declaration of fun=
ction error.</div><div><br>&gt;&gt; drivers/gpu/drm/msm/disp/dpu1/dpu_encod=
er.c:1229:7: error: implicit declaration of function &#39;msm_dp_display_pr=
e_disable&#39; [-Werror,-Wimplicit-function-declaration]<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msm_dp_display_p=
re_disable(priv-&gt;dp, drm_enc))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>=C2=A0 =C2=A0drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c:1229:7: note: did you mean &#39;msm_dp_disp=
lay_disable&#39;?<br>=C2=A0 =C2=A0drivers/gpu/drm/msm/msm_drv.h:420:19: not=
e: &#39;msm_dp_display_disable&#39; declared here<br>=C2=A0 =C2=A0static in=
line int msm_dp_display_disable(struct msm_dp *dp,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>=C2=A0 =C2=A01 =
error generated.</div><div><br></div><div>Signed-off-by: Gah0 &lt;<a href=
=3D"mailto:g0d3ph@gmail.com">g0d3ph@gmail.com</a>&gt;</div><div>Reported-by=
:=C2=A0<span class=3D"gmail-il">kernel</span>=C2=A0<span class=3D"gmail-il"=
>test</span>=C2=A0<span class=3D"gmail-il">robot</span>=C2=A0&lt;<a href=3D=
"mailto:lkp@intel.com" target=3D"_blank">lkp@intel.com</a>&gt;<br>---<br>=
=C2=A0drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-<br>=C2=A01 file ch=
anged, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c<br>=
index f7f5c258b553..52d9a82fb64f 100644<br>--- a/drivers/gpu/drm/msm/disp/d=
pu1/dpu_encoder.c<br>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c<br>@=
@ -14,7 +14,7 @@<br>=C2=A0#include &lt;drm/drm_file.h&gt;<br>=C2=A0#include=
 &lt;drm/drm_probe_helper.h&gt;<br>=C2=A0<br>-#include &quot;msm_drv.h&quot=
;<br>+#include &quot;../../msm_drv.h&quot;<br>=C2=A0#include &quot;dpu_kms.=
h&quot;<br>=C2=A0#include &quot;dpu_hwio.h&quot;<br>=C2=A0#include &quot;dp=
u_hw_catalog.h&quot;<br>-- <br>2.25.1</div></div></div>

--000000000000458d0e05b32badd7--

--===============1136580562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1136580562==--
