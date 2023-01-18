Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AA67239C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6143610E7A2;
	Wed, 18 Jan 2023 16:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA28E10E7A2;
 Wed, 18 Jan 2023 16:40:13 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id v17so7755058oie.5;
 Wed, 18 Jan 2023 08:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6M2Mwc6fPv6SKz16Py9LsXw75++yU7U39bm0+dfDtI=;
 b=xazoIhKTiQx9o6i25wc7Q8x1fR5MGJYN/+mNibD9zmg0RmGExwWat0Y38WXSGm7pkZ
 IAtt6cOSszP993SHoOo7BVV75oeb1eXU0QEtX3L43A9J5fs5Aii0kRBTYTg4wH0EMrFy
 I8ozQ5hbjsABcUQ3zzGwEIgQUcXp8+dBmdbSzlVmauR8QhfnwudxVeultgiaC6TupMlO
 GpT7lG0g4GpN+rkPV+wIyiaGcPfOVOVpZX/Cqhb8WadJZTThADyInYAZF6IvK4l/NF4c
 ZJJoVFa5Juv+FObMiSFTCU5/GYcWPxyZPx8BnqjjszNUB0r3CqkoYOCDKP8gpPCvq00+
 EZxw==
X-Gm-Message-State: AFqh2kr2l37hag8aaCZaOweN+U5yw9DaFYqVHeKoeZ/Kpmwdkn10O0ei
 YyKxAzBPx8+4iUvV4lfZ1+cMQQAxvg==
X-Google-Smtp-Source: AMrXdXueCqm+gVomYaXrF8HFdNo0iBj4JW/IegKNLeGDcwbVobzf/QTGtZ1YgGVL82AvHisW9HgThw==
X-Received: by 2002:aca:d7c6:0:b0:363:ab67:ee35 with SMTP id
 o189-20020acad7c6000000b00363ab67ee35mr3324016oig.56.1674060013043; 
 Wed, 18 Jan 2023 08:40:13 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 j21-20020aca1715000000b0036aa151bcd8sm2145156oii.16.2023.01.18.08.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:40:12 -0800 (PST)
Received: (nullmailer pid 136519 invoked by uid 1000);
 Wed, 18 Jan 2023 16:40:11 -0000
Date: Wed, 18 Jan 2023 10:40:11 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: dsi-controller-main: allow
 using fewer lanes
Message-ID: <167406001146.136465.11850514731563891195.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:24:31 +0200, Dmitry Baryshkov wrote:
> Some platforms might use less than full 4 lanes DSI interface. Allow
> using any amount of lanes starting from 1 up to 4.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
