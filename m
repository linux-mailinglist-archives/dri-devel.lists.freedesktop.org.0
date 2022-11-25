Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E746391AB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 23:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BFC10E00B;
	Fri, 25 Nov 2022 22:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652C910E00B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 22:58:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v8so8122673edi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zrh33fKX0AFIpQoDMHBkz3JckH2DUhXrvzHY5NCN5no=;
 b=mQdoKuKnzMEl3ts3gcoDtpsH6y8L7YdGJz9PaUC6jCAz9+M7NZkUnA6V6SqAhznP7Y
 tSFx861pQR1oB+THa/q9XGELxGpmBvcUQmUyvfoFAlMjWclqOJDRddY3FyBqzZQmhMpV
 9pefcrcTsPH40Gman4KI9NLTs6tpUVgF3+lfJMMavgurXtira3YpuBzgwsJINgNYY00x
 1WIvktfNncDKhZXOODC7yW2xvwJBbrpRLNYGcIi5mTstd789NPUD4Y9hgC90cjfFgssJ
 wUTe7DcnjEEwXUvKfzW3MBmGThfDDE04xy3diEaIcefXRqYa7/FREMt7YIEu4h9XvocU
 GEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zrh33fKX0AFIpQoDMHBkz3JckH2DUhXrvzHY5NCN5no=;
 b=aB6ZRiOCKyNkf/jgJrk/EdiXG84gPHICwbipadlhh5u7VPSGhX9Ps4dcdP3Hi2DG9M
 Nlb4hLnfvQfvUwD5j56Y7/YaBnEUJfu9G0otDFn1DVUxudM17OIfChP4M6piCiAYZjUa
 s4DcWtRE5eON4Aok7uEuur5Ba1buAeYbLgpx3JByCJN/pQGqCOw1/8UZEgM8vzFx39Z6
 ci8R70VCNdO2s/MBMfhDQIAQgN1ToKKEYhvDHSPrw4NFR2jnE5FeYnVq1LeEXtiljNiE
 YMGoZ+0PbL/n6Vcwp6FTLz1gkv0/PExAioqRkNumKhgpqUipSgfgLEgalldunY6k8s5o
 e4fQ==
X-Gm-Message-State: ANoB5pk7YlbmIKQuv+S3XGkDuYsHkjzc/DX3502czuhdj+uPEmB1UOWd
 6/GwS3jOcUG1TV1ONUBlb0GLUzJj2uw/NK5/do4=
X-Google-Smtp-Source: AA0mqf4qEx0qk48E7n/igXoN/8ITAy2dKB3urhN+QYQA7vj8vY/aA7c4YoItihhZk+R2xjYeYeLMIUoiVHRlbku+l4c=
X-Received: by 2002:a05:6402:3893:b0:461:b033:90ac with SMTP id
 fd19-20020a056402389300b00461b03390acmr25787621edb.257.1669417132710; Fri, 25
 Nov 2022 14:58:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668602942.git.mazziesaccount@gmail.com>
 <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
In-Reply-To: <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Nov 2022 23:58:41 +0100
Message-ID: <CAFBinCAxL1WapkjHo6B_FNj_r3Y0jZ6P7qmXPjWfGK-ivuT5+w@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/2] gpu: drm: meson: Use
 devm_regulator_*get_enable*()
To: Matti Vaittinen <mazziesaccount@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 2:03 PM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> seemingly unused struct member 'hdmi_supply'.
Personally I'd replace "seemingly" with "now" because hdmi_supply was
used before (although only in this one function, which makes it a bit
pointless).
This is minor enough. So with or without that change this gets my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
