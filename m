Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6872653E50F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385E810E2DC;
	Mon,  6 Jun 2022 14:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB4310E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:28:46 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o10so19070122edi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yGL0Upz9tWnkdyE7J91J4gh0jAtGzDIxVVzukBDULoo=;
 b=CMRHt1AN30bDkUOr86s0m7NX4v6Nb+f9O1f35JrMFYxJW+BntmP8QkDNPVhjPtLBAY
 +XZXVhMMoo3pRxxgqF6QmA5eND0Uhc4PnRQFCZGdnwOLTPB4jgL6mvWNPsslH/pJ8IAP
 3HOTuodUa88+MXtlY2t8w6gtk1sibf3wiJKvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yGL0Upz9tWnkdyE7J91J4gh0jAtGzDIxVVzukBDULoo=;
 b=HoL6AQ7n20w62+KG8F0X7Qsgq8twAwRtuakqf0CrVu/xvVxex8qQJispgdiOTPiunF
 XDbIYSbN7xRpcHCPV91Ck1ViWfzF78c3SLzcKxrTu4ILaIhuTPt9B9hEsLRy14OX1Pr8
 PgWnWK/y2J/KjHZiWiMJTG3F1SA23c6UYKiPYX3C0pWVjteMxZG6ozrXBcPOzhi6vMPE
 i3ztk9W9JTTW+xZD0TeFOch9IlTiEXHMJO3KH5fHqmD+rGIa7AAcNtS5FLeZ84jf5Eyh
 fhN2We1u9QfrjCkQjR8Z6HyBAccPPxfP2aLWp+ZbuUzCd8dvp6qJbla3uIgSmv7N8mMY
 bwwA==
X-Gm-Message-State: AOAM532HZ3+I0dlPOSLQkoO7kw/vgEP426u45uqezGDI9u8KBY8cpi3r
 hD8e7rZSsGCBomBg0wYm29JujNgpxZLMv5LRaYo=
X-Google-Smtp-Source: ABdhPJxWGW15lqNx9j4TwYe+3vdMHDNprX9JESLf0k4q65V8XTNQRFK0u9ATTaGwWVK20nhwhJZ0bw==
X-Received: by 2002:a05:6402:c08:b0:42d:d005:13c1 with SMTP id
 co8-20020a0564020c0800b0042dd00513c1mr26964798edb.187.1654525724612; 
 Mon, 06 Jun 2022 07:28:44 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 wj17-20020a170907051100b006fed9a0eb17sm6364480ejb.187.2022.06.06.07.28.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:28:44 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id x62so19062074ede.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:28:43 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr5831997wrt.422.1654525373078; Mon, 06
 Jun 2022 07:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-6-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-6-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:22:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeF=fM9dVSgdNNP8_mOWZXZyoSwF-tztSXe1=dLb5KzA@mail.gmail.com>
Message-ID: <CAD=FV=WeF=fM9dVSgdNNP8_mOWZXZyoSwF-tztSXe1=dLb5KzA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
