Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6334E598D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D3D10E174;
	Wed, 23 Mar 2022 20:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7110E154
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 20:06:04 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id e4so2798156oif.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xJAiyJpQqYMzE45B4+4Ip3dFo7/yY92VkX/LiqX9660=;
 b=VsVi31nWxQtXa8tfAZHQO05bp2eCb+d4mwHB4DbrFLJCdXzZj40bxmCm/gFOZ6Iz0U
 vkuGp6/OqFV1HduGas/hKysn+GaBwv12WzaBfPxiQkCSbgldx2Q4IadfXrx7bhqHIsQ7
 XvARUuEaY+0jBSvs2Vfxm9Z5lTU37XU141psnyEffApPMxZKuzuG7a4m4ieg+wOfZ8MW
 y6VZZhTrCakSnJqIf7y4TfKZ4XFsWrH8UXK3i6vCH697KmjwWmJsXvtDfsjmbZ6HUUT8
 WwUXw7RM5Nf3Eeu5RPVP0jh7krndru+YyVA1VD1tgwylaNywfVTKNG9JkeWqPHQiWV+3
 LamQ==
X-Gm-Message-State: AOAM530uJNafXqg3XCkrxLFWnmviRld72h5nR/FaD0jlmO+SH86uImjE
 PNI8BGFI7/f7BMQm9C4iUA==
X-Google-Smtp-Source: ABdhPJyEg+a3Qvv1SXv6BAjqSqkcktrlf4VnWVfiwkpussCQzsTjMRsK/CDQ1DJSXP2e4dHsgVNAtg==
X-Received: by 2002:a05:6808:30a0:b0:2da:3e03:5620 with SMTP id
 bl32-20020a05680830a000b002da3e035620mr5445003oib.264.1648065964085; 
 Wed, 23 Mar 2022 13:06:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o10-20020aca410a000000b002ecf2a4fda5sm395637oia.10.2022.03.23.13.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 13:06:03 -0700 (PDT)
Received: (nullmailer pid 362658 invoked by uid 1000);
 Wed, 23 Mar 2022 20:06:02 -0000
Date: Wed, 23 Mar 2022 15:06:02 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: it66121: Add audio
 support
Message-ID: <Yjt9qrPP7UsvDkq7@robh.at.kernel.org>
References: <20220316135733.173950-1-nbelin@baylibre.com>
 <20220316135733.173950-2-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316135733.173950-2-nbelin@baylibre.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Mar 2022 14:57:31 +0100, Nicolas Belin wrote:
> Update the ITE bridge HDMI it66121 bindings in order to
> support audio.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>  .../devicetree/bindings/display/bridge/ite,it66121.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
