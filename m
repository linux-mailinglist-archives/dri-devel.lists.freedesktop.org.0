Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92653E509
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9635F11B588;
	Mon,  6 Jun 2022 14:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11B11B546
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:22:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id er5so19030562edb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYyKGEeq3UcMlhiJRIzst7R0qW1WAne+X1OnepWLUYE=;
 b=SFL7T5uifrBNLjB2DlOQ76k2CWD4lYFfvi+Cpg2JoGdLGFnhB7NYaEk4VeIgQjMih4
 dWD6g0rOGkVYh08vQvggGJY2yZvlDGzOf+oz68gB+AJ6zFrx06LXKkzALLHoXBKljZOe
 I9/PsfKKDUm55hO4bPdYQWfKmR4oBwin7fnuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYyKGEeq3UcMlhiJRIzst7R0qW1WAne+X1OnepWLUYE=;
 b=oYDhe5TxKdCLjVGH/fPqRTokt6cZzFThhlhgBx5yx1kQC7zITkYD3PTmQ22lXcJ+CM
 emOMSEvni183EbyGdM+XAP3ZcPzRHTnv7OqFo0nP4C1cqztnSiSEr/+upbsr/6DWA9TP
 DIlCRpRP/WNP585lIkZbZS458Xl7lhSQ/5So3Pz3hrbTou8/KwelOwTZfUG5bBdp04n9
 uziNZg5Ux4hWR51YNcWBqabLVsQv1f3praldpjZBSKiOgiStrXngsWM0Uko4flHLQBSX
 vbXrgBbvh3947aE9ouOksDEH18y4J+/QbYOmSYVhl/81fqZbyUcdtAIypPU8VJyQ+mtd
 sc8w==
X-Gm-Message-State: AOAM532EU8pvcCquPS0PZuPH1toMVYcuIwy+tTWw2U80z40ibBXzsKP3
 lbwaDuXVsCZGIZPFYTTkVjDsIqP2QG9zRtsB
X-Google-Smtp-Source: ABdhPJxGIpPUlD5JbvN3aZl1hI2Bes3bjb0ycUrmvmn590XxCyNBmmMluLaZSFj3dwjtJGQLUal+ng==
X-Received: by 2002:aa7:c396:0:b0:42d:8b86:a8dc with SMTP id
 k22-20020aa7c396000000b0042d8b86a8dcmr26765829edq.54.1654525335199; 
 Mon, 06 Jun 2022 07:22:15 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 f24-20020a05640214d800b0042617ba63basm8676902edx.68.2022.06.06.07.22.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:22:12 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id x17so20086398wrg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:22:10 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr21413566wrw.679.1654525330160; Mon, 06
 Jun 2022 07:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-4-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:21:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNnWcvedzgxfSWT0-sTR3jF8LsVXKFRnm49ZCJw6EH6A@mail.gmail.com>
Message-ID: <CAD=FV=VNnWcvedzgxfSWT0-sTR3jF8LsVXKFRnm49ZCJw6EH6A@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
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
>  drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
