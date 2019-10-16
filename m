Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61637D8987
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CD06E8D0;
	Wed, 16 Oct 2019 07:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB3E89DC2;
 Wed, 16 Oct 2019 00:10:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b9so25869150wrs.0;
 Tue, 15 Oct 2019 17:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j69av0w9tOIcJjV3c32pq0GcgeoBfayplij6V6SpYU0=;
 b=qUKN8xI4z02lgfySURDLfGbVFUREJEwU8cPB43RGSW8IvgNHQuWoC8mYGQBboW0bi3
 IDY3+ubforofv0+yJblIS/hbJc9+xdurk+W/hSQdU0yE3J2oHvxUhPUOkSRp3RACsJFn
 Jl+a7Thja/iLC46P9qWz6xwCDKnG1qzfFZQ8vf1jIPTC0hpG6L6OSuYJeGheyzP7nlJD
 Po/9C0ZJ7KTDHgjrPtzHse3k2B8Tb9mqbyIMGJ85t3Tp4MozJBs3jfy01zTEI2d2WC2C
 OFh36MHyFZ8KZS1iDlAtJc6GY2HBNRanjh+CDILqHKT05HbjWPy8l7jTH0xQFYzUCGG/
 mU5A==
X-Gm-Message-State: APjAAAXq/IsFM5hk925nByEhhb/TTxNNLKD6+Bt2LBwfR4OiTzl701Ql
 vesXPDVxylWqsvn+n7/nfOc=
X-Google-Smtp-Source: APXvYqx9didLD4puGKS0MiDLXNZLOo8iIpQ3jo9nSKlc8SDSZHdSY8l1HBE2hD8vMB9qGmzlwoOa+A==
X-Received: by 2002:a5d:660f:: with SMTP id n15mr44289wru.179.1571184638558;
 Tue, 15 Oct 2019 17:10:38 -0700 (PDT)
Received: from mail.google.com ([104.238.174.53])
 by smtp.gmail.com with ESMTPSA id y5sm779614wma.14.2019.10.15.17.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 17:10:37 -0700 (PDT)
Date: Wed, 16 Oct 2019 08:10:28 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] kernel-doc: rename the kernel-doc directive 'functions'
 to 'specific'
Message-ID: <20191016001026.wa4hvc2pgyij2b4c@mail.google.com>
References: <20191013055359.23312-1-changbin.du@gmail.com>
 <20191015122726.7e12f551@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015122726.7e12f551@lwn.net>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j69av0w9tOIcJjV3c32pq0GcgeoBfayplij6V6SpYU0=;
 b=bgHjvrc0BYjeuZcUXC0kki5/TiWu4OdYD3WS+IpNJ+KYIbdDqej8OzgPunn6eiq91H
 OVKWlynTXlxTOt1VCwiXBh1APyD/FWjLDlcYaGgSusW42XL2IXuu2oZG7QuhsPUOmW0O
 95lVXtXQ1Jslh1IHfl8pkUkCaYNDRlRsb2Fi3r2KaCwsl87MeICsp4TtZZqNEGq7zZln
 FJJ5kJoWgm0EvynFElArkJp66uIptrD/WBESQdxVJCI2TMg1diIHTlWE9T4X/+7V6GMp
 Ibss60H57X7xrP+slUD20AfBhGc05pxATFFFpiR8kSbgiQKPhQgiHBNBGW4gx0B0n47S
 gBBw==
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
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, linux-kselftest@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTI6Mjc6MjZQTSAtMDYwMCwgSm9uYXRoYW4gQ29yYmV0
IHdyb3RlOgo+IE9uIFN1biwgMTMgT2N0IDIwMTkgMTM6NTM6NTkgKzA4MDAKPiBDaGFuZ2JpbiBE
dSA8Y2hhbmdiaW4uZHVAZ21haWwuY29tPiB3cm90ZToKPiAKPiA+IFRoZSAnZnVuY3Rpb25zJyBk
aXJlY3RpdmUgaXMgbm90IG9ubHkgZm9yIGZ1bmN0aW9ucywgYnV0IGFsc28gd29ya3MgZm9yCj4g
PiBzdHJ1Y3RzL3VuaW9ucy4gU28gdGhlIG5hbWUgaXMgbWlzbGVhZGluZy4gVGhpcyBwYXRjaCBy
ZW5hbWVzIGl0IHRvCj4gPiAnc3BlY2lmaWMnLCBzbyBub3cgd2UgaGF2ZSBleHBvcnQvaW50ZXJu
YWwvc3BlY2lmaWMgZGlyZWN0aXZlcyB0byBsaW1pdAo+ID4gdGhlIGZ1bmN0aW9ucy90eXBlcyB0
byBiZSBpbmNsdWRlZCBpbiBkb2N1bWVudGF0aW9uLiBNZWFud2hpbGUgd2UgaW1wcm92ZWQKPiA+
IHRoZSB3YXJuaW5nIG1lc3NhZ2UuCj4gCj4gSSBhZ3JlZSB3aXRoIHRoZSBvdGhlcnMgdGhhdCAi
c3BlY2lmaWMiIGRvZXNuJ3QgcmVhbGx5IG1ha2UgdGhpbmdzCj4gYmV0dGVyLiAgIkludGVyZmFj
ZXMiIG1heWJlOyBvdGhlcndpc2Ugd2UgY291bGQgZ28gZm9yIHNvbWV0aGluZyBsaWtlCj4gImZp
bHRlciIgb3IgInNlbGVjdCIuCj4KSm9uYXRoYW4sIEhvdyBhYm91dCAnaWRlbnRpZmllcicgc3Vn
Z2VzdGVkIGJ5IE1hdHRoZXcgYXMgaXQgaXMgbWVudGlvbmVkIGluIFRoZW4KQyBzcGVjPwoKPiBQ
YWludCBtaW5lIGdyZWVuIDopCj4gCj4gV2hhdGV2ZXIgd2UgZW5kIHVwIHdpdGgsIEkgdGhpbmsg
aXQgc2hvdWxkIGJlIGFkZGVkIGFzIGEgc3lub255bSBmb3IKPiAiZnVuY3Rpb25zIi4gIFRoZW4g
dGhlIHZhcmlvdXMgc2VsZWN0b3JzIHRoYXQgYXJlIGFjdHVhbGx5IHB1bGxpbmcgb3V0Cj4gZG9j
cyBmb3IgZnVuY3Rpb25zIGNvdWxkIGJlIGNoYW5nZWQgYXQgbGVpc3VyZSAtIG9yIG5vdCBhdCBh
bGwuICBJJ2QKPiByYXRoZXIgbm90IHNlZSBhIGJpZyBwYXRjaCBjaGFuZ2luZyBldmVyeXRoaW5n
IGF0IG9uY2UuCj4KU3VyZSwgSSdsbCBtYWtlICdmdW5jdGlvbnMnIGRlcHJlY2F0ZWQgYW5kIGFz
IGFuIGFsaWFzIHRvIG91ciBuZXcgZGlyZWN0aXZlIG5hbWUuCgo+IFRoYW5rcywKPiAKPiBqb24K
Ci0tIApDaGVlcnMsCkNoYW5nYmluIER1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
