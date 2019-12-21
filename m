Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F2128A91
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 18:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFE06E0B9;
	Sat, 21 Dec 2019 17:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BBF6E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 17:21:03 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7702C2070B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576948862;
 bh=ygQ+LLKc6onkKQohUjB4VeER1S5nL8ISyedIw3igvFQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=x96NU+fxBzmg38mKk0TGitI2DkyJtAaQKY/5VTvgo818kI3m0Av9s6mvDML47ta94
 P1eHg6Bp/jv5P0xoqarNn0EvL7tEDDphKBnvcv1WmbmRKyCHkjtqHCfJCQwI+86fG9
 w1y42YhGVRdJIfTYdIwHvOCJNRQyDKTs2czaTwV0=
Received: by mail-lj1-f172.google.com with SMTP id z22so8422380ljg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:21:02 -0800 (PST)
X-Gm-Message-State: APjAAAWmu5onRoQULbl9tb4DYZepC/56ZsB7Ehdp5x2qsDtVvvtOXi9j
 sBNdSWBzgZslgEN1sWyVvJBmhNw3cJ2lBXVwtWk=
X-Google-Smtp-Source: APXvYqzxQbblDkSAhXsYJzBSq3hDVzSm7VnGs1SPM1HBdZJYbyVd5kmZbEvVMHb9JsKwPhMwlDsc1nNYruHS7j121S0=
X-Received: by 2002:a2e:8551:: with SMTP id u17mr8218439ljj.165.1576948860712; 
 Sat, 21 Dec 2019 09:21:00 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191220120142eucas1p1f43c7a862d9c0faa72e14b21d7d697e9@eucas1p1.samsung.com>
 <20191220115653.6487-1-a.swigon@samsung.com>
 <20191220115653.6487-3-a.swigon@samsung.com>
In-Reply-To: <20191220115653.6487-3-a.swigon@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 22 Dec 2019 02:20:24 +0900
X-Gmail-Original-Message-ID: <CAGTfZH2mh4xcUUa+z=thdnrFsEgZ7NR5nmL4sK2ybARndhn01A@mail.gmail.com>
Message-ID: <CAGTfZH2mh4xcUUa+z=thdnrFsEgZ7NR5nmL4sK2ybARndhn01A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/7] interconnect: Relax requirement in
 of_icc_get_from_provider()
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjAzIFBNIEFydHVyIMWad2lnb8WEIDxhLnN3
aWdvbkBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHJlbGF4ZXMgdGhlIGNvbmRp
dGlvbiBpbiBvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoKSBzbyB0aGF0IGl0Cj4gaXMgbm8gbG9u
Z2VyIHJlcXVpcmVkIHRvIHNldCAjaW50ZXJjb25uZWN0LWNlbGxzID0gPDE+IGluIHRoZSBEVC4g
SW4gY2FzZQo+IG9mIHRoZSBkZXZmcmVxIGRyaXZlciBmb3IgZXh5bm9zLWJ1cywgI2ludGVyY29u
bmVjdC1jZWxscyBpcyBhbHdheXMgemVyby4KCkl0IGRvZXNuJ3QgY29udGFpbiB3aHkgZG9uJ3Qg
bmVlZCB0byByZXF1aXJlIGl0LiBJZiB5b3UgYWRkIG1vcmUgZGV0YWlsZWQKZGVzY3JpcHRpb24s
IGl0IGlzIGJldHRlciB0byB1bmRlcnN0YW5kLgoKPgo+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWa
d2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2ludGVyY29ubmVjdC9jb3Jl
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYyBiL2RyaXZlcnMv
aW50ZXJjb25uZWN0L2NvcmUuYwo+IGluZGV4IGU2MDM1YzE5OTM2OS4uNzRjNjg4OThhMzUwIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMv
aW50ZXJjb25uZWN0L2NvcmUuYwo+IEBAIC0zMzUsNyArMzM1LDcgQEAgc3RydWN0IGljY19ub2Rl
ICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYykK
PiAgICAgICAgIHN0cnVjdCBpY2Nfbm9kZSAqbm9kZSA9IEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7
Cj4gICAgICAgICBzdHJ1Y3QgaWNjX3Byb3ZpZGVyICpwcm92aWRlcjsKPgo+IC0gICAgICAgaWYg
KCFzcGVjIHx8IHNwZWMtPmFyZ3NfY291bnQgIT0gMSkKPiArICAgICAgIGlmICghc3BlYykKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4KPiAgICAgICAgIG11dGV4
X2xvY2soJmljY19sb2NrKTsKPiAtLQo+IDIuMTcuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcywKQ2hh
bndvbyBDaG9pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
