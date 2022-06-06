Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7053E507
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F7711B52D;
	Mon,  6 Jun 2022 14:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45E611B52B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:21:57 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u12so29289764eja.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vp8NNxHI8Mr5cvDebnpWHQ0r8fITxP4wMBgbky8hlKs=;
 b=cbfuFGvG9P3RoNLs/7komKcZAI5iYlhxO2c1PtY35nnPC3+G7B+1hWFJWkoS4PJIsj
 12l7R0+8en8jn64ramruBDLAM4LNDxwV5QlXnXU3GiVqV+E3Gtvm4iPw/S9vicOs+MKd
 veBzx9Qi7+Ff2iaPYmy4Uf1JlMPTfqESgCUDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vp8NNxHI8Mr5cvDebnpWHQ0r8fITxP4wMBgbky8hlKs=;
 b=oqs2pRhpt4QUcm4F2176t146f8lN7uN9Z+UJLkIAxQ/XEbLQzeWy6Csf4zxcAnC41T
 mfDhHs55lMueCswUToCMkkM254oRqo4VU912R40f9zDtiaRvmn75fsJlxzRyhZcsPk00
 9l5Z5dxMzFVAeCzZz6aTPjFiC6z/Mag0oTTl6FSzbyHyic/CuugnLnAJ9JImB9bYHkZs
 U6MfrEk7u6eHZg5HSPBC/lOapsvhsQEMmDtPwQHuZ22HeostuIfCKQIdZH2Gj5oR1DXw
 Jrn2Pq1TSlwktaAZsgbAP7hxRI6GHWTWGR6m46wOiHjB+weUvouBvp1EjRdrWlAhyIgz
 tXpg==
X-Gm-Message-State: AOAM532jmJiPt6llTA/ozHvGtQ8gnBZnAKwHymXJ+mCbiPUuHesoZG6b
 Y/i98GVzPrEfNruYoYS2gBPrKdKi/2bKOa5h
X-Google-Smtp-Source: ABdhPJz6BkAQVvO8QyvpUESWK2NQydakcKVuoThmAqj5NpBvO404MmmX7NZ7smaCDrHXSPTcaodD8g==
X-Received: by 2002:a17:907:6090:b0:6fa:14ca:fba8 with SMTP id
 ht16-20020a170907609000b006fa14cafba8mr21942037ejc.212.1654525316487; 
 Mon, 06 Jun 2022 07:21:56 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 l9-20020a50cbc9000000b0042ab87ea713sm3336941edi.22.2022.06.06.07.21.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:21:56 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id p10so20073315wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:21:54 -0700 (PDT)
X-Received: by 2002:a05:6000:1685:b0:218:45f0:5be6 with SMTP id
 y5-20020a056000168500b0021845f05be6mr2525253wrd.301.1654525314159; Mon, 06
 Jun 2022 07:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-3-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:21:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYjMKN=M=PWnGny0x5TaQ5gF7b_vL4muCsCi+rH7FAbA@mail.gmail.com>
Message-ID: <CAD=FV=VYjMKN=M=PWnGny0x5TaQ5gF7b_vL4muCsCi+rH7FAbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] drm/panel: boe-tv101wum-nl6: Implement
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
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
