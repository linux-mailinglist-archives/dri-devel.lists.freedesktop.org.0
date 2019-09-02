Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE6A5A97
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 17:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45B896EB;
	Mon,  2 Sep 2019 15:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEB6896EB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 15:31:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h7so13108118wrt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 08:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6EfGf6+MqXDQn1XB/auCj6alJzlc691SbvYsfhubDJk=;
 b=V24pMYCk9VwvrHh0AF7ijZ1enIZG0CcimFMLawL0Ck+07uBrwJBT+6jvx9Jw/k4prs
 PIP2GTJFKi0HE2hExx7XHx4NiQXXPCs/5TniHEQFGW3CWlofPVzNYev+xniVOT3uYb9N
 Y83rsqp7nuDrpY91dziOzfYlwr2aYaSGRx+qT+pRr2+9Va8jNhrqmXyZZugsUxMHxLwg
 HK+9EAIVJQLxZKLcMsnpsE8NHgwQaS2jgUEOJxt0U81a3U1waNBjrvspLJs7jkrjnGAI
 bJ7x9JOUINIigbVLeEHXOtsDM/df+n2X2z3xILM5GZVMwaGzCkmtxl4xqBjpZAhVHM4O
 WAAw==
X-Gm-Message-State: APjAAAX0t8UiLKPtBu9yeA2a1+o2h/2fcZZB5yJre1fvjtablrZKD+1U
 GryyGV0nCJaqH3RuDiswYA==
X-Google-Smtp-Source: APXvYqwetzEK7FeEiM3dn6hKrJ2qLNXC8+uEuUf/Uh8aDJuNsQ7P/1C+HHcWhHgga493/WttgRJdGQ==
X-Received: by 2002:adf:e48a:: with SMTP id i10mr910231wrm.311.1567438302740; 
 Mon, 02 Sep 2019 08:31:42 -0700 (PDT)
Received: from localhost ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id z5sm13506433wrl.33.2019.09.02.08.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:31:42 -0700 (PDT)
Date: Mon, 2 Sep 2019 16:31:41 +0100
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
Message-ID: <20190902153141.GA28522@bogus>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902093517.GA12946@ulmo>
 <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
 <20190902144006.GB1445@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902144006.GB1445@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDQ6NDA6MDZQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDE6NDQ6MzhQTSArMDIwMCwgTGludXMg
