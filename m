Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67BC371E21
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15376E9E3;
	Mon,  3 May 2021 17:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427636E9E2;
 Mon,  3 May 2021 17:11:42 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 t17-20020a4a3e110000b02901fab2f46a48so1392321oot.6; 
 Mon, 03 May 2021 10:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HEwsaXMShI2GeSM41jio8xx76l9slgvd7XZXsac4VUg=;
 b=JWTYBwZpHnZsSWRFazKSAQJtmD4PRfQVEq78hMl08/SGx+U0aCAUhrRslXxgXEJORm
 gQ+3KsjhuUc21ZMrep4FbqqIE4vORrV5jqE9A38HWumoozn5zNitTaj84E+KXyCrBFmC
 frQNIpFzUw7hed/NbeLpWdIhyDmrx/cS/o2ijwswmjEMreoTe5MRBUojZWJrGTvETKIF
 kk2FA2K2ZhNdYvUAXUiAKo4WrpcczwfnUf4nxPr3P5ssRWwocuxCTdYlrhCdw3UUDyzh
 AawMErjxtpJ9kTkqjBOwZe1qudABnlsHg8WCW2prwmvCMh8Kz72tLhP7KyGKm4C5Dw1X
 SfIg==
X-Gm-Message-State: AOAM532WHlVYK8NUSUDluMBkIeLoCVDRSttioGetyXwZkr8J8qXemGxg
 o+HXfyTb2z422OR++W936A==
X-Google-Smtp-Source: ABdhPJzB2X9md1pNaZpXDPwfhMw4IJJCmfgm9y0e4bZqmY3AfOUvTWL029kd9wuNRihOizFkPUmRuw==
X-Received: by 2002:a4a:9c8c:: with SMTP id z12mr16084980ooj.3.1620061901386; 
 Mon, 03 May 2021 10:11:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q184sm84746oic.35.2021.05.03.10.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:11:40 -0700 (PDT)
Received: (nullmailer pid 2025724 invoked by uid 1000);
 Mon, 03 May 2021 17:11:39 -0000
Date: Mon, 3 May 2021 12:11:39 -0500
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom,dsi-phy-cphy-mode option
Message-ID: <20210503171139.GA2011901@robh.at.kernel.org>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423172450.4885-3-jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
> Document qcom,dsi-phy-cphy-mode option, which can be used to control
> whether DSI will operate in D-PHY (default) or C-PHY mode.

Given this is a standard MIPI thing, I think this needs to be a common 
property. We already have phy bindings that use the phy cells to set the 
phy type which I think you should use here. See 
include/dt-bindings/phy/phy.h.

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
>  1 file changed, 1 insertion(+)

Note that this file is in the process of being converted to schema. 
That's been going on for at least the last year... :(
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
