Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3285848FB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 02:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB2910E504;
	Fri, 29 Jul 2022 00:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B301125A6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 00:18:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id z23so5786918eju.8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DEDxzOgHTQRQ+rvv/SEM8DOqN9V3eUaGY5hH+UtkIUE=;
 b=XgGvjKM+Hr42e4KmwAK3a1argfHnnskNbRdLej5zKrxwQdZsp8y8yMpZaRkfb6IxQr
 C8PRTgOCkSzXDctTwt3AbbUt42+nPjnl1Ik5fW1fT+au0znVnOZDXvJpfPbucVm4Bv+n
 ty8qUI1gfDrvRlxRV1sm3ItakjLTxp6xy+YLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DEDxzOgHTQRQ+rvv/SEM8DOqN9V3eUaGY5hH+UtkIUE=;
 b=druMxovV3w1KslowQZOL4e26LHF9px+2igsMJ4UayhIgNLkufKwuwXiR/j7LZ6FWhl
 fX1b5tvnPrjZQ9eV3vyQncgMlSwOvHQ4neVUxhF/FR8KGOZfKkGR3rKH1KcxH0S9T5e0
 Q82xNyMfgHh1HmHkax1lF3YxHUNzWhfvFrw1eU9OMb4Yi0sk2T/PKgXcAHgocTCkNIyn
 k78KY3Eplr2tctxkwkxlzyaH5HBh8tX65x29sc5DpxNislvdi3opgCTvThc5OO0m1Zwr
 STzCkhXa9Wvd4MA2sWSLomn7XB8GKDkNLmJuHhn7we9YtXZjJCIs6Z2935itwGhN7ejZ
 sQ8w==
X-Gm-Message-State: AJIora+rXV676pPLKLo/Ai/ctWSqkGk27x3TwtWnpc96EsjpNkHHp8Kw
 EFeHUnCNaa6a3FjceMaVIBUHvFeGVJSV5d89
X-Google-Smtp-Source: AGRyM1u64A4eYm943/G+ED0zQmJplFaxdeJCfH0DVqPVA863D4hyE5cI2f8RLOOt5rJGBKbl3ORycQ==
X-Received: by 2002:a17:907:72d1:b0:72b:6da5:9bb with SMTP id
 du17-20020a17090772d100b0072b6da509bbmr900134ejc.681.1659053925807; 
 Thu, 28 Jul 2022 17:18:45 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 kz15-20020a17090777cf00b00730165d4d43sm986693ejc.12.2022.07.28.17.18.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:18:45 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 i10-20020a1c3b0a000000b003a2fa488efdso1137957wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:45 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr1007498wmf.188.1659053924819; Thu, 28
 Jul 2022 17:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-4-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 17:18:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXKHrp63wosBdXDBKKcierbgfUOT-W1QF2N23No+MJBw@mail.gmail.com>
Message-ID: <CAD=FV=UXKHrp63wosBdXDBKKcierbgfUOT-W1QF2N23No+MJBw@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] drm/msm/dp: use atomic callbacks for DP bridge
 ops
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Use atomic variants for DP bridge callback functions so that
> the atomic state can be accessed in the interface drivers.
> The atomic state will help the driver find out if the display
> is in self refresh state.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ++++++---
>  3 files changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
