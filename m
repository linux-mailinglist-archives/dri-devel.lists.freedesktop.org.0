Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F339644BEA9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66066EC1D;
	Wed, 10 Nov 2021 10:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D126EC1D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:30:28 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b13so2666128plg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BL/ijtIxlYFTdIaPRxg1NuofUxGQzYinoPWGFB9zPEs=;
 b=oon4kKhSj7merVzvPBZvRplsjLDFbY6jj7MxoEEpCv5XCaxgftMX9iQSg2wZgT5bmh
 5GSs8rWijTpI31ovFFuakG9K9AAZdhQBKS1mhPi76SPrvNr+SNCoiyCWyIrU8CSCh2YC
 ip9t6JVaopp4KmCDK4b/pAWLlCqzs36IVlHxjuyGxtMmNzUws9ccTj38yd3EviK+6dsE
 puAwS46GaQ5dzqgphAdiIf/mlSnqbrFXyBbKZmcpXOuiVC8ectlztG/GN6cOGvUCHqdV
 qmXeEnMckfRwc1Fhe/svZO5BHI75kgDk/5rOCHY+BuwjUvYMBL6gOCfLMi3NO1r31Dc9
 k4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BL/ijtIxlYFTdIaPRxg1NuofUxGQzYinoPWGFB9zPEs=;
 b=PYEyNlWXwPt/EZZIibBzzMxBq8J5JXDR/VlZ+hwmRhUM0JIb02JGIiG2y9MCkAhYOt
 hbno/gqctChEMK+6A6CFb4nmigKUpRL2tyDjjBU0EpNmQbjcxB0u/LE8HwFbaiu6hbs2
 +Y0BwOwVrbH6bN8jr5Mrk4hnlG8HDDj8NPxdrETxUSsfrRZpU26lBXQdwFD5uEwoEMYX
 RXT9L5ElRLqZ9I/88AfLeTnU6ah/uRSsSkexd/XsFhmjKIMyXMqxivGUp/3cmu1t1QxC
 GHT+iVONQlSFD072k4nRatYFNFVD8sWY130YFqR35Lv2SbAVkoLsqMlN/ZaJcwxrDcMF
 2p+A==
X-Gm-Message-State: AOAM533lGHyny5qE4hGp7ZexUcNHZpcq5UFJgRKRyJyj3rsGv8cGc0QL
 jQ/YwcQbu3KdrDohB0SKWTcZXyyR7xvHKW8GjYcjQw==
X-Google-Smtp-Source: ABdhPJwVgFxj/vjgnycu/+1rEWt9aVPNT6j63gpsvXFnkemxO+5cDmd7zOvOIUlgeIO++x6gV0UCGw/o6pLmfakrEQs=
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id
 d9-20020a170902728900b00142805f0e2cmr14242448pll.42.1636540227601; Wed, 10
 Nov 2021 02:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-6-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-6-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:30:15 +0800
Message-ID: <CA+Px+wWiFDB9rqOzsTjjXAyKF9+AfEmC4ZrnYQTCi7ePuCUGXg@mail.gmail.com>
Subject: Re: [PATCH v9, 05/19] media: mtk-vcodec: Support MT8192
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 08:50:16PM +0800, Yunfei Dong wrote:
> Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".

The patch adds a new compatible string.  A separate dt-bindings patch is needed.
