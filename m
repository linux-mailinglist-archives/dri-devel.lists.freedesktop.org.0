Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D10758E0F4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 22:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B1F93460;
	Tue,  9 Aug 2022 20:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF192E83
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 20:20:42 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id r6so7142556ilc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 13:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=i8fLGMiVtuza7jt0uHgJRZ2ISnpXL3HFiXjjuGSh5DI=;
 b=ajXJBKchUIcFE+JQUIBDCkMtRhxf6qZvbD0GQWSvJaLKGmp8seGgagXnIawaSILlix
 xntLvWZl9kciHVHnMlGcv8rXZGObENxkZQ6fxE7pBgugdBST6Zx2iQ0gWvKhokyApBPT
 +rJoKklQnhTHVsD+/V3iluRmOtHENY3FiY6OA7qznB9Q9uit93261G16Z/2S0NFZZDMD
 031H2gu4DC3sOtzV0ErBdwway133OCoZJwYLhxGY8kwJAb1WDEOFC/cQ8zfFwtlUMW9O
 DMLG1Ae4sRHuv3UfkZx96mq4cH94isbFIgtLyZezd5MMY57C3LFCe1e25CI04sp+t1Jp
 k0pQ==
X-Gm-Message-State: ACgBeo1ueXIIASc6nbW0HUky0fyyeLZy6XPt0Pr0ysknuqPPeAtrbXz3
 22lYusF7cXv9nseWRSe2u0OzbT3aYg==
X-Google-Smtp-Source: AA6agR77Fjf8hjr8S8p/hEDdFDs8WlVvIGS5ALi31059dRoIxCAB8E+e02SA/ATgkv5OqsLL3MA3Zw==
X-Received: by 2002:a92:c501:0:b0:2de:69e6:4143 with SMTP id
 r1-20020a92c501000000b002de69e64143mr11738240ilg.262.1660076441170; 
 Tue, 09 Aug 2022 13:20:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a92c265000000b002dd0ba40abdsm1413532ild.18.2022.08.09.13.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 13:20:40 -0700 (PDT)
Received: (nullmailer pid 2327658 invoked by uid 1000);
 Tue, 09 Aug 2022 20:20:38 -0000
Date: Tue, 9 Aug 2022 14:20:38 -0600
From: Rob Herring <robh@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: panel-simple-dsi: add Tianma
 TL057FVXP01
Message-ID: <20220809202038.GA2327602-robh@kernel.org>
References: <20220808213726.883003-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808213726.883003-1-julianbraha@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Aug 2022 17:37:25 -0400, Julian Braha wrote:
> Adds the bindings for the Tianma TL057FVXP01 DSI panel,
> found on the Motorola Moto G6.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
> v3:
> Fixed kconfig dependencies.
> 
> v2:
> Fixed accidental whitespace deletion.
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
