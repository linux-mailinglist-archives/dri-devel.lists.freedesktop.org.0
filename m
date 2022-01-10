Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285614896D4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 11:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4814A33B;
	Mon, 10 Jan 2022 10:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E732A14A33B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 10:57:38 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id i8so10777421pgt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 02:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/d//iXcvScFsS0QFG+KfjeysK3dVRYehHeXn/qZMF0=;
 b=HS5Yr71lnN19txyrnE+hh7IH7NiptHECau7hysX67+PRmWzEEBssnq23eTWrUlDAWo
 tzib9q2i8eh3HJZ0o9XyavdlX/t70lI/hpSLnOlqm9xQX8K366BpAhkThlHeaFDS2ARL
 lGIG8GgAtRdTXHXJMld9sgD17TVt13nYOrBuW+kh+HGmmeta3X+CaeOwxh6vfFbxED7z
 vy+1/S6rWiuT6iS7CW0NOdqgl1CnjOxzUU48/tmHkBGfPixXMX4SuFRGcN9VQZFvGiq7
 4oS1k0dv6PDnR8gcsaeXVuKDyX+hGSzoQpZP6qjD/riOYy14RTHTyHekp2XqwuGt9Q9p
 7MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/d//iXcvScFsS0QFG+KfjeysK3dVRYehHeXn/qZMF0=;
 b=gR/sDMIRS7q1u0M9un4aZz8MSOeqOpFO0bx/N09Yy56avIin/nhcTqhLUA+Jf4Czo/
 Owa+ZastVslVRiZem/76X9KnDde30zQWiZzldetXV1g2acZNBaQ5joVY6liX81UBoqS4
 0k3clEyWqk4KPgCL4qCyDDRuI0QOwx0UH2GGMRP2SinhEkvAP9hH5+dBnguVNhsX9tGy
 ncOAQzAdgrp1k6RUFFotS4lImPzBE+Ajd8weQ+H4zEFjHtGBAkHasyavtmyaU8qzJVwE
 iFh7FuyOWEBgAC8gJZ7pbIozP1VIRydgWplv2GHt+qmu+JOLgF1pxxQUlDsT6nKUmA87
 MqvQ==
X-Gm-Message-State: AOAM530hBngB8GGTjDB9eAACASicNvgFpLAsUK1I1kdmCD6txwBCHfpI
 YzRgXmX4LV0i+yUgUwc78h2U/1sWIhcgg7IBtgqqnA==
X-Google-Smtp-Source: ABdhPJxewZSFmncqdt+aIYkjVjxgUAgUZXseR9yJSWIN6IiOi/ELijCRc1d2oxYKYMgw46GSFH37ke9r4b1b5EIxjZM=
X-Received: by 2002:a63:7c51:: with SMTP id l17mr4785548pgn.178.1641812258383; 
 Mon, 10 Jan 2022 02:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20220106100127.1862702-1-xji@analogixsemi.com>
 <20220106100127.1862702-3-xji@analogixsemi.com>
In-Reply-To: <20220106100127.1862702-3-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 10 Jan 2022 11:57:27 +0100
Message-ID: <CAG3jFytyKqwQkG8soz28tr75=xq76BR01ROoCoSM7qiioeBGBg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: anx7625: add audio codec .get_eld
 support
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied series to drm-misc-next
