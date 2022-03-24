Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32164E62ED
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 13:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F5F10E8A9;
	Thu, 24 Mar 2022 12:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0816F10E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 12:08:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so4938387pjq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVipAa3p2lxfXUCkOUOZLM+IsCeHmSn3C9tonIfy3wI=;
 b=GgZxZElViAtY8nYuSfW1SOAk4RYkWZbCX7r2JTWjp3YVnmRvERdOCjnXy6nso+IyKq
 ovobCqamm+f7nQd8RFGDu2zcwfp2JrhkcVj12wCEqqEDw0RYu4U6O+KmdR726BqEWOay
 kHKLGOpizCB1Oub8L4G7XvTefe9hVgNz+5OG5As/U2YMxDxzK9gyYdFUqx3GXAFVY+mS
 Sz0EF6MYB8YOCDJ5wE9Nu5aefYpaNnXMBb4zoVhR14cauuWV2LqzfbzxuiT+w7p/RqT1
 is9wwjgpSZeS4sYK21Y3QwPmlBNSvm8RWx10ZjuOfLjh0wvStTNew3M3SeG5HuAToX69
 4jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVipAa3p2lxfXUCkOUOZLM+IsCeHmSn3C9tonIfy3wI=;
 b=prxcL759idpSkc0f/FN434kYC2g1jCXaDoXAzAwCAeB6BM34HkPgS5fgyhDW+qNc3J
 L5jqAXl34TkaAPL1PwpvLsv4Qj6zwRtT2drJ5d1uSQoBcxsi67jqHw+lZNoCr+RG1FAZ
 5E1BPRo0MW+wr/jRg7TTHeLear0Z6sYDn162bTIhOAAA8Uqf0xfI4Fzv+ShGL+ApsNk/
 5GpkW3rbbL/7ur8Nz53yPqKeBAHqEI22E3+Y4SNmDVaCKAJn2jd6AJKUh3TXDAM0qvOQ
 PMEkCld9Yvi38i7FJlpueG3y3Hr5a8GAmpmcnPCdLLnKnk/kqKOENBv837HyWmCFYhrP
 YH9Q==
X-Gm-Message-State: AOAM532sISIV4+GX+9Ld9Qsvpk40zIovQt/1I3MvAG15pIpqo3VZN00t
 j+F7Gu5PYQQ6wkPtbdp1KsBjr5IwN02Hpt53zefESQ==
X-Google-Smtp-Source: ABdhPJxQLKe/VzqvQLCSDNsqOjYe8mtRV67RfXQKdQ8r+AXfmjXkshELz203hQfP9j88QK5Kc44t64UwnLq1b9Yp9hI=
X-Received: by 2002:a17:903:30c4:b0:153:c102:8b9a with SMTP id
 s4-20020a17090330c400b00153c1028b9amr5459892plc.21.1648123687624; Thu, 24 Mar
 2022 05:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
 <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
 <CAGXv+5Gddu8VU7xjX-r2=u85i7Ut=_6JpQV6py52OyzEkpezTg@mail.gmail.com>
 <20220322101342.GA1493353@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220322101342.GA1493353@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 24 Mar 2022 13:07:56 +0100
Message-ID: <CAG3jFytYcLP_1JJzoTU8YcwXp8==EpPdad5z02ROu8HtuaqfzQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 treapking@chromium.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 pihsun@chromium.org, Hsin-Yi Wang <hsinyi@chromium.org>, tzungbi@google.com,
 bliang@analogixsemi.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > The driver uses DRM_DEV_* for logs. Can we use this?
> > > Hi Hsin-Yi, as comment in drm/drm_print.h:
> > > "NOTE: this is deprecated in favor of drm_dbg". DRM bridge driver not
> > > use DRM_DEV_* any more. I'll send a patch to replace all of DRM_DEV_*
> > > later.
> >
> > drm_dbg is better than dev_dbg though. With the former, you still get the
> > option to control it with the drm.debug module parameter, unlike the latter
> > which normally gets compiled out.
> >
> > Please use drm_dbg*.
> >
> > ChenYu
>
> Hi ChenYu, the parameter of drm_dbg is "drm", if use drm_dbg, it will
> change more code, I'll consider to upstream new patch to replace all of
> them later.
>

Alright, since the driver already uses these logging functions, let's
apply this patch and fix the logging function this driver uses in a
separate series.

Xin: Can you submit a patch/series that converts this driver to use
drm_dbg* functions instead?
