Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63C64D7D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1614110E4ED;
	Thu, 15 Dec 2022 08:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB81F10E4ED
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:36:12 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d20so26105899edn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J9ND4ijq68a4hb3gYR2CJ/DyOHYb8yeQZla7eXoYCzc=;
 b=HhdRvG4XYqrsh3k2OdCVvBgdTiaVmwG0SBDN9sjj9GgVVYL5OiZ05+na3YBpllG3q3
 BaH6jODcOq20FYy5olQ5z00qwXLAQSLkjyBAPZZwpTISHgoMsR+OV3TM1VlF+a7P7/J0
 X7sB6nMwvloE+xgIdTxcv93Y2l3zQV08/mEU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9ND4ijq68a4hb3gYR2CJ/DyOHYb8yeQZla7eXoYCzc=;
 b=uP/+w0YoduMAx6oOZOVm2hMveRlj7OniUj+ufUYaLYToG1WAcFLPCBqS8B3TmYdLMw
 gYCJSV1VzEVj5sTOosubPNCKgGs9jKY48tnzvhnA+Z9qSf8jSh5H3iHQQYdFKBVjTAo6
 +F+t1XPUdWbpelqxF84ssS0cV7r5ijQi46NmLAk0MRyOGvydJMwpBWabnJf2xG9kwTJc
 P/xfGV5SllQR0otU5gmU7JsOvHjkyXIPlfNm+ermwfyyQREn1UCE5bT5c+mIK+P6w7Rm
 5JTlVKenk4RpJ/mLEBQN0SWthzVeKEtFw5hGJkEVDTfY5svAYVhsNzpzZdtryOPXtbTG
 WSSw==
X-Gm-Message-State: ANoB5pk2anzobaAvc2qLg+KqbayLCFzSuFu5pgIIkYhDgZ/PAMxAU2ea
 wLYkaxARoLXUJhh/4NEZFofbmpBTYejWMrZzFxFH2w==
X-Google-Smtp-Source: AA0mqf5u6VVY9Q5PyxQ+4FxYsGsBlaZT6Jdtf2Cwj/6QFxZ2lPdbWhu42bhr0RWrwu/RZ18Ude0UHGNKh0EyT7xNJew=
X-Received: by 2002:aa7:dd4d:0:b0:45c:98a9:7bbf with SMTP id
 o13-20020aa7dd4d000000b0045c98a97bbfmr71860623edw.372.1671093371372; Thu, 15
 Dec 2022 00:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20221115112720.911158-1-treapking@chromium.org>
 <167103665890.995711.9267085599513513874.b4-ty@linaro.org>
In-Reply-To: <167103665890.995711.9267085599513513874.b4-ty@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 15 Dec 2022 16:36:00 +0800
Message-ID: <CAEXTbpfgCVWNE=ao5=d8_Bo1YHmfb7e08aeMCaz38Tvt0jAcTw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Add caching for EDID
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 allen chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

Thanks for the review.

I didn't see this patch on drm-misc-next, but my another patch merged
instead: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5eb9a4314053bda7642643f70f49a2b415920812

Did something go wrong? Or is it me missing something?

Regards,
Pin-yen

On Thu, Dec 15, 2022 at 12:51 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Tue, 15 Nov 2022 19:27:20 +0800, Pin-yen Lin wrote:
> > Add caching when EDID is read, and invalidate the cache until the
> > bridge detects HPD low or sink count changes on HPD_IRQ.
> >
> > It takes 1.2s for IT6505 bridge to read a 3-block EDID, and skipping
> > one EDID read would be a notable difference on user experience.
> >
> >
> > [...]
>
> Applied, thanks!
>
> Repo: https://cgit.freedesktop.org/drm/drm-misc/
>
>
> [1/1] drm/bridge: it6505: Add caching for EDID
>       (no commit info)
>
>
>
> rob
>
