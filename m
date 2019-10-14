Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8AD5C5A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36826E102;
	Mon, 14 Oct 2019 07:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D1B6E102
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:27:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j11so18379309wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 00:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TWp5GZfXAuJiSjhN3OBoDFjXnsSknmpXMaB8oSLy2/g=;
 b=twv9KgLXg6xidBf6OL83VHHnozmvwMHYDEc5BHQlU5FWPtjC+YHBIT2iB4W0DgIat0
 J1oHYQenIf9A1I2ArUwc+jpmnU+Ylet0Bno/a3dWpO48pol6/FgdBzSXpCsMAzhNaAC2
 owUA00QYbkR3JMkxVwJcEj4iHSa10XOpNVDNYVJeDmykIfwgpu8iBT7GTBlZztzMUR16
 J9YvHCA7zTn6+oSLeoUGnPtFzxlM12IhGvEd8mbkUXyCHUySX4biC2+uHv7PkTdqiLQ/
 BSKnDSOMT0JwD14MmCdx4sXUMgEZObRwtiuY+1BWiH9iRiG+vEzYemsWsOq2rP8hkPf1
 KSqw==
X-Gm-Message-State: APjAAAUwlIzXGARPt7kONNqI3XRSqzJpOvvqv35HcyJzcK0kN7ugQpVT
 vEoq4ZS3nNuSPzJFyrkO/G7DZA==
X-Google-Smtp-Source: APXvYqySNhmt9GNRmDIkVlWJrnjisv4DE3+x++TMdbO6SLMmNeMmkEEhShnSGMTeiIYd/7/Hcsc+JA==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr11305190wrj.268.1571038047490; 
 Mon, 14 Oct 2019 00:27:27 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id e3sm16653686wme.39.2019.10.14.00.27.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 00:27:26 -0700 (PDT)
Date: Mon, 14 Oct 2019 08:27:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 2/4] backlight: pwm_bl: eliminate a 64/32 division
Message-ID: <20191014072725.GF4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-3-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008120327.24208-3-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=TWp5GZfXAuJiSjhN3OBoDFjXnsSknmpXMaB8oSLy2/g=;
 b=djTw1yvqaE4roQjMnJd2pe7/Kqo55OxZfnKi7PrNRYJCR3cP8VIuQ+Ac9RIOVFyZFp
 y8DgO8aeG3E0jLWMJirbmkXHnp+22ZU5W1/4Sle4LVjo00mv6/tkZp48vg8MI5G9bIk0
 TCoQCvmiECFLPfeKKhGJp28J0iY48QU45qXb4pB/QNZPE6U9DnhZfKU6CxHO6JjKO3rl
 JU/dDVqgr4+2HcxH+cdizMhUCpJDhKygiK7bLOk4voo6GA//n/Ao9fvlWyra5pv/itdG
 zhv6DyuGCQs0uuzCLvO64pnitnLClO7bcHr2MJBC6baxfXkXaLZ0LOS2hBpoz1e103jy
 EHZQ==
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

T24gVHVlLCAwOCBPY3QgMjAxOSwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToKCj4gbGlnaHRuZXNz
KjEwMDAgaXMgbm93aGVyZSBuZWFyIG92ZXJmbG93aW5nIDMyIGJpdHMsIHNvIHdlIGNhbiBqdXN0
IHVzZQo+IGFuIG9yZGluYXJ5IDMyLzMyIGRpdmlzaW9uLCB3aGljaCBpcyBtdWNoIGNoZWFwZXIg
dGhhbiB0aGUgNjQvMzIgZG9uZQo+IHZpYSBkb19kaXYoKS4KPiAKPiBSZXZpZXdlZC1ieTogRGFu
aWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+Cj4gLS0tCj4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
