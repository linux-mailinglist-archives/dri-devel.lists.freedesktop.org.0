Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18456393A59
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 02:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC08E6F52D;
	Fri, 28 May 2021 00:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E77B6F52C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 00:38:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b12so3156470ljp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 17:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3tZvKVXXK1CrsVCEdwk4kRijURbW1gkRo3MklbEt43g=;
 b=dzDstQmFnkHnT2yUIYKLBRRBS9fEvHqlCfVDyb072nsd2XLJcbMC9YytfAlVCe02vE
 w9imrgViRD9UmJFiNPktvwlhL+FSug8rzH1rndJtVlz3QQe+LaHVPjU6VmarHmQVjLz9
 xf8j7GTU197/jPwSsOeFHBpLr83hJSyRTW1TXntHZd/bB1uAuI+WQ+bhSHrv/SWtMmVd
 kyaH7en3LnMLvCu2BrfR+25SZJ37jTDiSZTB3f4yqmQeYCEoZnJSe4DbXuwQ/ieUoyZH
 Yg2q/hN5vESri9Wyb+J0nlja9X++NyijNUy+ePQmji3JkVQ2yCofSythjNO8OPePTRya
 28LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tZvKVXXK1CrsVCEdwk4kRijURbW1gkRo3MklbEt43g=;
 b=sXTGSRNaoELSkyrEjIhUNwFDO9IRBVDv4y7mPec7TxOWkEwOSdiTljRmP9acU5vAtf
 n9xzO0OoIWNVS7OnuQcXg9cVfyIb+Haru6rTYoVALWCKW5v5RrmDMGtSHH581Y4GUoEL
 Az/p7/z3cI77jEnzoaGPc6kVaL9CHF1Gr0Ncq25mRLxl68Dzmqwy4PSr1JB+yXEG8jVO
 WpIFokQboWt4a9XdRIEfSsadCRw4eNnSAE6KRPiT1QqBCfLqZOV36r0WiisdHvdjNkut
 gM+soeFxxwHBGJzwVYpGvaGWbRt6cTtrREfz0fWEEHrSMOkDM6ZNxQIMei9UZJ4Pe00O
 vMvA==
X-Gm-Message-State: AOAM530J9opv0JBiRxjl40Xbp1iryuj6HiYFHt7NfT75Ix5yfROJ/nkv
 QobKplN2XvZtH7TW6yyY9+ff7nW3Zssf6S7YZVl9vBwOgXA=
X-Google-Smtp-Source: ABdhPJz7njZd2vaMPN20MaL5HfLauAdefifx8indoEE9qbs7jFDoqG1iIPLF/BJ6sjZMAVRNssGVEUTUE+E+NW+cvHo=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr4571492lji.326.1622162328960; 
 Thu, 27 May 2021 17:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 02:38:38 +0200
Message-ID: <CACRpkdbZf_cTMppxfC4mM6XZ2YySH7dQ0NCY6v_pfwsdRzLPKA@mail.gmail.com>
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:

> Goes through all the drivers and deletes the default hook since it's
> the default now.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Lechner <david@lechnology.com>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: xen-devel@lists.xenproject.org

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
