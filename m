Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F306ABE65
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40B10E231;
	Mon,  6 Mar 2023 11:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B4D10E231
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:39:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u9so37294676edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 03:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678102758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D/m6Ruj5hwUPG+o/57fmQhrv2GpXodkCIwXsrbUI0kM=;
 b=q/jNnL2jyM+fGwElQZktU4ww9F29epcqZKgT81lva0Ba7/jCWVDIY+BWBk4ve++g8U
 H7S3TeJ+cPysZrLwbXlw+WV4uzHTxrSGZAEHTr/PGz/4n5qZN9/4o+pj5P80nsL0Z32f
 az2PVGndI7lavnJ6wEK9lpOhj95750FuuidsraV1nEw5JlyX20dvrOC4NuoeuKUrYLQw
 2ico8k9t8io8JdcqEQZEU3IAB9bdXRTyXs7EbgAKSjrQAxL5QByPXgq34z5Yx1/slGUQ
 9fGNKWeByy/70zp3Cu8+o4fGM+zAlyimqLWW0by77lMn+8TSSpEHCoK4FexjXHxX0OG2
 ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678102758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/m6Ruj5hwUPG+o/57fmQhrv2GpXodkCIwXsrbUI0kM=;
 b=8KpOHKpkdZPnckgAJ5YfCgOXKXoFY7tT2axHG/uC5DjZ105OwZ/CkeIpY/HodZ4ljI
 MQcfBA/gMSeuS7y2TmBtbPCcyUW/5EKnJf1btlUH7rV6YRflz267tS25tA/uFjVcoq9a
 OVvIGh7IXvugyBbqcpXRYJ1to3ZhuRVfN2rskwLvHEzlym396yegmtVdQbeZJNi5kuc1
 4ZcpTErV8g16YfDqCEqu5VKVpCSdKRXY1ma+9Nt1KAOM5Al4sbfutFvY7Yy3N6h8kQG8
 cRKr7wN3K7NOtfGvkgvYcmoATjamsXyutz8uXl2ZjJEY5IqHbu1oQjiQe1W/jN+8DEyt
 ewLA==
X-Gm-Message-State: AO0yUKWVH5og1U22mm8T32RQTi2CZ3XO1oz36sFN4N0gWsfXk2iEJXGh
 FaB3mKohDuq5BOTv6xUjz0+I1A==
X-Google-Smtp-Source: AK7set8lE7hoo/hOoLv2+iQyvRNs96nlUXnjY5BwmMBCd8+xRARJXE38bFoIaQCj6K1WtZ1UgAEsvg==
X-Received: by 2002:a17:907:742:b0:914:3b00:43ec with SMTP id
 xc2-20020a170907074200b009143b0043ecmr572939ejb.10.1678102758650; 
 Mon, 06 Mar 2023 03:39:18 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
 by smtp.gmail.com with ESMTPSA id
 ch10-20020a170906c2ca00b008cf8c6f5c43sm4411936ejb.83.2023.03.06.03.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 03:39:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 2/2] ARM: dts: exynos: add ports to TC358764
 bridge on Arndale
Date: Mon,  6 Mar 2023 12:39:07 +0100
Message-Id: <167810274094.82312.13543141865904847311.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225160252.18737-2-krzysztof.kozlowski@linaro.org>
References: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org>
 <20230225160252.18737-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 25 Feb 2023 17:02:52 +0100, Krzysztof Kozlowski wrote:
> The Toshiba TC358764 bridge binding expect up two ports as it is a
> bridge, thus add ports property to encapsulate them.
> 
> 

Applied, thanks!

[2/2] ARM: dts: exynos: add ports to TC358764 bridge on Arndale
      https://git.kernel.org/krzk/linux/c/704121ff1f6e05bd00ecb1ef2918ac309c18eb45

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
