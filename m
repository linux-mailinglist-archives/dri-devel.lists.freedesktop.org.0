Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA064AA339
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 23:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B7F10ED15;
	Fri,  4 Feb 2022 22:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1CC10ED15;
 Fri,  4 Feb 2022 22:37:18 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so6238172ooq.10; 
 Fri, 04 Feb 2022 14:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Xkm+wQR2CLWbK9ZiKadmiL63/Ces5dU1DXtwlkexAk=;
 b=fzdHf+mfUkYggml2h0LvzTO2LfRkYhGwCEGOhzVqBTYsycj/cEeQCEAHJpKNENVxaj
 Mbrwr6TGCPu40xvX1UZfBnxIT1axSX1Xw3c131JP/e22BnprpZTVeX8hUcCN3qhecz4J
 NgBQH02BHyGu5/XKHZUTVIcp6X4vKZUinm4fnFxkm6fUaRi1KsvIEHHghPURc8UIUrvu
 mhUGq4tApyZm+vimOUfySQNtnMHYy8o2+gThi1Bwr7QAOJLNd06UVQnYPKMXS2uPegU0
 Jxt5QjPJBa0RK64GXXJjfjn86GAuJLXvn9ZsxqTRScp7JuyAylR6C/fQ/mtGkqJZv1xP
 QGkA==
X-Gm-Message-State: AOAM530Yu9AHbU1cHzVfCauw0WdWNA2fHAlgLMgH7IYAKakg6yk7LM5p
 Gb9oL43ECzkc5jFPvxUCnA==
X-Google-Smtp-Source: ABdhPJxyooWnERKMMOe817RvnVcNz3HD2yH1iZf7YhESaOMD+6htuNPS+q5rU09UCiBaA5VXRwqxnQ==
X-Received: by 2002:a05:6870:e495:: with SMTP id
 v21mr317265oag.288.1644014237767; 
 Fri, 04 Feb 2022 14:37:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h2sm1215234ots.51.2022.02.04.14.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:37:17 -0800 (PST)
Received: (nullmailer pid 3310469 invoked by uid 1000);
 Fri, 04 Feb 2022 22:37:16 -0000
Date: Fri, 4 Feb 2022 16:37:16 -0600
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
Subject: Re: [v5 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Message-ID: <Yf2qnHguXCyWLj4f@robh.at.kernel.org>
References: <1643573719-32095-1-git-send-email-quic_rajeevny@quicinc.com>
 <1643573719-32095-2-git-send-email-quic_rajeevny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643573719-32095-2-git-send-email-quic_rajeevny@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 01:45:17 +0530, Rajeev Nandan wrote:
> In most cases, the default values of DSI PHY tuning registers should be
> sufficient as they are fully optimized. However, in some cases where
> extreme board parasitics cause the eye shape to degrade, the override
> bits can be used to improve the signal quality.
> 
> The general guidelines for DSI PHY tuning include:
> - High and moderate data rates may benefit from the drive strength and
>   drive level tuning.
> - Drive strength tuning will affect the output impedance and may be used
>   for matching optimization.
> - Drive level tuning will affect the output levels without affecting the
>   impedance.
> 
> The clock and data lanes have a calibration circuitry feature. The drive
> strength tuning can be done by adjusting rescode offset for hstop/hsbot,
> and the drive level tuning can be done by adjusting the LDO output level
> for the HSTX drive.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
> 
> Changes in v2:
>  - More details in the commit text (Stephen Boyd)
>  - Use human understandable values (Stephen Boyd, Dmitry Baryshkov)
>  - Do not take values that are going to be unused (Dmitry Baryshkov)
> 
> Changes in v3:
>  - Use "qcom," prefix (Dmitry Baryshkov)
>  - Remove encoding from phy-drive-ldo-level (Dmitry Baryshkov)
>  - Use negative values instead of two's complement (Dmitry, Rob Herring)
> 
> Changes in v4:
>  - Fix dt_binding_check error (Rob Herring's bot)
> 
> Changes in v5:
>  - None
> 
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
