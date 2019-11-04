Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA57EE659
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AF26E7A3;
	Mon,  4 Nov 2019 17:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B1B89DC7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:42:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n1so18120758wra.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 09:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=5ogVv9yu3iXpW756OAqxBZcAaxMrrDVeZyf4/i652TM=;
 b=ltFDcgQBL4aR1dRMUUa2W98ojOghPhCtvbIg5UBeQeLY6tO758F+fLiqRLb7CaQCI2
 LpRRahLP2uMtbDKyoHY5ER1agjmR96VHjbKj6nkRRRA5cPJkCO4r3eHdBpBah022fDbk
 76An8Hi+8fT1Tqj/BHGBCHXShlpE6zlSp/NRzIryXO8F+QcTZ/xIytc7Sl+FfHw5OJ1x
 b50CrBTLb52bPRQ565ASw7wqFPYjIceAjUiqr67AX4pws/yqibV/v/WvvE60EJoy0RPF
 Lx+if3bxq4DnKCN84lyZ7MtrKEZN+sh4JUgOzIZvnrk27mQZzX7x2nmxUSNVuMKoXEUP
 98OQ==
X-Gm-Message-State: APjAAAX59/lhmS/L+uRpPqGAGRtkr+cN+KTFKX0+Yt4u4SEJkf+vDwvb
 RtG+gWVZ8l6+TyQyKwEGLSS3Ug==
X-Google-Smtp-Source: APXvYqyo30Cx3N9aLHROc1bhJ+WNVO3huy0tpFL+gtfZWVC0nSZZlSOaRK2D60u0zqloh6U7cb3wBA==
X-Received: by 2002:adf:e889:: with SMTP id d9mr26191161wrm.266.1572889341116; 
 Mon, 04 Nov 2019 09:42:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f13sm17424754wrq.96.2019.11.04.09.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 09:42:20 -0800 (PST)
Date: Mon, 4 Nov 2019 18:42:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v2] drm: sun4i: Add support for suspending the display
 driver
Message-ID: <20191104174218.GL10326@phenom.ffwll.local>
Mail-Followup-To: Ondrej Jirman <megous@megous.com>,
 linux-sunxi@googlegroups.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20191029112846.3604925-1-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029112846.3604925-1-megous@megous.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5ogVv9yu3iXpW756OAqxBZcAaxMrrDVeZyf4/i652TM=;
 b=jvjHe6OReDuWCuVv2+9UAh0oNSew20Cf90E08ulRCvHLHeXfSPKJ1HoefQFlUG7hM8
 cvxTxB0gdhOTdqmAYguK071cnJKBuGonRdGwubEbmvi30uVk49BVOBFvBbnXyV6fgY1B
 /GBBc6/JCDu4mXohl8A5LHq8adjS1+871lhRU=
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 linux-sunxi@googlegroups.com,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTI6Mjg6NDZQTSArMDEwMCwgT25kcmVqIEppcm1hbiB3
cm90ZToKPiBTaHV0IGRvd24gdGhlIGRpc3BsYXkgZW5naW5lIGR1cmluZyBzdXNwZW5kLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+IC0tLQo+
IENoYW5nZXMgaW4gdjI6Cj4gLSBzcGFjZXMgLT4gdGFicwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfZHJ2LmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW40aV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYwo+
IGluZGV4IGE1NzU3YjExYjczMC4uYzUxOWQ3Y2ZjZjQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW40aV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV9kcnYuYwo+IEBAIC0zNDYsNiArMzQ2LDI3IEBAIHN0YXRpYyBpbnQgc3VuNGlfZHJ2X2Fk
ZF9lbmRwb2ludHMoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJcmV0dXJuIGNvdW50Owo+ICB9Cj4g
IAo+ICsjaWZkZWYgQ09ORklHX1BNX1NMRUVQCj4gK3N0YXRpYyBpbnQgc3VuNGlfZHJ2X2RybV9z
eXNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4gKwlyZXR1cm4gZHJtX21vZGVfY29u
ZmlnX2hlbHBlcl9zdXNwZW5kKGRybSk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc3VuNGlfZHJ2
X2RybV9zeXNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsJc3RydWN0IGRybV9k
ZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICsKPiArCXJldHVybiBkcm1fbW9k
ZV9jb25maWdfaGVscGVyX3Jlc3VtZShkcm0pOwo+ICt9Cj4gKyNlbmRpZgo+ICsKPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHN1bjRpX2Rydl9kcm1fcG1fb3BzID0gewo+ICsJU0VU
X1NZU1RFTV9TTEVFUF9QTV9PUFMoc3VuNGlfZHJ2X2RybV9zeXNfc3VzcGVuZCwKPiArCQkJCXN1
bjRpX2Rydl9kcm1fc3lzX3Jlc3VtZSkKPiArfTsKCkkgd29uZGVyIHdoZXRoZXIgd2Ugc2hvdWxk
IGhhdmUgdGhlc2UgYXMgZGVmYXVsdCBoZWxwZXJzIHNvbWV3aGVyZSwKdGhlcmUncyBwcm9iYWJs
eSBhIGZldyBkcml2ZXJzIHRoYXQgY291bGQgdXNlIHRoZW0/IEl0J3MganVzdCBhIGhhbmRmdWwg
b2YKbGluZXMgd2UncmUgc2F2aW5nIGhlcmUsIGJ1dCB3ZSBoYXZlIGVub3VnaCBrbXMgZHJpdmVy
cyB0byBqdXN0aWZ5IHRoaXMKa2luZCBvZiBzdHVmZiBub3dhZGF5cyAuLi4KLURhbmllbAoKPiAr
Cj4gIHN0YXRpYyBpbnQgc3VuNGlfZHJ2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIHsKPiAgCXN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0gTlVMTDsKPiBAQCAt
NDE4LDYgKzQzOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN1bjRpX2Rydl9w
bGF0Zm9ybV9kcml2ZXIgPSB7Cj4gIAkuZHJpdmVyCQk9IHsKPiAgCQkubmFtZQkJPSAic3VuNGkt
ZHJtIiwKPiAgCQkub2ZfbWF0Y2hfdGFibGUJPSBzdW40aV9kcnZfb2ZfdGFibGUsCj4gKwkJLnBt
ID0gJnN1bjRpX2Rydl9kcm1fcG1fb3BzLAo+ICAJfSwKPiAgfTsKPiAgbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihzdW40aV9kcnZfcGxhdGZvcm1fZHJpdmVyKTsKPiAtLSAKPiAyLjIzLjAKPiAKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
