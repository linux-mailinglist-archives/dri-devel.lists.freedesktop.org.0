Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678150B9AC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B9B10ECF1;
	Fri, 22 Apr 2022 14:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924C10ECF1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:10:55 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id u15so7721477ple.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7KnDx3MBsXGU+6f03hFeaiX/1ovDgX2SpGS4CvxvKDY=;
 b=q2bhF3xvKQlTLaeB2d4vAiYmlXLkecs/KMghPS5aa2xC2Pb+w5XYwcWBxIwx+JHZF4
 mbUuucvNbrkEooym6ExcZc522qErtzAUV1W5/OUIpmxFjPRN3I1j7Xfc60HUnRi1fuAl
 i2Z8wXMdD3qvhT1/jAkvQBo4fPgStqI7aIRP3FMbnmf0wNP1nvKLJgLMSJ7y/29Jtmjr
 AsjyKrCVacHZEq2364EGTa4Dz4vAmNY9AO8QbSD5nXbJVnaC/eLq/RoW5gXbYoxIk794
 L8R4xffk0MXLVYxWjUFY+HLvKvsh5Wj2CDTdX0G9ZmfKdAwEkAIT1A2gXp5Cbfg0f3vW
 bv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KnDx3MBsXGU+6f03hFeaiX/1ovDgX2SpGS4CvxvKDY=;
 b=kUINP9cxBsrzCMA8MkDczaKEKb2j1XQ9pnxoljR/QD6TGXeze2ogoqAAyRTMbK+B/h
 P9y/+U3mXsLb3BVRp5rX9uYQi34Lk0QfnVwwBoDby8wv5DSKQrCcxuC13ameB7WJQloe
 otV+gZdsA77Oub+WXsiCiKKm2TsrDVjyQTtux4svkpt30SKGBQtYVfouD/Zvj2q267Nu
 kDLWNyiagsI/lmcccI1570q9bcPwHn+NdG3LJAZVjv+lY0J3Dmd+w5ImTc+oNQSs1NPh
 ZXSQm647IktUHiOkJLGUI9Dj6ybsBCLYhUDZBttNlfvm33wYrgqcy1VbBoaqb0Jo2SPe
 Df9g==
X-Gm-Message-State: AOAM532tW0j/PzmYi3hj9QIp3/JP13bQ1/eEVLh1volQhlBcOyWzyGtA
 8MPWT2NJPEO/LJSS7L5YiRvmdKmyoTmh6mPAeh21GQ==
X-Google-Smtp-Source: ABdhPJwYFHoUca+/m8OJ6ZB2tOw4pt/Jt1T0oHOVtUwkm0mgQ7orYW9ZEfXsdLO3sdd6qjZz3OXQp5IRLzG67Opuvn0=
X-Received: by 2002:a17:903:32c6:b0:158:ded2:e766 with SMTP id
 i6-20020a17090332c600b00158ded2e766mr4769801plr.117.1650636654846; Fri, 22
 Apr 2022 07:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-3-xji@analogixsemi.com>
 <CAG3jFysyj7sO0qh3FAAeuOQYUSz6nkZ8svX7f4xdfSY980OkCg@mail.gmail.com>
In-Reply-To: <CAG3jFysyj7sO0qh3FAAeuOQYUSz6nkZ8svX7f4xdfSY980OkCg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 16:10:44 +0200
Message-ID: <CAG3jFyvay13a1zNu6k1LEykYHCvy96NT2AQp9mUTOn-dB_o1Ow@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings:drm/bridge:anx7625: add port@0 property
To: Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Robert Foss <robert.foss@linaro.org>
