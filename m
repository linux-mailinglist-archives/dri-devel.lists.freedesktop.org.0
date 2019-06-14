Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0C453DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 07:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E747892FE;
	Fri, 14 Jun 2019 05:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC0D892FE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:13:57 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id m30so667539pff.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 22:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7L7uajw4KCsbL/S4E35UjNUKEFnxH/l2jD/CiFHPlB4=;
 b=XViSkXDqf72MeNpC5pmBor0l6J32vOT9nsGweHHij42xJpRww/cLX6o5boJxPI8wZz
 BwpG4h3R63oG1EKYu2oxvpGZWNRmTCYDqHtHD9/2AkVo/sej/9lOa8tWBpmKMh/rk+x2
 m9YUzD584pPCZcDN1AoJY/J7h2TWeGNdHZuMEnsYy+hHYNPA5NHiEwvOj8OZMx7g6M7a
 ZR5aKAJ08mlA1U8hBDJ4F2rZgjwrbMpa41aFSmCXDWJxetd07Xsjz5H4WBjorisqBmCj
 sidwzphqIG8x8S1cW53239SqTkyKHnerZEMbcGoxlLpyxNMN3vTp5GS5CUXsvuegZsww
 sTqA==
X-Gm-Message-State: APjAAAWxGujcnPmU8gsRUmTrT1O6+pHQyeJiGCBosgJSGdMC35oqLAdt
 yvRfBS8gSefqBatVa2YAOSnaVA==
X-Google-Smtp-Source: APXvYqzTfasIXQ0R9bH+BHnjS/rxhZOCyiy3olY/JYV+P2HTQ7p4rEZDPtcIb7Np5EQm4YDFboUW8Q==
X-Received: by 2002:a63:6948:: with SMTP id e69mr23166361pgc.441.1560489236782; 
 Thu, 13 Jun 2019 22:13:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f13sm1417022pje.11.2019.06.13.22.13.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 22:13:55 -0700 (PDT)
Date: Thu, 13 Jun 2019 22:13:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <201906132209.FC65A3C771@keescook>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613110235.GW28398@e103592.cambridge.arm.com>
 <20190613152632.GT28951@C02TF0J2HF1T.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613152632.GT28951@C02TF0J2HF1T.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7L7uajw4KCsbL/S4E35UjNUKEFnxH/l2jD/CiFHPlB4=;
 b=iVgLfh3u2rK3LSidDHhJBtdtNtpSlz4dIEb1BDsj4Re2fjkTLPAq5VHIrDbtF7rfc6
 5a9vwqPeA/oCez/a3NCM+60PRvHQV0ltptm4u18TbaZDEEEiYlVGWcXj0ugZtZMkqFnM
 ltnmFCb7F68lK6w+sv8Frqic/ZXdf9np/Ivm0=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDQ6MjY6MzJQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDEyOjAyOjM1UE0gKzAxMDAsIERhdmUg
UCBNYXJ0aW4gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMTo0MzoyMFBNICsw
MjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiArc3RhdGljIGludCB6ZXJvOwo+ID4g
PiArc3RhdGljIGludCBvbmUgPSAxOwo+ID4gCj4gPiAhISEKPiA+IAo+ID4gQW5kIHRoZXNlIGNh
bid0IGV2ZW4gYmUgY29uc3Qgd2l0aG91dCBhIGNhc3QuICBZdWsuCj4gPiAKPiA+IChOb3QgeW91
ciBmYXVsdCB0aG91Z2gsIGJ1dCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBwcm9jX2RvYm9v
bCgpIHRvCj4gPiBhdm9pZCB0aGlzLikKPiAKPiBJIGhhZCB0aGUgc2FtZSByZWFjdGlvbi4gTWF5
YmUgZm9yIGFub3RoZXIgcGF0Y2ggc2FuaXRpc2luZyB0aGlzIHBhdHRlcm4KPiBhY3Jvc3MgdGhl
IGtlcm5lbC4KClRoYXQncyBhY3R1YWxseSBhbHJlYWR5IGhhcHBlbmluZyAodmlhIC1tbSB0cmVl
IGxhc3QgSSBsb29rZWQpLiB0bDtkcjoKaXQgZW5kcyB1cCB1c2luZyBhIGNhc3QgaGlkZGVuIGlu
IGEgbWFjcm8uIEl0J3MgaW4gbGludXgtbmV4dCBhbHJlYWR5CmFsb25nIHdpdGggYSBjaGVja3Bh
dGNoLnBsIGFkZGl0aW9uIHRvIHllbGwgYWJvdXQgZG9pbmcgd2hhdCdzIGJlaW5nCmRvbmUgaGVy
ZS4gOykKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA0MzAxODAxMTEuMTA2ODgt
MS1tY3JvY2VAcmVkaGF0LmNvbS8jcgoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
