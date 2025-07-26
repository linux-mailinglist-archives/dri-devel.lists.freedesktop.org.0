Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590DB12A67
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3797910E46F;
	Sat, 26 Jul 2025 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="larWd5He";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1DE10E273
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:16:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q4CANS000467
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JPo7S+oZuexL4DFQgOn2wIUA
 zSRAomU3JEjZqIYlc7k=; b=larWd5HeMURGT7/wBTH2UOb/xZ9HnK29t0kbt4Yo
 BeonJQpXT+V6B7D4F1EnGJiEvf0YdPDy7RsfdHpt10TQ10sJII4PgO5aVhvssir7
 Jj+IgK5erwuB1vmqRePXim18WQdoGMoRFtM17Ja0GLruzKzuJnSFnLs6Cy/jl+9L
 bvX3rjRA6890y8FsHQMxkwriTaIO8tQYEJtJQMRv2fIhtfuPwQwTA+AIKpXytx2P
 V7QfsJSiHhE4Kr0U+JzjE1Y2kzXiwRbtWVM1pAuLODGm32+V3HG0iL8RIrqEBWVD
 aeSp99DpLqZsYjXHei5HDOw9Bb77lLNY8Nlxi9Kftwo4/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk0h9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:15:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e1b84c9a3dso424494985a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753532158; x=1754136958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPo7S+oZuexL4DFQgOn2wIUAzSRAomU3JEjZqIYlc7k=;
 b=CN8C+tNQ7Fs+knvOoQ8WkEZo8rsFjN6gDvm1LPWn4J4PNgpZAzvB5SkasmfqalzC87
 xyVQosAzTxEQrRI9m/SWOKsY/jQEKSW0IXistU0GmOoLwcGv9Wct7HixXE8CUGgo7cZJ
 l/MNzYblQTVI2NuPVqXLHLi4OVmhoQdsHz+3ZnSdQYBJXRFZhS94svoKjR0iWMyRWTv3
 D6jnnIGGWvMkzY00dzxmROQRG9Yy75AttS5lcsoT9nCAZF3NvKVCuefUn61WgoLQFuq6
 UVYIKVqo5KllcMgsYBTTuMSFmHkUWlfuyOVvfgcrwNvxMvKtN/bg/uylwwrARoJVF1Mz
 jamA==
X-Gm-Message-State: AOJu0YyTq4asgUFz+lx+dOWR7hSf3hKKfhJrv5BPmEkc6dbsv+77HR3B
 VUCU4ygbID5HilXCOfzQ+kWBdplZIcOgQcc8syEOXNAUqzVzZBBs+6lW8nWK49z5Xumdoda9V1O
 MPMhxXpSH94itg1a/PbjxT0jaBudOdr7IWYDfJiQV60tFkG6O0u5BK++ODkWUbL89dxC7ILw=
X-Gm-Gg: ASbGnctqBFx/sXcGoy77ZLqkWZ0S3wcbsC1t3x18fclm7cWzzYg2mxkrcqyi4cdhdOM
 PSMUbNXwtYAFGPk3myYHrS7keY3bOvKjbg3tREZCr3IxeUznXskcDd6GuEWhErktVMhNq+WylyU
 udVVEy8g5UoO2Bhr77Eu7cFnAIHfGhl/wrz25JYvVwZ3sRSJojsEuqkrhkzWkatfvTQCK9sQ7rP
 UhJAITfmIG0sXjDDh6DVIJrz1ECOpOI3aqwxLWetMUMVZnsKP7/8iCQRD6qhG2WB4K9oeLG97/9
 OApqmPTbLhxBvUUATcFSCGk3Nr1XWx8Z19hHKhoDyAmx0ZU/LFbIHb9e5gcwVvL19rG2ZRkhRQb
 A1T8HuGHRUxJFYS+OFJ5SYCIkHIqbHPRBDp5Ul+hQ7RTSwhpjVAA6
X-Received: by 2002:a05:620a:a502:b0:7e1:3537:c2cf with SMTP id
 af79cd13be357-7e63bfa78a9mr415129185a.34.1753532158013; 
 Sat, 26 Jul 2025 05:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXniVE2tAr8AWEM4a1wMuv+mMSLdHRzi8saBzFV20evnchdZGpr+Wc8dh608+b+GAK0bBoSw==
X-Received: by 2002:a05:620a:a502:b0:7e1:3537:c2cf with SMTP id
 af79cd13be357-7e63bfa78a9mr415126285a.34.1753532157428; 
 Sat, 26 Jul 2025 05:15:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63378dd8sm412455e87.149.2025.07.26.05.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:15:56 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:15:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 01/28] drm/writeback: Add function that takes
 preallocated connector
