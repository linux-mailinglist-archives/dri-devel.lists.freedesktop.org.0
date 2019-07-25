Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C374A4F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 11:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA71E6E6B4;
	Thu, 25 Jul 2019 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B336E6B4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 09:49:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g17so50057925wrr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 02:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ujml4/mJ0MyIJxWWY8Xw5VZRsjX7zZKg2q4taAzvM/c=;
 b=gcQM/udaWmldFBgCKDi12erVeUh1aDPG0lnJ1BfXpaIpe88Z7DnwKh55AwjXTl9EDK
 +X49pF5bx/K1GfHHfDqiU6w/4+nPiOM10pD8WgOLpfeCcf30yiVRxU4OcCVJansXsLB7
 9npQjfx9La9SzUIyrW1Zer3LjKc+j1uivErhas9dQcXSOAQUMxLuf+ojuL/7bgr4+LjI
 Txrm+ZAiriHYNGzZAUhncjQ4xWBlf8XwxBDVFrZ9Rhu3EAv4bpbawvVOmvNtAY7eveBZ
 yCMnJsPIa6l6HkYr5em3Jx9CYiEPHHnAopupZs9zaBDl3VEPZenb8yicr1tcFSIezeWx
 /Uug==
X-Gm-Message-State: APjAAAXHe2zsimvnxE+vL/P8GP5B1u6AzBqgAdMmRuaZ/FeqfwSgV8ND
 r1Fcuu8X6f03Yh5T+hSbjeCVkQ==
X-Google-Smtp-Source: APXvYqxwv81BIV5RMSww0ZNPDfXsKTb2cQCw57D4xuzbghZTfN7520eIoXJkR8KoKO7DJIthWIGKpg==
X-Received: by 2002:adf:deca:: with SMTP id i10mr82173869wrn.313.1564048173775; 
 Thu, 25 Jul 2019 02:49:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a81sm49660430wmh.3.2019.07.25.02.49.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 02:49:32 -0700 (PDT)
Date: Thu, 25 Jul 2019 10:49:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] backlight: lms283gf05: Fix a typo in the description
 passed to 'devm_gpio_request_one()'
Message-ID: <20190725094931.biqd3pkt4kuaujaq@holly.lan>
References: <20190724213828.16916-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724213828.16916-1-christophe.jaillet@wanadoo.fr>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ujml4/mJ0MyIJxWWY8Xw5VZRsjX7zZKg2q4taAzvM/c=;
 b=VuNqE/NY+xkhpIiYamvpZsvoQFiBCE3wxC7mksjIRfdbeMGmFna25bkqhkjb44XsAy
 TqccR8asVu2KTiszeyVdgNj08Zfgh2V5+G7z7LP/zmKwZ2VJue3RWqbjHyviRERyGx2P
 FmjKBbI29vUi4HuccBNNNZ+OLEr3AOJCEJwn8Q7c8JGXrLEI06dEpLRWqu4TLEAKfz69
 W8f8EhmQFptIkojB+aRSgULsjceeR4OJfHeqzAIsOsh0DqFTHwBTk87WpWeeNLMOb7gt
 xXnNp3sfzEE3BXmfaHS45Y/HGg6mgJc7t3quha3SG1JNKhLs6kSY3pQRNFx+hVk03bmX
 W7GA==
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lee.jones@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTE6Mzg6MjhQTSArMDIwMCwgQ2hyaXN0b3BoZSBKQUlM
TEVUIHdyb3RlOgo+IFRoZSBkZXNjcmlwdGlvbiBwYXNzZWQgdG8gJ2Rldm1fZ3Bpb19yZXF1ZXN0
X29uZSgpJyBzaG91bGQgYmUgcmVsYXRlZCB0bwo+IExNUzI4M0dGMDUsIG5vdCBMTVMyODVHRjA1
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWls
bGV0QHdhbmFkb28uZnI+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczI4
M2dmMDUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczI4M2dm
MDUuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczI4M2dmMDUuYwo+IGluZGV4IDQyMzdh
YWE3ZjI2OS4uNGI2MmVkN2U1OGMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2xtczI4M2dmMDUuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczI4M2dm
MDUuYwo+IEBAIC0xNjEsNyArMTYxLDcgQEAgc3RhdGljIGludCBsbXMyODNnZjA1X3Byb2JlKHN0
cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4gIAkJcmV0ID0gZGV2bV9ncGlvX3JlcXVlc3Rfb25lKCZz
cGktPmRldiwgcGRhdGEtPnJlc2V0X2dwaW8sCj4gIAkJCQlHUElPRl9ESVJfT1VUIHwgKCFwZGF0
YS0+cmVzZXRfaW52ZXJ0ZWQgPwo+ICAJCQkJR1BJT0ZfSU5JVF9ISUdIIDogR1BJT0ZfSU5JVF9M
T1cpLAo+IC0JCQkJIkxNUzI4NUdGMDUgUkVTRVQiKTsKPiArCQkJCSJMTVMyODNHRjA1IFJFU0VU
Iik7Cj4gIAkJaWYgKHJldCkKPiAgCQkJcmV0dXJuIHJldDsKPiAgCX0KPiAtLSAKPiAyLjIwLjEK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
