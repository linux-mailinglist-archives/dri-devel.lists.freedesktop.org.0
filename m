Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6871CB538
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A37E6EAC3;
	Fri,  4 Oct 2019 07:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762116EA99
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 00:26:11 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 3so6294725qta.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 17:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t8ElgbBjvldS7RCANTQX7NP8jCNmVhBUpMx/X3yJJnI=;
 b=JcwpsNjJoA5+GeMvMf/q6Kr/bpZU5sxAzhkmn3I9v2yMgv6jmu12UeuH2NaMG2D5fe
 cJAXQxBPOi/2VWDhx5JQrT58GCSsMfC6H8yK78ERoRo3tkpjIa6bazipUhxUQqz0L2qa
 9tywqob5Zk2iQJNhEdS1Z9X0ivKFXNL/0XkGtyIw4XjAJLvam1RoFdWSiLl75NqC1+VX
 7c8Ib3eglxZV9We48SYgZ/0bXLpz7ITXeZ2jbOEpY8ZB8kAzOq/Mf84w5bu3zjuAD4op
 HadmrZHUFkqP8mWeCg9x6axkBjikuFVB7DLUKgF8A6jNxCHKvrIlVqOmOY/8Sa25MBlM
 GxrA==
X-Gm-Message-State: APjAAAXCFaTNurJ97WiuGqZcHXprE92GitPWjQf3DTONu5ymztl3fhAm
 8voa8dH6Ld1mC9Cl3K9Tie2Jhw==
X-Google-Smtp-Source: APXvYqy9wrqjsmrH13crtv8A8dB2SxbngdCHEaX3ber47YeIGRtVSMUgPxvnncxcC4QOMG1vCzGS/Q==
X-Received: by 2002:ac8:34c9:: with SMTP id x9mr13318619qtb.65.1570148770503; 
 Thu, 03 Oct 2019 17:26:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id i13sm1951713qtm.68.2019.10.03.17.26.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 17:26:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iGBQ9-0000yM-JC; Thu, 03 Oct 2019 21:26:09 -0300
Date: Thu, 3 Oct 2019 21:26:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH -next 00/11] lib/interval-tree: move to half closed
 intervals
