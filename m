Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717ED29C25
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD36E11E;
	Fri, 24 May 2019 16:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752696E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 16:27:14 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w11so15190139edl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=5uGnJY6+WIJldncn5/DuJlJfSiMsN3sDHc0cFO6evKw=;
 b=ciOR8hzLi5A9eF+vIpNx/Pakb57kqHvomW9YHmjnDJ1zMcu3SaVrxgQ1Uwi50ltSjo
 fEt5AaBJLstmOPkm5bfxpx/Oy8oiLMTaw68kyIGAM6+lyFa67nFE+aeOVC11HxgzonkC
 g8k5HEdB5RZduYQtcKbRgEgQ1CtI7P0eJjEwEqK4Ks+FQeR1a0G6fN6jLpZs10OtGDAG
 1JFQDJWHIFbH4q4HqjzqIskN8I0LcJBZdRcu5kcagSVRn3VeEPeaLr2ZfVLViZA1Ao/k
 AjKQHbqjp7TSRaOgh+y3LEmCjsh1LQ9r1WJJs8fi8rtdAwcpH+NElz6HR+zi+WH7SlQm
 fnnw==
X-Gm-Message-State: APjAAAUtscGwm4Wsg4pj/G9eLLV196wWWRTLNRoUr6OJTfyFDFzBNxpi
 Srt8lrxUAU9oxnAN+Vub74L1cw==
X-Google-Smtp-Source: APXvYqz+Z4CiuIPAkdi1mB6lLRW1WTeonKTLCscAeQw4ulK7kt9ebJAos6eSJA0Dpqv9o1VxaTHnkw==
X-Received: by 2002:a17:906:6a02:: with SMTP id
 o2mr57101777ejr.164.1558715233065; 
 Fri, 24 May 2019 09:27:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m16sm418816ejj.57.2019.05.24.09.27.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 09:27:12 -0700 (PDT)
Date: Fri, 24 May 2019 18:27:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
Message-ID: <20190524162709.GD21222@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Christoph Hellwig <hch@infradead.org>, akpm@linux-foundation.org,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jerome Glisse <jglisse@redhat.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Leon Romanovsky <leonro@mellanox.com>,
 Doug Ledford <dledford@redhat.com>,
 Artemy Kovalyov <artemyko@mellanox.com>,
 Moni Shoua <monis@mellanox.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Kaike Wan <kaike.wan@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-mm@kvack.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <20190523150432.GA5104@redhat.com>
 <20190523154149.GB12159@ziepe.ca>
 <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca>
 <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca>
 <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca>
 <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524124455.GB16845@ziepe.ca>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5uGnJY6+WIJldncn5/DuJlJfSiMsN3sDHc0cFO6evKw=;
 b=eGczKoO2oK1LxqRDUeq+D7nDJHBIb4XMUraNpLr4yOcOAsFgoTd33a5I2wq/sPLj5m
 cv4CL9Pysa7bfIL+Jn+vSSY2Z0bldZYmz/9YA39+pTt/iA6nk2Z39gXEHUQfsENbPGDq
 9COrk8k8zvaBOZH4FfeULv1UGUcPpYkvd+miQ=
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Doug Ledford <dledford@redhat.com>, linux-mm@kvack.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Kaike Wan <kaike.wan@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Leon Romanovsky <leonro@mellanox.com>, Jerome Glisse <jglisse@redhat.com>,
 Moni Shoua <monis@mellanox.com>, Artemy Kovalyov <artemyko@mellanox.com>,
 Dave Airlie <airlied@redhat.com>, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDk6NDQ6NTVBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDExOjQwOjUxUE0gLTA3MDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDQ6MTA6MzhQ
TSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiAKPiA+ID4gT24gVGh1LCBNYXkg
MjMsIDIwMTkgYXQgMDI6MjQ6NThQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3cm90ZToKPiA+ID4g
PiBJIGNhbiBub3QgdGFrZSBtbWFwX3NlbSBpbiByYW5nZV9yZWdpc3RlciwgdGhlIFJFQURfT05D
RSBpcyBmaW5lIGFuZAo+ID4gPiA+IHRoZXkgYXJlIG5vIHJhY2UgYXMgd2UgZG8gdGFrZSBhIHJl
ZmVyZW5jZSBvbiB0aGUgaG1tIHN0cnVjdCB0aHVzCj4gPiA+IAo+ID4gPiBPZiBjb3Vyc2UgdGhl
cmUgYXJlIHVzZSBhZnRlciBmcmVlIHJhY2VzIHdpdGggYSBSRUFEX09OQ0Ugc2NoZW1lLCBJCj4g
PiA+IHNob3VsZG4ndCBoYXZlIHRvIGV4cGxhaW4gdGhpcy4KPiA+ID4gCj4gPiA+IElmIHlvdSBj
YW5ub3QgdGFrZSB0aGUgcmVhZCBtbWFwIHNlbSAod2h5IG5vdD8pLCB0aGVuIHBsZWFzZSB1c2Ug
bXkKPiA+ID4gdmVyc2lvbiBhbmQgcHVzaCB0aGUgdXBkYXRlIHRvIHRoZSBkcml2ZXIgdGhyb3Vn
aCAtbW0uLgo+ID4gCj4gPiBJIHRoaW5rIGl0IHdvdWxkIHJlYWxseSBoZWxwIGlmIHdlIHF1ZXVl
IHVwIHRoZXNlIGNoYW5nZXMgaW4gYSBnaXQgdHJlZQo+ID4gdGhhdCBjYW4gYmUgcHVsbGVkIGlu
dG8gdGhlIGRyaXZlciB0cmVlcy4gIEdpdmVuIHRoYXQgeW91J3ZlIGJlZW4KPiA+IGRvaW5nIHNv
IG11Y2ggd29yayB0byBhY3R1YWxseSBtYWtlIGl0IHVzYWJsZSBJJ2Qgbm9taW5hdGUgcmRtYSBm
b3IgdGhlCj4gPiAibGVhZCIgdHJlZS4KPiAKPiBTdXJlLCBJJ20gd2lsbGluZyB0byBkbyB0aGF0
LiBSRE1BIGhhcyBleHBlcmllbmNlIHN1Y2Nlc3NmdWxseSBydW5uaW5nCj4gc2hhcmVkIGdpdCB0
cmVlcyB3aXRoIG5ldGRldi4gSXQgY2FuIHdvcmsgdmVyeSB3ZWxsLCBidXQgcmVxdWlyZXMKPiBk
aXNjaXBsaW5lIGFuZCB1bmRlcnN0YW5kaW5nIG9mIHRoZSBsaW1pdGF0aW9ucy4KPiAKPiBJIHJl
YWxseSB3YW50IHRvIHNlZSB0aGUgY29tcGxldGUgSE1NIHNvbHV0aW9uIGZyb20gSmVyb21lIChp
ZSB0aGUKPiBrY29uZmlnIGZpeGVzLCBhcm02NCwgYXBpIGZpeGVzLCBldGMpIGluIG9uZSBjb2hl
c2l2ZSB2aWV3LCBub3QKPiBmb3JjZWQgdG8gYmUgc3ByaW5rbGVkIGFjcm9zcyBtdWx0aXBsZSBr
ZXJuZWwgcmVsZWFzZXMgdG8gd29yayBhcm91bmQKPiBhIHN1Ym1pc3Npb24gcHJvY2Vzcy9jb29y
ZGluYXRpb24gcHJvYmxlbS4KPiAKPiBOb3cgdGhhdCAtbW0gbWVyZ2VkIHRoZSBiYXNpYyBobW0g
QVBJIHNrZWxldG9uIEkgdGhpbmsgcnVubmluZyBsaWtlCj4gdGhpcyB3b3VsZCBnZXQgdXMgcXVp
Y2tseSB0byB0aGUgcGxhY2Ugd2UgYWxsIHdhbnQ6IGNvbXByZWhlbnNpdmUgaW4gdHJlZQo+IHVz
ZXJzIG9mIGhtbS4KPiAKPiBBbmRyZXcsIHdvdWxkIHRoaXMgYmUgYWNjZXB0YWJsZSB0byB5b3U/
Cj4gCj4gRGF2ZSwgd291bGQgeW91IGJlIHdpbGxpbmcgdG8gbWVyZ2UgYSBjbGVhbiBITU0gdHJl
ZSBpbnRvIERSTSBpZiBpdCBpcwo+IHJlcXVpcmVkIGZvciBEUk0gZHJpdmVyIHdvcmsgaW4gNS4z
Pwo+IAo+IEknbSBmaW5lIHRvIG1lcmdlIGEgdHJlZSBsaWtlIHRoaXMgZm9yIFJETUEsIHdlIGFs
cmVhZHkgZG8gdGhpcwo+IHBhdHRlcm4gd2l0aCBuZXRkZXYuCj4gCj4gQmFja2dyb3VuZDogVGhl
IGlzc3VlIHRoYXQgaXMgbW90aXZhdGluZyB0aGlzIGlzIHdlIHdhbnQgdG8gbWFrZQo+IGNoYW5n
ZXMgdG8gc29tZSBvZiB0aGUgQVBJJ3MgZm9yIGhtbSwgd2hpY2ggbWVhbiBjaGFuZ2VzIGluIGV4
aXN0aW5nCj4gRFJNLCBjaGFuZ2VzIGluIHRvLWJlLWFjY2VwdGVkIFJETUEgY29kZSwgYW5kIHRv
LWJlLWFjY2VwdGVkIERSTQo+IGRyaXZlciBjb2RlLiBDb29yZGludGF0aW5nIHRoZSBtbS9obW0u
YywgUkRNQSBhbmQgRFJNIGNoYW5nZXMgaXMgYmVzdAo+IGRvbmUgd2l0aCB0aGUgcHJvdmVuIHNo
YXJlZCBnaXQgdHJlZSBwYXR0ZXJuLiBBcyBDSCBleHBsYWlucyBJIHdvdWxkCj4gcnVuIGEgY2xl
YW4vbWluaW1hbCBobW0gdHJlZSB0aGF0IGNhbiBiZSBtZXJnZWQgaW50byBkcml2ZXIgdHJlZXMg
YXMKPiByZXF1aXJlZCwgYW5kIEkgd2lsbCBjb21taXQgdG8gc2VuZGluZyBhIFBSIHRvIExpbnVz
IGZvciB0aGlzIHRyZWUKPiB2ZXJ5IGVhcmx5IGluIHRoZSBtZXJnZSB3aW5kb3cgc28gdGhhdCBk
cml2ZXIgUFIncyBhcmUgJ2NsZWFuJy4KPiAKPiBUaGUgdHJlZSB3aWxsIG9ubHkgY29udGFpbiB1
bmNvbnRyb3ZlcnNpYWwgaG1tIHJlbGF0ZWQgY29tbWl0cywgYnVnCj4gZml4ZXMsIGV0Yy4KPiAK
PiBPYnZpb3Vpc2x5IEkgd2lsbCBhbHNvIGNvbW1pdCB0byBwcm92aWRpbmcgcmV2aWV3IGZvciBw
YXRjaGVzIGZsb3dpbmcKPiB0aHJvdWdoIHRoaXMgdHJlZS4KClN1cmUgdG9waWMgYnJhbmNoIHNv
dW5kcyBmaW5lLCB3ZSBkbyB0aGF0IGFsbCB0aGUgdGltZSB3aXRoIHZhcmlvdXMKc3Vic3lzdGVt
cyBhbGwgb3Zlci4gV2UgaGF2ZSByZWFkeSBtYWRlIHNjcmlwdHMgZm9yIHRvcGljIGJyYW5jaGVz
IGFuZAphcHBseWluZyBwdWxscyBmcm9tIGFsbCBvdmVyLCBzbyB3ZSBjYW4gZXZlbiBzb2FrIHRl
c3QgZXZlcnl0aGluZyBpbiBvdXIKaW50ZWdyYXRpb24gdHJlZS4gSW4gY2FzZSB0aGVyZSdzIGNv
bmZsaWN0cyBvciBqdXN0IHRvIG1ha2Ugc3VyZQpldmVyeXRoaW5nIHdvcmtzLCBiZWZvcmUgd2Ug
YmFrZSB0aGUgdG9waWMgYnJhbmNoIGludG8gcGVybWFuZW50IGhpc3RvcnkKKHRoZSBtYWluIGRy
bS5naXQgcmVwbyBqdXN0IGNhbid0IGJlIHJlYmFzZWQsIHRvbyBtdWNoIGdvaW5nIG9uIGFuZCB0
b28KbWFueSBwZW9wbGUgaW52b2x2ZCkuCgpJZiBKZXJvbWUgaXMgb2sgd2l0aCB3cmVzdGxpbmcg
d2l0aCBvdXIgc2NyaXB0aW5nIHdlIGNvdWxkIGV2ZW4gcHVsbCB0aGVzZQp1cGRhdGVzIGluIHdo
aWxlIHRoZSBobW0uZ2l0IHRyZWUgaXMgZXZvbHZpbmcuCgpDaGVlcnMsIERhbmllbAooZHJtIGNv
LW1haW50YWluZXIgZndpdykKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
