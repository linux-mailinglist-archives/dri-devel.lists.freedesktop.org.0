Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF4546DB3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA3510E18D;
	Fri, 10 Jun 2022 19:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63F310E18D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 19:55:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v25so255949eda.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=un+lSY3X7YxGwu/r7FDzIT1K5N2rDGm8eR6DAEKLWI8=;
 b=DTlJwrChV2ZxnBi9qNxUeHN+3nWNEObwhsUb7nrqwBjXjLYiSjfFg+U9eGFcvcYlzq
 oNTo53JdL8b6SdBk9IPuQtHKcfbJ/6qqgYGbbFIBL6pirvKXwQnjv5ecGP93pZul8GOV
 obKLA5Vj2oTreta7PXAzkR5F854ZpZ34W/nLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=un+lSY3X7YxGwu/r7FDzIT1K5N2rDGm8eR6DAEKLWI8=;
 b=4SDR9rtzYlLZLl25M4OE5B+vXXSOgra1EXw75lbqTOtjDEwBLRfn7NI2h91NPOMzP8
 o6k3yys+le8ikut/ie6VYXpvhnZ6bIwR16CX61qZnn8/Lq5rf/aO3WB1R1T79mjzJPh+
 vYv2zEYOgOaGlF7o4+1rZn/2RyuOIfK0Q2gyPhrmBthoFWxfKif2w8ekmBb0j4yctKSj
 UnRXnL9K0nqMR45hII4kl0Tp6SZ9MM7FHJgdhJhb67BhD8pgRNyjlB45Fxj9F50ZPb3A
 vmey7yyN74EGcRrLqMJfWCx/KFDOJBdm/cPUtm5dwCFcSrvRC3QPY2C9QSufdtfEdLqT
 5tBQ==
X-Gm-Message-State: AOAM533cpRmfBIFZ2iVFKJ+qa1StDsQZhlvWTnNoHv4WovatkEEc9eJc
 PkS8WmEYEiEdLek4xmzBj8Zi4ciRCPX0PO1z
X-Google-Smtp-Source: ABdhPJzwtXlT1n8s55hV9DhLDr6nMA1ctyeH3+jyCrxb+Vi6SA3gsOvtHBY0v5GQverla0AmQRwq2Q==
X-Received: by 2002:a05:6402:2710:b0:42e:28c9:fa7 with SMTP id
 y16-20020a056402271000b0042e28c90fa7mr47583977edd.2.1654890946847; 
 Fri, 10 Jun 2022 12:55:46 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 de46-20020a1709069bee00b0070f6855b90bsm10161839ejc.170.2022.06.10.12.55.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 12:55:46 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id u8so33485675wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:55:45 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr44505394wrw.679.1654890945353; Fri, 10
 Jun 2022 12:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220609072722.3488207-1-hsinyi@chromium.org>
 <20220609072722.3488207-9-hsinyi@chromium.org>
In-Reply-To: <20220609072722.3488207-9-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Jun 2022 12:55:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+9+a2EdkpvEneUfcCS=nr34+aGa_ZjvhidF_vfSiLzg@mail.gmail.com>
Message-ID: <CAD=FV=X+9+a2EdkpvEneUfcCS=nr34+aGa_ZjvhidF_vfSiLzg@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] drm: Config orientation property if panel provides
 it
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 9, 2022 at 12:28 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panel orientation property should be set before drm_dev_register().
> Some drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
>
> In drm_bridge_connector_init(), if a bridge is a panel bridge, use it to
> set the connector's panel orientation property.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v6->v7: remove redundant check and fix config issue.
> ---
>  drivers/gpu/drm/bridge/panel.c         | 34 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_bridge_connector.c |  8 +++++-
>  include/drm/drm_bridge.h               | 14 +++++++++++
>  3 files changed, 55 insertions(+), 1 deletion(-)

Reviewed-by: Doug Anderson <dianders@chromium.org>