Message-ID: <20191004002609.GB1492@ziepe.ca>
References: <20191003201858.11666-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003201858.11666-1-dave@stgolabs.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t8ElgbBjvldS7RCANTQX7NP8jCNmVhBUpMx/X3yJJnI=;
 b=V0gIeyikeiCZtCt6Rp3QBzMia/OIN1ZrMPfARnjDaPkm4V//Ololtz3g2tINpmwTOM
 G4h8ADErSWenuWSneClOPnP5fwYjruCLrrB20mTMLMCJ+FPhdKuV4zfQWKP3JjGzRzXL
 sTx9OnXRZidfyv67LSy5DkJNVLGYLoXokm0bt4xU9ppGISWuCXP2y4GP9+Qu2uXgzloY
 fBNANHNH14MZZlVD0T6Z0xJa9gQERDhjGALPG4oO9r+soBJpU7fkNYTBV63b6GmlTvJi
 aqb5QEgOLOytxsQe37CBgS+/bZVAipGHyyr3JBkRMMAVOOpcXjXpQIRK2+XQuswuA4Ee
 TBbQ==
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 walken@google.com, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDE6MTg6NDdQTSAtMDcwMCwgRGF2aWRsb2hyIEJ1ZXNv
IHdyb3RlOgo+IEhpLAo+IAo+IEl0IGhhcyBiZWVuIGRpc2N1c3NlZFsxLDJdIHRoYXQgYWxtb3N0
IGFsbCB1c2VycyBvZiBpbnRlcnZhbCB0cmVlcyB3b3VsZCBiZXR0ZXIKPiBiZSBzZXJ2ZWQgaWYg
dGhlIGludGVydmFscyB3ZXJlIGFjdHVhbGx5IG5vdCBbYSxiXSwgYnV0IGluc3RlYWQgW2EsIGIp
LiBUaGlzCj4gc2VyaWVzIGF0dGVtcHRzIHRvIGNvbnZlcnQgYWxsIGNhbGxlcnMgYnkgd2F5IG9m
IHRyYW5zaXRpb25pbmcgZnJvbSB1c2luZwo+ICJpbnRlcnZhbF90cmVlX2dlbmVyaWMuaCIgdG8g
ImludGVydmFsX3RyZWVfZ2VuLmgiLiBPbmNlIGFsbCB1c2VycyBhcmUgY29udmVydGVkLAo+IHdl
IHJlbW92ZSB0aGUgZm9ybWVyLgo+IAo+IFBhdGNoIDE6IGFkZHMgYSBjYWxsIHRoYXQgd2lsbCBt
YWtlIHBhdGNoIDggZWFzaWVyIHRvIHJldmlldyBieSBpbnRyb2R1Y2luZyBzdGFiCj4gICAgICAg
ICAgcXVlcmllcyBmb3IgdGhlIHZtYSBpbnRlcnZhbCB0cmVlLgo+IAo+IFBhdGNoIDI6IGFkZHMg
dGhlIG5ldyBpbnRlcnZhbF90cmVlX2dlbi5oIHdoaWNoIGlzIHRoZSBzYW1lIGFzIHRoZSBvbGQg
b25lIGJ1dAo+ICAgICAgICAgIHVzZXMgW2EsYikgaW50ZXJ2YWxzLgo+IAo+IFBhdGNoIDMtOTog
Y29udmVydHMsIGluIGJhYnkgc3RlcHMgKGFzIG11Y2ggYXMgcG9zc2libGUpLCBlYWNoIGludGVy
dmFsIHRyZWUgdG8KPiAJICAgdGhlIG5ldyBbYSxiKSBvbmUuIEl0IGlzIGRvbmUgdGhpcyB3YXkg
YWxzbyB0byBtYWludGFpbiBiaXNlY3RhYmlsaXR5Lgo+IAkgICBNb3N0IGNvbnZlcnNpb25zIGFy
ZSBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkLCBob3dldmVyLCB0aGVyZSBhcmUgc29tZQo+IAkgICBj
cmVhdGl2ZSB3YXlzIGluIHdoaWNoIHNvbWUgY2FsbGVycyB1c2UgdGhlIGludGVydmFsICdlbmQn
IHdoZW4gZ29pbmcKPiAJICAgdGhyb3VnaCBpbnRlcnNlY3RpbmcgcmFuZ2VzIHdpdGhpbiBhIHRy
ZWUuIEllOiBwYXRjaCAzLCA2IGFuZCA5Lgo+IAo+IFBhdGNoIDEwOiBkZWxldGVzIHRoZSBpbnRl
cnZhbF90cmVlX2dlbmVyaWMuaCBoZWFkZXI7IHRoZXJlIGFyZSBubyBsb25nZXIgYW55IHVzZXJz
Lgo+IAo+IFBhdGNoIDExOiBmaW5hbGx5IHNpbXBsaWZpZXMgeDg2IHBhdCB0cmVlIHRvIHVzZSB0
aGUgbmV3IGludGVydmFsIHRyZWUgbWFjaGluZXJ5Lgo+IAo+IFRoaXMgaGFzIGJlZW4gbGlnaHRs
eSB0ZXN0ZWQsIGFuZCBjZXJ0YWlubHkgbm90IG9uIGRyaXZlciBwYXRocyB0aGF0IGRvIG5vbgo+
IHRyaXZpYWwgY29udmVyc2lvbnMuIEFsc28gbmVlZHMgbW9yZSBleWViYWxscyBhcyBjb252ZXJz
aW9ucyBjYW4gYmUgZWFzaWx5Cj4gbWlzc2VkIChldmVuIHdoZW4gSSd2ZSB0cmllZCBtaXRpZ2F0
aW5nIHRoaXMgYnkgcmVuYW1pbmcgdGhlIGVuZHBvaW50IGZyb20gJ2xhc3QnCj4gdG8gJ2VuZCcg
aW4gZWFjaCBjb3JyZXNwb25kaW5nIHN0cnVjdHVyZSkuCj4gCj4gQmVjYXVzZSB0aGlzIHRvdWNo
ZXMgYSBsb3Qgb2YgZHJpdmVycywgSSdtIENjJ2luZyB0aGUgd2hvbGUgdGhpbmcgdG8gYSBjb3Vw
bGUgb2YKPiByZWxldmFudCBsaXN0cyAobW0sIGRyaSwgcmRtYSk7IHNvcnJ5IGlmIHlvdSBjb25z
aWRlciB0aGlzIHNwYW0uCj4gCj4gQXBwbGllcyBvbiB0b3Agb2YgdG9kYXkncyBsaW51eC1uZXh0
IHRyZWUuIFBsZWFzZSBjb25zaWRlciBmb3IgdjUuNS4KPiAKPiBUaGFua3MhCj4gCj4gWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FOTjY4OUhWREpYS0V3QjgweVBBVnd2UnduVjRI
Zml1Y1FWQWhvPWR1cEtNX2lLb3p3QG1haWwuZ21haWwuY29tLwoKSHVybSwgdGhpcyBpcyBub3Qg
ZW50aXJlbHkgYWNjdXJhdGUuIE1vc3QgdXNlcnMgZG8gYWN0dWFsbHkgd2FudApvdmVybGFwcGlu
ZyBhbmQgbXVsdGlwbGUgcmFuZ2VzLiBJIGp1c3Qgc3R1ZGllZCB0aGlzIGV4dGVuc2l2ZWx5OgoK
cmFkZW9uX21uIGFjdHVhbGx5IHdhbnRzIG92ZXJsYXBwaW5nIGJ1dCBzZWVtcyB0byBtaXMtdW5k
ZXJzdGFuZCB0aGUKaW50ZXJ2YWxfdHJlZSBBUEkgYW5kIGFjdGl2ZWx5IHRyaWVzIGhhcmQgdG8g
cHJldmVudCBvdmVybGFwcGluZyBhdApncmVhdCBjb3N0IGFuZCBjb21wbGV4aXR5LiBJIGhhdmUg
YSBwYXRjaCB0byBkZWxldGUgYWxsIG9mIHRoaXMgYW5kCmp1c3QgYmUgb3ZlcmxhcHBpbmcuCgph
bWRncHVfbW4gY29waWVkIHRoZSB3cm9uZ25lc3MgZnJvbSByYWRlb25fbW4KCkFsbCB0aGUgRFJN
IGRyaXZlcnMgYXJlIGJhc2ljYWxseSB0aGUgc2FtZSBoZXJlLCB0cmFja2luZyB1c2Vyc3BhY2UK
Y29udHJvbGxlZCBWQXMsIHNvIG92ZXJsYXBwaW5nIGlzIGVzc2VudGlhbAoKaGZpMS9tbXVfcmIg
ZGVmaW5pdGVseSBuZWVkcyBvdmVybGFwcGluZyBhcyBpdCBpcyBkZWFsaW5nIHdpdGgKdXNlcnNw
YWNlIFZBIHJhbmdlcyB1bmRlciBjb250cm9sIG9mIHVzZXJzcGFjZS4gQXMgZG8gdGhlIG90aGVy
CmluZmluaWJhbmQgdXNlcnMuCgp2aG9zdCBwcm9iYWJseSBkb2Vzbid0IG92ZXJsYXAgaW4gdGhl
IG5vcm1hbCBjYXNlLCBidXQgYWdhaW4gdXNlcnNwYWNlCmNvdWxkIHRyaWdnZXIgb3ZlcmxhcCBp
biBzb21lIHBhdGhhbG9naWNhbCBjYXNlLgoKVGhlIFtzdGFydCxsYXN0XSBhbGxvd3MgdGhlIGlu
dGVydmFsIHRvIGNvdmVyIHVwIHRvIFVMT05HX01BWC4gSSBkb24ndAprbm93IGlmIHRoaXMgaXMg
bmVlZGVkIGhvd2V2ZXIuIE1hbnkgdXNlcnMgYXJlIHVzaW5nIHVzZXJzcGFjZSBWQXMKaGVyZS4g
SXMgdGhlcmUgYW55IGtlcm5lbCBjb25maWd1cmF0aW9uIHdoZXJlIFVMT05HX01BWCBpcyBhIHZh
bGlkCnVzZXJzcGFjZSBwb2ludGVyPyBJZSAzMiBiaXQgNEcgdXNlcnNwYWNlPyBJIGRvbid0IGtu
b3cuIAoKTWFueSB1c2VycyBzZWVtZWQgdG8gaGF2ZSBidWdzIHdoZXJlIHRoZXkgd2VyZSB0YWtp
bmcgYSB1c2Vyc3BhY2UKY29udHJvbGxlZCBzdGFydCArIGxlbmd0aCBhbmQgY29udmVydGluZyB0
aGVtIGludG8gYSBzdGFydC9lbmQgZm9yCmludGVydmFsIHRyZWUgd2l0aG91dCBvdmVyZmxvdyBw
cm90ZWN0aW9uICh3b29wcykKCkFsc28gSSBoYXZlIGEgc2VyaWVzIGFscmVhZHkgY29va2luZyB0
byBkZWxldGUgc2V2ZXJhbCBvZiB0aGVzZQppbnRlcnZhbCB0cmVlIHVzZXJzLCB3aGljaCB3aWxs
IHRlcnJpYmx5IGNvbmZsaWN0IHdpdGggdGhpcyA6XAoKSXMgaXQgcmVhbGx5IG5lY2Vzc2FyeSB0
byBtYWtlIHN1Y2ggY2h1cm4gZm9yIHN1Y2ggYSB0aW55IEFQSSBjaGFuZ2U/CgpKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
