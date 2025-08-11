Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2525AB2054B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9E510E41F;
	Mon, 11 Aug 2025 10:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9sOpvJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526CA10E426
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:28:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9pU019056
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=S0wh/vf9/ahF7czkuW2zqdi/
 QK9zgAaa0tIwnSvWMPo=; b=d9sOpvJshStdAy5fa3QCF2K0LlzG6kYdh0u51C12
 tq/CY6gep0XLjkozWPaZQAAVnQKqRxdS22XjMpXF9KpTa/xwmJklZcYi58+wVtBz
 uccjxAgMX3MC0JIAnZBb19FrvZGpx6IfkxOaa+Oaw4McjQGiTFsw+pKUpU8mxJjs
 7N8dBL8C/OS0coltbGBCZHdG9r++tckpKwCpGwDM/DS10wGnY6qgBbwKEhy1sYxr
 kOIn4k/qhvBDr23TfRdX3tXIKif+NCPm8UvNEutjTP9aa6ceDjrb26lTlYkSltQp
 1okPKCG5h7mnm9HBgpDlZUdf7Uhjsf8pf+jXYzOJhqBDmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv00n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:28:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af1a20cbcfso111169971cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908088; x=1755512888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0wh/vf9/ahF7czkuW2zqdi/QK9zgAaa0tIwnSvWMPo=;
 b=ZRUJdVshi22yDKCnL55WZwL0X6UnSTsfePvSVL6Jo757tbADFXRmskq21ULXrROYHG
 rGKNjJUYpez8ex3RWUTJpF5foNzQXi3SaAu6JuhbnehbqBhyytm1XRJfXskKrBHmvDXy
 QL5BVtPGtc4dQG5V9Lel8dPIbTu6iGH/x5XpMpW7ByPAmlXX5L8X3R75K6iiqJZpkZLD
 ameMKzZMxf2MduEQ0nP5e+oKqSSH16lzrkid9ffM2LsB+G+b/JNsPXRiZzxihpV2UVu5
 QlBRhFctudURTiPQaor/ZQjwHbrBbv2IMlow+l3LPTRLX96foOSze+C4Ez7cqTNeQDR/
 l/5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXojwf3G1nR+/qqefie8yas3/LOaRCu7m5OLHBcJzcvF+rnFcOHYEzIAWDbLeb1CxIByzCKrJJKmhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVs8eKEqJsYE9sVIjFw0CfEL2VYWoOPtC/+AUApUhOaQ3e0+AC
 cx76Vg/XFAmAhbQvIICoxCp2A/3odmwZlBvRpE7lvsELVeSzY3CqqmLw2vTXpfCZhbql23oWJLx
 4m9rHINOGOSWNx1xz96mFD2qBPEBGeAZDA6FSGG8aijBT7PBN4C3mi5butI8Zc6GUokw5Ae0=
X-Gm-Gg: ASbGnct/cjr4xAGsYBtJsYkf8l4oW0zhKQ/6/tFf5OyQzJ0klyVI3H17j993IPd4PXu
 B42bCdfH6nTJg19fY6XBTJkzNSuQhFVaIojx6p5R8Fq3MfX7GcHpeCrWgsIwPQmXzUFi6PAHDB9
 whd3wiy4cvRHcsFflT46ailqG2A1e4rmQrnxhS5cnSVSZjul2k50Tl27lm+EUETaPVIjHFuN7Pu
 3bLFoXZvIbvlPUAVTq2811JqtiPeTMlG7iKFJaSGcK52UR7q0hTfqVQ/bokLQg5whf0Ci/S+iaJ
 quqCzYuM4aBC9nfqXNmpfO422ixCwSTMkYnZQmn84RuwHS3dF1V0sb94TlPv9dq4K/wKN8P6CzU
 PvGMHQ+d5PD9R2efidq9f9nzdxZiRzcyk+dzhOpf340VtT1a0VTPd
X-Received: by 2002:a05:622a:348:b0:4b0:889b:bc5e with SMTP id
 d75a77b69052e-4b0ca69c598mr83121251cf.22.1754908088374; 
 Mon, 11 Aug 2025 03:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGChlYy+rk1d69F1ULSQJbZUJQYjmNVQhVTyYQ4mc1AGZP7o17UaEkItyvfAe/6wocgG6cF7g==
X-Received: by 2002:a05:622a:348:b0:4b0:889b:bc5e with SMTP id
 d75a77b69052e-4b0ca69c598mr83120731cf.22.1754908087789; 
 Mon, 11 Aug 2025 03:28:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88cabb7fsm4247040e87.146.2025.08.11.03.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:28:06 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:28:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org,
 laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <g7ny277cnctr3edw53qyutiyv3yxah2m7pulg2u6gud6f2gla6@micq4aliwx3i>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c5b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=-zeacxS0QVZa6ZkZsZMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: dDOTxFIjWwoCmQmUUxYoca1czUYD0Hjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX2hzvohhpunJ0
 0fyI621/T/3h87HHrFEN2PJTPC3IRiFqSUZaBYk+0jxQvL/ggTSs1+Aubraa9EY9aK4soA985o3
 KhOEpiP7Q9XgBcSZoo9xYoQXRGefE8XGWvdmIVuna9BIdavZLZDC1e5g9bRE/pvCxqc4EfV0rj4
 F2vCVXO+fNXJexy+apbk1EWznLMTqnzoRRiI/x0e32GkXQfq4yOQf7GD+YeTPpd+1PFpNrnzCC6
 oKVT+UJuFW3aOhG/JcMKkGWycjDMYwbO5n8L9a0Me8u2R+OfuVosKuheiayvwbOUIF1p04OuxQJ
 9qqiKo6pKUIW5lkl4+8B2PMa6EgTzsmoOakof+wBQqJ65wr0C42VvFJlDNnPQB7/jClky5hK5kw
 TWiZQ/jb
X-Proofpoint-GUID: dDOTxFIjWwoCmQmUUxYoca1czUYD0Hjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not.
> To solve this we move the drm_writeback_connector within the
> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We do all other required
> modifications that come with these changes along with addition
> of new function which returns the drm_connector when
> drm_writeback_connector is present.
> All drivers will be expected to allocate the drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
>  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
>  include/drm/drm_writeback.h     | 68 ++++-----------------------------
>  3 files changed, 89 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index ec2575c4c21b..198b8c488056 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -89,8 +89,10 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
>  {
>  	struct drm_writeback_connector *wb_connector =
>  		fence_to_wb_connector(fence);
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  
> -	return wb_connector->base.dev->driver->name;
> +	return connector->dev->driver->name;
>  }
>  
>  static const char *
> @@ -187,7 +189,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>  					  struct drm_encoder *enc, const u32 *formats,
>  					  int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_property_blob *blob;
>  	int ret = create_writeback_properties(dev);
> @@ -269,7 +272,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  				 struct drm_encoder *enc,
>  				 const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);

Please pass drm_connector instead (to all init functions). It would make
more sense.

>  	int ret;
>  
>  	ret = drm_connector_init(dev, connector, con_funcs,
> @@ -339,7 +343,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	int ret;
>  
>  	ret = drmm_connector_init(dev, connector, con_funcs,

-- 
With best wishes
Dmitry
