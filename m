Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D4A76010
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755CC10E37B;
	Mon, 31 Mar 2025 07:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHc/iNTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B250610E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:28:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kZxa005013
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hZyUpa3rAkBi+PARgDkDOefn
 jJbsZvmSzJyud7QTZuA=; b=QHc/iNTrhIoDH/lrk7ZWrABa82aIXTq0QgXUE5jK
 J7PVxBuV1BwIeMhT+VNT8yqPxwbfDkZ/pZjDambkRESYAjgvJHaa6RoGPRpADlI8
 myH9ZVzg002HjAY49ZvKRuiTnCckJFl3G+GJznbIUGtWrx+nWsbl24sPJJ3ov5Jl
 CM0nVotoBMSx7ZBptBQ6r1+JTL4kf0afkzBeCC3aG1HHWPgxpD4Gc9L7uZJ7kvwl
 NjOO6MaeHS2o6+G8OIFL9XeglyeMRs23xKRvw9vZwRh6jo+b5xIwzJ2ObsCbjZzx
 NdOGp3jaUHQRCP9Klbl/QgL798tVSriqqG0SHdGtODlzTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bkpa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:28:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c572339444so654240385a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 00:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743406086; x=1744010886;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZyUpa3rAkBi+PARgDkDOefnjJbsZvmSzJyud7QTZuA=;
 b=QjxmZubxleJu126v6KTeF3UZB7/ndDhChHiskuSjAMXkRJEOiXz/0NaWl9MdntA8UE
 PoA/tSHHWeDS4rksE7Ja6pzMb0Of5TbQ/cj/5FMu2/emZjEnTFB2WQF8UfR898tIKwUh
 6tGczNtDHyEHxoigCjMV5Dk2d943Au5gnn5DFgaWnLAvB04QQNZu5nxmexZn/nWbj+q2
 fjRO2bO1XsJOlf52zj6AcZY1EO70s09Xvm8C3sag+MexO0974Y/LK/CJQWCwxhoAKBKL
 YlBU5DV9dQqMvN8DqDODTBJU5Sq8LZWIaB/b84+hB4atriv95tdOU/gB7EqCCOcxcdR1
 sgUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlG7Vv3a8Un386co+rmII2z1zTnt+DlRuyGLgnbISBNXxwkQMGWvl65LPB8wYARk/2sm+nIlAmwKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+hjwnEeqmZukW3tPCQ2VFqDIALzB7N6hj6IYfYvCl+Lj8+9WL
 kayoBKLfgyh/iID5LQLlK36cqb05szVMRgJKTqWatbotWjhOPe9xtE/NXW6q+FlUhFHFNmeMD9Y
 zcr4abymzs5e9hNSrbNiGmHirmgfI2qIdcWh1eqNsY6vzwlS12WaHuHV18cGTv4E22cY=
X-Gm-Gg: ASbGncvRyjPLVdlSkAEKmVExHrNF9gRJwcdWvVQd/unXGbDhCX+zTecpgNI3rjc2mVC
 mEH1YF6NuxrxEfD41R0Laz3+FRbrB3doEEyG8TIsc/duSBYGdxEGwLi8JsUvONpLSd/KI3XUhs7
 cD4prXY1hqcLnEPI+yrzCFHS2LnmTZ3YO0Vl9/ur9m9jwyOl4dg8EVm1do1q5nKDIZVgm6TQveC
 2GKz6ir1pV/I8BnNIQPpWt+IUUTrK278ZklLCy9xDl7Ijf9p+r0gr9+3PapX+d5rhJct0qn5Aw8
 8WfwqlA9M3qCCD5LSo0EzuBjjhAUa9V/q3ZgLfX6Zuw4FMVRWqAyrky5OpzVADjl5GbdimSE8WW
 GltE=
X-Received: by 2002:a05:620a:470f:b0:7c5:9731:3c7b with SMTP id
 af79cd13be357-7c69087d968mr1350298385a.36.1743406086477; 
 Mon, 31 Mar 2025 00:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHdlYf0Zt8oO7dWXCZz8tMTpvz1k8xD57XWx7S84EqWU/TjVkwdon5MCGQ3y9pcpy5ZttFRg==
X-Received: by 2002:a05:620a:470f:b0:7c5:9731:3c7b with SMTP id
 af79cd13be357-7c69087d968mr1350294685a.36.1743406085964; 
 Mon, 31 Mar 2025 00:28:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094bb427sm1061141e87.49.2025.03.31.00.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 00:28:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:28:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Message-ID: <z5uepwsk6t6j5zlkrfrkcuodcmx477b7wr7smziwj4nf3avhv2@p7bqiun4yxb7>
