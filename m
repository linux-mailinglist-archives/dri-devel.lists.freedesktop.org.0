Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F1A677037
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 16:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8918110E18D;
	Sun, 22 Jan 2023 15:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3810E18D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 15:37:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFD4AB80AF5
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 15:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC1FC433A1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674401819;
 bh=RtN6VM53/AyRL0T6lTHmeEBHv7Z+IjaXe/djZ6ectng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D1qkKG4kb8gHNmXGAgMJ0NKzf1Jrt9kuF7IvFG41zjxEB07D6uK7E6qvHoEf3yAez
 DL5zQsO9NNfp22miYOfawlS1pdkD1yU7+9Wdh+nZUNtDJdIIR5CP2WhwZNwoS09juN
 mbrNTpp6kuhhwzXy3v4Z0Qys2YuVcojAZOdEwnUKmrk2Q7VKdpx+scIO7HbKT9bG2R
 vi39XHLEPJY2xSPVyUQ+AzrUE6+ZA47tJArOW0tEg3jR5R9FpqPFmP86v3tC54ScCW
 9Z7TUau7l5XMjxwyo1J+uTLvhCTQFsAPXGXJe9KkKUXGwu6Le9eZs1H3c6GvuBphSf
 LX1519gywNuIQ==
Received: by mail-ua1-f45.google.com with SMTP id j1so2333705uan.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 07:36:58 -0800 (PST)
X-Gm-Message-State: AFqh2kpDw0CvPtW7KgCZ2TwdfJGjYM4ladH4joSOiN2qaCFoZSEAFOA8
 XLbqfEl3h5cxS+gs9FmeVlb2MnbbbcMohgA+mA==
X-Google-Smtp-Source: AMrXdXtaJGGPuSDntjhTa9IstN9+kYwGqE/HL9t8ofms18yBJ45Rqak284KVOWnfaIo98tIhMeiIZzEB2j+M3JIs2KM=
X-Received: by 2002:ab0:1512:0:b0:5fc:a2ef:4b70 with SMTP id
 o18-20020ab01512000000b005fca2ef4b70mr2269079uae.36.1674401817944; Sun, 22
 Jan 2023 07:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
In-Reply-To: <20230121153544.467126-3-rayyan@ansari.sh>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 22 Jan 2023 09:36:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
Message-ID: <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
To: Rayyan Ansari <rayyan@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
>

Why do you need this change?

The 'simple-framebuffer' contains data on how the bootloader
configured the display. The bootloader doesn't configure the display
size, so this information doesn't belong here. The information should
already be in the panel node, so also no point in duplicating it here.

> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>  1 file changed, 8 insertions(+)
