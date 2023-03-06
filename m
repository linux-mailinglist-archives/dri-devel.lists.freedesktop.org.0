Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F196AD168
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 23:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA4E10E459;
	Mon,  6 Mar 2023 22:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8F10E49B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 22:20:12 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id t39so9765576ybi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 14:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678141211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
 b=WQLXFgm2cskHChBbeJjnWfHzLaVEexVQKOQ4rB9cRG3lQA3qPXuomhUFMa1bPJaV+O
 elX+AVtcktbnW0u6KZFFrMz/uVu6DNtCdgp7AOhijqFyjyBI6havk1pXij2OauQZ92qg
 TP7BYf+epbi5+Fb8EdRlsu8DoxuCo/2SVjKw2HJW8WDIUgzdaxomEvmi9CQMcj+Gtg/u
 AWdSzRJdlgO45NCMRtVrCRZOSi4bGROwqVtYX+0cJKot3gy/M2pkyUPeu9oLPYu3Bo7A
 haB/pNnDt3IxCUNKe7BAbGoTTF32+chnWsq932lhwVWXjK9AljFmPq2wHMNt9iZXwgl3
 6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678141211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
 b=s7o7H3e77x09Yv2Dd/Jmmyqsiv8NlcdIHPQERhCIFTR8kkwrmsML8HA3H+cofUDzxf
 0l0G/bhddXjMTlz5ncxAoFBdzoFAW9pAHngGNbZPPsz6W8/93NUI89Y0VnhxerGN8q9K
 psVUKEC03Om2iBZZk8IL0ileOgxs/TZ1V/wuD3wH9wEs/RU2/6zIGAFDZK6qpt2k9uVQ
 pD51WJae5oCdL70FhY/Zg/l6U/ZDI1TuRQsYV2Ygzj3DYc8XrGqiOVXvnhHAisZR9iCG
 MqssjiDMu78D9XXLfm5LwY5Tw+Fwe7Fj8rr5ly4IFAFF0fp2dT4RC5NPxMhVd/WFWSf4
 xHCQ==
X-Gm-Message-State: AO0yUKWybvG+cp4lt8L7gcOhIF7WW1xlb1hXlIUU7jn0vD+biP+lACC3
 Wxnh0bEicm1gaDmD/3y9zG7FtCBPBr/thw1Y5rDzQQ==
X-Google-Smtp-Source: AK7set+xwxOTuAGUH2F4JBk51moW8y8vFCxjzdcMEe6q9xVEyLeKbxDfeAXuirvD55r2Rwjk4zMOQZkWM/2/groUae8=
X-Received: by 2002:a05:6902:4c2:b0:ab8:1ed9:cfd6 with SMTP id
 v2-20020a05690204c200b00ab81ed9cfd6mr7198831ybs.5.1678141211227; Mon, 06 Mar
 2023 14:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:59 +0100
Message-ID: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 raphael.gallais-pou@foss.st.com, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org,
 andrew@aj.id.au, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Add fbdev emulation that is optimized for DMA helpers, as used by most
> drivers. It operates directly on GEM DMA buffers in system memory.
> Memory pages are mmap'ed directly to userspace. No implicit shadow
> buffers need to be allocated; as can happen with the generic fbdev
> emulation. Convert drivers that fulfil the requirements.
>
> Tested with fbcon and IGT on vc4.
>
> Future direction: providing a dedicated fbdev emulation for GEM DMA
> helpers will allow us to remove this case from the generic fbdev code.
> The latter can then be simplified.

1) I love your work.

2) Why isn't this DRM driver changed?
drivers/gpu/drm/mcde/mcde_drv.c
AFAICT it also uses GEM buffers in system memory.

3) This one:
drivers/gpu/drm/pl111/pl111_drv.c
is also very similar, but can sometimes use a dedicated
RAM memory for allocations using CMA, does that make
it not a candidate?

They aren't much different in how they work from the TVE200.

Yours,
Linus Walleij
