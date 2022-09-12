Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA25B5992
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 13:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D342810E3E8;
	Mon, 12 Sep 2022 11:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C381710E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:46:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id v16so19467706ejr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 04:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=dU6qTsmX+AR4sN4oTS+ciGVK85MYdIPdrKWG8ScWOgNhX7cCJ1mgYJErWyquyiWpR8
 ZKKXhlelu5FWOHV4vLu1oUfC5+RQIt9Ek3b1XvEU2+pbFQS3DjW/sRiQ9mpmtYKFpISA
 G7UoxEOCCHg4KJd2JKkNxXrmyhBpYN9IeX9zEGX+KAwnwG3rBFC7NbXuTA+I1IuDUlSI
 PES1FOqjb1RRn8F8dtr/015vox2A4xpyxn7gc7vE/5NKqBqkl+LMINRYjncSuj+fqY18
 7M4szXd5CGWL60jmccOgh2ugbDNV3xsSe7bSJjCGmWPXFnj1IGzRCjKMnDXz8tbBvJg3
 R06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=5cJqdqsrmpZInwDRfQ7nnMBgPssKFo7LgC32M52Kt7KcGDV10W8oiBp8m3qDuph66k
 ziBpKwDgbGbmMLKAoUm3pU5XYEXR/Bu8FFEcgZx9Rb8gahI6FCxI30l/a6diAuTCmMuu
 K6nLD+l5LtyICCAOYFMLZFvG6oXZ6g5OU6GW5O5NkUca/bOm/t5F7h9o3Wytd6u50YLe
 6kGd5yH/QyRFctK/FhySoCZtNwm3iPuKQ1BtuuzX3KeurLDzduNg0n1+C6MhZlq0enDO
 bCayliK1q96B78+AzinpkI742WjJ8Mwjth8BE/cZR6fvwoH1mFcFeGBL+pASK5GQnbzQ
 Xnvw==
X-Gm-Message-State: ACgBeo0VpdEIfaVzBfbr6j+D+hCYhfRYbHKRSts4O/7qqrKT6A6ZsPxN
 ZE0h34u+oLp+vFXp8T24CVZ0Kis7jnnnmaBUApXP6Q==
X-Google-Smtp-Source: AA6agR4itWEF5fG4C5Mcg4cNALXMb1B1eC0ZYWG9pXsheQJmPgQNvBk382aGfE0updA8rpqzChb4xjGhpIx3cChP2Gs=
X-Received: by 2002:a17:907:94d0:b0:77e:c2e5:a35e with SMTP id
 dn16-20020a17090794d000b0077ec2e5a35emr1638818ejc.648.1662983160325; Mon, 12
 Sep 2022 04:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220910224816.15058-1-someguy@effective-light.com>
 <eb8173f6-74cb-3010-f1c2-5eac6939e1f7@collabora.com>
In-Reply-To: <eb8173f6-74cb-3010-f1c2-5eac6939e1f7@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 12 Sep 2022 13:45:49 +0200
Message-ID: <CAG3jFyt-6-i1aYJ4ntTNqd__EnYejvMnfi_NEgXHOd+U9xtYJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: use drm_debug_enabled() in
 it6505_debug_print()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
