Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C999E11A6CE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFC76EAC6;
	Wed, 11 Dec 2019 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C881F6EA22
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 23:18:59 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b9so9277313pgk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 15:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=aYvblQ30gpZBVZ6VS3OFmdjMaDeok1Zcablkjmc6EOU=;
 b=Ez7MIMBE5taWgU7EnE1c9HZazz94lKoxKKudi28hGlkZHPKeouhxZOeSVIVSrZjduF
 osT5hb9wlP19DVYMnG27YTJ18DQ5Wi36mie+Vuq37WbCInVvHObb+ixe/17FJMt5N0V/
 PJ/6eKxsxNVPKgNOVgStzNIQ2NCXbuBwV7EJBtPfsCvgc34Vnms5w1yEYm3RO7f384Jz
 30W0YP7DL2HvStXmyypG9DZqw2J1Gvc3CN3c3rXs828lj2fcG3G44c1zl1DRTe4ig/mV
 fZ29+G8azKU/iIZUQanuTgZhEBDOmEyFoRXsrGk8EAsBNLw/KD3IYaX63YQVBPqZBVJC
 7eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=aYvblQ30gpZBVZ6VS3OFmdjMaDeok1Zcablkjmc6EOU=;
 b=Zc2SvRuPiEOSQxdh/g4Hv0AbaKBu1zpTL3hOrF3NRvKcWrQJ7zlNDOPCDH5r5GnaVl
 fgUhaDG64dPM91NfrVKK9L5ITVMOqYxlaDjEo4V0JnxvhfoQXSf5GgBZljghBZxWuCcv
 5JIltBPLLCnyw1AadNRULLf+QFCNqqVBdkHLVt6BAS7Ci7byPLOBvKva29kXQUHhu0SX
 h3H+WcSWx70m0xf7Q/ano63oLZDPOXI32UUMZP8qnciYkfpQwcnhNEilk/xUcmEj2uqD
 IA6CBlMywFJ4kYONfh0dMHn4OzSKldFTk6L3YrJaSxA8he4EXZXZfFEKOHgHg66xZczr
 VFag==
X-Gm-Message-State: APjAAAWenmll6XVxHfWMBEawZE9yq89FebKzT8msokzkX6S5QcKDE1Gk
 wEuRpfwYEy+s+fYusqz2Ea8nxR5H2DErI5UT
X-Google-Smtp-Source: APXvYqwLGDrs8XLfKy4j7dJdTziNjFYFFnOQ42Ma+2WY+SKaSNb2by54CBIGEFeX0/K9GNLomnn/eg==
X-Received: by 2002:aa7:9d0e:: with SMTP id k14mr412568pfp.157.1576019939203; 
 Tue, 10 Dec 2019 15:18:59 -0800 (PST)
Received: from google.com ([2620:0:1000:2511:b34b:87b6:d099:91b0])
 by smtp.gmail.com with ESMTPSA id l21sm56081pjq.23.2019.12.10.15.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 15:18:58 -0800 (PST)
Date: Tue, 10 Dec 2019 15:18:54 -0800
From: Tom Anderson <thomasanderson@google.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [v3,3/4] drm/edid: Throw away the dummy VIC 0 cea mode
Message-ID: <20191210231854.GB25612@google.com>
References: <20190925135502.24055-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925135502.24055-4-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Hans Verkuil <hansverk@cisco.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDQ6NTU6MDFQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IE5vdyB0aGF0IHRoZSBjZWEgbW9kZSBoYW5kbGluZyBpcyBub3QgMTAwJSB0aWVk
IHRvIHRoZSBzaW5nbGUKPiBhcnJheSB0aGUgZHVtbXkgVklDIDAgbW9kZSBpcyBwcmV0dHkgbXVj
aCBwb2ludGxlcy4gVGhyb3cgaXQKPiBvdXQuCj4gCj4gQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3Zl
cmtAY2lzY28uY29tPgo+IENjOiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAxNCAr
KysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggOWY2OTk2MzIzZWZhLi4wMDA3MDA0ZDMy
MjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC03MDksMTEgKzcwOSw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbWluaW1vZGUgZXh0cmFfbW9kZXNbXSA9IHsKPiAgLyoKPiAgICogRnJvbSBDRUEv
Q1RBLTg2MSBzcGVjLgo+ICAgKgo+IC0gKiBJbmRleCB3aXRoIFZJQy4KPiArICogSW5kZXggd2l0
aCBWSUMtMS4KClNpbmNlIHdlIHNob3VsZG4ndCBiZSBpbmRleGluZyBpbnRvIHRoaXMgYXJyYXkg
ZGlyZWN0bHkgYW55IG1vcmUsIHRoaXMgY29tbWVudApzaG91bGQgaW5zdGVhZCBiZSBjaGFuZ2Vk
IHRvIHNheSB3aGljaCBmdW5jdGlvbnMgc2hvdWxkIGJlIHVzZWQuCgo+ICAgKi8KPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGVkaWRfY2VhX21vZGVzXzBbXSA9IHsKPiAt
CS8qIDAgLSBkdW1teSwgVklDcyBzdGFydCBhdCAxICovCj4gLQl7IH0sCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBlZGlkX2NlYV9tb2Rlc18xW10gPSB7Cj4gIAkvKiAx
IC0gNjQweDQ4MEA2MEh6IDQ6MyAqLwo+ICAJeyBEUk1fTU9ERSgiNjQweDQ4MCIsIERSTV9NT0RF
X1RZUEVfRFJJVkVSLCAyNTE3NSwgNjQwLCA2NTYsCj4gIAkJICAgNzUyLCA4MDAsIDAsIDQ4MCwg
NDkwLCA0OTIsIDUyNSwgMCwKPiBAQCAtMzIxMSwxMCArMzIwOSw4IEBAIHN0YXRpYyB1OCAqZHJt
X2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPiAgCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2aWMp
Cj4gIHsKPiAtCWlmICghdmljKQo+IC0JCXJldHVybiBOVUxMOwo+IC0JaWYgKHZpYyA8IEFSUkFZ
X1NJWkUoZWRpZF9jZWFfbW9kZXNfMCkpCj4gLQkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18wW3Zp
Y107Cj4gKwlpZiAodmljID49IDEgJiYgdmljIDwgMSArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9k
ZXNfMSkpCj4gKwkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAtIDFdOwo+ICAJaWYgKHZp
YyA+PSAxOTMgJiYgdmljIDwgMTkzICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xOTMpKQo+
ICAJCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMTkzW3ZpYyAtIDE5M107Cj4gIAlyZXR1cm4gTlVM
TDsKPiBAQCAtMzIyNyw3ICszMjIzLDcgQEAgc3RhdGljIHU4IGNlYV9udW1fdmljcyh2b2lkKQo+
ICAKPiAgc3RhdGljIHU4IGNlYV9uZXh0X3ZpYyh1OCB2aWMpCj4gIHsKPiAtCWlmICgrK3ZpYyA9
PSBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzApKQo+ICsJaWYgKCsrdmljID09IDEgKyBBUlJB
WV9TSVpFKGVkaWRfY2VhX21vZGVzXzEpKQo+ICAJCXZpYyA9IDE5MzsKPiAgCXJldHVybiB2aWM7
Cj4gIH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
