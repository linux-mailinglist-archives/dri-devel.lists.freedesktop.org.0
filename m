Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45535A9632
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334FA10E6D8;
	Thu,  1 Sep 2022 12:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073110E6D8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 12:02:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b16so22250600edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 05:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EQtlz1/8bB0OljN4UM8RiMyes3u0l9AMyZLPYPjwNbg=;
 b=csw5ErrdSflUSncY2RGnqgVsO26AzQXTVkmfMWaLDZu0r1lqkbe1Dm/e4m+d4LMmuF
 f+0F5VaY/M8NkRSLpS5fLGu3FIP5e3Vig2aNluEEwrALGOFvhE2kA63jB7wt+jukOY7g
 HdfXsSBWY3n1NFJe/MuHyN5GsASL7wPwUGoKrNo2DZC+POKv0J0WiLhIMeElR2v/epCt
 Z2lPJmhe6uTZ0m2IBBfibiFUNUG4Ak6QkUbR63nLTbTLaArK71EFrXQIwK9Y2Y0oeQF1
 nL+g/67GbFp7ErsomDo14kVw4edEef0k9aYVZA2jS+cAzanNAXpAAfz80xrP/BtpMxcu
 6ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EQtlz1/8bB0OljN4UM8RiMyes3u0l9AMyZLPYPjwNbg=;
 b=B8WQhcbCi/Lh5phQWQfvje9xFE+5avaP+CZocv1EWD8EetT0FfV+o0RuvAq6b6HScc
 GvMzPb6z2CWp2sVH3HOSfNnaN8dmNZSP6IxI236Zg2W47wmwXpapdrWaXsDDVe0MD1Bt
 VkJ2MQpGzUHNn253+XZbGWiJzCrxmTAGWYkT0XzqKHnUz1t5hZzEsPB9cfFI73XgcUJY
 PILO8p44xf4SzoXn72gRaoyN/j9ec8rzI5qUR8STsydhCJaPduvN95HHvaberQMZZtwI
 5/+RWSdtSf826fOxbunBP5hV3Lw5WHmxnflMJQO9SHBP/3ZYxH9ULHuMKBBU+zivvgdt
 j2Rg==
X-Gm-Message-State: ACgBeo20TqxH7ge2HYuFTdNH7cMOUtQxL7XAr5cJzJpM8C8AoLBjjQpu
 RRKQ7zi6zl1ILZExyeYqqVYjwuulVYMWIMcjzCswig==
X-Google-Smtp-Source: AA6agR46lntjoWxygCrFZiR2tXvOJ0E5Z87wwnM92vmKFppeHSarx/2ykA+3g+EifYIeUwUI0d7H7IEkqsfkaefSozc=
X-Received: by 2002:aa7:c488:0:b0:448:d11:4830 with SMTP id
 m8-20020aa7c488000000b004480d114830mr22369484edq.97.1662033769564; Thu, 01
 Sep 2022 05:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 1 Sep 2022 14:02:38 +0200
Message-ID: <CAG3jFyuaM4DYAsC1u7k==3OzVtheqxBoUJgDDso9sZgY9ByO7w@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] drm/bridge: ti-sn65dsi86: Basic DP support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Aug 2022 at 10:27, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> v5 of the series can be found from:
>
> https://lore.kernel.org/all/20220824130034.196041-1-tomi.valkeinen@ideasonboard.com/
>
> Changes to v5:
> - Drop the broken "check AUX errors better" patch
> - Fix sync pulse widths in "Reject modes with too large blanking"
> - Drop the text about eDP, detect and get_edid from the desc of
>   "Implement bridge connector operations"
>
>  Tomi
>
> Laurent Pinchart (2):
>   drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
>   drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP
>
> Tomi Valkeinen (1):
>   drm/bridge: ti-sn65dsi86: Reject modes with too large blanking
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 72 +++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>

Applied to drm-misc-next.
