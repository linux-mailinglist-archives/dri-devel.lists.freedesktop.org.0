Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA546378B1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109910E6EB;
	Thu, 24 Nov 2022 12:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C093410E6EB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 12:16:31 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v82so1401398oib.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 04:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=xkgOOoR55naEVrK40Wadm7CKSFaP+TtjkA0V95FFtQig0FqjBXoxg5AczLVoZABCSI
 RKW+UZFs07r/8QbajkgkbARvMuCkxDkgTHACQAdEs6i3yGxWMGfORA6R/BHx3bjurpC9
 yuVRsAlQZlkPDBVZ3gzMbMY2/wop4cN6tNjay/yF1Y2BzJfOEslh+km+OdQPdiRL6QZA
 mXfg4XyRuCDWI5JHyIzMxdGeE4v9QLuVwRNeCBnNnlMwdAIAlWqY9tFbxdseCU6ymGIL
 JQX0iU9sZAciqoAHQXOsQV8b20/9kd8xyx60QXeohdoSdICogiNPxup0bL9LDSpubZn2
 kuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=8OWnLY7Pe/MdnDRsfuAZwFyqV/fxZ9ZbaqRG63uOGiZ7XghZSkRjqxmySB/0bneRtL
 9J/+sa6b868vYQ3yG9ryFx469o71c0gJmt5FZ9mAkiLvDg9RaRPH5lSijV7WYBZ3XNs1
 OwNnxpExDcgMiwFRpld4Rs8EyaNjUNj6GLg+t09KJVVxpPg4VqK/fArTVa5Gy0irynp1
 HDHZgn59rgIYXG6uU3IjEqmIWEVcF2+673hO8yk6BYgRbqyx71odx4g77B7fSfFV6zyc
 eYYaU7M/RWJ8JfJvO9d5f/xDxsfHmJcoCaLcJkXwKy/LOKp0X5X+WHJsLxF+/1/MHG+M
 Kwbg==
X-Gm-Message-State: ANoB5pl3DlUwLnwNwjwK656M1VN7v2cAKRbIvqiKmrzjHIMInvedn18s
 hBSEqL/F7XH6AoDrgOHJj7NYQhB1LNFscBNvZh6ZUA==
X-Google-Smtp-Source: AA0mqf5L9+lrul1I/1+IDLi94tm9hWpUFUpDXBQmzSQdIXIUp8plQRGnsolhUNGiRLT/zlEFKPJLP+FVe3zMEWIotRU=
X-Received: by 2002:aca:5bc4:0:b0:35a:7056:4f9c with SMTP id
 p187-20020aca5bc4000000b0035a70564f9cmr19837991oib.72.1669292190923; Thu, 24
 Nov 2022 04:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20221122081219.20143-1-frieder@fris.de>
 <9079928.rMLUfLXkoz@steina-w>
 <7761d66c-a8a7-c11a-9c09-a47f57bd1311@kontron.de>
In-Reply-To: <7761d66c-a8a7-c11a-9c09-a47f57bd1311@kontron.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 24 Nov 2022 13:16:20 +0100
Message-ID: <CAG3jFytse8xcyFe-1F95tqdixeZy5ivYd=vxXUBVkiwUu-yjWA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix delay after reset deassert
 to match spec
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
