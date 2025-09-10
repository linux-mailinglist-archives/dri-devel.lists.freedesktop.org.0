Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC1B5214F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4054B10E9CB;
	Wed, 10 Sep 2025 19:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4C4B47D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49BC10E9CB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:42:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgEZN020634
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AshvdUVEa9FiNe5UYmEu3NEb
 RFgCfkbR3d/lUj1X4cc=; b=M4C4B47DFelWfTtHXBl58OlfAnb9kgVzh2KD5MDP
 u21jR0DMliki4JJ9sbq0tg/a+i93jCDeMlXDMvHLvtf7lP6zdaXEhxxR40DF68h+
 rU/qxdJlK0+ZmRfhw4E6cF67By/Tr+FieX8DVNFtWhOFAWxwvGr5eR1s72BMLocK
 /g2sryaJrEckcY4rJKMHckuG4bRdtmZmv+k7ig0la9HsVvpcCZ4RXA1kAkttl361
 6ckX43sYScEE63NUml41VV+UYRTAp8Z6clD8qHBQqabTgKjKw1MHHCSsIvDTZ3y4
 RhcJ4PBDMquA6XnTAn+tQ4uLj2dtQHl0xxkg7UDOFdLxag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2958m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:42:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5e5f80723so148341cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533374; x=1758138174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AshvdUVEa9FiNe5UYmEu3NEbRFgCfkbR3d/lUj1X4cc=;
 b=abCItCqd/IFjWR8GE5w23Zi0U04MInTh6O0FHJmwm3oYgzOyjWeaaGg+uq7LuiN7U/
 8uKe84Ui9/Rl3F8M2UldOqzg9B+sGJOwuWBWvQlN14pf7jf6ge9M04LaLXk0hGcTDdD5
 cgzWJgUwRcHWEGgmSiVWZBV+DnHmlcx1Msi2PFlSB2Ylht/grrNV7BTafDSPIukLSqyu
 lQunUhZX7MSVPHiOW9U1Mg0mPvZ7DgFEKPaC5iTQuAlHm57tSdNPicGwhLmiAxewEvtr
 AiEv9jqNm+8eXqjiz9S3dSTekkQdgQ3teOD1pGhV7E9JqyddIfXMbRpCnENmfW0zlkEZ
 n3Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6SgHZagbvaThd+cN0sHc644+txIdTPNOGha3GgEOqXBBtUIp86lDAks2yWntONrNmMT3gbPwQBJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6ZZYpVvYDPZwHwlAAlAteK7g8C58G7Ka4X0ym3YDQL1Gc693u
 qRlKbsHyDd5D0gFgT/9Y9BrAkTyqBff88WwQmDGanbX74O+rBt97Fm7ttqdo30v6lXqF/JiqGpl
 /crRsfacrdCHmWrtQoebiF+XiXfWJPZcFZ634B1gaLRaGjw2YXJjWTC9AXAui4ZAeRADvY4s=
X-Gm-Gg: ASbGnculBnIefIYWtFnDC2NMIesv4SYp9pIYtFy4BuGLqcW7oY3/RYMPTsFiSBJxQfS
 TR+MmaGEYvUlpeVTZZs/HfhFyigdeDHqb9cZj5GlaaU/MB9f4WR4OcoWDMzq+ccu97Lusn9O5e7
 dbTzISf+WGTYe6H8oLU6SGU34j8Qurntt3NwCbStBroBGdYd/nP1vlzUxXG4Ow4SzxrRpNl9RMZ
 ljU9ldjGcbbujE/LeQWWC1KpMtwSDnqADmhY8zcaUdfntGQw/6qF4bLmjwrx/aeOfMnmL1eHLqZ
 dQ+6J+Gutmc3BFf/Gag0awiGfhXzMu0hDyuLBimDqJjMCYiXOivM3QaKxROjDvHEPxPKuEgsz56
 SDXJkBKIpaj394ZXj3BTF8+Blu2EaaQw8kkR7T2xkx+yRx6ZKchbY
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id
 d75a77b69052e-4b5f84bdc04mr172829051cf.84.1757533373957; 
 Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LM5n6q3x7O/nMFCbv+KTdGAJSRvFARvfiNuJedE701eBLHhZVYWWeXkwyAfYeYOBgycy0w==
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id
 d75a77b69052e-4b5f84bdc04mr172828411cf.84.1757533373376; 
 Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56dbfb5d10fsm49073e87.108.2025.09.10.12.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:42:52 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:42:50 +0300
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
Subject: Re: [PATCH 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <curkiddhkz6k4rtbxxmmmm4oqyjzvda3xc2bc5c6dmq2c5qgkk@z6cwzap2hwgy>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-2-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1d4be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=ht3OSqXAj6RBLq6GiRYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TXeKV6FCQ8L8YbV2gtoq4gc6SL41yxnh
X-Proofpoint-GUID: TXeKV6FCQ8L8YbV2gtoq4gc6SL41yxnh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX7Ukh+ApxbLb5
 NqeEK0AI6h8gewaBX3B3gPR955L3H6WWYyB0L6B6GyylgrFt+g3puMw3VsL7fd/DXXy+IxmBghN
 07KPNZHZ6W7NgRIqv14yQgsYbvChMvEoJInaAZ4q9hnKKdoBgOGUl6ithp4a3yyFy0owWhnyyc1
 QfjRcEYG2Bu+Ovl52GPiCloTxBLZuYyXD9WJk2JFzhFVNPMyQ+zGhwDB/EIf+7HChOScaIJlJYG
 +Z42PQiERP5BCUzoINBtJCI91wchpA20V0r2IlE71YN9UGsw6voNHe5UOHR10YJ5QXpm/tc0rz4
 qSWDhapLIWCcr4VWNcE9MHD8BMCy7UQrv+i5pLwAdwZVd8ZBAkRdIr1dKoOlubMR+cFQfw14xb+
 /2wTmo+m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Tue, Sep 09, 2025 at 03:36:43PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as Intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not,
> this is due to the limitation of inheritance in C.
> To solve this we move the drm_writeback_connector within the

Please take a look at Documentation/process/submitting-patches.rst:
s/we //g, etc.

> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We also make this drm_writeback_connector
> a union with hdmi connector to save memory and since a connector can
> never be both writeback and hdmi it should serve us well.
> We do all other requireda modifications that come with these changes
> along with addition of new function which returns the drm_connector
> when drm_writeback_connector is present.
> We also modify drivers using the drm_writeback_connector to
> allow them to use this connector without breaking them.
> The drivers modified here are amd, komeda, mali, vc4, vkms,
> rcar_du, msm
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
>  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
>  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
>  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
>  drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
>  .../drm/renesas/rcar-du/rcar_du_writeback.c   | 19 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
>  drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         | 13 ++--
>  include/drm/drm_connector.h                   | 70 +++++++++++++++++--
>  include/drm/drm_writeback.h                   | 68 ++----------------
>  22 files changed, 163 insertions(+), 137 deletions(-)
> 
> @@ -2305,6 +2366,7 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +

Probably a refactoring leftover.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry
