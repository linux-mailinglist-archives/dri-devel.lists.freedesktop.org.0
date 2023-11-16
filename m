Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC97EE773
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11DD10E032;
	Thu, 16 Nov 2023 19:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF48C10E032
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:26:19 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-58a0ac41154so607993eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162779; x=1700767579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NcZwCjQ4JrwVYAwfxeJR9lgNCrE0p4rX4/iJLdX3krg=;
 b=eYwtWjhdZMgLBw8a9Ut/OiIkAuScTZimC/vrTL7z5kDL9g9YABxiEO/7gV3TvbUeMq
 Vqmtv0mE8iTgjEDo+BWcTMH8kxUO4N8tpe22Fw+zkmOZ2CADqcYfxfCNXJ3QI7KGw6ms
 Bwfiv9x2CJgM6Gn3gLR9HnLgo9mP2A7O0hgdSLb3Sz8FSko2yBCMZcHVh0WGea4PXnfp
 oHSaRNCbrfSzgougYfFL9SrhW6NpQfsVf/v+aktk7QZBh9+QPdHAMoAe2x+QMaMf/kwt
 m2OdriB5kyFHmvaMbJefUFEN0rM95jT8xxFrK39Ki4C+NhCbMJJ9GOGfe/rOco+1Ff6a
 a9wQ==
X-Gm-Message-State: AOJu0YwKjthJUcO2wqZS3TmJ4VQhbhJEdJoWqHRLD66b75MKzqPTjllV
 MOrNcUJ7h81Dkaqwee+l1AIUK++kog==
X-Google-Smtp-Source: AGHT+IGSTth+hP2mmYGFO8yjKtjUWI7ZiE2Wb5+MqaNsG99C+yIPf6hkTRBp8Wbxr+QbyVOYwjXPNQ==
X-Received: by 2002:a4a:9181:0:b0:589:d6c7:8573 with SMTP id
 d1-20020a4a9181000000b00589d6c78573mr16344725ooh.3.1700162778694; 
 Thu, 16 Nov 2023 11:26:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a2-20020a4a9882000000b0057b74352e3asm12380ooj.25.2023.11.16.11.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 11:26:18 -0800 (PST)
Received: (nullmailer pid 3049422 invoked by uid 1000);
 Thu, 16 Nov 2023 19:26:16 -0000
Date: Thu, 16 Nov 2023 13:26:16 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH 07/11] dt-bindings: soc: rockchip: add rk3588 vop/vo syscon
Message-ID: <170016277633.3049138.9769922490771899888.robh@kernel.org>
References: <20231114112534.1770731-1-andyshrk@163.com>
 <20231114112820.1771240-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114112820.1771240-1-andyshrk@163.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 s.hauer@pengutronix.de, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 14 Nov 2023 19:28:20 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add VOP and VO GRF syscon compatibles for RK3588
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

