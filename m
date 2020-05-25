Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB9C1E0E45
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEF689C0A;
	Mon, 25 May 2020 12:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0C289C0A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:20:36 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c12so10400304lfc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2uL/BTgbcmhuM5YoKw/xsIFunhmdvIl/vJd/r4JhQGI=;
 b=s27kr2eqyPVVUBlXSvFGIQr/trFb1G9zTpaZkf+2EZG3Hx2n20tojKndnRmHxnFm5B
 ASp5qUZUcNhgDtSz05MKDEc0AhNM7RX+XqKC4RcH+dueKzNuzdA9UUtfJm3QObywiyNn
 gLyUfwWbN87noM3TipQ1xxzLT/qC8suP8C2ItO0uKVBLZF7gkDhYZYdyWaPhGsZlURx5
 dC7jiymi5TrHLn3WrjWoWbTG/vN0K0XXq9T9jya4WAVmkhAW4KU3DPDDLxbaJk+51A8y
 NPUY8Y3/kWXC5iqcAEtXLI21yhLyJybrVzQtHPxoRDO5FDHaT8xNMF10qM6k/sr2ih0m
 THuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uL/BTgbcmhuM5YoKw/xsIFunhmdvIl/vJd/r4JhQGI=;
 b=pFus6J/+8/RwQVwVK+SQZy5UI83frPY4NtqaTS+Kp6hEMOsmgCd0lG806WKZLpUfuL
 8pVBatY+ZQmjxgiz7lifftK++9CS06sPs/4nDGqVpjK3uv/aEi8E7ExalEtaxWf2KXs/
 +Qw0vohX63UMMPWDSO92xL1WwTFRMG63Bd21Wp7k2dUz6qdNVJck1X1MOR3Q2nuVJxbA
 XXGX6t+VG4IwvmX4YLB0Z8tIr/ghH7gqzoEGR8QFfXtsyLt/uFvHM/QLAjIAkRaAfCIc
 4CIxtgYEXdHzvByKDgUun9FK7IzbFfzYTDQoQMe9hBwe7xl+ekkw6JxtbCRVTI6oso+J
 gUqg==
X-Gm-Message-State: AOAM531BJ04HlsLQvuKgCKZHfauziFZfpN3ne6Kh1PAY98UBpIRtwFRU
 II4rA7HUCtIPFt/9nJ/Qa0IZ3Wr882V974mhAItpsg==
X-Google-Smtp-Source: ABdhPJzzn4cmibq9OV9VwB1X2PlikxB9SvAFGTTF5EB8YLtQ3tUTqPOcsUIpd9PFnnM7N1+NhdQzLiY+0rFB4yQUkHM=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr14251823lfn.21.1590409234803; 
 Mon, 25 May 2020 05:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-5-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1590378348-8115-5-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 14:20:23 +0200
Message-ID: <CACRpkdb=+T0jSzBkrViHnuXGNhD4F3d_VX1t-hkqMG0CSdDhnQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To: dillon min <dillon.minfei@gmail.com>
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
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 5:46 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
