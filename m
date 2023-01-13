Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A320566A2C5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B46810EAAE;
	Fri, 13 Jan 2023 19:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6732110EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 19:17:43 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id h185so18454408oif.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 11:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4CJajujD5LCHqYKQc7DCfZ+S0748YjEApgV0a2xuDw=;
 b=YTZHKT9c5neFRqwK/7/eiMZOn/b6E2xcVNahsYeHm/rvb3iJlG4RNE4rVnEV1/uuwU
 ABjTt5jXC8WkkRr0ogNbjQwfE9S69pLwfBWU38rAVObFMVi+LIDcCpSQ7hFO78Dr0F3A
 rz7R14O7CFMOp8yHRp+fq0EP/BsKG03HoeQK7Sc77waCUcJaTQKqlu98Ru5j4uvGV5I7
 AayvsUuUKQpR7ACwn/rcTKlh6hJmDq2q0WSyhi4T19np7E+Q0GWba2bpMlNhqaEGn3J9
 qtommEnFGqK4I7irLvDB3534yXczQgtpSYsNxF4V6eWEKmBUlW/GdFoh4RA5v2d1RFOq
 j7nA==
X-Gm-Message-State: AFqh2kqFHmXRk9ELb4TujHCuCmDFApeoQsa9kaFc4pLjUp6Y4DJICKuk
 SSs0qievEsf//EJvWhpnog==
X-Google-Smtp-Source: AMrXdXumnqXHmHJ9OSjT0qtZ37tvwGUWU+z1M/2ahtBoZIkYl48Ps2exVXHLlOF9YRZTNrnHNwii8Q==
X-Received: by 2002:a05:6808:2744:b0:35a:33d:5651 with SMTP id
 eh4-20020a056808274400b0035a033d5651mr30880409oib.14.1673637462562; 
 Fri, 13 Jan 2023 11:17:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q10-20020acad90a000000b00354932bae03sm9543137oig.10.2023.01.13.11.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:17:42 -0800 (PST)
Received: (nullmailer pid 2757784 invoked by uid 1000);
 Fri, 13 Jan 2023 19:17:41 -0000
Date: Fri, 13 Jan 2023 13:17:41 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH 2/9] dt-bindings: spmi: spmi-mtk-pmif: Document
 mediatek,mt8195-spmi as fallback of mediatek,mt8186-spmi
Message-ID: <167363746062.2757569.16048285089924690318.robh@kernel.org>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111123711.32020-3-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 11 Jan 2023 20:37:04 +0800, Allen-KH Cheng wrote:
> The mt8186-spmi is used as compatible with mt8195-spmi on the MT8186,
> document this situation.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