References: <20250327115616.1271635-1-xji@analogixsemi.com>
 <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
 <BY5PR04MB6739BEDCE701FBC346106E21C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB6739BEDCE701FBC346106E21C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
X-Proofpoint-GUID: YCjsnqA5_n_--mCb922zTfZSgNS5R0Tv
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67ea4408 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=bbNUuHX0AAAA:8 a=O8w02n9TKN_3-gt52VEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=3b-t3vAtY4IUXy2q2Ylb:22
X-Proofpoint-ORIG-GUID: YCjsnqA5_n_--mCb922zTfZSgNS5R0Tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310052
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

On Mon, Mar 31, 2025 at 05:44:58AM +0000, Xin Ji wrote:
> > > 4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits RGB
> > > pixel data format, total transport bandwidth need 297M*24(at least
> > > 7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
> > > 4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
> > > receive 4K30 video timing.
> > >
> > > When display pixel clock exceed 250M, driver will enable DSC feature,
> > > and the compression ratio is 3:1, eg: 4K30's pixel clock around 297M,
> > > bandwidth 7.2G will be compressed to 7.2G/3 = 2.4G. Then anx7625 can
> > > receive 4K30 video timing and do decompress, then package video data
> > > and send to sink device through DP link.
> > >
> > > Anx7625 is bridge IC, sink monitor only receive normal DP signal from
> > > anx7625, sink device didn't know DSC information between SOC and
> > > anx7625
> > >
> > > v2:
> > > 1. Add more commit message
> > > 2. Remove unused code
> > > 3. Add more comment
> > 
> > This part is useless, it adds no information. It is as good as 'changed it'.
> OK, I'll remove it
> > 
> > > 4. Remove dsc_en flag
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 299
> > > ++++++++++++++++++----  drivers/gpu/drm/bridge/analogix/anx7625.h |
> > > 31 +++
> > >  2 files changed, 274 insertions(+), 56 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 4be34d5c7a3b..bae76d9a665f 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/interrupt.h>
> > >  #include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/math64.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mutex.h>
> > >  #include <linux/pm_runtime.h>
> > > @@ -22,6 +23,7 @@
> > >
> > >  #include <drm/display/drm_dp_aux_bus.h>  #include
> > > <drm/display/drm_dp_helper.h>
> > > +#include <drm/display/drm_dsc_helper.h>
> > >  #include <drm/display/drm_hdcp_helper.h>  #include
> > > <drm/drm_atomic_helper.h>  #include <drm/drm_bridge.h> @@ -476,11
> > > +478,159 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
> > >                                MIPI_DIGITAL_ADJ_1, 0x3D);  }
> > >
> > > +static bool anx7625_dsc_check(struct anx7625_data *ctx) {
> > > +     if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
> > > +             return true;
> > 
> > So, now DSC is enabled unconditionally just because the clock is too high. Let's
> > see...
> Yes
> > 
> > > +
> > > +     return false;
> > > +}
> > > +
> > > +static inline int anx7625_h_timing_reg_write(struct anx7625_data *ctx,
> > > +                                          struct i2c_client *client,
> > > +                                          u8 reg_addr, u16 val,
> > > +                                          bool dsc_check) {
> > > +     int ret;
> > > +
> > > +     if (dsc_check && anx7625_dsc_check(ctx))
> > > +             val = dsc_div(val);
> > > +
> > > +     ret = anx7625_reg_write(ctx, client, reg_addr, val);
> > > +     ret |= anx7625_reg_write(ctx, client, reg_addr + 1, val >> 8);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int anx7625_h_timing_write(struct anx7625_data *ctx,
> > > +                               struct i2c_client *client,
> > > +                               bool rx_h_timing) {
> > > +     u16 htotal;
> > > +     int ret;
> > > +
> > > +     htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > +                      ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > +     /* Htotal */
> > > +     ret = anx7625_h_timing_reg_write(ctx, client,
> > HORIZONTAL_TOTAL_PIXELS_L,
> > > +                                      htotal, rx_h_timing);
> > > +     /* Hactive */
> > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > HORIZONTAL_ACTIVE_PIXELS_L,
> > > +                                       ctx->dt.hactive.min, rx_h_timing);
> > > +     /* HFP */
> > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > HORIZONTAL_FRONT_PORCH_L,
> > > +                                       ctx->dt.hfront_porch.min, rx_h_timing);
> > > +     /* HWS */
> > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > HORIZONTAL_SYNC_WIDTH_L,
> > > +                                       ctx->dt.hsync_len.min, rx_h_timing);
> > > +     /* HBP */
> > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > HORIZONTAL_BACK_PORCH_L,
> > > +                                       ctx->dt.hback_porch.min,
> > > + rx_h_timing);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int anx7625_v_timing_write(struct anx7625_data *ctx,
> > > +                               struct i2c_client *client) {
> > > +     int ret;
> > > +
> > > +     /* Vactive */
> > > +     ret = anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
> > > +                             ctx->dt.vactive.min);
> > > +     ret |= anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
> > > +                              ctx->dt.vactive.min >> 8);
> > > +     /* VFP */
> > > +     ret |= anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORCH,
> > > +                              ctx->dt.vfront_porch.min);
> > > +     /* VWS */
> > > +     ret |= anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH,
> > > +                              ctx->dt.vsync_len.min);
> > > +     /* VBP */
> > > +     ret |= anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH,
> > > +                              ctx->dt.vback_porch.min);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int anx7625_set_dsc_params(struct anx7625_data *ctx) {
> > > +     int ret, i;
> > > +     u16 htotal, vtotal;
> > > +
> > > +     if (!anx7625_dsc_check(ctx))
> > > +             return 0;
> > > +
> > > +     /* Video Horizontal timing */
> > > +     ret = anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client, false);
> > > +
> > > +     /* Video Vertical timing */
> > > +     ret |= anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
> > > +
> > > +     /* Vtotal */
> > > +     vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> > > +              ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
> > > +                              vtotal);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
> > > +                              vtotal >> 8);
> > > +     /* Htotal */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
> > > +                              htotal);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
> > > +                              htotal >> 8);
> > > +     /* Hactive */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
> > > +     /* HFP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_FRONT_PORCH_L_7E,
> > > +                              ctx->dt.hfront_porch.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_FRONT_PORCH_H_7E,
> > > +                              ctx->dt.hfront_porch.min >> 8);
> > > +     /* HWS */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_SYNC_WIDTH_L_7E,
> > > +                              ctx->dt.hsync_len.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_SYNC_WIDTH_H_7E,
> > > +                              ctx->dt.hsync_len.min >> 8);
> > > +     /* HBP */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_BACK_PORCH_L_7E,
> > > +                              ctx->dt.hback_porch.min);
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                              HORIZON_BACK_PORCH_H_7E,
> > > +                              ctx->dt.hback_porch.min >> 8);
> > > +
> > > +     /* Config DSC decoder internal blank timing for decoder to start */
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > +                              H_BLANK_L,
> > > +                              dsc_div(htotal - ctx->dt.hactive.min));
> > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > +                              H_BLANK_H,
> > > +                              dsc_div(htotal - ctx->dt.hactive.min)
> > > + >> 8);
> > > +
> > > +     /* Compress ratio  RATIO bit[7:6] */
> > > +     ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
> > > +     ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
> > > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > > +     /*PPS table*/
> > > +     for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
> > > +             ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
> > > +                                            R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
> > > +                                            &ctx->pps_table[i]);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > > {
> > >       struct device *dev = ctx->dev;
> > >       unsigned long m, n;
> > > -     u16 htotal;
> > >       int ret;
> > >       u8 post_divider = 0;
> > >
> > > @@ -506,48 +656,12 @@ static int anx7625_dsi_video_timing_config(struct
> > anx7625_data *ctx)
> > >       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > >                               MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes
> > > - 1);
> > >
> > > -     /* Htotal */
> > > -     htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > -             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > > -     /* Hactive */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
> > > -     /* HFP */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_FRONT_PORCH_H,
> > > -                     ctx->dt.hfront_porch.min >> 8);
> > > -     /* HWS */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
> > > -     /* HBP */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
> > > -     /* Vactive */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
> > > -                     ctx->dt.vactive.min);
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_H,
> > > -                     ctx->dt.vactive.min >> 8);
> > > -     /* VFP */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
> > > -     /* VWS */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> > > -     /* VBP */
> > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > -                     VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
> > > +     /* Video Horizontal timing */
> > > +     ret |= anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client, true);
> > > +
> > > +     /* Video Vertical timing */
> > > +     ret |= anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client);
> > > +
> > 
> > Please split this part into two commits: one refactoring timing programming into
> > two functions and another one introducing DSC support.
> > It is hard to review timing programming otherwise.
> 
> OK
> 
> > 
> > >       /* M value */
> > >       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > >                       MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff); @@
> > > -663,9 +777,15 @@ static int anx7625_dsi_config(struct anx7625_data
> > > *ctx)
> > >
> > >       DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> > >
> > > -     /* DSC disable */
> > > -     ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > -                             R_DSC_CTRL_0, ~DSC_EN);
> > > +     ret = anx7625_set_dsc_params(ctx);
> > > +     if (anx7625_dsc_check(ctx))
> > > +             /* DSC enable */
> > > +             ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > +                                     R_DSC_CTRL_0, DSC_EN);
> > > +     else
> > > +             /* DSC disable */
> > > +             ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > +                                      R_DSC_CTRL_0, ~DSC_EN);
> > >
> > >       ret |= anx7625_api_dsi_config(ctx);
> > >
> > > @@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct
> > anx7625_data *ctx)
> > >               MIPI_DSI_MODE_VIDEO_HSE |
> > >               MIPI_DSI_HS_PKT_END_ALIGNED;
> > >
> > > +     dsi->dsc = &ctx->dsc;
> > >       ctx->dsi = dsi;
> > >
> > >       return 0;
> > > @@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct drm_bridge
> > *bridge,
> > >       struct device *dev = ctx->dev;
> > >
> > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > > +             return MODE_CLOCK_HIGH;
> > > +
> > > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > > +             return MODE_CLOCK_LOW;
> > >
> > > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > -                                  "drm mode invalid, pixelclock too high.\n");
> > 
> > Any reason for dropping debug message?
> 
> I'll keep this message.
> 
> > 
> > > +     /*
> > > +      * If hdisplay cannot be divided by DSC compress ratio, then display
> > > +      * will have overlap/shift issue
> > > +      */
> > > +     if (mode->clock > DSC_PIXEL_CLOCK &&
> > > +         (mode->hdisplay % DSC_COMPRESS_RATIO != 0))
> > 
> > 
> > ... and there still no check that the DSI host supports generating DSC data. Nor
> > there is an atomic_check() that will check if the mode can be enabled.
> 
> I cannot know whether the DSI host supports DSC or not. Anx7625 driver force
> enable DSC feature if pixel clock higher than DSC_PIXEL_CLOCK.

