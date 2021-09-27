Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C722419694
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 16:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93E889FC3;
	Mon, 27 Sep 2021 14:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EC389FBC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 14:42:40 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id b78so17765713iof.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qvtZBZ+cLSMTupAyX2ZKGNNGtfrOCy1D4m7ug1Iv9X0=;
 b=FoMhf7fbYbBHrVsX94BuI5a4xIeWR401smJ1jgv4AMdBDP7eETvTkECdzoAIfy84gR
 uEtEaHGmIkJ50ww2IBTfO31HvsgASAV5T9/IBhedUO+md2ElfKEb1ht1YMOyJs+b+O6z
 nw44azCCLeZ8Xsm5V4J0cx4XySUVHvNNX+zPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qvtZBZ+cLSMTupAyX2ZKGNNGtfrOCy1D4m7ug1Iv9X0=;
 b=PxklZ1cdOQIhwozaOw6wyr3iAlMGr2bzdZXr6/bIaBwMBzeyafcUMNy5+9hwrW+hoB
 pIo5IHasA3foOlGdVALd6YQbn6dDf2sVr25w2kJwNte+sqkLZUjMi0fro1L9R8+4/XO6
 xrMt354QFsImz4n4tIkYO8RA3P+n0Emlw33QWQu5HWKfA2vB0v0gDZV4LiPKH2EOFZzk
 RP4JaX1IGr8CCuLZX/YX5JWFrgb3+OaR21+llDTN4MSjgSQuxy39b974Q5DSr/sjJxdk
 P+ypk4fIjLrxbWmxUvrQePqOpebIxKv07BOX8/jWeBvPKQ6NsCo64T75BnVFrsoeSAbY
 vpZA==
X-Gm-Message-State: AOAM532YuS0JlJccSCm36jPEeio742fNaL0ukiQZWTFS3hAaP1YG+YEx
 FJbfis9yUrd5PpDAcmwPK2gOaFFQJ5IGUQ==
X-Google-Smtp-Source: ABdhPJwDYDIALnWxrhbe8S3xpTp02Gfi+To9hjZ7uXC5pylaW+1HGfMdCOZ9azhWa6glfQ+1Hjs9gg==
X-Received: by 2002:a5d:9492:: with SMTP id v18mr73882ioj.158.1632753759760;
 Mon, 27 Sep 2021 07:42:39 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id k6sm3818480ilh.55.2021.09.27.07.42.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:42:39 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id n71so23174027iod.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 07:42:39 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr81319iog.98.1632753758718;
 Mon, 27 Sep 2021 07:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210927154422.605920fd@canb.auug.org.au>
In-Reply-To: <20210927154422.605920fd@canb.auug.org.au>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Sep 2021 07:42:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VrkmTDA-zLFW=1f1RAAVB_P=kJDQtAx+tng6+ZkhkCSA@mail.gmail.com>
Message-ID: <CAD=FV=VrkmTDA-zLFW=1f1RAAVB_P=kJDQtAx+tng6+ZkhkCSA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Sep 26, 2021 at 10:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> include/drm/drm_edid.h:530: warning: Function parameter or member 'vend_chr_1' not described in 'drm_edid_encode_panel_id'
> include/drm/drm_edid.h:530: warning: Excess function parameter 'vend_chr_3' description in 'drm_edid_encode_panel_id'
>
>
> Introduced by commit
>
>   7d1be0a09fa6 ("drm/edid: Fix EDID quirk compile error on older compilers")

Thanks for the report! Fix posted.

https://lore.kernel.org/r/20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid
