Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177FF3992A4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E0B6E48E;
	Wed,  2 Jun 2021 18:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE75F6E48E;
 Wed,  2 Jun 2021 18:34:36 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 x41-20020a05683040a9b02903b37841177eso3312293ott.9; 
 Wed, 02 Jun 2021 11:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v7bb35jhHDO5KmSChe6UgzAJ2YLdRNf6+3Ot3N3cHEw=;
 b=ZT2H0xNO0hHJMJORckNBeGaCWMOz3ITLWtOLqDl3c0OfCozHyP/RDNa87LG8AaKBvD
 vwMlg9cOmAZMJXFiU6mbjhx3jLMCfQYZIu47fzuw6Eey0tXSNAgiv7e/03zYLBo062dY
 M42C+K9S6o5XjjTs545IYr/LMK+mxcc2sBzT1lh65UZTIyZ3iy9B1SwY+UMnsVHMlwlL
 7/Ni772uXqMTlztvVswmXZKZQYW7sxCITLkNiX7nTaJCIfEPRswQRcooaQnn3xS7io+0
 walNP4HpEC/T6qzfS53ygqMPDQfG7SZUiTh1WUcFWEXRkNCA+v6+92idf+PJ/4pRz8Sw
 qacw==
X-Gm-Message-State: AOAM532t5SaDR1xMtK1g1yWB3T2E7drCpCGizJMBKylDAt0cDBQFHhWk
 pSV5ytiPT4KNG2ImISk2AA==
X-Google-Smtp-Source: ABdhPJwpbSJ+FHTZMygd+tTbazR6JvvrPj4e9XhrvI/pZhiv08sY74HxC/wpj1Zvl/Ep4SQSbB2U3g==
X-Received: by 2002:a9d:460b:: with SMTP id y11mr17785207ote.330.1622658876193; 
 Wed, 02 Jun 2021 11:34:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 88sm151977otb.7.2021.06.02.11.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:34:35 -0700 (PDT)
Received: (nullmailer pid 3735855 invoked by uid 1000);
 Wed, 02 Jun 2021 18:34:33 -0000
Date: Wed, 2 Jun 2021 13:34:33 -0500
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [v5 4/5] dt-bindings: display: simple: Add Samsung ATNA33XC20
Message-ID: <20210602183433.GA3735793@robh.at.kernel.org>
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-5-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622390172-31368-5-git-send-email-rajeevny@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 mkrishn@codeaurora.org, jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dianders@chromium.org, a.hajda@samsung.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 30 May 2021 21:26:11 +0530, Rajeev Nandan wrote:
> Add Samsung 13.3" FHD eDP AMOLED panel.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - New
> 
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
