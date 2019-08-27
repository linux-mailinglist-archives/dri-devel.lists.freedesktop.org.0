Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD99F31F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 21:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C689B61;
	Tue, 27 Aug 2019 19:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B689B61
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 19:17:53 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id m9so19693pls.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 12:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vJzw3QpMeKUQN9mhk1L8KwSYlM1O8J0WfSacmAROoZs=;
 b=rjPLMwgPfOaqdgOdPnK2KUb8k01vD9JMPi7nOoSQUuWAyWZMb7ZI6xfNA2AvSymLPW
 jUKbWtK+DPozdMv3oK7gRbjX6Oa3rnZhvoIvqui3/aFSvSN8gGNOdqg0acMP34NUTuvU
 PnXLx5d9EFN9iUqWxQjnTFmLF2Bkmzhgr2muIBcsJGiTqpt5Znrjie6IDci2GK2YYEiN
 TPpWnM/qQFtT6xZ80wpy2WrGuCqw5BsKe5LGg/3MwuwDp0jV5W1NgLp9nDr7AfWgxXmL
 EYuHy+HEKoHqOwmUaywS1ks7aDiNEx2tqPowPxGhwKG2z8mePCLW49Cjsjazb682tpDo
 Hu3g==
X-Gm-Message-State: APjAAAWepWcr0UNVpdQIEKI+AVF5CoYk+rGbEdjKUmdUkwBEeUOsiRs8
 pZfkCJds1Az4/DDjrh/uo3mlvQ==
X-Google-Smtp-Source: APXvYqweKeR+O1L8NUQ1dGQZwjj/kGMRlK298lUWAQfX/o+FgU8fpeeMRjkf/+I6PLTs1JLB3DAJow==
X-Received: by 2002:a17:902:8488:: with SMTP id
 c8mr440778plo.164.1566933473391; 
 Tue, 27 Aug 2019 12:17:53 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id z16sm65758pfr.136.2019.08.27.12.17.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 12:17:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/meson: add resume/suspend hooks
In-Reply-To: <20190827095825.21015-1-narmstrong@baylibre.com>
References: <20190827095825.21015-1-narmstrong@baylibre.com>
Date: Tue, 27 Aug 2019 12:17:52 -0700
Message-ID: <7h5zmixvrz.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=vJzw3QpMeKUQN9mhk1L8KwSYlM1O8J0WfSacmAROoZs=;
 b=l6uFNGI6x957C+EC5/aW9Yx7fg8JZ+lcCqjjsTH+8k7iItlRBiXO8ZTf9SNIpupFkC
 oSuNmg7PFn/ebDs8M8g+KOaI04jIfrTDroOVpzIItWImSWSf1eHhACbRgzRsaNUONRsh
 rplv2ndYyVe5diOf99PXG0oxUEzZRkYGLNFmLv4iahEuBPwYYdWAqzVdNsmtakNIxeqB
 a/NrJiL8vYCBFeFXW2y2TzpuH0JTd+0iRIqS20qyq6GuCiSuN3vt5+20VU5OZMuLjE27
 CDDG6b9OsVLL8Tk6E10FTyg9ncG/KR2ZmGwP9VZN1jPOiZ1aVMcfT3q5LkACVukAJZks
 YqGg==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
c2VyaWUgYWRkcyB0aGUgcmVzdW1lL3N1c3BlbmQgaG9va3MgaW4gdGhlIEFtbG9naWMgTWVzb24g
VlBVIG1haW4gZHJpdmVyCj4gYW5kIHRoZSBEVy1IRE1JIEdsdWUgZHJpdmVyIHRvIGNvcnJlY3Rs
eSBzYXZlIHN0YXRlIGFuZCBkaXNhYmxlIEhXIGJlZm9yZQo+IHN1c3BlbmQsIGFuZCBzdWNjZXNm
dWxseSByZS1pbml0IHRoZSBIVyB0byByZWNvdmVyIGZ1bmN0aW9ubmFsIGRpc3BsYXkKPiBhZnRl
ciByZXN1bWUuCj4KPiBUaGlzIHNlcmllIGhhcyBiZWVuIHRlc3RlZCBvbiBBbWxvZ2ljIEcxMkEg
YmFzZWQgU0VJNTEwIGJvYXJkLCB1c2luZwo+IHRoZSBuZXdseSBhY2NlcHRlZCBWUlRDIGRyaXZl
ciBhbmQgdGhlIHJ0Y3dha2UgdXRpbGl0eS4KClRlc3RlZC1ieTogS2V2aW4gSGlsbWFuIDxraGls
bWFuQGJheWxpYnJlLmNvbT4KClRlc3RlZCBvbiBteSBHMTJBIFNFSTUxMCBib2FyZCwgYW5kIEkg
dmVyaWZpZWQgdGhhdCBpdCBmaXhlcwpzdXNwZW5kL3Jlc3VtZSBpc3N1ZXMgcHJldmlvdXNseSBz
ZWVuLgoKS2V2aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
