Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8136524EF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60A710E0EC;
	Tue, 20 Dec 2022 16:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0514B10E0EC;
 Tue, 20 Dec 2022 16:49:47 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id t62so11033937oib.12;
 Tue, 20 Dec 2022 08:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpjiiMMEKUx7aLu2jmHLYDP5YyYL+OfcLX43RIXmyx8=;
 b=aapSFwuNHizWzSreJMVZxwcfOrfChEwocFbRSr4qnh+yAq8qdcRiw69YP3KsnvQF9z
 0RNHiOTXaXAzjSYkRBpeIw+cntpN7eIsvo+Icbk7/2uHhm1x2yjlVQ3WIzCFfOxdc5Ph
 MhJP+NhdaIGlWxrR30CMR7xhiiXtJ6bQarpNl+nsgNq0kQIhBXHAqaantvg6dVVdvyqm
 jDAFHwtC0e2ehPCjU/aGqA47ZCkNJWKWKw7yfZm3mn09JjgPKONR7Rk67yM6pqkixlLZ
 H5djqsXzCPcPwrEnlKouGF7jHUio+f4mLPHN3HpLDHCkzrshHAicAtQ7a8JpOobr916z
 dwcQ==
X-Gm-Message-State: AFqh2koIWL4WaoNadyPKytFS6gNbA/8ZX6iWAmqxcsZXXu/4UKSjuQet
 RSK5uaKyiyPWWQPcwcFhOg==
X-Google-Smtp-Source: AMrXdXucVzUYs3Qv4dUgwQz43Bm+id6hoba4q8xaAN5FGBFUMAmXiZFy27bVsiKNTFbzkSXCaWXFtw==
X-Received: by 2002:a05:6808:1525:b0:35c:3e8e:de6e with SMTP id
 u37-20020a056808152500b0035c3e8ede6emr8244033oiw.22.1671554986222; 
 Tue, 20 Dec 2022 08:49:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l19-20020a544513000000b0035b7002af8csm5688297oil.56.2022.12.20.08.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 08:49:45 -0800 (PST)
Received: (nullmailer pid 726623 invoked by uid 1000);
 Tue, 20 Dec 2022 16:49:44 -0000
Date: Tue, 20 Dec 2022 10:49:44 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v5 06/21] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Message-ID: <167155489243.724404.14934163321956490554.robh@kernel.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220123634.382970-7-bryan.odonoghue@linaro.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org, robh+dt@kernel.org, agross@kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Dec 2022 12:36:19 +0000, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 189 +++++++++++++++++-
>  1 file changed, 179 insertions(+), 10 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>


