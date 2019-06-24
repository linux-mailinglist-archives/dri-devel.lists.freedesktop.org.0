Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD0C50F79
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BC689C3F;
	Mon, 24 Jun 2019 15:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812AC89C3F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:01:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b7so7053701pls.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BLg06i/VCl1+ARgBePt6UCtgCE6yMoeYz0XGu/hbFeo=;
 b=WX7sBJK1DpPcZW9yJxpskexRUsk7ch+/fqx6T6Xzcnke2P+LwEH50sDzS8n84vD6OY
 xzkmMS4gx4S6WEWzxSDteNgpOOsOUqhE+ALup5FSODGuk5DDiuDYsdGkRgKeMYpXO3Wf
 cdjRcoFWJ+iC4oGRNlrWcsl1JMB2QX0JGTt8ZoSr4QPxaA5QGHaKCwUCdTx1WWnsaOeG
 LagjD+n3qDyDS7V+IpkDUW6tUwuHr4Ms11yAard0uZoN2ZPm8tWJ2SYhz9aJX6S+spnV
 HouhBG2dn6MC6T1fAa8SWCvhAz1CPC+nNkPOP+g6wGDXSI08NVFjEUfVViP64bFcLj7A
 pUXQ==
X-Gm-Message-State: APjAAAVPLMQC2cv10CwnFGzNq7IqvssqHKzjCUj4mq+CjMdaigg8wdas
 akWsT5R4VwNo6zAUnUlS8chPVA==
X-Google-Smtp-Source: APXvYqxWnwPjr90pgAz811Ip1hR0DU+KY/u+1S7JOfCxDoc+41R5+q814qY7q3l7dWsEUazPv/NQog==
X-Received: by 2002:a17:902:ac88:: with SMTP id
 h8mr71103307plr.12.1561388501191; 
 Mon, 24 Jun 2019 08:01:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k2sm10325517pjl.23.2019.06.24.08.01.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 08:01:40 -0700 (PDT)
Date: Mon, 24 Jun 2019 08:01:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
Message-ID: <201906240801.BE42EB3AA@keescook>
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BLg06i/VCl1+ARgBePt6UCtgCE6yMoeYz0XGu/hbFeo=;
 b=MwA/LDiusqfNWsTB2DaatzITy3M650ma8hf3fWZJJgZo0sU5+WHRov34/AgR5khfdn
 43QWHZ5AnOHm74CPfDOEecH6k3NeL2D42ht4vodc0QKm4kkProj+2T//kWp6iTgN3F0V
 SMoSonCHMQtZbalEg27bzapOmKXhEcFOVUU3I=
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NTZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gbWx4NF9nZXRfdW1lbV9tcigpIHVzZXMgcHJvdmlkZWQg
dXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9uZSB3
aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBm
dW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZs
QGdvb2dsZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5v
cmc+CgotS2VlcwoKPiAtLS0KPiAgZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyB8IDcg
KysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIGIvZHJp
dmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwo+IGluZGV4IDM1NTIwNWEyODU0NC4uMTNkOWY5
MTdmMjQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMKPiAr
KysgYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jCj4gQEAgLTM3OCw2ICszNzgsNyBA
QCBzdGF0aWMgc3RydWN0IGliX3VtZW0gKm1seDRfZ2V0X3VtZW1fbXIoc3RydWN0IGliX3VkYXRh
ICp1ZGF0YSwgdTY0IHN0YXJ0LAo+ICAJICogYWdhaW4KPiAgCSAqLwo+ICAJaWYgKCFpYl9hY2Nl
c3Nfd3JpdGFibGUoYWNjZXNzX2ZsYWdzKSkgewo+ICsJCXVuc2lnbmVkIGxvbmcgdW50YWdnZWRf
c3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiAgCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYTsKPiAgCj4gIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwo+IEBAIC0z
ODYsOSArMzg3LDkgQEAgc3RhdGljIHN0cnVjdCBpYl91bWVtICptbHg0X2dldF91bWVtX21yKHN0
cnVjdCBpYl91ZGF0YSAqdWRhdGEsIHU2NCBzdGFydCwKPiAgCQkgKiBjb3ZlciB0aGUgbWVtb3J5
LCBidXQgZm9yIG5vdyBpdCByZXF1aXJlcyBhIHNpbmdsZSB2bWEgdG8KPiAgCQkgKiBlbnRpcmVs
eSBjb3ZlciB0aGUgTVIgdG8gc3VwcG9ydCBSTyBtYXBwaW5ncy4KPiAgCQkgKi8KPiAtCQl2bWEg
PSBmaW5kX3ZtYShjdXJyZW50LT5tbSwgc3RhcnQpOwo+IC0JCWlmICh2bWEgJiYgdm1hLT52bV9l
bmQgPj0gc3RhcnQgKyBsZW5ndGggJiYKPiAtCQkgICAgdm1hLT52bV9zdGFydCA8PSBzdGFydCkg
ewo+ICsJCXZtYSA9IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCB1bnRhZ2dlZF9zdGFydCk7Cj4gKwkJ
aWYgKHZtYSAmJiB2bWEtPnZtX2VuZCA+PSB1bnRhZ2dlZF9zdGFydCArIGxlbmd0aCAmJgo+ICsJ
CSAgICB2bWEtPnZtX3N0YXJ0IDw9IHVudGFnZ2VkX3N0YXJ0KSB7Cj4gIAkJCWlmICh2bWEtPnZt
X2ZsYWdzICYgVk1fV1JJVEUpCj4gIAkJCQlhY2Nlc3NfZmxhZ3MgfD0gSUJfQUNDRVNTX0xPQ0FM
X1dSSVRFOwo+ICAJCX0gZWxzZSB7Cj4gLS0gCj4gMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29n
Cj4gCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
