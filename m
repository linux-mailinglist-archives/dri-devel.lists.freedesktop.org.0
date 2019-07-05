Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31702605DB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4698B6E3EC;
	Fri,  5 Jul 2019 12:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FB66E3EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:23:53 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so8119048edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 05:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=5QgxkK2BzVl/nyok1ckc9QkZXVZfV59w8ef5yaPLIeQ=;
 b=tO0HSEGpaweyrZqjE695nJxiFdbo1dRoh9OnuOtZdfx+Njq+yMuBAFStRJ1kDRLECL
 vuETsq75HqjN+BKkofQUufKoRxwSxBoysl+M0eRXPYqYyQtO1gY9y2AwkS1+zKIlgR0W
 ru2ixoPiVaDLP46OzMp92NNi651AcD60h4eP2Zas4eDDoV/zBBhprzm6yfNwyMzuUaq8
 KHrITRiWqQ7Ua4U8KlPS9cYlKhAXXdG6VLGGE+msbHK2rUXXyFiOyo13OQmN/8HmrXpK
 etrYmXulOsYe3DXXh8gpnj9yRUxYaAFO4smL2xAAWp/eZIowBMFHnMOqmEpO5czqEAIM
 qMfw==
X-Gm-Message-State: APjAAAUzpf7dZxrp0z9yXm+q6aBwegT2XzH/hY6OxAJSJsmc32IH4B3D
 kXXpWK1LZngtuoxRxLOFCUgrJw==
X-Google-Smtp-Source: APXvYqx0a1gWOtWT9/MpcV/1byNvLxzqfYN5lsb63pRNcON6/Uz//6V/QxiEEP7duzFtvD/7Xmnsrg==
X-Received: by 2002:a50:b566:: with SMTP id z35mr4279907edd.129.1562329431964; 
 Fri, 05 Jul 2019 05:23:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w14sm2648879eda.69.2019.07.05.05.23.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 05:23:51 -0700 (PDT)
Date: Fri, 5 Jul 2019 14:23:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH 1/2] drm/komeda: Disable slave pipeline support
Message-ID: <20190705122348.GN15868@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "sean@poorly.run" <sean@poorly.run>, nd <nd@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>,
 "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
References: <20190705114357.17403-1-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705114357.17403-1-james.qian.wang@arm.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5QgxkK2BzVl/nyok1ckc9QkZXVZfV59w8ef5yaPLIeQ=;
 b=fosrfzKlSYrojK0mZJeW01zCt1CRx0uEqtSUG1WPUH4mKDuv+wAcNyFFU5q1cWLWJS
 lKAMmmb3h6PVVRVvxpDeLu9FKPtx1WQMvWa3w6yLiGAstL4uZ5LOfCWWcMlfgo+pYZPg
 xs/lyLpzcycIvP46/HMX/x1N5cneuFLdIHoq4=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTE6NDQ6MTZBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gU2luY2UgdGhlIHByb3BlcnR5IHNsYXZl
X3BsYW5lcyBoYXZlIGJlZW4gcmVtb3ZlZCwgdG8gYXZvaWQgdGhlIHJlc291cmNlCj4gYXNzaWdu
bWVudCBwcm9ibGVtIGluIHVzZXIgZGlzYWJsZSBzbGF2ZSBwaXBlbGluZSBzdXBwb3J0IHRlbXBv
cmFyaWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCkkgZ3Vlc3MgdGhlIHdheSB5b3Ug
aGF2ZSB0byBlbnVtZXJhdGUgdGhlIHBsYW5lcyBsaXN0aW5nIHRoZSBzbGF2ZSBwbGFuZXMKd29u
dCBqdXN0IGF1dG9tYXRpY2FsbHkgd29yayBpbiBhbnkgZmFzaGlvbiBhbmQgZm9yY2UgYSBsb3Qg
bW9yZSBmYWxsYmFja3MKdG8gcHJpbWFyeSBwbGFuZSBvbmx5LiBBdCBsZWFzdCB1bnRpbCB2aXJ0
dWFsaXphdGlvbiBvZiBwbGFuZSBodyBpcyBkb25lLgpTbyBtYWtlcyBzZW5zZSB0byBvdXRyaWdo
dCBkaXNhYmxlIGFsbCB0aGUgc2xhdmUgcGxhbmUgc3R1ZmYgZm9yIG5vdy4gQW5kCkkgdGhpbmsg
aXQncyBvayB0byBrZWVwIGFsbCB0aGUgY29kZSBzdGlsbCwgd2UnbGwgdXNlIGl0IGFnYWluLgoK
QWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiBp
bmRleCBmNDQwMDc4OGFiOTQuLjhlZTg3OWVlM2RkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiBAQCAtNDgxLDcgKzQ4MSw3
IEBAIGludCBrb21lZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21z
LAo+ICAJCW1hc3RlciA9IG1kZXYtPnBpcGVsaW5lc1tpXTsKPiAgCj4gIAkJY3J0Yy0+bWFzdGVy
ID0gbWFzdGVyOwo+IC0JCWNydGMtPnNsYXZlICA9IGtvbWVkYV9waXBlbGluZV9nZXRfc2xhdmUo
bWFzdGVyKTsKClRoaXMgbWlnaHQgY2F1c2UgYW4gdW51c2VkIGZ1bmN0aW9uIHdhcm5pbmcsIG1p
Z2h0IG5lZWQgdG8gYW5ub3RhdGUgaXQKd2l0aCBfX3VudXNlZC4KLURhbmllbAo+ICsJCWNydGMt
PnNsYXZlICA9IE5VTEw7Cj4gIAo+ICAJCWlmIChjcnRjLT5zbGF2ZSkKPiAgCQkJc3ByaW50Zihz
dHIsICJwaXBlLSVkIiwgY3J0Yy0+c2xhdmUtPmlkKTsKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
