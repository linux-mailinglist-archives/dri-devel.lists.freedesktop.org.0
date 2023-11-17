Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2C7EFA70
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E275F10E797;
	Fri, 17 Nov 2023 21:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271C10E795
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:23:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-548696eac92so262061a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700256191; x=1700860991;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFBqw6WWFn2DTJJAm5oTscYcujSFx4g4cXCp4v+z0IA=;
 b=JGKgdEEj2OycnilQ0J2D17+MrnJNnHkTJcmPbCLHS49610w8pfJXSuxGiQSvo3pbcP
 Uy+9aqPqYOoFZR51VTfQ/I70CDYONuuyTW9n6u2LNQg8A1+f4Eal5Pz2c2Tusa4yMbVf
 pqD9DAMZOhyqdM6jQczIZNnQd3BvybPprPd0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700256191; x=1700860991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFBqw6WWFn2DTJJAm5oTscYcujSFx4g4cXCp4v+z0IA=;
 b=NbfXEBDFA8VpHDHdsnAqZJX85cAOI3ccdWEMJkR4syd9V/o5gycSY4SMGbGXigW//G
 EC3wZU5jG0GqynbyVJFpYVMHj/697Is/R+TVYwhz5ABCOhfVTWyhSdurt5XfYxLS2Urr
 XJshGEOpAtfGTBP4E1CiSnxSHB7b/QVUn7CjYR/vzbyQxCfEW+UO9tcr80aCGJoimHE4
 MoAVX9a9s1YgBkuxd6mDXHTGECv2UXPCT0QmBwgLi02F5JQaP5ja7tvN7t+8czxFalgB
 yfNx9bYSRdhlTKrboNP9QzeeaPJ4tBCRlldJH+HkafsgUiBMH8b6xaOOgk9W5/QqYSd6
 dhmw==
X-Gm-Message-State: AOJu0Ywm/Dl28gkZJ3W8DMb0opotnGqK4Wy2FRRpplO3ttjJhZUTBzv/
 2yKcq+Pq2O4xLSyyoSqTQGrnT9n/DEs08Vas301zjA==
X-Google-Smtp-Source: AGHT+IEXHiMQ/prHeMAJBu6nb9AhDSwVzr46g6vLqoA9ZDbaBsqUkbfq/vljDkKt+ChcXR64AFxYLA==
X-Received: by 2002:a17:906:29d0:b0:9e6:26d4:120f with SMTP id
 y16-20020a17090629d000b009e626d4120fmr158624eje.74.1700256191135; 
 Fri, 17 Nov 2023 13:23:11 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 d24-20020a1709064c5800b009dbe08bc793sm1202950ejw.18.2023.11.17.13.23.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 13:23:10 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso18535e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:23:09 -0800 (PST)
X-Received: by 2002:a1c:7504:0:b0:404:74f8:f47c with SMTP id
 o4-20020a1c7504000000b0040474f8f47cmr50225wmc.5.1700256189626; Fri, 17 Nov
 2023 13:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20231114044205.613421-1-xuxinxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20231114044205.613421-1-xuxinxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Nov 2023 13:22:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vg5YouEYVSnv3XJ-ghjZoLa9-QG6Ksh4yg5hExN_9gWA@mail.gmail.com>
Message-ID: <CAD=FV=Vg5YouEYVSnv3XJ-ghjZoLa9-QG6Ksh4yg5hExN_9gWA@mail.gmail.com>
Subject: Re: [V3] drm/panel: auo,
 b101uan08.3: Fine tune the panel power sequence
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 13, 2023 at 8:42=E2=80=AFPM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> For "auo,b101uan08.3" this panel, it is stipulated in the panel spec that
> MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high=
.
>
> Fixes: 56ad624b4cb5 ("drm/panel: support for auo, b101uan08.3 wuxga dsi v=
ideo mode panel")
> Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> ---
> Changes in V3:
>   - Updated the Fixes tag's style.
> link to V2: https://patchwork.kernel.org/project/dri-devel/patch/20231114=
034505.288569-1-xuxinxiong@huaqin.corp-partner.google.com/
> ---
> Changes in V2:
>   - Updated the commit message and added the Fixes tag.
> link to V1: https://patchwork.kernel.org/project/dri-devel/patch/20231109=
092634.1694066-1-xuxinxiong@huaqin.corp-partner.google.com/
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
>  1 file changed, 1 insertion(+)

In my response to v1 [1] I said you could have just added my
Reviewed-by tag yourself after the problems were fixed. Some
maintainers actually get a bit annoyed when you don't do this, so you
should get in the habit of doing it.

In any case, this looks fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-fixes with my tag:
6965809e5269 drm/panel: auo,b101uan08.3: Fine tune the panel power sequence



[1] https://lore.kernel.org/r/CAD=3DFV=3DVxQJFWFaGHD+zpr4dxB85jMQpJiTDAmFZk=
67CTYNcg=3Dw@mail.gmail.com/
