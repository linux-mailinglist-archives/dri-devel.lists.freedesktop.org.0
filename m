Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C26D5C56
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD5E6E0DD;
	Mon, 14 Oct 2019 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E1A6E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:27:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so2477188wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 00:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=U6/vqqI+KFne/Y1dUe/Jfr2lNHLnywOUOorz0nDROSE=;
 b=FsXOfSlwVYJchCA2gczW9STPHu2fs/DCqnitXgDfMcOY9GVTaUvnEk/hZNKiAc3hup
 X+OiaSP2BfLBfVbNK+ND7m3cnMzVR/J/50yh2cfiTNOPngUsqkg7uAZba99He7QxSkGg
 qrNPkzJd4fUe/cC6D1pvjxmrtyl4lWGEzeY4EK7hCb5uYXytuVhTRuI26OLOS+z1mTRs
 ALn3TAck5TjNUVKXBFCvqVHAqn5yyGGPKH2ryjZf6y+mNTxFcKmnrnC18/WwZQ1zGS8O
 Qi/iLlLAAHzIGx3QyXBZbZ7pALhOhDwopT0fd/RUvovkJf6NTAMVQvKXjWjbEi+x0O8a
 GKGQ==
X-Gm-Message-State: APjAAAVQWosj1GW7jY72kMzQSMZbULCbe6BFItXFHvlecKI/o1EdtVLb
 bifqlLS6JQHz6FcextusDD2XLA==
X-Google-Smtp-Source: APXvYqwNx4BWT3sUTOLgHRxO1bczBBeKgEVPdgkFIDoixi5Si9gU2rsgGmIYce/VDvFK7gDzI8aLMw==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr23551615wrc.251.1571038032239; 
 Mon, 14 Oct 2019 00:27:12 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id x2sm21172669wrn.81.2019.10.14.00.27.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 00:27:11 -0700 (PDT)
Date: Mon, 14 Oct 2019 08:27:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 1/4] backlight: pwm_bl: fix cie1913 comments and
 constant
Message-ID: <20191014072710.GE4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-2-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008120327.24208-2-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=U6/vqqI+KFne/Y1dUe/Jfr2lNHLnywOUOorz0nDROSE=;
 b=xfMY0SiR5P3VvexTUHqw+8OwvkSFp1LclUgomGX8ksXD9q+KX3colpmtmOQTdGsSr1
 mLiKIi4t6EbNMkHrkaw6c9HN0uFFJPrEveqy1XNvtv8xxA4a3rmzkcgsc9ArmbsDqi+q
 BVBGVv4Bz102IqKVDtJRIvf445rKWFHWpSvGTw590ibcF0ATNRW1OqFNBbueDBB0fKNW
 WmL9j6X+gmvrsvEh5CzILouSfDc8LlVezqWssmsW32To36UlqbkrTmMdHv3oamJyMUnp
 VJl9ivKm4uvwcw4URs8Tp0jzVZbp8nDo6aTXnyBSyPiY3pl1viQ5mYhAzoaBsKx6fifV
 6peg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOCBPY3QgMjAxOSwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToKCj4gVGhlICJicmVh
ay1ldmVuIiBwb2ludCBmb3IgdGhlIHR3byBmb3JtdWxhcyBpcyBMPT04LCB3aGljaCBpcyBhbHNv
Cj4gd2hhdCB0aGUgY29kZSBhY3R1YWxseSBpbXBsZW1lbnRzLiBbSW5jaWRlbnRhbGx5LCBhdCB0
aGF0IHBvaW50IG9uZQo+IGhhcyBZPTAuMDA4ODU2LCBub3QgMC4wODg1Nl0uCj4gCj4gTW9yZW92
ZXIsIGFsbCB0aGUgc291cmNlcyBJIGNhbiBmaW5kIHNheSB0aGUgbGluZWFyIGZhY3RvciBpcyA5
MDMuMwo+IHJhdGhlciB0aGFuIDkwMi4zLCB3aGljaCBtYWtlcyBzZW5zZSBzaW5jZSB0aGVuIHRo
ZSBmb3JtdWxhcyBhZ3JlZSBhdAo+IEw9PTgsIGJvdGggeWllbGRpbmcgdGhlIDAuMDA4ODU2IGZp
Z3VyZSB0byBmb3VyIHNpZ25pZmljYW50IGRpZ2l0cy4KPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBS
YXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+Cj4gLS0tCj4gIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMTIgKysrKysrKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3Mu
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVh
ZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
