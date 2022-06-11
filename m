Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA295477C9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 23:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CD010F0E9;
	Sat, 11 Jun 2022 21:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0A610F0D7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 21:55:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x5so2931491edi.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghSA0tuQ6VU/fN8bZWOyRJMi2B9MX3nLEaeMYI+I+TA=;
 b=NRINHvlp/wCMpRoQYQm8j4hi5AFgFPobmgkp15BfbQcjmPOQ6/vXVNNBqpTd56zSVK
 BoydC9AqHmdYUgo4xPR5ZfyMvhyY6jJ5UEcN8SIhQOdiHdhKOb3ucYtJcjUY6a1bbAbT
 KFBgzvCjo/tvLNq7q/uMXiK9Kmr+whYMPca5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghSA0tuQ6VU/fN8bZWOyRJMi2B9MX3nLEaeMYI+I+TA=;
 b=vc84EZGeQjcEXcTOAHKNWX4qNiRxM/ls3InP396L0eEVFD6wu/l7m85eqj0dxMcBhG
 FZNCm9dWwNPWzN0gK5jvTEaeB6HcE/CG44L5yRBVauCrcGMKUq0Hv2u/T8FfhXCbQmn1
 CfVi0BNuKNoqlNFvk3zrZN0CK+xiu4/fs7Ry2Kz0VmFgeqluQrfa3VDcDvhoT2cYKHDk
 x8jcKxAeHLR/GW+VgVcZe9FBRdrqEG0hKXuT1ESVb5mIw+6bbpAA69Qvvnf528IwyxN8
 gApKAiN54vqnJqjtnZLYNghNFxd5oZlYVCrUVs12w+X0ky6NpH4sF1Pec++IhA/YzsvG
 EL8w==
X-Gm-Message-State: AOAM532FqR/yP5mO3tYV+TB5gEekNonrk3a5OCWshBEgcCeWGSzRY0jX
 EFXX/Wo44yrOap8mdfEx1a7bY/RdL+nVuYuC
X-Google-Smtp-Source: ABdhPJwZvljJuMShdb8FZmVEuEAXbKfkhlCIVF4eoAn9tV+VJEO5E3Kkx4+k+GbOBOdxeZK1qYA7tA==
X-Received: by 2002:a05:6402:2682:b0:42e:1c85:7ddc with SMTP id
 w2-20020a056402268200b0042e1c857ddcmr53731409edd.143.1654984509914; 
 Sat, 11 Jun 2022 14:55:09 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 n2-20020a17090695c200b006fe99b66198sm1545026ejy.60.2022.06.11.14.55.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 14:55:07 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id a15so2758367wrh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:55:07 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr34490637wrt.422.1654984507137; Sat, 11
 Jun 2022 14:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid>
In-Reply-To: <20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 11 Jun 2022 14:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UPcBmCAd005rcARD_CemVwBd80QpDeVddO=Mcggg2Chw@mail.gmail.com>
Message-ID: <CAD=FV=UPcBmCAd005rcARD_CemVwBd80QpDeVddO=Mcggg2Chw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix htmldocs indentation warning w/ DP AUX power
 requirements
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 11, 2022 at 9:55 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Two blank lines are needed to make the rst valid.
>
> Fixes: 69ef4a192bba ("drm: Document the power requirements for DP AUX transfers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  include/drm/display/drm_dp_helper.h | 2 ++
>  1 file changed, 2 insertions(+)

Pushed with Sam's Ack.

7d188c521d9e drm: Fix htmldocs indentation warning w/ DP AUX power requirements

-Doug
