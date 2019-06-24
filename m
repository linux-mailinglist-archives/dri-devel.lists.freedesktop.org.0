Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7750F7E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADFD89C1C;
	Mon, 24 Jun 2019 15:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9961189C29
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:02:21 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g4so7022110plb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GtAdqPjW6ZZZnXrgGtz9dHnmmTnu4keB507Xrm18218=;
 b=BREVW5G9wmhoynucHtvtigp/S+O24fJwIEF/SmikJRvdFjsaiWugJP3UHdL7sdC1xL
 LZME0O3eKWcL5XnIrx6HWHwPAiHRfer5l1BnPOIkRIsbCx9tI9ATQkXV8aPjYlO2v2eM
 d778fbpfsV/E4qC9e8wW891/2KqB8XcgjbAQWUJTeB+m6RtDXhmEgNhTxn/CtRsVUx5y
 cnkVoelDIGcrUY307mfiFofZagNbqqoUAIGnU+Ey/pniD6IGIngLi92o8+yB8ickDpCg
 m4u0OjDWeiGOYxD9x8Bvnma83y6INswqd0Srbn/yT8jAfazXHQfFxTBLV6+lMcd8qzz+
 hQtg==
X-Gm-Message-State: APjAAAWjAY7lFQcjNuaaK612PwmPrJB/SjZOKU0XvTXjgzKOgMLxKlzS
 RabcgM3Am5FAVyvhoLi7Hz4vxw==
X-Google-Smtp-Source: APXvYqw9zabTal+i8jDaBfZR0QmoB7d+QTrClEOLwXBQMsgoLsFLEgEQhYNwi/8CLPRMNc9iVSjF6A==
X-Received: by 2002:a17:902:7687:: with SMTP id
 m7mr67127539pll.310.1561388541281; 
 Mon, 24 Jun 2019 08:02:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e189sm5063967pfh.50.2019.06.24.08.02.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 08:02:20 -0700 (PDT)
