Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428049DEC31
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 19:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11910E570;
	Fri, 29 Nov 2024 18:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YnucKs0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066AC10E570
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 18:53:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53df67d6659so3648930e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732906414; x=1733511214; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RMZBqTf9vwYO288um1aarUm1opCdaHbvfUFbKvwCj+Y=;
 b=YnucKs0EG9oOV2bspVYGDHKLoGStFH4cC/4N8E3k2zSdT2rcSrqHr4Ov0wwy7THuV2
 B8cLQp7VdnExDvwZOa9d9AciT1ex4P9DvCaQG51+dEYGvPqoOcxMvxY+o1nhiisJwLDV
 /S6hUnSXdXuL6UUs1qm1reDFBQWZiogVhq4Rs39A/PHW8KIw4itzpomvO7U50r2+4wFM
 buELhMIJEs9I1IGlsFN+qfTk/Po7J4PbbsELoykXxH+u/DRdDNHPvUCjyiFdo1ld9l1U
 4rIe6Yvm/4/gMKBF+XkuNyld6/mDdg6u+zjkNF9R+bZuH/mKfKusAuTNmRDMTnXZ0qbs
 s92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732906414; x=1733511214;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMZBqTf9vwYO288um1aarUm1opCdaHbvfUFbKvwCj+Y=;
 b=IQ5DFcOyeYjcjIkjuerO4DFlPwm10CTu+xJtgbSGFIEeLpwzXbmTClSXXWo+HmgIsr
 zs1josA61+Ar/ZX/kMtDbkZn5ZONFos7GDdPEXmYXY3oRcgaZk4MtIx7pOOCy7F7Nisp
 BcDbun9IjChEKhRZxhcMOilSEv4XEAEZe10FLZXAzbfzBXlj2z2PazBV0d/EKCR/bXoy
 7KP6bMQsuB6fWDW5KZCBCOLXq293+kr2XijTCLVaImaX20PRbsuqZ82S9OEd5KzFtg71
 HN3AJawTxVOF1Wj400OrrxfzWH/JjIdRqbkrQDQrLpqHV1qZhalGramE5hGrzc1kSen+
 atsA==
X-Gm-Message-State: AOJu0YxQhI2GhGtQdWQMTznhrKUbp/MwiiQEGoZsx3nHMSY7LRSth27q
 st2kw/YIGanwEx8ZS3Re5khKm9s25UMnozyLPV5CE67nb3h1PG1lBDlyTStn0C4U8C9yFQukOol
 4
X-Gm-Gg: ASbGncsNz9Cs7PWEr1fmv1lAxdG/+pAY2tCrOloE1xLEcoIRBuxi8Xieb0Udpf/vgiq
 Mo4Oib49m1co8tH3ewRQGd1YqVgnwph/t7diquTb/pPTMTh4QuxpcRBR6zrazxtFp3gm75Np6sh
 Wv/a/Izk1QwD0BhqVeVG0b/xFeOGn6EmZupqHgvl315sVsRMgH8rv3VixCy8D00Sr+aoNDdBWc7
 e4NIX/bhvO9k7Nd1il7uit5SwcqDg6rORgDlflVvJQJ0ladqrg0wTmG91Hww66dcCq5zEiBmlRs
 C/z5eLVaPhwbz6gJKrUmJsXvIuNOMA==
X-Google-Smtp-Source: AGHT+IEQw10drYBuK9Sy5fW1HyBDfyxTyjvLG6KZvRgfNa2snpnTxERkNey/0Nh12zS+WNBPZ9xJrQ==
X-Received: by 2002:ac2:51c6:0:b0:53d:a132:14f5 with SMTP id
 2adb3069b0e04-53df01172f5mr12590075e87.57.1732906413843; 
 Fri, 29 Nov 2024 10:53:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df644321fsm557213e87.96.2024.11.29.10.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 10:53:33 -0800 (PST)
Date: Fri, 29 Nov 2024 20:53:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <vvfc43i222h74b2m4xmnxd25frk5nfy7pxpv7io46awnaugaw2@tdpuvg2m7vqc>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
 <2ld2iwmvhz6myn6ume3lspi63wjefa3hpctoj2rdreaqhwdxmx@seic3sq2yo4h>
 <c7cf322c-2f52-4bb1-953b-1816fb9e57a2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7cf322c-2f52-4bb1-953b-1816fb9e57a2@quicinc.com>
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

On Fri, Nov 29, 2024 at 06:15:56PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/11/27 21:43, Dmitry Baryshkov wrote:
> > On Wed, Nov 27, 2024 at 04:15:51PM +0800, Yongxing Mou wrote:
> > > The Qualcomm QCS8300 platform comes with a DisplayPort controller
> > > with same base offset with SA8775P, add support for this in the
> > > DisplayPort driver.
> > 
> > Can we reuse SA8775P config then? And SA8775p compatible as a fallback,
> > not requiring any driver modifications.
> > 
> for DP controller,in qcs8300, it only support controller_0,connection of
> controller_1 are removed. but sa8775p have two dpu,each of them support two
> controllers. So is it fine to reuse sa8775p?

Please take a look around in the file, you will notice the answer for
this question. Then take another look around, find the data that you
should have used instead, remove the useless mention of SA8775P and
mention the correct platform instead.

Or, better, drop the patch completely and modify the schema in a correct
way.

Please, always make a broader look around when writing the code, rather
than implementing a feature in a most obvious (but not always optimal)
way.

> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index aba925aab7ad7c6652e81004043864c1cb3ac370..f870faa89f26a8cb5bd7f4caf11f42e919c9efac 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -118,6 +118,11 @@ struct msm_dp_desc {
> > >   	bool wide_bus_supported;
> > >   };
> > > +static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
> > > +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },

I don't know what has happened here. I doublechecked, original patch
uses Tabs in the beginning of the lines, so it's okay.

> > > +	{}
> > > +};
> > > +
> > >   static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> > >   	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> > >   	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> > > @@ -170,6 +175,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
> > >   };
> > >   static const struct of_device_id msm_dp_dt_match[] = {
> > > +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
> > >   	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
> > >   	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
> > >   	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
