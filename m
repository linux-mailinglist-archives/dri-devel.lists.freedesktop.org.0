Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE05B204F9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492FE10E303;
	Mon, 11 Aug 2025 10:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDwP+B0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A61110E106
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:13:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAEv000640
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=; b=FDwP+B0OX5UBuh1A
 yaBnSgBA4PZ6KYN6UyxgXDpyNLwikqLtNO6NVZchMnFrdq1fHAr9zI3JLW/AKlB5
 nxIdKbXb87PbAZ2UiPni3kloNPTITgFmGv6lF1CH2AdwpxGy6DNhc7/lMRaa26ok
 AXFCp45EK0v4y/nT5fwiGnPWYU5wcC6mTKy1VYu3ol63+TOPdiuiJhcv9r7YqKYs
 RQyuqXukejuJ37d/tRE8V2Cn/2VVJ0n0OTxLwyvmy5rBgwi3p4b6oJM3S+Eqe5Zd
 9GSCTxs/jeBsJi5cJ0uWNqxOvHZKxGtVOz3gUSCF+MmelO9zM2JtUXFL9SlErhyO
 3BHiYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kwur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:13:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70739ef4ab4so95115346d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907218; x=1755512018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=;
 b=kOpC/hGsC0srQJZ6Gk/xLsDW4N2ZbFil/3m6oY7PCevw/+NcsVIxEdj/amIbyjk8qn
 xjHeLqXlDNqoFGC4ZqBSUlFu6UiwqsD4AvQO8SJdb6X40bvMqbJA4kiiZLBYPyjTuJqi
 uSx228+sHE75QPj1z5bpXiL3CKcEerXBFhE86f29A4i3KghXXLx6x1nHdInXm+Et8+c2
 8h14+jEpfwq70PbQXDOc6038vzPvqZUYnPfxC9iYgs7t8RmS2SS9Gq9Ixe7NAtJFbrnd
 0deKrIP8oJVhClhzqVAiwtY1fBx7gViCxjTOj3IEtJUU23B1i4/OJnbQmQpXus/8GsB0
 4hJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8VdQz7vYU0qOlOWUEBl+P7BAATXKH027zu2AOi21++qrpD0Hq33LtRDGN+Ff0+wilgjj66x1Hb7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzULwB8yQNbTpyhQ2h8lZS3TPx9NtMWjFs3s4IxRLTU93Am4qSK
 AFCiVIroRkZm7rnYgR3iMs0oOVkzMXky3yt2MG6J2tEdtrHQwVQ8jFBCY7LLKxu30jLOpx/+uRi
 bh0RPiVkI0DmPRJ2OHIpEWsV6vlcc8V7Or5nd7cO4bGPVBnM7dDMn3q7tI536gtN4miSQFH0=
X-Gm-Gg: ASbGncsDBq6PLJRPmClqzNUZvaT4LFmIpOKKdtqKPzvPEfXfqnO/vpcMyBQbQGDECLp
 wHBa1G7DHxcRXz1jNVzG/wFAz6Sxes4XtNAZwBTGlQU3o6pp3kTaZa1dmViIbSnyzJIk+eB3kpr
 YaVLuMbzU4i5vwb83mbpDuK5JC/U0loLqA3Sy1BP0ctUYwtw+13a1qcZIw0JD4I0U6XhDVh2ZWP
 jlmMYIZckjHeFOHKprgGKwEfSh9N70XnRtO0PLVIm4qgDMy/gl5g6F+evQ/c+dYDK1WlyYfYkn/
 +ZGbLPsjsuD+lKwn9vXAArdAYELRqhACwAhvIETOka1NP8ubHF74m1g8fbrRY87MBOgcjGGt5fl
 Z9/twlMlqI5xdR52p/q08KaP9+uQJmnDEKFm4JyAdtRbHCmatpOtB
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id
 6a1803df08f44-7098943a0camr242700166d6.21.1754907218049; 
 Mon, 11 Aug 2025 03:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BY/zT1y+b3ji4GZxhC3ZVhQrv/r/mWPNZE1y3jpndTSli2Cjg/bMQSHGPbSf9yhMaetFWQ==
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id
 6a1803df08f44-7098943a0camr242699906d6.21.1754907217606; 
 Mon, 11 Aug 2025 03:13:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a905fsm41770471fa.21.2025.08.11.03.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:13:36 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:13:34 +0300
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
Message-ID: <gvshpndrbnojzwewwa3icd5fjwecqj57jj6gfgoips5xq2oo3l@3dsebzcjwr7t>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Proofpoint-GUID: LFHYjCZWfdIX862h6IDreDO8qRZXyhRq
X-Proofpoint-ORIG-GUID: LFHYjCZWfdIX862h6IDreDO8qRZXyhRq
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c253 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=JhAXgKmwuo5aGy_CkLIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX/kcd7YAkn+MF
 9HWCtsILl1HSLndyC0MDaPC5tzUNe/zM4UxiPYXMMS5HvNir7VmCeyBjJR4QRfYerLYiEhWLZr3
 ke4xpV7P2Gz+mnpCnVrxcfiMz3i/PkkTYEMNeHf+YEzlZNEUFC5ND+eEuJC6SjhGvoJ49XTsIvq
 52iEr934RzlWGzf0Hx3I/RRMQQH0KqC/ucfV0khEgmwPKZsOQ6E6q7AIOSJRwSE354/t5ohHrlt
 6bKusWiBq5qvk0tSkU8A3RDtesjIYttZPsi3BkGdMmr5VWNT0H4agVUYJyIJOUeFXW/b0khIV6+
 BK5Zl1tzX+BAaaN7bp9iFHDkfs9QTp9VTTjWAI5+tQBjf9X75IaieSULXgavn6Ip9IyJ7x9LHi5
 I8g46c+s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036
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

This patch breaks building of drivers:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c: In function ‘dpu_encoder_phys_wb_prepare_for_kickoff’:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:487:36: error: ‘struct drm_writeback_connector’ has no member named ‘base’
  487 |         drm_conn = &wb_enc->wb_conn->base;
      |                                    ^~

Please perform step-by-step modifications, making sure that on each
step all the drivers can be built and function as expected.

> 
> @@ -2305,6 +2360,11 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +
> +	/**
> +	 * @writeback: Writeback related valriables.
> +	 */
> +	struct drm_writeback_connector writeback;

I will respond to this in another thread.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry
