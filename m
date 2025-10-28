Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26AEC16F52
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FEC10E66F;
	Tue, 28 Oct 2025 21:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnggW4ue";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gty/e23M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6E210E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlDXG2616656
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=buWf0Ypb6OYJRaVhj46HKhwl
 jA+c0LfBLxaOuJMXUF4=; b=TnggW4ueFlJVAw+iErtFvrfcjR0uJa/t/JJVhDMZ
 4i/rjpK4ZspqGXiWtLGp/TfOOLVY1C3+NE1PZRE3NnruanL2pn8JIacL4LPK8QyL
 NhhAE5P8Ji1VbYZL42ORQYoxc6bVtaGuAm3zd/s0EL6NBY8zE984xqQUHABe9Wxl
 7iIrHlHtzdUXjts02Pt2pke/uGNjmt+s8XDbp6IP6ZtY87yJ04FFRJhR70QtBowe
 95RGCM+0wS6cxqQrFPOT3EHTn03vA16oUf3Lcr30YyazdTPFoGh5fE2nrauwbf9d
 XwbAP0LSfhvV1vYrMEy8aUqgqNVPLuRKGbBPmCOGbfP1Jw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y07pf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e894937010so181882601cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686740; x=1762291540;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=buWf0Ypb6OYJRaVhj46HKhwljA+c0LfBLxaOuJMXUF4=;
 b=gty/e23MxzmPw4uvmFmbPU7O4jwFdgeVaIEWtYNj+vh0G8jhteQP9Ws4sg/GOBq/hQ
 xnXPTyLnFwh6ZJXGrmBWkD1biZAXbtAdrc0BpTTgnT6PmkuXlTtaTZ2DUKP4sxQgczQK
 8rF/9h/EY6ZdmhWVrALA7QxzlsrjgYjw6VRDhZSaANR3pvUmz2jA+q6mMmVSn3w8WJ90
 Wa8kweWmHqfjqm7waxqRwdC6nkLpSBzy3dRWklw5Ww84e/58YZ7dAPrWl9hcbEyfn6jX
 3p3i6l9XT5y7A/FnyrTwdXylBkAJLADP7iAUxBYs4PlhbwOJQNtEWr25VNNYm8/6yAPu
 y8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686740; x=1762291540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buWf0Ypb6OYJRaVhj46HKhwljA+c0LfBLxaOuJMXUF4=;
 b=RjzczVdQ1sEVQncp8xmB8Y7TdRqRY0jH0tlkppzDGtbMOTPG/taXVgDdSPlShbg4C0
 VOLFZrvCN1MV1oIEY2lCQgSblBn8F62WstM2SMqgCxnEiibdYX1ObDUJz56L/fivX4gW
 nFnMbbux29UcBHO1Y5mvkpHxIQoBzM/Eyr0zZzKyDjnMZALVlGiWcVi0m2zp0Wm68+1N
 oDuhjE/RVj/J31m4eECR75Z2DXG4IBUqaKSkPVmj57N3C3eRIuhf8PBfBVSjHlzh924V
 /5P7NXeboLDSNjAEIHKyk9w9Mr/VrOoQFPR4fI3neSNHA17G8hoVP+tPIbWL0ltztfCf
 xR1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlOCddbTIb4STFJecF5YlLXt85JKjP4PckAolBdsEKLP1zx8RA3A6UpZXDKEGfdFpE9jaizsvuGtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd3D5QADmwkAOekVbJ4e2bXJ8D03tZxjAB5IpHntmZH7ddLSZH
 MwMQhmWNPudsq7/RWiKjZAoSaeTZWYhZ1VBM/sm9il7iBtMuS+nx+tMA4mqzVMA0/OEQJm+q04A
 GMMUg/P0ZIkALkwjW3mtYYkdZGwSQLad5e6BFSlLpDlVKcR6UJ7hjwHdWXhivtCN7OJt+9nc=
