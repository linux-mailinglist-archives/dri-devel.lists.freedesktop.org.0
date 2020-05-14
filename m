Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4A1D29DE
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 10:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EFE6E2E9;
	Thu, 14 May 2020 08:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0E66E2E9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:21:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g4so2539498ljl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
 b=pL+XB6xDy0cGnanxPxZeCoXI+0/bH/MJrC9FZHLbSFeABMiSHzmaFy/I+vlbadTqdg
 moVU55iWLxpm1nnhHrCGKzA2uK7DqkWVrHrypLWkQ77O98C65VIQg4eWTACmBhqQAvbe
 pHSqklAJtsA1BGN8aJrEPgAzkjuaIRy0vNfWRPOiZ0Gx9pkVb9qjr26pYd9MiqLjtOJr
 54QU9Kl6XwBPNiecFaQ5Q2UN0C0xobJnHAsuUb9l4eWMcWJxS8krPxWVDver5JV680GH
 IzpZdlsYOHiSkmT8GBGTZ0VfuqV8Pk7Uv4HSe7NIk0lkUADLNFPO/dZ01aPB2TJo4RoU
 he7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
 b=EabyBSP3LGf7wzOKhFp09vidhxV+7G6PPNLjn1vYDHAl9I2nL+HhF64eu71Xynm7EM
 YirnhWeNCiJJ6ZmS84VbIipsgGvQqdo0GXaUdiJZybF1tb4To0xFzBFhNtScqOqeTwiQ
 +A1mk7tAJ6dLCoTYsEBHNsRKZ3ZYG8WV6x/xM3Zah9Il20/JyUZbs5XEQBka7rtRVvb1
 n73SYz7+w3ckReAuN8veEHrD+kgBeGwZrzRGVr9pDxORWVHTUMI5uWC9AfebG4VzEvpQ
 MSdHiuh4k67AxiwP+keTyiKh3WmbxcONJJnYthTXRUzqvntb3JJRW34WXEQFiCuCQ5L3
 ZTyw==
X-Gm-Message-State: AOAM531Zf5hkQBkJ4rE+v8SRDwC/mVcmRsz0w/e6wykENpTaafht1qlS
 rOL/Y+I8+VUA+CwJc8CBJA0+ADlXrMuaXEUBsRkjjg==
X-Google-Smtp-Source: ABdhPJyRERMIh+MQZPItj7QatuGXtUx06mgJ88uloHfqTCykxSiONeYCm+tNHIHuv9MC+hs2Hr0mPlFfLP8XGnr3zRA=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr1125043ljb.168.1589444480845; 
 Thu, 14 May 2020 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 May 2020 10:21:09 +0200
Message-ID: <CACRpkdZUyRh0KZzRxsdfFU_L-F=Ns0j1d3eR-ermhx2Gb0Zrgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To: dillon.minfei@gmail.com
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 9:03 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
