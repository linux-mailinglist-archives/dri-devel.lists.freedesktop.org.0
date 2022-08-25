Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCB5A180C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 19:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A57B10E128;
	Thu, 25 Aug 2022 17:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAB010E0E9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 17:36:57 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id og21so3411883ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MgkxpuDYNfRRBnVjGGx0IvVP/Y84NvnK9NI2soXdS2k=;
 b=XzKSN+zJd0x+L4aWMzauNurwUHFcSPiPCb1fGPFyN2vz+d/RoA+TjfrUTNw7mW7t/L
 8GEtg9rj7rAYC0VKF08igpQIBo5p3lYtT51A050uz6ZJOgzADOgKSyZI4hTiNusPnrJq
 klt0qWnCM70n39VrqtFAlGcV51De/6hBnxTdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MgkxpuDYNfRRBnVjGGx0IvVP/Y84NvnK9NI2soXdS2k=;
 b=oMwzsL6+HBjf9kLvrOFtqcFVwdz9FZM9F4HeUPh5HIQxDUawgiPosFWrmupFeL4UuW
 /6Bf4Jwidxp7KRP5sfwo2l8/p05KgcUNNFmSy6YVRM5ji/9nfkrfVFYcPWh4rIp46ToH
 Pn+SGtsleHwhDWVEBqSiUEJzD7/Au4Rq4wGuw79JMnVqsldRmXkfLgGYzLex79nQFScF
 hbzUimn5LuDTXxvv6oXXhA1QVRqZzjSSRMk0ietZzDvfKTen9qRF427lh44XkxQwATFe
 mmdpjZAlGPujC08TSujUa1mIseCmBe5X0E3DT5ahkhIxoFt4pW75Oe+hwpgW7s9DaOXn
 HMLg==
X-Gm-Message-State: ACgBeo112LfDMqcC4lCsUy13PcoZ5PjQABkzU4jtRgN2qbqdvc5kuspI
 OBvujvzuJXmhis5n5hyCHG7WZAbvVjw5zm+uA7s=
X-Google-Smtp-Source: AA6agR75hFg98y3yQuOCc95XU0bFT1RNfbT2oAg9hco+I+GTYsdAttoVBBXNdHu13pA0iTwp2QMzwA==
X-Received: by 2002:a17:907:160b:b0:73c:fc00:e55e with SMTP id
 hb11-20020a170907160b00b0073cfc00e55emr3078645ejc.356.1661449015105; 
 Thu, 25 Aug 2022 10:36:55 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 z22-20020a50cd16000000b00445f9faf13csm18231edi.72.2022.08.25.10.36.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 10:36:54 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id k9so25530942wri.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:36:53 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr2914675wrr.583.1661449013445; Thu, 25
 Aug 2022 10:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220822180729.1.I8ac5abe3a4c1c6fd5c061686c6e883c22f69022c@changeid>
In-Reply-To: <20220822180729.1.I8ac5abe3a4c1c6fd5c061686c6e883c22f69022c@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Aug 2022 10:36:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5X2XvvKT5tq+1ywJSmVB0TAHquGgn02uNmn4s-sqndg@mail.gmail.com>
Message-ID: <CAD=FV=W5X2XvvKT5tq+1ywJSmVB0TAHquGgn02uNmn4s-sqndg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time"
To: Brian Norris <briannorris@chromium.org>
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
 Zhang Zekun <zhangzekun11@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, xuqiang36@huawei.com,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 22, 2022 at 6:08 PM Brian Norris <briannorris@chromium.org> wrote:
>
> This reverts commit 211f276ed3d96e964d2d1106a198c7f4a4b3f4c0.
>
> For quite some time, core DRM helpers already ensure that any relevant
> connectors/CRTCs/etc. are disabled, as well as their associated
> components (e.g., bridges) when suspending the system. Thus,
> analogix_dp_bridge_{enable,disable}() already get called, which in turn
> call drm_panel_{prepare,unprepare}(). This makes these drm_panel_*()
> calls redundant.
>
> Besides redundancy, there are a few problems with this handling:
>
> (1) drm_panel_{prepare,unprepare}() are *not* reference-counted APIs and
> are not in general designed to be handled by multiple callers --
> although some panel drivers have a coarse 'prepared' flag that mitigates
> some damage, at least. So at a minimum this is redundant and confusing,
> but in some cases, this could be actively harmful.
>
> (2) The error-handling is a bit non-standard. We ignored errors in
> suspend(), but handled errors in resume(). And recently, people noticed
> that the clk handling is unbalanced in error paths, and getting *that*
> right is not actually trivial, given the current way errors are mostly
> ignored.
>
> (3) In the particular way analogix_dp_{suspend,resume}() get used (e.g.,
> in rockchip_dp_*(), as a late/early callback), we don't necessarily have
> a proper PM relationship between the DP/bridge device and the panel
> device. So while the DP bridge gets resumed, the panel's parent device
> (e.g., platform_device) may still be suspended, and so any prepare()
> calls may fail.
>
> So remove the superfluous, possibly-harmful suspend()/resume() handling
> of panel state.
>
> Fixes: 211f276ed3d9 ("drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time")
> Link: https://lore.kernel.org/all/Yv2CPBD3Picg%2FgVe@google.com/
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 -------------
>  1 file changed, 13 deletions(-)

I thought it was strange that the patch being reverted had my
Tested-by, so I tracked that down at least. Looks like that's from:

https://lore.kernel.org/lkml/CAD=FV=XXESzA6n6MNEGH1Kbh7CeL8xWX8CifFLVf91+0JyFcJQ@mail.gmail.com/

...where I tested the whole stack of 17 patches together. That means
that my Tested-by was legit but it wasn't as if I tested that one
patch and confirmed that it was useful / needed.

Your argument here sounds right to me. The panel should get prepared
through the normal means (analogix_dp_bridge_pre_enable()) and
unprepared through normal means (analogix_dp_bridge_disable()). ...and
whenever the Analogix gets moved to "panel bridge" then that will move
to just being part of the bridge chain. Having these calls directly in
the suspend/resume seems weird/wrong.

So while I'm not an expert enough in the quirks of the Analogix DP
driver to say for certain that your revert won't cause any problems at
all, if problems come up they should probably be fixed in a way that
doesn't involve re-adding these direct calls to the suspend/resume
callbacks. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Given that this is _not_ an area that I'm an expert in nor is it an
area where the consequences are super easy to analyze, I'm a little
hesitant to apply this to drm-misc-next myself. Ideally someone more
familiar with the driver would do it. However, if nobody steps up
after a few weeks and nobody has yelled about this patch, I'll apply
it.