Message-ID: <tglzdolw5nxc7tbscpfjcvx5jiydbghvouws7fl7xqryh7q5c4@klo5yncolqah>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-2-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6884c6ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=TSzOo6nbr_hXDAOSG38A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gGdwVBCh6GyflChXqnd4ujugCwwj8uzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX+0GcjbbVFeld
 4pWvp5SzFl0D4d5Hn6bleRJ1zMSKIB/UFG+L3pqgvEy3ViPfYlipMMcWjl3dcePIjKqBzt2ZmcE
 06yfuvRb7VZ0O1Mrz3kmPZkrb5gWBwF/HoFtncm4Mmr7ALyNQ4GcqySa2Ctp/k4TZttR8gR0vY3
 91YcWCciuvSzt5QvBswfmAss5RnBLPUUQAvvHFhFL/e2W5SKtNSwv83yy6asIb3a9QSCAsAgwUs
 42iIdGGNpBstEKL6ws0AkZvsIQQhm9t8WTTHqLSBIaTOzTfGjlLNlirtCU9J6Fgajazq4dGiahm
 Sj15W2QX28d38sl1JewVBg4LQWmEm92/VOxOF+ue/0NvndShQNAH2J37wF3RFhEMHjxsVEsnlYd
 iSTyPtApW0FnD7ds5J6n3E20X31N61W4qyXn0pBuugZH4hXuLwopGm6JcrKF9rKdxj+ItGq0
X-Proofpoint-ORIG-GUID: gGdwVBCh6GyflChXqnd4ujugCwwj8uzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260104
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

On Fri, Jul 25, 2025 at 10:33:42AM +0530, Suraj Kandpal wrote:
> Write a function that takes a preallocated drm_connector instead of
> using the one allocated inside the drm writeback connector init
> function.

Please start your commit message with describing the problem.

> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 76 +++++++++++++++++++++++++++++++++
>  include/drm/drm_writeback.h     |  7 +++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 95b8a2e4bda6..fa58eb0dc7bf 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -416,6 +416,82 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_writeback_connector_init);
>  
> +/*
> + * drm_writeback_connector_init_with_conn - Initialize a writeback connector with
> + * custom encoder and connector
> + *
> + * @enc: handle to the already initialized drm encoder
> + * @con_funcs: Connector funcs vtable
> + * @formats: Array of supported pixel formats for the writeback engine
> + * @n_formats: Length of the formats array
> + *
> + * This function assumes that the drm_writeback_connector's encoder has already been
> + * created and initialized before invoking this function.
> + *
> + * In addition, this function also assumes that callers of this API will manage
> + * assigning the encoder helper functions, possible_crtcs and any other encoder
> + * specific operation.

Why?

> + *
> + * Drivers should always use this function instead of drm_connector_init() to
> + * set up writeback connectors if they want to manage themselves the lifetime of the
> + * associated encoder.
> + *
> + * Returns: 0 on success, or a negative error code
> + */
> +int
> +drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connector *connector,
> +				       struct drm_writeback_connector *wb_connector,
> +				       struct drm_encoder *enc,
> +				       const struct drm_connector_funcs *con_funcs,
> +				       const u32 *formats, int n_formats)
> +{
> +	struct drm_property_blob *blob;
> +	struct drm_mode_config *config = &dev->mode_config;
> +	int ret = create_writeback_properties(dev);
> +
> +	if (ret != 0)
> +		return ret;
> +
> +	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
> +					formats);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	connector->interlace_allowed = 0;

This function contans a lot of copy-paste from
__drm_writeback_connector_init(), which is obviously a no-go.

> +
> +	ret = drm_connector_init(dev, connector, con_funcs,
> +				 DRM_MODE_CONNECTOR_WRITEBACK);
> +	if (ret)
> +		goto connector_fail;
> +
> +	INIT_LIST_HEAD(&wb_connector->job_queue);
> +	spin_lock_init(&wb_connector->job_lock);
> +
> +	wb_connector->fence_context = dma_fence_context_alloc(1);
> +	spin_lock_init(&wb_connector->fence_lock);
> +	snprintf(wb_connector->timeline_name,
> +		 sizeof(wb_connector->timeline_name),
> +		 "CONNECTOR:%d-%s", connector->base.id, connector->name);
> +
> +	drm_object_attach_property(&connector->base,
> +				   config->writeback_out_fence_ptr_property, 0);
> +
> +	drm_object_attach_property(&connector->base,
> +				   config->writeback_fb_id_property, 0);
> +
> +	drm_object_attach_property(&connector->base,
> +				   config->writeback_pixel_formats_property,
> +				   blob->base.id);
> +	wb_connector->pixel_formats_blob_ptr = blob;
> +
> +	return 0;
> +
> +connector_fail:
> +	drm_property_blob_put(blob);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_writeback_connector_init_with_conn);
> +
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  			 struct drm_framebuffer *fb)
>  {
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index c380a7b8f55a..149744dbeef0 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -167,6 +167,13 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats);
>  
> +int
> +drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connector *connector,
> +				       struct drm_writeback_connector *wb_connector,
> +				       struct drm_encoder *enc,
> +				       const struct drm_connector_funcs *con_funcs,
> +				       const u32 *formats, int n_formats);
> +
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  			 struct drm_framebuffer *fb);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
