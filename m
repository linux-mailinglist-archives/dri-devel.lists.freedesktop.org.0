Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11070CAA6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC8710E265;
	Mon, 22 May 2023 20:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8124B10E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:16:13 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d2981e3abso3568551b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786573; x=1687378573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bBzsEFEBaOoamjuMu6tkFnCdq33AsZWodYlngR5umYI=;
 b=NQpIylAo879lZg+bIGPMAEf7DDZr1HUjRDRjXgFFzOZAqJismdNG2vT6fvEGnxixbE
 AO59fHineVN3ZV8SGUip2kK2YNl7yCMhINlOucn3D9rFDYquHDJDjZqxyorrI6Aa1PG3
 dgDmEFNb5d5Gy4SPsHORvJXWSanJ+OBQLiiBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786573; x=1687378573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBzsEFEBaOoamjuMu6tkFnCdq33AsZWodYlngR5umYI=;
 b=caYkKgszG1LaU4eK/m31TVg1YOErfTGCRN9GIt6GP0m73sM+yj0cEpCxgWdlv7bHgo
 M4rLHiJLVLHHIk+A3tUpepKj3+aReOCgI/vAFVoM2reUWuRfgRgqa5/6Rl7ODFfe2EcZ
 mCew9bJOd3DcJA2M1UKRdD1MLNFvdN/5RIIfQtHucdE5PJbrHVUpPRwEcKmGqDkq2XRv
 nXY1WC/6D3CzDH7z/mmEiMnyrRwGv5avzxl+Mse9+gq+VNv8RTdWW0uLF74UN2ugquf1
 tv3XlzVlHmMNJA6QaKAXb8Yo8emG7rJowfusFTw2uNTr514IlspJUd39tmoeWhKC7hs7
 KwcQ==
X-Gm-Message-State: AC+VfDyA0x7uRdrAN4oWhjOORIJOwcwudPPQ7mfNMeLbicEHMFZt/Qku
 EwAAJvdV4u0yyRrQIpoJ+u8lYw==
X-Google-Smtp-Source: ACHHUZ5ATfKSsDeoySmt4TpoCC/s6QT9JMih/7kH5QlewrwQzwJyKfURuuEBVyEFMexNU1NyLHmTzg==
X-Received: by 2002:a05:6a00:a20:b0:64a:4bfa:6b8d with SMTP id
 p32-20020a056a000a2000b0064a4bfa6b8dmr16642693pfh.6.1684786572799; 
 Mon, 22 May 2023 13:16:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 d26-20020aa7869a000000b00640ddad2e0dsm4512884pfo.47.2023.05.22.13.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:16:12 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221316.5C8770098@keescook>
References: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:53:06PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
