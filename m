Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E228F52E117
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 02:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A9C10E3FA;
	Fri, 20 May 2022 00:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAF410E3FB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 00:20:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id wh22so12637408ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2SsP49FcCChtmjGtwbSaTMmlIgf4FKqMdxkNXcLZxo=;
 b=HXRvwBSe1kdLw+E5XZQUg1aqD+Xzx1EPDD38vER8o23tEByEWKBd7UsuCsmlQjS2IA
 UrFRDsWb1JfLL64GhKqULVkddtRl8NXbTC9LPYW7SISZVG8H9KSTco/tZyI1GcTczIEC
 gnDMhQk9vYaGXJfrN3vT+O6EmsVeRrRGlccwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2SsP49FcCChtmjGtwbSaTMmlIgf4FKqMdxkNXcLZxo=;
 b=rKQIo3eukZIHAOb0MB8yDGLNaHWzy6QTCexkiwaS7MZqd9qvVSm4PT7wx+vYFDS6we
 00IDQN4lqjTjma7WCVK7fPTedCe4WD9MReERi/++twQ413NSnH7CJk/Iauiml7CLQcG7
 sxZmWPY3Cp5tyu7IJmO/ht2zyH7SSCZTRy3sErU17Ht196MVzlKiLkf9Zfw6UrJd5RCg
 6ZPYcwKpRlaQkShf8F/otV3u7a1Usr1/MPBpRXXbnB9x9tJsH5jeFEfR5L+SRcNEoxlB
 RhIM6ZUs4ALo04bLcrQXxo4QxH3+1Vb6mCiPOFJ+gJGhPuhyEkKXfXDkdif/XVX490H+
 PE/w==
X-Gm-Message-State: AOAM530PPd6TjwIjsxzaNchTQFy8LUVNLzBtXu9fOkBsTGydKHn80McI
 3duAnSu6NRiWTUfSBZAyjC3N2glXVkl2cufGeAI=
X-Google-Smtp-Source: ABdhPJyqcIpn6QJQT5KjrINV2u/ClpFvtGlc/3/m6J8u4YRgli0/S3wV4VmhSXwyXVgzOnqRSG6GOQ==
X-Received: by 2002:a17:906:58d0:b0:6fe:ae38:1aca with SMTP id
 e16-20020a17090658d000b006feae381acamr486927ejs.109.1653006046250; 
 Thu, 19 May 2022 17:20:46 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 p25-20020aa7c4d9000000b004278942f86asm3507978edr.7.2022.05.19.17.20.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 17:20:45 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id t6so9387387wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 17:20:44 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr5985688wrq.513.1653006043655; Thu, 19
 May 2022 17:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
In-Reply-To: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 May 2022 17:20:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Und7oTNBf8+=d9_RMQyv1v0vzh6OSGpvvPTYWtGF07MA@mail.gmail.com>
Message-ID: <CAD=FV=Und7oTNBf8+=d9_RMQyv1v0vzh6OSGpvvPTYWtGF07MA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
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
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 3:58 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The drm_helper_probe_single_connector_modes() is a bit long. Let's
> break a chunk off to update and validate modes. This helps avoid one
> goto and also will allow us to more easily call the helper a second
> time in a future patch without adding looping or another goto.
>
> This change is intended to be a no-op change--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>
> Changes in v3:
> - Removed WARN_ON
>
> Changes in v2:
> - Two underscores for __drm_helper_update_and_validate().
> - Return err and use WARN_ON instead of returning a bool.
>
>  drivers/gpu/drm/drm_probe_helper.c | 106 ++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 46 deletions(-)

Pushed to drm-misc-next:

4a2a13a57b60 drm/probe-helper: Add helper for
drm_helper_probe_single_connector_modes()