This is called upstream. Please work on necessary API changes rather
than claiming that it is not possible. Enabling DSC support when DSC is
not handled by the DSI host is not acceptable.

Few semi-random ideas:
- Add DSC checking callbacks to struct mipi_dsi_host_ops. Assume that
  DSC support is not available if callback is not present. The callback
  should accept struct drm_dsc_config and populate const and RC params.

- Add DSC-related flags to struct mipi_dsi_host, describing DSC feature
  availability. Make anx7625 check those flags.

> 
> > 
> > >               return MODE_CLOCK_HIGH;
> > > -     }
> > >
> > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
> > >
> > >       return MODE_OK;
> > >  }
> > >
> > > +static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en) {
> > > +     int ret;
> > > +     struct device *dev = ctx->dev;
> > > +
> > > +     if (en) {
> > > +             ctx->dsc.dsc_version_major = 1;
> > > +             ctx->dsc.dsc_version_minor = 1;
> > > +             ctx->dsc.slice_height = 8;
> > > +             ctx->dsc.slice_width = ctx->dt.hactive.min / DSC_SLICE_NUM;
> > > +             ctx->dsc.slice_count = DSC_SLICE_NUM;
> > > +             ctx->dsc.bits_per_component = 8;
> > > +             ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> > > +             ctx->dsc.block_pred_enable = true;
> > > +             ctx->dsc.native_420 = false;
> > > +             ctx->dsc.native_422 = false;
> > > +             ctx->dsc.simple_422 = false;
> > > +             ctx->dsc.vbr_enable = false;
> > > +             ctx->dsc.convert_rgb = 1;
> > > +             ctx->dsc.vbr_enable = 0;
> > 
> > Aren't those 'false' and '0' defaults? If so, you don't need to write those fields.
> Ok
> 
> > 
> > > +
> > > +             drm_dsc_set_rc_buf_thresh(&ctx->dsc);
> > > +             drm_dsc_set_const_params(&ctx->dsc);
> > > +
> > > +             ctx->dsc.initial_scale_value = drm_dsc_initial_scale_value(&ctx->dsc);
> > > +             ctx->dsc.line_buf_depth = ctx->dsc.bits_per_component + 1;
> > > +             ret = drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_444);
> > > +             if (ret < 0)
> > > +                     dev_warn(dev, "drm_dsc_setup_rc_params ret
> > > + %d\n", ret);
> > > +
> > > +             ret = drm_dsc_compute_rc_parameters(&ctx->dsc);

BTW: these calls belong to the DSI host driver. See msm/dsi/dsi_host.c
and DSC-enabled panel drivers.

> > > +             if (ret)
> > > +                     dev_warn(dev, "drm dsc compute rc parameters
> > > + failed ret %d\n", ret);

I think this should become an error rather than a warning.

> > > +
> > > +             drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set
> > *)&ctx->pps_table,
> > > +                                      &ctx->dsc);
> > > +             dev_dbg(dev, "anx7625 enable dsc\n");
> > > +     } else {
> > > +             ctx->dsc.dsc_version_major = 0;
> > > +             ctx->dsc.dsc_version_minor = 0;
> > > +             dev_dbg(dev, "anx7625 disable dsc\n");
> > > +     }
> > > +}
> > > +

-- 
With best wishes
Dmitry
