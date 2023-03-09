Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E36B2FB8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEE210E8E5;
	Thu,  9 Mar 2023 21:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA3710E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:38:56 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id ec29so12700399edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 13:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1678397935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQC5hfxWVbHEWl8ZrfP9KMO777ra0RwsEH2B4bfOP3U=;
 b=kjQCLsRXGgyzJBWjk4vVLXzh7JIlbWei6AQr6j1+/0QcBHPeUqwGqZwZXj6EODsd+N
 +wYCB9M/xrVXwYGLVvD3pCmyKMyDavsoJeR4H7yyP1fwM3TKvTcaOsVdx30RksiFj5u7
 ESq3Bnv5Sve2TIexGRVJuhBQOAJ/+DcLCjBJc5XtIT/2Z30r47xnjBbXuzPjTdEokK3H
 wBWaNnlPdC/3J3FPqbkhNsF0y2Bb2ktZ24R0oJyF98RTZNKuyuu3DAX/k5LlC8bfQD56
 2l+vMTmvAbQVKdwEuJ2qhYkuYTMzVgS5YpBdlldhfm/YfVZI8jgPRjEdcxAfP6zl7DU/
 8cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678397935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQC5hfxWVbHEWl8ZrfP9KMO777ra0RwsEH2B4bfOP3U=;
 b=OKw8RNXmOJS1xH/tLgtBJ9CHiRJ423efG6kwFoFdKLYi0kIIxGWhXNlvJCFPCj7mIh
 D12R+bXi45qUVtn64K+LOzBOIiyJou3zwLf9uv3VFmnKl3O3lUWS5BrFH/ZoS8Lx7VZr
 BqmN8dkGiXDXTs1p/5GhDmgGnfh8ZwGs0k1XlXfjPBrvbGv1r/RlMDv8QLQGrPQcH2Hn
 ZCYfMfKwCyoWzkwKERF6R5ZKG1kvUL5uxyjeZUT3CWAcREAnz5BWsFBSwj6CxVW6jhKR
 7SCNMCvsrHbdjHH4bbXkm4MtFzNv/FYeIHZkU29dEOFPGnwdliXaVFi9wnLlD4wLH69J
 vYhw==
X-Gm-Message-State: AO0yUKWy/nO4bZEnY8BcxZwTZ+U/HV+CC6Qsy7+bmV+xojYXds/r0oz9
 rNCjYCJuC8gAFyTQTpvdb1HvNg1IP9MZJ2xemII=
X-Google-Smtp-Source: AK7set/2FGl4AxcL636YWKlVcDAS8iU/ZLVUhpEENhPuAiGKHfPH1cbKN1phpXLfYBUYSPukogm9WWUPjHtZ1VIHffQ=
X-Received: by 2002:a17:906:b48:b0:8b1:3cdf:29cd with SMTP id
 v8-20020a1709060b4800b008b13cdf29cdmr11938018ejg.6.1678397934737; Thu, 09 Mar
 2023 13:38:54 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
 <20230309152446.104913-1-m.szyprowski@samsung.com>
In-Reply-To: <20230309152446.104913-1-m.szyprowski@samsung.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Mar 2023 22:38:43 +0100
Message-ID: <CAFBinCAiTWhh7hOdE-FgOO_neXfQirkNNcVp8VTh_v4dm=2riA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 9, 2023 at 4:24=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> devm_regulator_get_enable_optional() returns -ENODEV if requested
> optional regulator is not present. Adjust code for that, because in the
> 67d0a30128c9 I've incorrectly assumed that it also returns 0 when
> regulator is not present.
>
> Reported-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> Fixes: 67d0a30128c9 ("drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*=
() conversion")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
