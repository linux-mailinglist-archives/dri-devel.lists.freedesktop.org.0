Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57474A6380D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 00:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBDB10E159;
	Sun, 16 Mar 2025 23:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdu9q+1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC4310E159
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 23:32:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GNKAsb007977
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 23:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v+4z0pXri9D3MA/bSTRiP9pS
 Qb9e0AicJTboxk8OTXU=; b=jdu9q+1ccyzDR02tJmhNSh94ly3QUD3rp0/qBiFt
 lfErfDXE9MPf6UB0mzp2I+LdMPg4wkPW3BYgJ+/8waXYOIEjPtzsjCXrhZem0C6J
 yqjApI8/nXTzTuuGce1MrrCpCDasMKG1Wz0B7fxBEHd9D6UvR3YWynRG0bbXba90
 F9Q1pODyY7NpAztZlc8BpMyaAkTNs8SNggqwYYLJkMww2ZoweKgMW/Yc9YHfHAnq
 eLZrDsfkzvickyfc82T7fLpzLaDDQLpKTc2f7dDQE+CEAvz0qTCaNLljT8y9VTsK
 7mCbHnLQKP0dnQB1WRhrVrukKT4GThkR5jFvKdS1/n8trg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdjuhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 23:32:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54e9f6e00so882173485a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742167965; x=1742772765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+4z0pXri9D3MA/bSTRiP9pSQb9e0AicJTboxk8OTXU=;
 b=uOs9GIDDuC9Y8eujlo3d7S7N9tWWRyM11/+GYkHvwjEIToyIkkXdGyyTCz+sYh6VKF
 m+hepnvKhYAgv9Nb9VFcekdwKJXo0rQzJOKje9+4mbwM9I17Wan+Wqz0imGcf1ZCB13f
 2hpdOjIBqMWdfKDsneBjTd+/HL7msw6ylU5utDbXOeWShP8/R119SAZ4kQK3wJmtafsS
 /TOLehEdeEXKZR/33NT1nU/Uz9RQgoz3339uthtfg1U8Wgq8eXEsqVPVMAc9XD8ftT+g
 c3f+bfCHMqrjnGGgyTLq+fCnvd7cJr/QmFSPJhJEyDLt2W1MCtV9Jgfgb0wanw/qNqBy
 gkeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxU8BNAcc0T+82tN34235p4DLpPU400SAdkYXF+R/p6oYPyyu5gGbRYfu46PEThlWGGvLjHxblbIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7jqoyLznvCI4kLz4cPHErBKDF9ywSm4A4FASSNO+M3if2HNvJ
 zHiYwqCmvhfYrbbQ0C+gCapLMyxZSpe4L0kwR5FRlxpJ/ilrmSVsjuOOGdgkGZAEzQTsNvIZqBa
 0lgfDU5uyjWSWTxDh5zBKqEY2BXhHaS+rTpwY3lCq3ZZDA7N8AwZcv8x+WSCAlnHkYHs=
X-Gm-Gg: ASbGncuNsQV6Mp6PG16Ec1XbT7q7O3/SfMm3HvXf+fQ3CIBmLPsM7tFWl/ZU88Jbdbt
 tXNnCtp1wiR0BbHz0IwWi/MMK+rWkrF68YbLnOOrI/lBHasH6vinvxbXxHtFR597R7lqXMNOa2N
 OFeFFIfYbQ6O7OOuEjz5nW4OQsX7ZdsUsFk0TAt7KdGKqd+rJTN9AGby75+3mRGK8OOtE66esaJ
 e/4KaAbQO5HlmfFB9bXV0zQyhQ0TrIrXcbb7l2N9HoLT89xENQPw2Ji6bOz0va1ItWttssQgTiw
 lmguW8wB24egujwt3SC6UzOHvM7Ym7eySLEqkT522msmCxdRIo7JRhrC0mUniq75bHP6p178+Oi
 lRCk=
X-Received: by 2002:a05:620a:45aa:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c57387033fmr2218283685a.18.1742167965425; 
 Sun, 16 Mar 2025 16:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvMr4+3BmMeA4wBPnIO4xs9pC+f/i6v3L0AXx68Mbmu7j3jPeem9oGJdtBp4jFNXmmA3OQBg==
