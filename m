Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5B6E6DE4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 23:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD9F10E060;
	Tue, 18 Apr 2023 21:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395210E060
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:11:54 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-541b654ab7eso488302eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 14:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681852313; x=1684444313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wq4XES0A3vZMGZurOPdlsGHZykLyFbZWmGpJXYBbCNw=;
 b=RfNrOd1MfF83+9s96ZZf+XaraN93VSdrbqMj9bwjSCzDfWr9kjUJJVhrQDPnv2HcBX
 oL3RiMZTcE7pLCr4nzzdTz3dHYlp29cz+oemJtNwjWS5YlGBc3y+h/McWjSAZYsg09Qs
 zUKxZH8ESJdVzNCLMkUai6TH4XnwwvBogDaTBxGcKXVewQgk/aJ8zi346YobCWP/LL7n
 +cVC5ItIrnysz15vvyIWiZ0et8Oh/h0cCDAC4kaLNWQCFJpRazuNadbzW4ILufni16SQ
 ba9foipx5y1AuXWPDOQPlnivnDZp2Rbvm1kdrTJNvZNXpniZiIAodkcSFlkdVGG8NSON
 wQfA==
X-Gm-Message-State: AAQBX9erSxBYK8FxpaxObPzLTCtS5ANJrsjUaRQWwAvz5oq7/7BSIPGk
 wnqe21u4Dci/IaM5pZAkcw==
X-Google-Smtp-Source: AKy350asGV+/EQnR8K/k603pg3P1vk2PcyjMx5ZRioEAbPquyMv9OeqaOF+GvaSzzXOg6OCwjSe3hw==
X-Received: by 2002:a05:6871:729:b0:187:a6fd:f1c7 with SMTP id
 f41-20020a056871072900b00187a6fdf1c7mr2115232oap.5.1681852313474; 
 Tue, 18 Apr 2023 14:11:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a056870c79000b0017197629658sm6077372oab.56.2023.04.18.14.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:11:52 -0700 (PDT)
Received: (nullmailer pid 2345963 invoked by uid 1000);
 Tue, 18 Apr 2023 21:11:51 -0000
Date: Tue, 18 Apr 2023 16:11:51 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: simplify compatibles syntax
Message-ID: <168185230077.2345727.991435195687309100.robh@kernel.org>
References: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 14 Apr 2023 12:42:30 +0200, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just const or enum because it is
> shorter and simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230406. I hope it applies cleanly...
> ---
>  .../display/bridge/analogix,anx7625.yaml      |  3 +--
>  .../display/panel/sharp,lq101r1sx01.yaml      |  4 ++--
>  .../bindings/display/solomon,ssd1307fb.yaml   | 24 +++++++++----------
>  3 files changed, 14 insertions(+), 17 deletions(-)
> 

Applied, thanks!

