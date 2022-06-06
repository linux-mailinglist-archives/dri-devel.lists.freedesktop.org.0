Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACF53EE81
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D5611B0A4;
	Mon,  6 Jun 2022 19:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85BE11B093
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:22:56 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id r3so12644982ilt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 12:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=igqJ6dHQr5YcAlveo+prNgh7gR56A9+URnq8E5u+gNg=;
 b=FtuSps3nvoDNNlRMH51e9sSDI+LtaBGoimv/JqjqKI9VI10rU0TMQjPtk2rO3WbhKh
 vJz03BUf3+wQQ1oWY+m9wYrgSKfnXxlEtlVJISi93/QZtVu2hblFlWx1iHkKYhfsgdHT
 3GRsmWEQwWqnMN3scNA6xgAkGq/MET8aSuW6YMFLlAKSG4dWa0WevFyM6j2qlFIpkn5b
 YuQrqS7GLGuUTeL1i+L7bGNbVhMeIRuLu9oWUy8UITZbDcxwvkJAmsXzPpIvXmG9rC9+
 RyjadFhynrg81U/iqnl7+4SaIIW6xZu4/tIkcxQYURW8aa6WJ+pjZm/PE4ifLWX9oqjo
 u/tg==
X-Gm-Message-State: AOAM531/e4CK+SgJKM/Du+7r8Fy+kEFsGf3bL9vCOJ5GiErlsBEHy8Z/
 n2eHT6UbLftz6smIgBEQniq/uqE98g==
X-Google-Smtp-Source: ABdhPJxCcKVuvKSNVEEpGpz2jpx7c2xLaCtMwOmcYjdVDfde+NPC5xKUdC2Cs+uEbOzHCaJz1JP2NQ==
X-Received: by 2002:a92:c94e:0:b0:2d3:be50:3e2f with SMTP id
 i14-20020a92c94e000000b002d3be503e2fmr14793916ilq.143.1654543376225; 
 Mon, 06 Jun 2022 12:22:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a02394a000000b0032e79d23f8fsm5934333jae.156.2022.06.06.12.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 12:22:55 -0700 (PDT)
Received: (nullmailer pid 1112900 invoked by uid 1000);
 Mon, 06 Jun 2022 19:22:53 -0000
Date: Mon, 6 Jun 2022 14:22:53 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3] dt-bindings: display: bridge: sil, sii9022: Convert to
 json-schema
Message-ID: <20220606192253.GA1112705-robh@kernel.org>
References: <2f8e12b4980a82788c1dd413ceedf8d144fdca91.1652967387.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f8e12b4980a82788c1dd413ceedf8d144fdca91.1652967387.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 15:41:06 +0200, Geert Uytterhoeven wrote:
> Convert the Silicon Image sii902x HDMI bridge Device Tree binding
> documentation to json-schema.
> 
> Add missing sil,sii9022-cpi and sil,sii9022-tpi compatible values.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Add comments clarifying CPI/TPI,
>   - Improve wording,
>   - Drop port@2,
>   - Add port descriptions,
>   - Add schema references to individual ports.
> 
> v2:
>   - Rework sil,i2s-data-lanes,
>   - Add schema reference to ports.
> ---
>  .../bindings/display/bridge/sii902x.txt       |  78 -----------
>  .../bindings/display/bridge/sil,sii9022.yaml  | 131 ++++++++++++++++++
>  2 files changed, 131 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii902x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
> 

Applied, thanks!
