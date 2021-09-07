Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E389402E62
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 20:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162906E057;
	Tue,  7 Sep 2021 18:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB676E057
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 18:30:26 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso324169otu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 11:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RY7t/KtclcMrm1EFQWrDQzShg6OefcMHqjUW+/7wI8k=;
 b=pjWVX5Ddla0Vo5TqSHr8PxS43lWJ3Km5g8Nt4lXHyDtZX2/E5cqXUoTEzZz81q00QF
 /W6a+D+7MlBdEifntA/Ybc96kS6fCknN9JggQc+RYPrObU9TftPWidemMLXQ+LqSHhIK
 HTE87U5Gsda12YmOigESLI8eLN18S3mEnj96KXgUZjcv6ufuRJbIfcKw8GZx1jkYJpIu
 d5+yNIgXOLYmrdcTHL5P5rnaxUD38fXbgiBhp/SgVsr6cs7eOxE3JfP72fjK/ikCZsR3
 oavV/TUgz+3g+hfZzFXG6QN1kz5GZzHJonY1xXymaDCQoZLu1a3fzVn5LTCi5VVkGMPW
 3lnA==
X-Gm-Message-State: AOAM533AElTIEfKy+dXZ9cJH9SQNTyfdelfi6AkvhIOTJXchl94iqdvA
 SPvR0s3It97CFrjbR5w8PQ==
X-Google-Smtp-Source: ABdhPJy0rnbbmCqZo6/JDD6kKwVz/6PyHgi9xXqaVz1dF2On7vgXzqe19r+KS/YvEyPjAkIj4CeaUA==
X-Received: by 2002:a9d:7299:: with SMTP id t25mr16204557otj.272.1631039426239; 
 Tue, 07 Sep 2021 11:30:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k1sm2665289otr.43.2021.09.07.11.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:30:25 -0700 (PDT)
Received: (nullmailer pid 110400 invoked by uid 1000);
 Tue, 07 Sep 2021 18:30:24 -0000
Date: Tue, 7 Sep 2021 13:30:24 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org, robh+dt@kernel.org,
 sam@ravnborg.org, konrad.dybcio@somainline.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, devicetree@vger.kernel.org,
 thierry.reding@gmail.com, martin.botka@somainline.org
Subject: Re: [PATCH 2/2] dt-bindings: display: Add bindings for Novatek NT35950
Message-ID: <YTevwDHhSJKIboWl@robh.at.kernel.org>
References: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
 <20210901173127.998901-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901173127.998901-2-angelogioacchino.delregno@somainline.org>
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

On Wed, 01 Sep 2021 19:31:27 +0200, AngeloGioacchino Del Regno wrote:
> The nt35950 IC from Novatek is a Driver IC used to drive MIPI-DSI panels,
> with Static RAM for content retention in command mode and also supports
> video mode with VESA Frame Buffer Compression or Display Stream Compression
> on single, or dual dsi port(s).
> This DDIC is also capable of upscaling an input image to the panel's native
> resolution, for example it can upscale a 1920x1080 input to 3840x2160 with
> either bilinear interpolation or pixel duplication.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../display/panel/novatek,nt35950.yaml        | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
