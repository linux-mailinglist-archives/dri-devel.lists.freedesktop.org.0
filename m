Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87C5B0369
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E810E609;
	Wed,  7 Sep 2022 11:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC610E609
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 11:52:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f11so8012131lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Q9TkKT3+r01vVZzm+xYD0OiOoUb1Biq2Sme618hwY2k=;
 b=E2WS1W4kTl+lKYjh0LzH3Iv0PROxOKPqSSBUCjc6Ru0c/oRl2CwyXEESKCujDzMVZ4
 vofTbLuMOSJy3uTdgF2dvEfMG3R4J8paHgPsRFJC3Q/RZLqojQAFvSoQ1kFcQZZeYW33
 CKHo+Cl2RMBm/Fr4CFOfRQVW2doulrmXVYUgBIcAheY7NGPH+Rf095FHhf2kpfkbnjUf
 emrsva18+hWuKfGqoEbqx5H3ec599rqRpxPytLgk12j69+ayiuTv8mtICSQmLOH3/r+2
 iUYfbydwCc/0HQk6f5/SAfFZB8u7IF6qVBy+n3AL+qqxjmvZvDJHlKjK/7NWMId5I2dx
 fyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Q9TkKT3+r01vVZzm+xYD0OiOoUb1Biq2Sme618hwY2k=;
 b=aoYfLdiJdJdHcJ32KfQc+HCDWOiyKDLdHM/1pmoF92gDEdLjg85u/AYIKC6g2z7KtU
 WgqS6j6dtX25/tLHIyHoKfgMImE0s8wj9Fym5Dij2b9xhhpTQhbTTt+XBn/Ss52J1uqt
 VLqbQGaenjyGv22e6fqt1CKYA8EfG9RqgdgCZYblyvX39vXNJSESiAzGD8pcdQcfixrh
 FUes5DnOcTOfjd8rQSy1hPO/mr71iS9ixvTRUsAgFla1uPV9Mu2MbSsMT+XqdHDw++IC
 lC1v0oRipK6h7LjkC5nWipt68irVe71cxshFwQCjid2sEhnVJrYtudeG/Lx6j59dNgAY
 vG0Q==
X-Gm-Message-State: ACgBeo16YhWqxSHo3Vfgsztl0EkgNTBV4+N2CWcpKkLy/IjqdUAw/S3u
 HpvOzoo/QmRPs2sIqYL49D4iew==
X-Google-Smtp-Source: AA6agR7gpVa5DIQ2h+vqaTkyvVoEIuRThZItL25KMOVg6jlA6fNSzQ7YUJDL6/meWk9lWYJT9jLdhA==
X-Received: by 2002:a19:5602:0:b0:496:443d:f044 with SMTP id
 k2-20020a195602000000b00496443df044mr1069081lfb.313.1662551568497; 
 Wed, 07 Sep 2022 04:52:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a0565123b8100b004947a12232bsm2383321lfv.275.2022.09.07.04.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 04:52:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: broonie@kernel.org, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, hdegoede@redhat.com, daniel.lezcano@linaro.org,
 lee@kernel.org, cw00.choi@samsung.com
Subject: Re: (subset) [PATCH 2/3] MAINTAINERS: pwm-fan: Drop Bartlomiej
 Zolnierkiewicz
Date: Wed,  7 Sep 2022 13:52:41 +0200
Message-Id: <166255155747.50111.5480583055849352151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808101526.46556-2-krzysztof.kozlowski@linaro.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
 <20220808101526.46556-2-krzysztof.kozlowski@linaro.org>
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
Cc: bzolnier@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Aug 2022 13:15:25 +0300, Krzysztof Kozlowski wrote:
> Bartlomiej's Samsung email address is not working since around last
> year and there was no follow up patch take over of the drivers, so drop
> the email from maintainers.
> 
> 

Applied, thanks!

[2/3] MAINTAINERS: pwm-fan: Drop Bartlomiej Zolnierkiewicz
      https://git.kernel.org/krzk/linux/c/1f88d1e5f9e5d965c2208edc2c757eaff8960bca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
