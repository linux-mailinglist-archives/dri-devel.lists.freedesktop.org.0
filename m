Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A18121B97
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 22:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4407F6E8A8;
	Mon, 16 Dec 2019 21:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A356E8A8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 21:14:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d20so8341380ljc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVU2QVc8cullB3PW1a2bN+Nno6c4lqAlkAVvljHtjfU=;
 b=LPKOU/QMk5SxHjfr2dHQL6fMsZksjmG/nS+UQ8yyfcciov84en0pO+PczBe5HiSV2a
 pAx5IwlnuQ/uc2nYtfDWdhzvsmqli4YyekYR+EN2f9VPJYLCU/XeatX5RRTWShWDlOXY
 NsamuMfgn4sLGMeU4ct9v8UpzIbDBVFCEBBIa4+q5Gk0prJsBhMzutCAZEXMuT5BcbDY
 +nq+7KMHAcWH586E41ZY5IHJTmwaIJebOF4npfIejcvphkhMdW9p7QO5O+mtEzEg9T6G
 jhHE+jdPiofOecKrBVvctxWNT08r6qXqrPYMbvbpYt124CgYPtYKU7KvGqSQSPoV3StI
 1vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVU2QVc8cullB3PW1a2bN+Nno6c4lqAlkAVvljHtjfU=;
 b=rkBjhUdH7+xzxRFe5KWdnFgjoeKl3xE3hV6WcHGbC/sdZ70P/gNUkjn8hcp4Vuw5nF
 jEpDUNcSgNdHN2qUky7XDTgPa83A+yTXSkIf1U0jJnWSGwVQUkrvl3YmCVMZhDq5G8VU
 ++fKsN1+8CBCR0OYdZXnRminN3kH/EXu/Tmy4TlBaOsgPxfT4JiGB9O451HWi9vMpdY1
 LDkROCdgOId3COBewdtBJt5h7BQBZato3TFOdUuf9wPXK7ispiZ35c4u3sc+Hz4NF+Uy
 jEQP0QKuqfO9GCV59WchFqrT9+iU3PMzf7I+iIhNSiRN0z0gw1Iq1czgIqhmY7hUjVQT
 cNog==
X-Gm-Message-State: APjAAAXGqSn8DHT6Ykn6m4hVCGyf0wGcUUQe+Z7o2w9Dhn7s6cXawqM5
 Jq5MLFJrQXkDwRPNeyaIXnbzR9W9xaPsXzr/GwLAGQ==
X-Google-Smtp-Source: APXvYqxq2pt3rp1m5FiZ9cPdnCmaTiiQGBTNnIVat0Mbyut/kVo8lxMGBBfseRhqdc4BP2977wafF8CCqTehXy5Gio0=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr797657ljm.218.1576530862685; 
 Mon, 16 Dec 2019 13:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20191210224857.28661-1-linus.walleij@linaro.org>
 <20191216175535.GA173588@gerhold.net>
In-Reply-To: <20191216175535.GA173588@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 22:14:10 +0100
Message-ID: <CACRpkdZ+u=S=8_oLEg4+gHkOR05QrhorABJfoQ_bQjaFLw_4Mw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mcde: Some fixes to handling video mode
To: Stephan Gerhold <stephan@gerhold.net>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephan,

I fixed up the patch according to your comments, this remains:

On Mon, Dec 16, 2019 at 6:55 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> In general I was wondering if we could benefit from using something like
> the regmap_update_bits() helper to avoid having to write this manually
> all the time. However, this does not have anything to do with this patch
> - just an idea that could be discussed separately.

Yeah I can take a stab at simply converting the whole thing to
regmap-mmio, I thinkt it'd be pretty quick and we can see how
it looks. Maybe easier to debug as well.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