X-Gm-Gg: ASbGncvgWkIIfa0veLN6KskzN0qNhdEzj629pcaJXuS5xTr1iAo8fYtLI25zZ7xubdp
 YvcKdI0yGturk7z2VKRcCslDkRl509CN28lSKHn8lDcTX7sa3UP4RhvclxMJvlDnke1BtJIOAOk
 nLZCReAMGV9gUQgCQYl4ypPwOcF8I25wTVaA3eo/k18XeLdEOAjNLuEq8Q2xw2nhHM8ZbjFo+l+
 1qgkUG3MCxAAhrY4LtTRdVC6kX1+3vH8+o0t4jmT2w9tBPdEv8j2RXE8wViaKvs1dFyP0oN8Enk
 zltGR5GSYm3qumtFDzM9zd2oHn6ct3QNsM3o+P/b+zcbS7vZiNwTVE5g/KYYc7uBNm75A8ZL3AC
 q8PiG/z37+EBPhz1rSDRZjs5lG0wbgSW7zOYQvS07M92x6y3kQPvcwU0ujuJVks3VTK4nVP75OW
 y7atATIB80Zxf+
X-Received: by 2002:ac8:6909:0:b0:4e8:a560:d96b with SMTP id
 d75a77b69052e-4ed15c020b2mr10948371cf.41.1761686740424; 
 Tue, 28 Oct 2025 14:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO5pCJUeWKODo7AqcDXtB24CKjFMyBTZ3ZE99nuuxHRCx3zn3Hq6WfRARXUseSiFF6FSGTDQ==
X-Received: by 2002:ac8:6909:0:b0:4e8:a560:d96b with SMTP id
 d75a77b69052e-4ed15c020b2mr10948011cf.41.1761686739982; 
 Tue, 28 Oct 2025 14:25:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f8471csm3295318e87.106.2025.10.28.14.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:25:39 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/msm/dpu: Disable scaling for unsupported scaler
 types
Message-ID: <a56tw3xxxn5u54hs4pt64b5ljlp26x23lvftu2tblwpvuzx5xh@quyr7xyn7sn6>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=690134d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LqUZSzWJFxV8yDGbkgcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kn79tvikUIpeD5rAwGHl0KxRCBAVitY-
X-Proofpoint-ORIG-GUID: kn79tvikUIpeD5rAwGHl0KxRCBAVitY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX6mEYWRCtekMR
 /qquXAenp5ycYokB1pHPhqtbf5orzYaBjMWISnSlaRNtTiI64s+H48fgtEJjNJGsm3F6VXnUOek
 bE2xI7ow3laBOlXUmhaZzX4mQmudmLG7Kye2zL7+JvAYMo//vmyJq7TEcSjZuO8lsUz5q6+IkwM
 sVMLU7RncuBj2eYtygg1JyeNcGN37ruj0jKgIwEzAFpWnxo4UoDipq8GpQhGBfPWrCvirezhF2E
 h96ZcKNOhlBhVaVIu1Ln1Z0kjOReFj83p9Z6ZM4RB3QomUheXZM6FMECAnZUhoCDoaQjcy0Jto4
 EiXQcf6jMHLxvizWJyAsb3UOfj/gtSgsaX7G+oWy0ZV5wFvQ607YLWkCRo6TuVbCq8lzWF75Al2
 zUv/j0+vLa+1h/Hq6vvDxWGn5jb6nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:37PM +0000, Vladimir Lypak wrote:
> Scaling is not implemented for some type of scalers (QSEED2 and RGB) but
> it was unintentionally re-enabled with change below. The remaining
> condition in dpu_plane_atomic_check_pipe is not enough because it only
> checks for length of scaler block (which is present). This patch adds a
> additional check for setup_scaler operation.

Nit: in future please refrain from using constructions like 'This patch
makes foo' (see Documentation/process/submitting-patches.rst).

For this patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Fixes: 8f15005783b8 ("drm/msm/dpu: move scaling limitations out of the hw_catalog")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
