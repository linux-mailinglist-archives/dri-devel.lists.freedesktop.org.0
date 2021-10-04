Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A374215A2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 19:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD806EA78;
	Mon,  4 Oct 2021 17:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFEC6EA78
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 17:55:39 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so22679629otx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 10:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qbZN6rMSWR0gbKjL6x8M6wey/LpUEac+LmLt3k0AccY=;
 b=lWZUBuVHuPJBWQq8dtV1DZ/4U59dqLlNr1NQjIh5LCwjERHpKkjLlN5zLIz5ktn6Jb
 3HEomHE1SVToWOpawGkIrxAdmIVpTv4maq79vyA5vHCYVPsW4coPBPeAEHEDw/KmVZNW
 rBAAgpb6RoBtdL2Wsg1/rGbE5yva+qgwSpEkJ7J++s4jegHU6AeoAxMLIsFxBGTUULkv
 3JfzH9rdcTXCAPJwmhPZIFeH6SjMokAtL9eDcFQwDyV2FUrPH4tXoaExIBU7FTPGdHjj
 IRPHDahd4XbyPuvth07Vgdwez9+yUzlm0RsgyCAfzZrglkhK87N9kQJXCTm/MVA8h3GW
 NMfQ==
X-Gm-Message-State: AOAM533rh/1QU0xbc0l+6yxF/VqlxRf8nkU/5+XN05jfIU6F9GTHxosI
 A/bYGDGMvHSaukN/E5NifQ==
X-Google-Smtp-Source: ABdhPJzE8ansEYAF7nfdPkNvh9Xlpfn9aiNclDdmzorIs3IpHlu8p25hfzxxPbmIHxHpA+9LIrdmYQ==
X-Received: by 2002:a9d:4618:: with SMTP id y24mr10505775ote.326.1633370138696; 
 Mon, 04 Oct 2021 10:55:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w21sm2840108oif.13.2021.10.04.10.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:55:38 -0700 (PDT)
Received: (nullmailer pid 1559992 invoked by uid 1000);
 Mon, 04 Oct 2021 17:55:37 -0000
Date: Mon, 4 Oct 2021 12:55:37 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: add bindings for the Sharp
 LS060T1SX01 panel
Message-ID: <YVtAGXwLr8FepT+I@robh.at.kernel.org>
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
 <20210926001005.3442668-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926001005.3442668-2-dmitry.baryshkov@linaro.org>
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

On Sun, 26 Sep 2021 03:10:04 +0300, Dmitry Baryshkov wrote:
> Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> using NT35695 driver. This panel can be found i.e. in the Dragonboard
> Display Adapter bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/panel/sharp,ls060t1sx01.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
