Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21394B1F2C0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 09:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9D810E011;
	Sat,  9 Aug 2025 07:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOvv5hT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC4110E221
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 07:10:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Lnn3012617
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 07:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lGIoJPjVaweh6fzYPRiYjwF1
 gDXSBBuomIgkEtxpmgc=; b=VOvv5hT9xA6M62f5MM1zOyfhwAmy9+7nRw7qqBEn
 K5YHfyVMcX8uqXXsFj24oIpbM9eaRa/X7tLbke90A42h2tyoeP/N3+NG8/ClM8OU
 dwKi6sdSEH6Jb/TptdXr8mXCcnM1SADPEQITkwy8N2RAiasyJjXAbRAn5gpCuVMh
 tYw/xdbOHz1AqiA+EAj+Og6dUu1+zjlisXCNZTbVOdw0cMkYwsx1yGFG1JBWSCgI
 vZCcIvSYDEdu88QNVqCs87SRP64C9jOGebb8HWfHtj32yKGEPVWzEneRKwL3hMVH
 HJnMvCu7XBZAZAZGJ7w0LGW3YMbckvwgDmZT6XSRPi4S4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fgetg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 07:10:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af2237e4beso69902491cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754723431; x=1755328231;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGIoJPjVaweh6fzYPRiYjwF1gDXSBBuomIgkEtxpmgc=;
 b=raYxrpUIE1oUe3gzj+IAG7pfU5o0qYkt5IHWdKue0nboZJ16D4QoOgjx1qfmrXT+1F
 GtSGkUH7eOZIKfJpj1RAs+C2EhgIZKlAodI5W/cL80c6dCYLk/1fnkrRsgf6S7ugBEMN
 rMFu+L4s+36uRD1QnSbDKxyD24kyAmQxoibB/FRSidfC96JcC0cQK3O6wB1xPz/RW+9Z
 nTCMbGi9LpssYtgGFGZGm56mEZmU4tPiWdLwg/067+VM12TkWULqvy6nHoRAFIL8FnKx
 YO5H7Aw3sQXR5JZ346CPLxZafF7r2CKCz2Nw36Pth80uLqXOymcQ/W/dRQ5C2nf7dd9Q
 itzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXev/1BYXbzwj0EpBkcN/AdYhBXvZPh5d5GwiIJE+W1V5rhscNyOZdlMNYEc9r9aTwlpr8fPOVzkhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2FQcbfNlvf1uXDgQ8xf9IDF7iFI7sOQnCmbsVWGaHcyI76koo
 AxzW89ChxGEUz6ozzm/uTIVII6V2U11br2wbCm7grEQbIwAvUjgs2gSYloHzR05WaSmIM7b+oi6
 gnuiFFCapOU8LQadCAXsAtDGESj6V6zr4765DwBnmsozLzeaTPa15jEjdzemEC5YF1u/YCco=
X-Gm-Gg: ASbGncs5/4Rsp2Cxb9uVOd0Ndpq5WMlhPS8nJGNWxfFlB1E+hEVEG+q7/BQZSF1IZrJ
 s5m7ewaTUPY1Pzbzji6BCz9fdmXanoqGv5pQsTmSAa0tbpCI2hnzkINleAkWskEoUeSGuxpaYf1
 G8MMezKjjvpB/sUJS4KCp38a7Mf7LcS1BKWEAolHxxSjwS9/jHZCFQqNjdWFYlk3kah/mv0QWud
 LSjvLWSzrzZ8hFinHD0C+fCNZ72CXjdtRTYOAwVzzdvNz0hlMneM5YuiKpTD85JnOJp5PRHosVE
 bq7QrFqK6EYehIO1fIT37YDWN+NGPedvYJVPMAaZQHR9J7em9P5pPo+pKcYm8NHZUXz04FymSM8
 vHtQlLwETIdfI/IJHnziygg0vCXN7OQevkIum8Hd3G7RX4md3oq3N
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id
 d75a77b69052e-4b0a06eedfdmr151126061cf.3.1754723431327; 
 Sat, 09 Aug 2025 00:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV6uIbGHBTb/R1Jt3TX1bc0j6npBwpC0efjKBnU0qNU5KhhatLsSTXZdchZFM7R1iG73Hy5w==
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id
 d75a77b69052e-4b0a06eedfdmr151125621cf.3.1754723430746; 
 Sat, 09 Aug 2025 00:10:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88cb7c4dsm3320058e87.170.2025.08.09.00.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 00:10:28 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:10:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 09/12] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug handler
Message-ID: <45shie2h45zmrrgtkt5k4v5hb7cjspjkdfugy3mvsjsbeggrm5@mfyhk5ntwmqe>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-9-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-9-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-GUID: bBu_NGP596IDPMS16F5lCD_R0QfDOioq
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6896f468 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=S3fc_xTQ5om5qnv2m30A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX4CE9JZSdVxC3
 MrbOLk5k6XhIuQZVrhoV1wRsqW21LUGbLLmRc7QuzN6TOhEE/5TCE+UCJ83O0tavPGy0KMmDYwt
 tYASggZnOX/ykIVROWncQcapTbkP2Yapa+bIl6ZyT5EAxOnGDNlgCvGjq/hbE7Gic1Fv8Yypgk9
 +Ji/6mNp9LQu1+JdEebJkDW7Sb4zjms0XoFUvnTJZ6zKFc9gK5iU6wREJNaLTG10khjyTfuNdzs
 3INFUbqIUZPLged8xt+ATalebLvkE0WnXcKQSU9LBhLx4hKiGtzECEbpLJsA3NkhNeOlNCZC8tC
 slbECEGh1vhy7h+dvgwP2rIcFfJPIZmzZ7uD8VIWI47qhM43rHLuSyaKqdS6sZtwMJdR+Bfmrj3
 h1Xx7JzW
X-Proofpoint-ORIG-GUID: bBu_NGP596IDPMS16F5lCD_R0QfDOioq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003
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

On Fri, Aug 08, 2025 at 05:35:21PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
> Chipsets"), checks were introduced to avoid handling any plug event in
> ST_DISPLAY_OFF state.
> 
> Even if we do get hpd events, after the bridge was disabled,
> it should get handled. Moreover, its unclear under what circumstances
> these events will fire because ST_DISPLAY_OFF means that the link was
> still connected but only the bridge was disabled. If the link was
> untouched, then interrupts shouldn't fire.
> 
> Even in the case of the DP compliance equipment, it should be raising these
> interrupts during the start of the test which is usually accompanied with
> either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
> be fine to handle these anyway. In the absence of a better reason to keep
> these checks, drop these and if any other issues do arise, it should be
> handled in a different way.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Note: Taken from https://patchwork.freedesktop.org/series/142010/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
>  1 file changed, 3 deletions(-)

I think this patch and the next one should be folded into the 'drop the
HPD state machine' patch. It would be easier to review.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index eabd6e6981fb..dd3fdeaacc91 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -495,9 +495,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_DISPLAY_OFF)
> -		return 0;
> -
>  	if (state == ST_MAINLINK_READY || state == ST_CONNECTED)
>  		return 0;
>  
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
