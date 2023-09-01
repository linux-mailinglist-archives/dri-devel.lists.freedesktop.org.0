Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5478FF95
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 17:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57E010E807;
	Fri,  1 Sep 2023 15:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546310E807
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 15:00:57 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-48d05fdb8bfso697182e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693580457; x=1694185257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lnevc20nRmP7PquEdhakfrPorTg+eX5G0icySYl0ICg=;
 b=WpIZtTAPvigTVS3wKTnvxoMmwfXSeIDJFv6BhrsDG/xuvj1Sm2NpAgtIToly5wH6P2
 jxKs4BI3vcwEEa/kp+z2DbE5nSaExKs8Dg5S8fhEOZz0rUPX8ZLs0U41rsz9VzJI7wHh
 tOiRzaXXk8Ya1ZnfLvdg9bcBuEJGiZlZ0IWp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693580457; x=1694185257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lnevc20nRmP7PquEdhakfrPorTg+eX5G0icySYl0ICg=;
 b=ah1a3WksDuabRtcXiId4UgRaa+Z5GsbthRquMN21jSXTCq9LVxvKJAYmnF/zsMAdll
 GJhG/KNVws72xHuHgjLvbg7nSl0iLzwU6M+7R7gNI76gX0LtzxGeiL3uMMrY1YIKJ0vF
 o8BBi0Z03lyjizJfXEIRLGpDcgZYP2QSqTPxul98dQ4iqgCETdpe7JOPZN9xlRCzEGMN
 H5Gp+cd0N+hjIWsFvrzUlOQBrIdSeZRKPRr1W3sLZXVkTKaNouH22OT+D0A+C5Q6tddS
 0AImE4ByhXbG/eZIUQM/RMtkKLHgEjzYnxeybrR7Eb5lkbkTYmdoSJOV2nm72Y8vkA8M
 s9og==
X-Gm-Message-State: AOJu0YwF/lW6swR4u5RkEO2tenObaOTiZMbHMEb7UT55uizvSX5uYDFo
 cxf5NXHi0jEXBj4SAydKW43CpM/1Tnnt06MpY4EeMg==
X-Google-Smtp-Source: AGHT+IG+W/T5TeKymvtATZ1GHNxllQKC01DOQi4Q4SMcnuEycQsU5HjjfQBucfegSU4lOxNjd79MQXGybqZbwL/BL1I=
X-Received: by 2002:a1f:ed81:0:b0:48d:1fcd:9760 with SMTP id
 l123-20020a1fed81000000b0048d1fcd9760mr2743978vkh.10.1693580456779; Fri, 01
 Sep 2023 08:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
 <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
 <7a3257dddac78c46408341253a3286f4@kernel.org>
 <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
 <d6031e00cda9ea1e30bb75b2ca97300f@kernel.org>
In-Reply-To: <d6031e00cda9ea1e30bb75b2ca97300f@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Sep 2023 23:00:45 +0800
Message-ID: <CAGXv+5H_L+Zg66+nTaVGQ=yqcazMtKqG54eURtcjgA=q0VK2Eg@mail.gmail.com>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
To: Michael Walle <mwalle@kernel.org>
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
Cc: chunkuang.hu@kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 amergnat@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 1, 2023 at 6:00=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> Hi,
>
> >> I was just curious if you know of any development for that (or
> >> similar)
> >> in the kernel.
> >
> > This is probably because support for this SoC began with Chromebooks,
> > which have fixed and defined uses for the pipelines. I suspect that
> > what you are working on is much more flexible.
>
> Yes. that is correct.
>
> > The driver should be made to allow dynamic selection of outputs, as
> > is commonly seen with other drivers, but I don't know if that's on
> > anyone's TODO list.
>
> Do you have any pointers where to look at?

There's a series [1] called "Add connector dynamic selection capability".
Not sure if it does what you want though. I haven't looked into it.

ChenYu

[1] https://lore.kernel.org/all/20230809181525.7561-1-jason-jh.lin@mediatek=
.com/
