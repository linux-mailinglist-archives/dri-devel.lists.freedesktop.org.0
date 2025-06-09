Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8CAAD2177
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F6C10E402;
	Mon,  9 Jun 2025 14:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDNPH2Cp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C73B10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:57:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599BYCg012736
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K8r802PenSGXPrkZXgxFoete
 wp971X+pPQskH5G0jbk=; b=YDNPH2CpZZgplNKrxTcITlOUEPl9X7J9WlI6s7oc
 tKFSZL/Q6UGPuy0udoq5iLtlEmu5jQKGVbq8Bieu5ntI9VahAj9SPOcVGyM1T3Wt
 zE64JavD/0VGnHLbOvMUTT6AJIYMROkZdevMny0945sGZhlZzsu5IcwzG7j+F92u
 QZX6xyFBnovv21jKEa6kqrNSzgpAAcwJzZc0gRolaCl/GG6QfrziUncGFn0w8q+9
 T30YAgSUZQMzEZkBZD86Iu/sXTDT2D0gW7DWul9o9+yCYGRQxpVBRkKlwOjNVpOZ
 14bXY0WVO4x4GBv1p31yJf4TD8mW1+iHchFv5GlZVEgLNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6a8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:57:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d38c5c3130so373399985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749481022; x=1750085822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8r802PenSGXPrkZXgxFoetewp971X+pPQskH5G0jbk=;
 b=Ea0RwUfFXEYq08uCEMqI24m40ZdHVhfofp45I3JqAvg7E80/ld+L3siBnOaJUvrjhY
 zow8fBD1sFIAJT16w/W6oyPLZkjUkRnhY6wrRTWgXBcs8XvDPwNNRr9vn7hJUcKWE4ie
 3XBw7GkDK4KBcjAU1CtNenChpKnfrlgUuuamGgtDiE6AQjlX7sguTc8oS9NDzuVwzjEp
 zdQABf6lFuYhxAUtPVX4rS6JO9m1EdmPB6Hf1i8UZlj4gIQ/A66sXkHjLuW4iUGts3Hp
 Y1yy1s5TcGzI18eUT21vYFmQziCB92CcRqK6GnvQqbBHM0kl9AmndKxyjKig+C3AP8xc
 CyXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpFzhM1OMWjFWDcgHPxvgOCm/3+hYy4XDL/A47EqnozgLUDcAjCBi7fl+QkKDPzviQxkmhFlH8cKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzTSrmOQhJ6EHQ5tbm/0nsHZmNcL/wVo99x2NkyeWocON1oq6l
 Ti/5MWOxwsbp+M9Ej2O2wLnkgr+jEf/PP+t65b6ceJ/u7PZykw3Vs0W6kYxeglcOdWi6MM+EHTB
 J7N0kj0rDJWhOLf3MMvztIwgVLF0zovU1wkJjcrWOcPIe/YI+NKlA+fmjU1qkExonDyE5gHpZIT
 yidVc=
X-Gm-Gg: ASbGncvxP+CW79UHxMHTL86sG7fFqFIEo8XU8+T2DLuNXYBvh5NuoqQDxL1dk7RaBHb
 ychXJCkgtSGaBRRg/bpcC6k9tyA71EeHhpjkEJgUjXyXtWKZYaUcHpIZhl3cVm0bvA6tbg8Cezw
 5tMIgPen8K7MXrEoDjUE9ApPb+Jzq5Yv1nIs5/8EQf7ijIbl00i64iD9MvzWOPlevkdmwnz989N
 p0JO6m7DHPgUgchi/2xnHXoF4b2yJ0BmGZgyAEFX4NBaAVw+lTZcQyi7Ntl4tLUISZ1lZqJ5zVK
 xHMN0MxaRI8wZMgvWeuWmO30N0OpLAkYSeGOnTZ5x4NIQu9KcsR7HsZNcNPKN4tTckIyVYiwMf4
 =
X-Received: by 2002:a05:620a:2495:b0:7c5:99a6:a1ae with SMTP id
 af79cd13be357-7d2297b0605mr1872285685a.0.1749481021930; 
 Mon, 09 Jun 2025 07:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7bagCShzpFotGW6Mdie/zxiNFAxlZeqZ3FisYsgQ5S/g+ilyc8bP5T8FnUSbm8hPil7YMIw==
X-Received: by 2002:a05:620a:2495:b0:7c5:99a6:a1ae with SMTP id
 af79cd13be357-7d2297b0605mr1872282285a.0.1749481021528; 
 Mon, 09 Jun 2025 07:57:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b347afsm10911921fa.34.2025.06.09.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:57:00 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:56:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 31/38] drm/msm/dp: propagate MST state changes to dp
 mst module
Message-ID: <4w6rtzhetxrco5ncynr52qeveypfpqkclh24kcdpfcn5u3v5at@evxsz3xdxfio>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-31-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-31-a54d8902a23d@quicinc.com>
X-Proofpoint-ORIG-GUID: 4acitV3B1B0-12nBFT4zswOq0iwm70Jq
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6846f63f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=dJ-eneoFgqejyoFL2bkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4acitV3B1B0-12nBFT4zswOq0iwm70Jq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMCBTYWx0ZWRfX5QG4uf9vVnjC
 xiDa27RwBfDdZ5cRUeIYEOp/+IoUOsx13aEX408oxYNNOBnEShvkEdQahzwTWsRVcyrUZm+HvVE
 eDcgTHID1uEuKHCnHiShmPrqU3Dv4UQTfnUpnGrCDmJWBlnlFJk95nCT5yHPeT47UPMtWsGqPCa
 0U2mdr/vF6NM6RF9IomxRHDB9yDTY1Wb3NtLeb/lYSuN8WSWGLPuKK9ipxEpF/k926ZEsrJ1XhA
 GE6Vk2I29UgFrldBwQoDxb3pUbDeSLjb9ujPZAHsMuv7qkLOTRgmpKb6N6VqZ7F0ryGoawgA/uK
 NhkobRLZs5wShtanC/SuG2WNny9zMeWwzpTI71tbVan2Twrd+ujU43H8KF0xN2aCG+bUXx8EpiB
 O8YYkI9nAyWlmznidJ4VoXuoqxJ2gkEQB8vKjf5g1k2MSlQjkt58199VoLqvHqjK14AlroVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090110
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

On Mon, Jun 09, 2025 at 08:21:50PM +0800, Yongxing Mou wrote:
> Introduce APIs to update the MST state change to MST framework when
> device is plugged/unplugged.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Hmm, who is the author of the patch?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 323d1c0a9efa4fa30ce97317e873607c54409a11..9dbcf4553cad70c9e3722160a87403fc815765d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -29,6 +29,7 @@
>  #include "dp_drm.h"
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> +#include "dp_mst_drm.h"
>  
>  static bool psr_enabled = false;
>  module_param(psr_enabled, bool, 0);
> @@ -420,6 +421,17 @@ static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>  	msm_dp->mst_active = true;
>  }
>  
> +static void msm_dp_display_set_mst_mgr_state(struct msm_dp_display_private *dp,
> +					     bool state)
> +{
> +	if (!dp->msm_dp_display.mst_active)
> +		return;
> +
> +	msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, state);
> +
> +	drm_dbg_dp(dp->drm_dev, "mst_mgr_state: %d\n", state);

Yet-another-oneliner? Noooo. Really, no.

> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;

-- 
With best wishes
Dmitry