Date: Mon, 24 Jun 2019 08:02:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <201906240802.29EB80F@keescook>
References: <cover.1561386715.git.andreyknvl@google.com>
 <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GtAdqPjW6ZZZnXrgGtz9dHnmmTnu4keB507Xrm18218=;
 b=ChnBbYYcZq0gQP/sJ3UOuMWBE4sFOJb179x3KxiYoIf9mz01hnbxknC2HoJWZ+GnKo
 I/gVcZavG+bqjHfCSPjI903PM2pF2P+rKnbbNQBP7YiqUkuVedhF+Zt+0nrsisSgO62h
 w1puy7E9AYi+Gooou5JDhG3yaU4cjhKpyOEpU=
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzM6MDBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIGEgc2ltcGxlIHRlc3QsIHRo
YXQgY2FsbHMgdGhlIHVuYW1lIHN5c2NhbGwgd2l0aCBhCj4gdGFnZ2VkIHVzZXIgcG9pbnRlciBh
cyBhbiBhcmd1bWVudC4gV2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKPiB1c2Vy
IHBvaW50ZXJzIHRoZSB0ZXN0IGZhaWxzIHdpdGggRUZBVUxULgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KCkFja2VkLWJ5OiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KCi1LZWVzCgo+IC0tLQo+ICB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlICAgICAgfCAgMSArCj4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlICAgICAgICB8IDExICsrKysrKysKPiAgLi4uL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0L3J1bl90YWdzX3Rlc3Quc2ggIHwgMTIgKysrKysrKysKPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgICAgIHwgMjkgKysrKysr
KysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2Vm
aWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9y
dW5fdGFnc190ZXN0LnNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9hcm02NC90YWdzX3Rlc3QuYwo+IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQv
LmdpdGlnbm9yZQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5l
OGZhZThkNjFlZDYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYXJtNjQvLmdpdGlnbm9yZQo+IEBAIC0wLDAgKzEgQEAKPiArdGFnc190ZXN0Cj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uYTYxYjJlNzQzZTk5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlCj4gQEAgLTAsMCArMSwxMSBAQAo+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+ICsjIEFSQ0ggY2FuIGJl
IG92ZXJyaWRkZW4gYnkgdGhlIHVzZXIgZm9yIGNyb3NzIGNvbXBpbGluZwo+ICtBUkNIID89ICQo
c2hlbGwgdW5hbWUgLW0gMj4vZGV2L251bGwgfHwgZWNobyBub3QpCj4gKwo+ICtpZm5lcSAoLCQo
ZmlsdGVyICQoQVJDSCksYWFyY2g2NCBhcm02NCkpCj4gK1RFU1RfR0VOX1BST0dTIDo9IHRhZ3Nf
dGVzdAo+ICtURVNUX1BST0dTIDo9IHJ1bl90YWdzX3Rlc3Quc2gKPiArZW5kaWYKPiArCj4gK2lu
Y2x1ZGUgLi4vbGliLm1rCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Fy
bTY0L3J1bl90YWdzX3Rlc3Quc2ggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5f
dGFnc190ZXN0LnNoCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAwMDAwMDAwMDAu
Ljc0NWYxMTM3OTkzMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoCj4gQEAgLTAsMCArMSwxMiBAQAo+ICsjIS9iaW4v
c2gKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsKPiArZWNobyAiLS0t
LS0tLS0tLS0tLS0tLS0tLS0iCj4gK2VjaG8gInJ1bm5pbmcgdGFncyB0ZXN0Igo+ICtlY2hvICIt
LS0tLS0tLS0tLS0tLS0tLS0tLSIKPiArLi90YWdzX3Rlc3QKPiAraWYgWyAkPyAtbmUgMCBdOyB0
aGVuCj4gKwllY2hvICJbRkFJTF0iCj4gK2Vsc2UKPiArCWVjaG8gIltQQVNTXSIKPiArZmkKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYwo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yMmExYjI2NmUzNzMKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKPiBAQCAt
MCwwICsxLDI5IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+
ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiArI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ICsjaW5jbHVkZSA8
dW5pc3RkLmg+Cj4gKyNpbmNsdWRlIDxzdGRpbnQuaD4KPiArI2luY2x1ZGUgPHN5cy9wcmN0bC5o
Pgo+ICsjaW5jbHVkZSA8c3lzL3V0c25hbWUuaD4KPiArCj4gKyNkZWZpbmUgU0hJRlRfVEFHKHRh
ZykJCSgodWludDY0X3QpKHRhZykgPDwgNTYpCj4gKyNkZWZpbmUgU0VUX1RBRyhwdHIsIHRhZykJ
KCgodWludDY0X3QpKHB0cikgJiB+U0hJRlRfVEFHKDB4ZmYpKSB8IFwKPiArCQkJCQlTSElGVF9U
QUcodGFnKSkKPiArCj4gK2ludCBtYWluKHZvaWQpCj4gK3sKPiArCXN0YXRpYyBpbnQgdGJpX2Vu
YWJsZWQgPSAwOwo+ICsJc3RydWN0IHV0c25hbWUgKnB0ciwgKnRhZ2dlZF9wdHI7Cj4gKwlpbnQg
ZXJyOwo+ICsKPiArCWlmIChwcmN0bChQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCwgUFJfVEFHR0VE
X0FERFJfRU5BQkxFLCAwLCAwLCAwKSA9PSAwKQo+ICsJCXRiaV9lbmFibGVkID0gMTsKPiArCXB0
ciA9IChzdHJ1Y3QgdXRzbmFtZSAqKW1hbGxvYyhzaXplb2YoKnB0cikpOwo+ICsJaWYgKHRiaV9l
bmFibGVkKQo+ICsJCXRhZ2dlZF9wdHIgPSAoc3RydWN0IHV0c25hbWUgKilTRVRfVEFHKHB0ciwg
MHg0Mik7Cj4gKwllcnIgPSB1bmFtZSh0YWdnZWRfcHRyKTsKPiArCWZyZWUocHRyKTsKPiArCj4g
KwlyZXR1cm4gZXJyOwo+ICt9Cj4gLS0gCj4gMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCj4g
CgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
