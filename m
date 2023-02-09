Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D1F691026
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6F910E26E;
	Thu,  9 Feb 2023 18:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D7310E26E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:15:31 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 r34-20020a05683044a200b0068d4a8a8d2dso787182otv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGKDzpQl36bGqwBBeYFJNy6u4C/uzXcd+jWKiDdMto8=;
 b=LYMwh0Rx8dMBgS6hMZWT2JxwkIL++VJPTHNUz+WZOlYhMRG/tbA+OvM8vnymjw8P+f
 L7LOrKorRvFp/U22jcal8eAs7ER0Pr9WPxI/j1jDQm7L4PmziTIEx3o5lkUTHKHNgKiE
 7358QzORGs5jbprxbIpJhL0zQqdSfmF6dZXqnnwvHESEhfY7FIlWFAk/KJnW3O/rsP3G
 V7JMafDMbhty6oVWUHAZbOw8KLv3nPG8yrjZqBJiHrxrDsucMKBRt2gwBf31BqRRzJOv
 9HrIu/tiqSzritzrDMSJKR3E/3kEH9bE1NX9N2xO7L9hJGMsKxoICwMzkOvmHSIFYCY0
 03Sg==
X-Gm-Message-State: AO0yUKVtbOjzmFMxhi/Tgnp0JuW8AERq6zHVwsUbZ8Zx1/LsU7Mc+7J/
 kCDW3kV2O7gP3j8Xk5F3nw==
X-Google-Smtp-Source: AK7set/vKPnpTPG7LfxGY3SZG4NkXDy5WVxyF5/HKjTtS2pCGvrXXIv4QnhMbYB01iQJ9u0d1Jyjkw==
X-Received: by 2002:a05:6830:6102:b0:68b:d679:9530 with SMTP id
 ca2-20020a056830610200b0068bd6799530mr9249542otb.1.1675966530910; 
 Thu, 09 Feb 2023 10:15:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056830144300b0068d4292f4c0sm994977otp.35.2023.02.09.10.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:15:30 -0800 (PST)
Received: (nullmailer pid 588545 invoked by uid 1000);
 Thu, 09 Feb 2023 18:15:29 -0000
Date: Thu, 9 Feb 2023 12:15:29 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8195 SoC
Message-ID: <167596652912.588493.7192091258835336091.robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208103709.116896-4-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Feb 2023 11:37:03 +0100, AngeloGioacchino Del Regno wrote:
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

