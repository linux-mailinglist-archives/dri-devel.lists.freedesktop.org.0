Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D434A21AE1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1516D10E796;
	Wed, 29 Jan 2025 10:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aomP3H7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F057810E796
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:18:57 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so562809e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738145936; x=1738750736; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CD7Rzq+gMDi5MyNxNk1w+uvvwKV4G+Zwfd1XSHVS6cQ=;
 b=aomP3H7QsQ6521xMxHTrpHn4J0I9JfSTVhvmkUx8CWw6dKfi0oNnGMCoNTapExwTUT
 XNu2ThOfdSyon0oxcx84emr2L+iSa0dzxINbj/mf4OWIdm8VIH61X4Syfyxh928/Y4vJ
 8qoGhyTIR2Qud731kWs/Uvh+1Tsi2xBVmaubp3ZQCbkQ07iPhCzX0BlrEvSDy21IZW3H
 9vkPN5DTIUI8iXtbbjoarodfl7LUXm5O5zL/X4oRbbHSmcHzkmCBsspyC4cjWcbuRQFs
 2mgpDt8+gmv8OnIiVseSLiUeisCbEcA2+WFgg1J0PSccp0Puv/VDSzM43wtY2ACKQ9tT
 rTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738145936; x=1738750736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CD7Rzq+gMDi5MyNxNk1w+uvvwKV4G+Zwfd1XSHVS6cQ=;
 b=Wp2l7Hz+JUnXJg+vrM+ZplVITl/owYl3Z4XmlyKHcuDWOnXTNtEg15gfkJiaBxe/ha
 auFRJCd3A/6G/iEMk81zFe0hLhPrEbMvBQnp7hdFAEE4PTP1Cxak+II35fdgMrVo3LG3
 qq4JjaELgpyrM/fRwgilzqL1iGx/gncZFoowWf/9dM3s/juE8ZeIZQNcjwgQAs3Tyr8U
 RSuTD8dQl/Fxd8u5fAiWNVzM6YPUG/w+gejnLjKj7yu8zmeQuLvg2u/pjXjBaj3GgNXP
 A+GfSG5shjTUn0d4QcCeN04EbFCV4j9+b/ijwwYhoBs3AGtxvYU3X75MlwvXwvEK9tDS
 xZxA==
X-Gm-Message-State: AOJu0YzpWg7HT9rOTxRERtVA0lmZEgE101+Ha98cgESSBbEt/ixV3Eql
 BHmPUX/13ZSw5XFd3Uy/+eBeUOyBTUoW0zOkMG0MDQIAGHh22fLvRP9Loz5b7Hc=
X-Gm-Gg: ASbGncvxmgMstLH/+FW2OR+0/e8MhjC21bxUaIxvlAd0CiseRrKTklllXhjstGh33D4
 SG85mOxI3nE+FgDc1vIl4usQtL62Tubmz4Qe1oMkWOw6ufYmMGr/gDLNsg5dPDv39NiY21u3za8
 cmPU3XOCj6zU3oqtulRSjQaTrCp1OuwIoNyZ4diLr608TEofC1DL+GxE8HDsj6bwJZk32Ko+s0l
 oSQM1svXw/JrjoEcqnDD0IOSXDE+VEsmq2UUEeEvTAimqa1lcmLIOrPEzLjJAoA2vF8Vp2CNw2z
 cqEsg0z6qzTOevG8SeLzjxzmH8KKYb+mn62MnYASs2vp/loyxXV2ccLH9ds/I2e+n78LxZ4=
X-Google-Smtp-Source: AGHT+IF9jHoLDnvcnghnxUeU87YKSzZMeWIi2QDM6j19kDW5g68ullXD1rILsMSfpCm/ZndoF2lP+g==
X-Received: by 2002:ac2:4158:0:b0:542:8d53:5eab with SMTP id
 2adb3069b0e04-543e4a71be8mr680136e87.6.1738145935932; 
 Wed, 29 Jan 2025 02:18:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822f85esm1949177e87.53.2025.01.29.02.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 02:18:54 -0800 (PST)
Date: Wed, 29 Jan 2025 12:18:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Farblos <farblos@vodafonemail.de>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
Message-ID: <idv2nm3dextozwfjyj7shq4gf7nbbat3fup2zixg5jwya7hi4m@a4g2kfxla4pi>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
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

On Wed, Jan 29, 2025 at 10:51:48AM +0100, Hans Verkuil wrote:
> If the hotplug detect of a display is low for longer than one second
> (configurable through drm_dp_cec_unregister_delay), then the CEC adapter
> is unregistered since we assume the display was disconnected. If the
> HPD went low for less than one second, then we check if the properties
> of the CEC adapter have changed, since that indicates that we actually
> switch to new hardware and we have to unregister the old CEC device and
> register a new one.
> 
> Unfortunately, the test for changed properties was written poorly, and
> after a new CEC capability was added to the CEC core code the test always
> returned true (i.e. the properties had changed).
> 
> As a result the CEC device was unregistered and re-registered for every
> HPD toggle. If the CEC remote controller integration was also enabled
> (CONFIG_MEDIA_CEC_RC was set), then the corresponding input device was
> also unregistered and re-registered. As a result the input device in
> /sys would keep incrementing its number, e.g.:
> 
> /sys/devices/pci0000:00/0000:00:08.1/0000:e7:00.0/rc/rc0/input20
> 
> Since short HPD toggles are common, the number could over time get into
> the thousands.
> 
> While not a serious issue (i.e. nothing crashes), it is not intended
> to work that way.
> 
> This patch changes the test so that it only checks for the single CEC
> capability that can actually change, and it ignores any other
> capabilities, so this is now safe as well if new caps are added in
> the future.
> 
> With the changed test the bit under #ifndef CONFIG_MEDIA_CEC_RC can be
> dropped as well, so that's a nice cleanup.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reported-by: Farblos <farblos@vodafonemail.de>
> ---
> Jens (aka Farblos), can you test this patch?
> ---
>  drivers/gpu/drm/display/drm_dp_cec.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