X-Received: by 2002:a05:620a:45aa:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c57387033fmr2218281385a.18.1742167965073; 
 Sun, 16 Mar 2025 16:32:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8804a9sm1150832e87.168.2025.03.16.16.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 16:32:42 -0700 (PDT)
Date: Mon, 17 Mar 2025 01:32:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel/sharp-ls043t1le01: Use _multi variants
Message-ID: <zs4tt57ur6hbesipab3kuiost4gokfu6tmfsicfwtdwri2wwli@fylnnpu3xoen>
References: <20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com>
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d75f9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=cm27Pg_UAAAA:8 a=20KFwNOVAAAA:8
 a=abSFfuejC0CNeSHrdi0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: e2xUtzjzZvGEOEA1f1UhU2nkSLB5H8UL
X-Proofpoint-GUID: e2xUtzjzZvGEOEA1f1UhU2nkSLB5H8UL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_08,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503160175
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

On Sun, Mar 16, 2025 at 02:58:22PM -0400, Anusha Srivatsa wrote:
> Move away from using deprecated API and use _multi
> variants if available. Use mipi_dsi_msleep()
> and mipi_dsi_usleep_range() instead of msleep()
> and usleep_range() respectively.
> 
> Used Coccinelle to find the _multi variant APIs,
> replacing mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions.
> 
> @rule_1@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_device *dsi_var = dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> <+...
> (
> -r = mipi_dsi_dcs_nop(dsi_var)@p;
> +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
> +mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
> +mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_write_buffer(dsi_var,es)@p;
> +mipi_dsi_dcs_write_buffer_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_display_off(dsi_var,es)@p;
> +mipi_dsi_dcs_set_display_off_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_compression_mode_ext(dsi_var,es)@p;
> +mipi_dsi_compression_mode_ext_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_compression_mode(dsi_var,es)@p;
> +mipi_dsi_compression_mode_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_picture_parameter_set(dsi_var,es)@p;
> +mipi_dsi_picture_parameter_set_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_display_on(dsi_var,es)@p;
> +mipi_dsi_dcs_set_display_on_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_tear_on(dsi_var)@p;
> +mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx);
> |
> -r = mipi_dsi_turn_on_peripheral(dsi_var)@p;
> +mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_soft_reset(dsi_var)@p;
> +mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> |
> -r = mipi_dsi_dcs_set_display_brightness(dsi_var,es)@p;
> +mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_pixel_format(dsi_var,es)@p;
> +mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_column_address(dsi_var,es)@p;
> +mipi_dsi_dcs_set_column_address_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_page_address(dsi_var,es)@p;
> +mipi_dsi_dcs_set_page_address_multi(&dsi_ctx,es);
> |
> -r = mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;
> +mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,es);
> )
> -if(r < 0) {
> -...
> -}
> ...+>
> }
> 
> @rule_2@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> <+...
> (
> -r = msleep(es)@p;
> +r = mipi_dsi_msleep(&dsi_ctx,es);
> |
> -msleep(es)@p;
> +mipi_dsi_msleep(&dsi_ctx,es);
> |
> -r = usleep_range(es)@p;
> +r = mipi_dsi_usleep_range(&dsi_ctx,es);
> |
> -usleep_range(es)@p;
> +mipi_dsi_usleep_range(&dsi_ctx,es);
> )
> ...+>
> }
> 
> @rule_3@
> identifier dsi_var;
> identifier func;
> type t;
> position p;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> ...
> -return 0;
> +return dsi_ctx.accum_err;
> }
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Doug Anderson <dianders@chromium.org>
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 36 ++++++++++---------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..9803eaf18e95d70742ece88e82932751476fdda8 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -36,15 +36,14 @@ static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
>  static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
>  {
>  	struct mipi_dsi_device *dsi = sharp_nt->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  	int ret;
>  
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>  
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>  
>  	/* Novatek two-lane operation */
>  	ret = mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);

Anusha. Please. Start reviewing your patches before you send them. This
is a MIPI DSI call. And it wasn't switched to _multi / context. You
should have cought this. I don't know why you didn't. Please review and
check your code before sending it upstream.


-- 
With best wishes
Dmitry
