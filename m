Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067215537B9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 18:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486E710E47B;
	Tue, 21 Jun 2022 16:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357010E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 16:17:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id c189so14783187iof.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cbMkNF6F3Ld4xQ45Oa2UvUrcvR0Hf6I/PwT2kBwxAs=;
 b=aB5j0VbEE/nmIbXsK0SDlivbqh84Xhr061uGq8iD+WWz1c+oIBC0c1aXlmCVOXhzHK
 AAGOJx6jqamYX1GtqvHExxYoa2FRKSt6PridsYBLQa8Z7K0AVaKV7YWDBIUQfRm+Sup4
 qqrikaWUQ7A/vUeD9Ukcr6oFAVZROfENjgWyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cbMkNF6F3Ld4xQ45Oa2UvUrcvR0Hf6I/PwT2kBwxAs=;
 b=MLq3KW1VO49IUiRT2eOtgwr7WPf7SlPo8ZIPlJPvhHoY7hSW9pKhzVLrSMXeO7WkTS
 UA2d2VniPIJMEMFTEZJLzzPPW++wQ51zPG44fZsdzYPPs2TV3M/zaMMkJRNQ8iov3sH4
 buvXVSEvH+FWp70H9Qx8ZNEziYKonArg3TJ2D78wq1d3s2Zba0zdPyjGbxlCi8w3MiMj
 377zewDnU02X4xtwkSaOX9qLpU3J3jCEnVaXfg8LQkYstegQxu4s+WrGDY5HyuTKTMf3
 q1Ds8G2l3dVz2gWf/mL9cH+rjov+wf/3CNah752v+VMf+rw/vPR01es7dN4NnLb/0F7h
 HBaQ==
X-Gm-Message-State: AJIora/apgj8jh/Q38AzVCuUnvk+p/uGDlAvjb0ul+T3xn6DLGZDwiwV
 XIoKDkvp6mQESEFJgAiZ0ZIWS38GV1q2VQ==
X-Google-Smtp-Source: AGRyM1s1h3QW1ie3Acu2jrLT7R1Z4x4QznELMS3RS5YA6gJiMgMcy86PLzCcyuI3qL5gz1G+VcswSA==
X-Received: by 2002:a05:6638:1312:b0:339:cc31:9e2f with SMTP id
 r18-20020a056638131200b00339cc319e2fmr1763045jad.195.1655828237508; 
 Tue, 21 Jun 2022 09:17:17 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47]) by smtp.gmail.com with ESMTPSA id
 c12-20020a056e020bcc00b002d52f2f5a97sm7546371ilu.35.2022.06.21.09.17.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 09:17:17 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id d123so14745676iof.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:17:17 -0700 (PDT)
X-Received: by 2002:a05:6602:29d0:b0:669:1723:c249 with SMTP id
 z16-20020a05660229d000b006691723c249mr14916031ioq.208.1655827822015; Tue, 21
 Jun 2022 09:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220614215418.910948-1-dianders@chromium.org>
In-Reply-To: <20220614215418.910948-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Jun 2022 09:10:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCCaD-YxhyQeUXe-L06me7XnTRxvsuzjMjWMRYtFxpjw@mail.gmail.com>
Message-ID: <CAD=FV=WCCaD-YxhyQeUXe-L06me7XnTRxvsuzjMjWMRYtFxpjw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] drm/dp: Introduce wait_hpd_asserted() for the DP
 AUX bus
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Philip Chen <philipchen@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 14, 2022 at 2:54 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This is the 2nd four patches from my RFC series ("drm/dp: Improvements
> for DP AUX channel") [1]. I've broken the series in two so we can make
> progress on the two halves separately.
>
> v2 of this series changes to add wait_hpd_asserted() instead of
> is_hpd_asserted(). This allows us to move the extra delay needed for
> ps8640 into the ps8640 driver itself.
>
> The idea for this series came up during the review process of
> Sankeerth's series trying to add eDP for Qualcomm SoCs [2].
>
> This _doesn't_ attempt to fix the Analogix driver. If this works out,
> ideally someone can post a patch up to do that.
>
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
> [2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/
>
> Changes in v4:
> - Add comment that caller powered up the panel.
> - Comments now explain that we may wait longer due to debouncing.
> - Mention in commit message debouncing vs. powering on timing.
> - Rebased to handle the fact that the stuct moved files.
> - Reorganized logic as per Dmitry's suggestion.
>
> Changes in v3:
> - Don't check "hpd_asserted" boolean when unset.
> - Handle errors from gpiod_get_value_cansleep() properly.
>
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
>
> Douglas Anderson (4):
>   drm/dp: Add wait_hpd_asserted() callback to struct drm_dp_aux
>   drm/panel-edp: Take advantage of wait_hpd_asserted() in struct
>     drm_dp_aux
>   drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct
>     drm_dp_aux
>   drm/bridge: parade-ps8640: Provide wait_hpd_asserted() in struct
>     drm_dp_aux
>
>  drivers/gpu/drm/bridge/parade-ps8640.c        | 39 +++++++++-----
>  drivers/gpu/drm/panel/panel-edp.c             | 33 ++++++++----
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 51 ++++++++++++++-----
>  include/drm/display/drm_dp_helper.h           | 30 +++++++++++
>  4 files changed, 117 insertions(+), 36 deletions(-)

Pushed to drm-misc-next with Dmitry's reviews.

f5aa7d46b0ee drm/bridge: parade-ps8640: Provide wait_hpd_asserted() in
struct drm_dp_aux
3b5765df375c drm/panel: atna33xc20: Take advantage of
wait_hpd_asserted() in struct drm_dp_aux
2327b13d6c47 drm/panel-edp: Take advantage of wait_hpd_asserted() in
struct drm_dp_aux
841d742f094e drm/dp: Add wait_hpd_asserted() callback to struct drm_dp_aux

-Doug
