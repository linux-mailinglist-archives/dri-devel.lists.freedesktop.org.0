Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BD760B0F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B2910E398;
	Tue, 25 Jul 2023 07:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C312810E398
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:00:33 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-783549ef058so274680839f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690268433; x=1690873233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/wCFrYPEzzO/MfkHD0RMinAwo+j9ojz+4k/clTmCNQ=;
 b=ZBuFVmXEW7YkilPPnIblq0+A7eWY3z1OQruHbkBTfKNgzf56kCT+iLBXME3UfsAYI2
 GW9H8is3mSFagrerjjr+5JHrvfQlG4W8KurrdrhppSV0K7Z8PFC8qvNtpnCo61KgAGGf
 ktiJAALe9loUtdKo2hd56Bf80GNjnik4dJkis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690268433; x=1690873233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/wCFrYPEzzO/MfkHD0RMinAwo+j9ojz+4k/clTmCNQ=;
 b=PDVK4cn6nz8NZgZ9irTyJk44DvrCY/SnjSUcpubcbhhLJ6rGfZnWs9XUkK3LadVXMo
 4w805GgxMjmRwwmQ8n13Ndw+48lPgu6q/gTDZQAWOPQaMPVxLc+ezF0Uh/dl3Ip5thE+
 ztkThIGkeIM60D5oUxZvrhvz80B3opmqx5Vdzyk7mpN5vrlGc/6XH7JQPJOrDxDCsMd4
 PmRGs4cW8Gd9ImsgxjiuR++V+vBiz1LKwHhO1XjC5pNG1+iRbxNW5syk4YjfeyMNhquy
 4r1GMgXWcPlBkiERqKdAVApSu0shtEjkevcA95v639x1f9bFy4yhhz67GShzeDu0GPoK
 MiYw==
X-Gm-Message-State: ABy/qLbsFG6EFhz6nBrKrn4y4YCJ5isecSzGxdzDpaVk2UFv3jDZn2PT
 SGfu0o+MDnUYFmeRI4jsaZdVoN6mlAv/w0Eglgw=
X-Google-Smtp-Source: APBJJlFs4yCMq8MtbXkm9dw0PbuYE2u/Ln9/3ZIViKSIWEU1iv/3jAH6J21x3MgUZY0+/J/vQ2PvGg==
X-Received: by 2002:a05:6e02:11b4:b0:345:6ce1:d259 with SMTP id
 20-20020a056e0211b400b003456ce1d259mr2021952ilj.28.1690268432710; 
 Tue, 25 Jul 2023 00:00:32 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41]) by smtp.gmail.com with ESMTPSA id
 b3-20020a920b03000000b00342093347d8sm3509980ilf.76.2023.07.25.00.00.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 00:00:32 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-78363cc070aso275017639f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 00:00:32 -0700 (PDT)
X-Received: by 2002:a6b:7e06:0:b0:783:6190:f913 with SMTP id
 i6-20020a6b7e06000000b007836190f913mr2051985iom.4.1690268431885; Tue, 25 Jul
 2023 00:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 25 Jul 2023 14:59:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1nju8_KWG0v=JNh+v9LVBuEVDnnW5JCfbcySBLGEJAMvxg@mail.gmail.com>
Message-ID: <CAC=S1nju8_KWG0v=JNh+v9LVBuEVDnnW5JCfbcySBLGEJAMvxg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Justin Green <greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 1:59=E2=80=AFAM Justin Green <greenjustin@chromium.=
org> wrote:
>
> Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> is not the AFBC mode supported by MT8195's display overlays.
>
> Tested by booting ChromeOS and verifying the UI works, and by running
> the ChromeOS kms_addfb_basic binary, which has a test called
> "addfb25-bad-modifier" that attempts to create a framebuffer with the
> modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> EINVAL.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Tested-by: Fei Shao <fshao@chromium.org>

Tested the UI and with the aforementioned binary on a MT8195
Chromebook (AFBC supported) and a MT8188 Chromebook (AFBC not
supported at this moment).