V2FsbGVpaiB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDIsIDIwMTkgYXQgMTE6MzUgQU0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gPiAr
ICBkc2ktY29tbWFuZC1tb2RlOgo+ID4gPiA+ICsgICAgIHR5cGU6IGJvb2xlYW4KPiA+ID4gPiAr
ICAgICBkZXNjcmlwdGlvbjoKPiA+ID4gPiArICAgICAgIElmIHRoaXMgaXMgc3BlY2lmaWVkLCB0
aGUgcGFuZWwgd2lsbCBiZSB1c2VkIGluIGNvbW1hbmQKPiA+ID4gPiArICAgICAgIG1vZGUgaW5z
dGVhZCBvZiB2aWRlbyBtb2RlLgo+ID4gPgo+ID4gPiBJJ20gbm90IHN1cmUgdGhlcmUncyBjb25j
ZW5zdXMgb24gdGhpcyBvbmUgeWV0LiBJIHRoaW5rIHNvIGZhciB0aGUKPiA+ID4gZHJpdmVyIGRl
Y2lkZXMgd2hpY2ggbW9kZSB0byB1c2UgdGhlIHBhbmVsIGluLiBUZWNobmljYWxseSB0aGlzIGZh
bGxzCj4gPiA+IGludG8gdGhlIGNhdGVnb3J5IG9mIGNvbmZpZ3VyYXRpb24sIHNvIGl0IGRvZXNu
J3QgcmVhbGx5IGJlbG9uZyBpbiB0aGUKPiA+ID4gRFQuCj4gPiAKPiA+IFRoZSB3YXkgd2UndmUg
dXNlZCBEVCBpcyBmb3IgYSBiaXQgb2YgYm90aCBoYXJkd2FyZSBkZXNjcmlwdGlvbgo+ID4gYW5k
IGNvbmZpZ3VyYXRpb24gSSdkIHNheSwgYnV0IEknbSBubyBhdXRob3JpdHkgb24gdGhlIHN1Ympl
Y3QuCgpJJ20gb2theSB3aXRoIHRoaXMgaWYgdGhlcmUncyBjb25zZW5zdXMsIGJ1dCBpdCBzaG91
bGQgYmUgaW4gYSBjb21tb24gCmRvYy4gV2UgcHJvYmFibHkgbmVlZCBhIGRzaS1jb21tb20gc2No
ZW1hIHdpdGggdGhpcywgcmVnLCA/Py4KCj4gPiAKPiA+ID4gSSB2YWd1ZWx5IHJlY2FsbCBmcm9t
IGRpc2N1c3Npb25zIEkndmUgaGFkIG9uIHRoaXMgc3ViamVjdCB0aGF0IHRoZXJlJ3MKPiA+ID4g
dXN1YWxseSBubyByZWFzb24gdG8gZG8gdmlkZW8gbW9kZSBpZiB5b3UgY2FuIGRvIGNvbW1hbmQg
bW9kZSBiZWNhdXNlCj4gPiA+IGNvbW1hbmQgbW9kZSBpcyBtb3JlIHBvd2VyIGVmZmljaWVudC4g
VGhpcyB3YXMgYSBsb25nIHRpbWUgYWdvLCBzbyBJIG1heQo+ID4gPiBiZSBtaXNyZW1lbWJlcmlu
Zy4gUGVyaGFwcyB5b3UgaGF2ZSBkaWZmZXJlbnQgaW5mb3JtYXRpb24gb24gdGhpcz8KCjMwIG9y
IDYwZnBzIHVwZGF0ZXMgdGVuZCB0byBiZSBpbXBvc3NpYmxlIGJlY2F1c2UgeW91IGhhdmUgbGVz
cyBiL3cgYW5kIAppdCdzIGFzeW5jIHRvIHRoZSByZWZyZXNoLgoKSSB0aGluayBtb3N0IHBhbmVs
cyB0aGF0IGNhbiBkbyBib3RoLCBhbHdheXMgbmVlZCBjb21tYW5kIG1vZGUgdG9vIGZvciAKaW5p
dGlhbGl6YXRpb24uCgo+ID4gTm8gaWRlYS4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhh
dCB2aWRlbyBtb2RlIHdhcyBwcmVmZXJyZWQKPiA+IGJ1dCBJIGhhdmUgbm8gaWRlYSB3aHkuCj4g
Cj4gSG0uLi4gbXkgcmVjb2xsZWN0aW9uIGlzIHRoYXQgY29tbWFuZCBtb2RlIGlzIG9ubHkgc3Vw
cG9ydGVkIG9uICJzbWFydCIKPiBwYW5lbHMgdGhhdCBoYXZlIGFuIGludGVybmFsIGZyYW1lYnVm
ZmVyLiBTbyB0aGUgY29tbWFuZHMgYWN0dWFsbHkKPiBpbnN0cnVjdCB0aGUgcGFuZWwgdG8gdXBk
YXRlIHRoZWlyIGludGVybmFsIGZyYW1lYnVmZmVyLCB3aGljaCBtZWFucyB5b3UKPiBjYW4gdGVj
aG5pY2FsbHkgc3dpdGNoIG9mZiB0aGUgZGlzcGxheSBlbmdpbmUgd2hlbiB0aGVyZSBhcmUgbm8g
dXBkYXRlcy4KPgo+IFVuZGVyIHRob3NlIGNpcmN1bXN0YW5jZXMgSSB0aGluayBpdCdkIG1ha2Ug
c2Vuc2UgdG8gZGVmYXVsdCB0byBjb21tYW5kCj4gbW9kZSBpZiBib3RoIHRoZSBwYW5lbCBhbmQg
dGhlIGhvc3Qgc3VwcG9ydCBpdCBhbmQgc3RpY2sgd2l0aCB2aWRlbyBtb2RlCj4gaWYgZm9yIGV4
YW1wbGUgdGhlIGhvc3QgY2FuJ3QgZG8gY29tbWFuZCBtb2RlLgo+IAo+IE9yIHBlcmhhcHMgdGhp
cyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBzZXQgZnJvbSBzb21lIHVzZXJzcGFjZQo+IHBv
bGljeSBtYWtlciB2aWEgYSBjb25uZWN0b3IgcHJvcGVydHk/IEEgY29tcG9zaXRvciBmb3IgaW5z
dGFuY2Ugd291bGQKPiBoYXZlIGEgcHJldHR5IGdvb2QgaWRlYSBvZiB3aGF0IGtpbmQgb2YgYWN0
aXZpdHkgaXMgZ29pbmcgb24sIHNvIGl0Cj4gY291bGQgYXQgc29tZSBwb2ludCBkZWNpZGUgdG8g
c3dpdGNoIGJldHdlZW4gdmlkZW8gbW9kZSBhbmQgY29tbWFuZCBtb2RlCj4gaWYgb25lIG9mIHRo
ZW0gaXMgbW9yZSBhcHByb3ByaWF0ZSBmb3IgdGhlIGdpdmVuIHdvcmtsb2FkLgo+IAo+IENvbW1h
bmQgbW9kZSBjYW4gYWxzbyBiZSB1c2VkIHRvIGRvIHBhcnRpYWwgdXBkYXRlcywgaWYgSSByZW1l
bWJlcgo+IGNvcnJlY3RseSwgd2hpY2ggYWdhaW4gd291bGQgbWFrZSBpdCBwb3NzaWJsZSBmb3Ig
YSBjb21wb3NpdG9yIHRvIHNlbmQKPiBvbmx5IGEgc3Vic2V0IG9mIGEgc2NyZWVuIHVwZGF0ZS4K
CkFsbCBtYWtlcyBzZW5zZSB0byBtZS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
