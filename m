Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947D51EFE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 01:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB4089EA9;
	Mon, 24 Jun 2019 23:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C469689EA9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:15:32 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bi6so7723249plb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2IMAKyHpnPJ1yDvedXi3maHRvnqNVDYJ2coEjzpqvcg=;
 b=dXJSU1tBUkZSF32XP2sbkgCULGj05C6wMPk0wv3RO8phKVM3C+wFLjgBlCJaYNExs5
 8IEue5xy05Voa8/dfw9p8NlRbRSJ+qfTnuYQlCKft5bNKPuVrxeW/7EK9itL9rSJiCU5
 eSHLVecZ4nEnbAp4L0reWnQECeqKQUIJkptNuF+ALMLCx7ZNbOB2K8vCRMfXYyndhOYZ
 clRzcqIW8F9AE9koQWdMzCDDrl+8mNZVoBxfUP2f7RmbhWTo6KdS2PC4oCXaM7usrWoM
 pKqGSnITN8rRPdXpsJY7wQYGn9IjetWt/cBst2PGhk9WH96C6DJpEmQ7+DNW2NIzoFEx
 yfRg==
X-Gm-Message-State: APjAAAXRumA/OQDufK7u6BCXxEhllIML5AevjdabbKtC+9xIRFvj9nrl
 hseMObcuiewy0x+uzxuJ8L892A==
X-Google-Smtp-Source: APXvYqwROTeApbbRvj7XZr2xOey7lePNY05i1p2vtda9bu6wK0pvM2dbxuFwX8hcBJqIgVsFRVqElQ==
X-Received: by 2002:a17:902:42d:: with SMTP id
 42mr144122426ple.228.1561418132182; 
 Mon, 24 Jun 2019 16:15:32 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:559b:6f10:667f:4354])
 by smtp.googlemail.com with ESMTPSA id v9sm16566583pgj.69.2019.06.24.16.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 16:15:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: 86zhm782g5.fsf@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/9] drm: meson: vpp: use proper macros instead of magic
 constants
In-Reply-To: <86tvcf82eu.fsf@baylibre.com>
References: <86zhm782g5.fsf@baylibre.com> <86tvcf82eu.fsf@baylibre.com>
Date: Mon, 24 Jun 2019 16:15:28 -0700
Message-ID: <7h36jyy3qn.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=2IMAKyHpnPJ1yDvedXi3maHRvnqNVDYJ2coEjzpqvcg=;
 b=fNoiNIAlRLn2QPb90BjGH37+vFNKA/mLAyGEzncUaIUNKlz7FLzTUan3SXPxa1rNq8
 7saw0x1+SkHrlvHHaLtCzAuR7AUl5tVeWeM7dauo2/iU1K+AVzbwctFJ5zSEeVx94FuT
 7MMlmAJrW3AOOmVZ7ElmnT16ufcPs1Zow5dWLjMaqdWX+cWwAom1Wk+c0lBAehDJdbr2
 unMFbvikaH6zQO3eS25IrkX5zlnygUySo3Ybd8VG/p9wqDGJZ0CibWSLbx/Bn46+GRrn
 C9SbdikcTznE1mRjY+HDMes2guFt2BWypwoXZuPoBwsmUusAWHuddfXUtfS0d8dJlRFd
 Hhqg==
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVsaWVuIE1hc3NvbiA8am1hc3NvbkBiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gVGhpcyBwYXRj
aCBhZGQgbmV3IG1hY3JvcyB3aGljaCBhcmUgdXNlZCB0byBzZXQgdGhlIGZvbGxvd2luZwo+IHJl
Z2lzdGVyczoKPiAtIFZQUF9PU0RfU0NBTEVfQ09FRl9JRFgKPiAtIFZQUF9ET0xCWV9DVFJMCj4g
LSBWUFBfT0ZJRk9fU0laRQo+IC0gVlBQX0hPTERfTElORVMKPiAtIFZQUF9TQ19NSVNDCj4gLSBW
UFBfVkFESl9DVFJMCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gTWFzc29uIDxqbWFzc29uQGJh
eWxpYnJlLmNvbT4KClsuLi5dCgo+IEBAIC05NywyMCArOTcsMjIgQEAgdm9pZCBtZXNvbl92cHBf
aW5pdChzdHJ1Y3QgbWVzb25fZHJtICpwcml2KQo+ICAJZWxzZSBpZiAobWVzb25fdnB1X2lzX2Nv
bXBhdGlibGUocHJpdiwgImFtbG9naWMsbWVzb24tZ3htLXZwdSIpKSB7Cj4gIAkJd3JpdGVsX2Jp
dHNfcmVsYXhlZCgweGZmIDw8IDE2LCAweGZmIDw8IDE2LAo+ICAJCQkJICAgIHByaXYtPmlvX2Jh
c2UgKyBfUkVHKFZJVV9NSVNDX0NUUkwxKSk7Cj4gLQkJd3JpdGVsX3JlbGF4ZWQoMHgyMDAwMCwg
cHJpdi0+aW9fYmFzZSArIF9SRUcoVlBQX0RPTEJZX0NUUkwpKTsKPiAtCQl3cml0ZWxfcmVsYXhl
ZCgweDEwMjAwODAsCj4gKwkJd3JpdGVsX3JlbGF4ZWQoVlBQX1BQU19EVU1NWV9EQVRBX01PREUs
Cj4gKwkJCSAgICAgICBwcml2LT5pb19iYXNlICsgX1JFRyhWUFBfRE9MQllfQ1RSTCkpOwo+ICsJ
CXdyaXRlbF9yZWxheGVkKDB4MTA4MDgwLAoKbml0OiBzdGlsbCBhIG1hZ2ljIGNvbnN0YW50IGhl
cmUsIGFuZCBpdCdzIG5vdCBvYnZpb3VzIHdoeSBpdCdzCmRpZmZlcmVudCBmcm9tIHRoZSBjdXJy
ZW50IG9uZS4KCktldmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
