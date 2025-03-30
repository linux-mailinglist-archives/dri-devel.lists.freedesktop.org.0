Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413DA75B7D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8926E10E253;
	Sun, 30 Mar 2025 17:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDhq2GNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F41510E253
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:45:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCtFgW015021
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=P0ftvHk0zJxR+Mo9YakIO8lA
 GLmBp6+lxXZh/431vDE=; b=TDhq2GNzt/fRJfMUjDvMGmdE/nhpzlbrEASJKHI4
 7bteB2zxTFP4fUDuGKRIt3Y3l6blSuZe6NietQKkAEPMab5Sl6KqUjGF6t0ezvQ4
 A8G+V0/0BUlvDzJAeGtOrEN9gVzMzZr3f4xQAQBv0D5WvuUSvb+cSGfOmqdsmNRO
 qiSdlIB3pPiEmXVOgB8oIe0lTSBN5oFMzFMcIA1a5N7xNbFj6AzET+MTNtnb0yMK
 LHZO4Rp4GvbeUv9me51DeKMFDpTuBEbFosfplg3rk3LuRTfBdbiKLB9SvUsfN7o4
 fj90Mrk0QTKtC3OogN9OK9Q8T1V1aP/2hCGQwI7uyqeqNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qau7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:45:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff64898e2aso7419614a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743356729; x=1743961529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0ftvHk0zJxR+Mo9YakIO8lAGLmBp6+lxXZh/431vDE=;
 b=ZNFqbhA7G9eNDiwZFgHXhQyetc5IiZAItJvu9EZ4B9C+d0Pmx7yi7+MxR1uTbr0FsZ
 12eJxBeWB/MKpA9Y6vvfltm0dMupd4YR5pnFz4rBzFH/3C4wTZAjanx7CEM/yLKUbv9v
 9iTzUaEOPdzMgOU6xpOIBTM8bjQIeHspOj3I6+0jpuc4pLM6HhBrGbQauhh71vpSra/e
 xmC8zwyEsyUDRcs0b3pfEqWLRXtZ9zYErn5z0yFmVSko7RRnlQRK1UJfDFMK1u50Z1NZ
 TQvlfDP1SaGGruSUyi5lD/RWXt18y2HZnbWV2jE+nZuyeY9QlnOe3KpevXbQRqMaqLtg
 Z+zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr4szR8viJ3RtEKGIfH+pjdLlfDoK9zFN8rL/QHB0vcFkxbLOM32aAhZrylaTHVwNtQ4ampNoVQRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3+Kn8Yimj0sAQ4GQmYaA3yS+pQORDFPvZVtodrCM9j5Rjubz1
 S4Hf4DkPZrcKUMDMONYL0uTgPoiGbsmqDtKJm7aZGHqNaHcgZghD2FloHNqTlaQDYD0sJzAbIXC
 7gh6zET5EBAFhyY4TmFQaKr4jsYXEkiqhNDHgVRjZMG99Rzy7gExNh8/BW6EP5MUL2emlU9zNN5
 8PYjNLFRdiZJVWhUBXX0BBVJCvnjQ040J8F0bKFPEFfw==
X-Gm-Gg: ASbGnctw9/l1AFq8y9vSW2t1UANNYRnnDLhMsBm4aBx0ib62ioWctCGgefggYBB37Gb
 Bq4WNXdd4FoV0cDuXekVPqxjzp4AzPdZX1lGYMrzhWPaaQXR9bVmnOKAl9id6ILTI4nlJ2nKh
X-Received: by 2002:a17:90b:1f81:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-3053189a552mr11204821a91.8.1743356728878; 
 Sun, 30 Mar 2025 10:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGME7jRI2sFfJsehCQt4lsWUfCyjJVKWW/oli3FcGjjzFgJjhd9tuzlvDwqRmfcOc8OJA++VOev6W9P/jn0J8E=
X-Received: by 2002:a17:90b:1f81:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-3053189a552mr11204793a91.8.1743356728513; Sun, 30 Mar 2025
 10:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Mar 2025 20:45:16 +0300
X-Gm-Features: AQ5f1JpjYWSUXvbaxiHPEpdW5pr9qFF-4jMf2vNXngE7irr28wNVcYOn4zBVpxQ
Message-ID: <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67e98346 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Nx99i8uyAvHPRi5pis4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ano9RWtde-CYaohzQaV7__DfzBz9z4YB
X-Proofpoint-GUID: ano9RWtde-CYaohzQaV7__DfzBz9z4YB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300124
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

On Sun, 30 Mar 2025 at 20:31, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
>
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> registers is now required to succeed. Before reading these registers
> was optional.
>
> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
>
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
>
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v4:
> - Remove unrelated whitespace changes.
> - Remove unrelated commit change.
> - Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
>   and _CAP__MAX from optional to required.
> - Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org
>
> Changes in v3:
> - Properly rebase patch on top of latest version of drm-misc-next.
> - Make patch more generic by clamping PWM bit count to advertised MIN
>   and MAX capabilities (suggested by Dmitry).
> - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
>
> Changes in v2:
> - Split backlight brightness patch from T14s OLED enablement series.
> - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> - Rework commit message to reference eDP spec.
> - Rebase on drm-misc-next.
> - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e2439c8a7fefe116b04aaa689b557e2387b05540..b5c8a75d036b5d65262417de363409e3ff3f4560 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -28,6 +28,7 @@
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>         }
>
>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +       ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +       if (ret != 1) {

NAK. See previous discussion.

> +               drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +                           aux->name, ret);
> +               return -ENODEV;
> +       }
> +       pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;


-- 
With best wishes
Dmitry
