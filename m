Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4E5A0179
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D782C0CF1;
	Wed, 24 Aug 2022 18:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62893A8636
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 20:53:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id y13so26538306ejp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1+XpTLI/st3pL/UMVfxVdHTTNl/6n7HQUGF319MI0IU=;
 b=LWeIFvQ972maQf3/948nGROrQ/uqLY39NILux/YX/yij//DDfJOUkG1nQJ6gmz+gTm
 mt6Z7RHYlgh9kTtp86QGSAGzgewxTFuJcYWCfkzx6O30xI56V2DXKKKABUkTg/s+s5IO
 K4V+NvtxkPE4rvxL0bRx0Z/HcIaJaqrN3Qad8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1+XpTLI/st3pL/UMVfxVdHTTNl/6n7HQUGF319MI0IU=;
 b=LU2LvH//jDuDOUUoI6Wm1ETOFIz9VGY+zrYqG6bRO6uvGZBr7vLlFZ5/kFAObxQb8E
 rCCg1FfSFVFYZgj0X2BDO2tg11hNuNC2reVDS9tU2qvTlWRHIn62qEORIf6ssT9beL1b
 QLvf+5XjV56SuUAIQik5zs7v6gOfZdsHeltWdiDeAegJHgTMJ5FbBWEtPafpQURAOeWj
 B6n/F2s60ZPxI4loshWJN/ZsojfR5qBwCLqwYM+UJx8jj9XjKNkgbqb1Kymq5g0AjjDX
 bVbgF1XvkvWFR04kdphN/t90bMFUxYtMtNwZyH1np4EtD5IX1wKQw8CGXTUSN0YBokr9
 MI3Q==
X-Gm-Message-State: ACgBeo11kNnMZ6DzDmNMFIy6AsrrfsmSjyLOH9UjJDNK/6wahaa1UGgU
 YdeCOHqrjZoOkY38XMWP5LN0/nqjnsB/7zJH
X-Google-Smtp-Source: AA6agR6Sy9R3DLLoJbebzfDprGTKpYVH19/40zIuv8rLE+hKx1g8CxcqU3LZ4332WoQDXG6+bGG9Xg==
X-Received: by 2002:a17:907:3d90:b0:730:9300:68aa with SMTP id
 he16-20020a1709073d9000b00730930068aamr18455050ejc.655.1660769621642; 
 Wed, 17 Aug 2022 13:53:41 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 w27-20020a1709060a1b00b0072ed72072aesm7174849ejf.192.2022.08.17.13.53.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 13:53:37 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id r16so8300704wrm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:53:37 -0700 (PDT)
X-Received: by 2002:a05:6000:1541:b0:222:cf65:18d7 with SMTP id
 1-20020a056000154100b00222cf6518d7mr14840607wry.659.1660769616735; Wed, 17
 Aug 2022 13:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220816064231.60473-1-zhangzekun11@huawei.com>
In-Reply-To: <20220816064231.60473-1-zhangzekun11@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Aug 2022 13:53:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxp=YJcweeuzQqkzVoC-uuXgbTREqJTu0RphB4X6B4DQ@mail.gmail.com>
Message-ID: <CAD=FV=Xxp=YJcweeuzQqkzVoC-uuXgbTREqJTu0RphB4X6B4DQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: Add missing clk_disable_unprepare() in
 analogix_dp_resume()
To: Zhang Zekun <zhangzekun11@huawei.com>
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
Cc: Brian Norris <briannorris@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, xuqiang36@huawei.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 15, 2022 at 11:45 PM Zhang Zekun <zhangzekun11@huawei.com> wrote:
>
> Add the missing clk_disable_unprepare() before return from
> analogix_dp_resume() in the error handling case.
>
> Fixes: 211f276ed3d9 ("drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this and check back in approx 1 week. If someone else
hasn't already applied it I'll plan to apply it to drm-misc-fixes.

-Doug
