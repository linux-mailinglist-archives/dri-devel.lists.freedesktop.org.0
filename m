Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709B44BEA5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D806EB3A;
	Wed, 10 Nov 2021 10:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7206B6EB31
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:30:18 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id q17so2568995plr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/H97nPqB7O+Ha49bdQqeIeu5pMRHp/3DE9p9icaUgqM=;
 b=PUuEyw9XBots469I4b/mSNfuAjfpd7qQMzH59EqV6M8zrGuW5q/CfOy/XJM/r7hsaF
 ndro4ZRi2k2UFXbYR7Y2TD+wsPKHpZaqWMHSaQC5u0vRq/R4W4M75LnQ6wwHqTSRhgjA
 gNhSq0Dc8jWZWpqCIgVAsX8h+/O3mbrRqDeGIUv2lwZ2U3bRdIAyjPOH7bVnTrFrFM5/
 FjN72YqxEMlv/SAj8JL4+P+sZFmb9ZhnqE0y/Dg5uFA/hcBKG1196tdQW2bAJXYHe/fz
 wZWqGkamOre8skZ1KLmAgmEvyTB8aiEzTVhVd5dmXMR4WSLYYi9i0jUTIq125egaczwZ
 gM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/H97nPqB7O+Ha49bdQqeIeu5pMRHp/3DE9p9icaUgqM=;
 b=4cKHBsEv6L7PeOLQo24WnqVhKVJahLHwuq1HdVkkbqHHl2X8rw3G/633E1H71ULQit
 Lwo1IcukWbNLjnfx+rIHcf9Gxg4K8wPN5X7D3N54VxpWrRYC24nzkE7hEDGm8/cOzrzJ
 PcJhiIDxKKA/uTqbv807m2MjmAJ7ALFG0Es8/tV71U+8R2IU44dwx2wvOPzHgNzQ3qHF
 KR0LlCCG4LmL9u71XK+SixmOtYrFQIUQ1x3s+5jmx0Q6v6dFl0cUG6q0FLkF/y1paiOo
 ZXVUp1v6y4OZfsfbjKAdGJJq3in8GqzcpNGiGIjTayAOiuxo57URsF/N0HA46OIa1Qqc
 sZMQ==
X-Gm-Message-State: AOAM530SgfcAmCSdZbrEMTnEL5Jp6nUSpG5141HY+CsYhupLzT6mV4D8
 w6ZGV9dgz1iABhhgGXBAqTr8jYqwkPZWYiA91MpUgw==
X-Google-Smtp-Source: ABdhPJz1qeQBdRPNXYe0xOwKF+EIkcWuZ9iABV9TtnSScZMDJCzYb6hg0DTj4FGiTtJpUHr1yfmX7QThpigva/yBGZE=
X-Received: by 2002:a17:90b:4ac1:: with SMTP id
 mh1mr15543616pjb.30.1636540217454; 
 Wed, 10 Nov 2021 02:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-5-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-5-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:30:06 +0800
Message-ID: <CA+Px+wU6iwjisS1_Mdxdt6eb4pjLQp_Z16bA_ewEhCe80worKw@mail.gmail.com>
Subject: Re: [PATCH v9,
 04/19] media: mtk-vcodec: Build decoder pm file as module
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

On Tue, Nov 09, 2021 at 08:50:15PM +0800, Yunfei Dong wrote:
> Need to build decoder pm file as module for main device
> and subdev use the same pm interface.

Why does it need to be a module?  Could you provide more explanation
in the commit message?  For example, any compile errors under some
circumstances?
