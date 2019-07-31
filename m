Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA47BBB0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 10:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D9989ACD;
	Wed, 31 Jul 2019 08:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C0289ACC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:30:09 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so64928600edr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 01:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=JgH28VsQCEs5lBFCl/HW+iDF5pqXhCpcPtH4d3l7Gss=;
 b=qvxNLgeCArlycwKGtIcn0owOy5cpn/HgD2bg+C1N7AwFjI/7keGid7pDLBjx+7EdaJ
 CcCavb8IatOlLcgHtFC0Tc2MXQQv9gPus1PRZl/rdSSn+Li9DPydgqgft4Zkvgw02msW
 njx2Z4WJ/Bcp12d8M7WS4b0fSC3KQMiKvjMOVwHv+h8cei2qD+ZuKhKnrpNzeXtiPB5P
 Ij3G1IS78xoJ1HQwSA9k6BuBfBvK3ziX05TLeT0ul5vKRlOBmIADFzrned7+jXaNe0mE
 Iofx6et2dY5UTP+FSWiTAQqkJ7WOh4PDfVF+nFDPZBlNZpyz91NSoA+Z+873qSJtZvpe
 yodQ==
X-Gm-Message-State: APjAAAXglcmtvs4LWlpAD1AusEf6X7trZJcSDdRg1726xoEZij8O4IRk
 gG388z680nJ2L5ar3m9CzxI=
X-Google-Smtp-Source: APXvYqxUClg+hymug+sReej1HKnbrHTTTd2GdXPeZrCCrjmOEOPFJ4pJWRRSeHBF9HGci08JOLY5mg==
X-Received: by 2002:a17:907:2101:: with SMTP id
 qn1mr94859635ejb.3.1564561807715; 
 Wed, 31 Jul 2019 01:30:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id br13sm12348127ejb.92.2019.07.31.01.30.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:30:07 -0700 (PDT)
Date: Wed, 31 Jul 2019 10:30:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] drm: use trace_printk rather than printk in drm_dbg.
Message-ID: <20190731083005.GF7444@phenom.ffwll.local>
Mail-Followup-To: Joe Perches <joe@perches.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190731062416.26238-1-huangfq.daxian@gmail.com>
 <29b3741ca8a9e94d64dba213059abb2296c30936.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29b3741ca8a9e94d64dba213059abb2296c30936.camel@perches.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgH28VsQCEs5lBFCl/HW+iDF5pqXhCpcPtH4d3l7Gss=;
 b=KFDb09LmsH2sr+kaB10au1eADIFAwq8Vg+D3qKetvDq2VLWvZC+TP/bYUGtI4gPtnK
 BKMxmD7pvuYLfDfn6OAMr1ALMSX/O50sYdkvNOupDyDCM97kTtO2cWK2d89cW+SvHvYS
 ParjeXDY6tFOQrwOQHShj0y5savr4LX6MOEZg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTE6MjY6MzJQTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gV2VkLCAyMDE5LTA3LTMxIGF0IDE0OjI0ICswODAwLCBGdXFpYW4gSHVhbmcgd3Jv
dGU6Cj4gPiBJbiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWguYywKPiA+IGFt
ZGdwdV9paF9wcm9jZXNzIGNhbGxzIERSTV9ERUJVRyB3aGljaCBjYWxscyBkcm1fZGJnIGFuZAo+
ID4gZmluYWxseSBjYWxscyBwcmludGsuCj4gPiBBcyBhbWRncHVfaWhfcHJvY2VzcyBpcyBjYWxs
ZWQgZnJvbSBhbiBpbnRlcnJ1cHQgaGFuZGxlciwKPiA+IGFuZCBpbnRlcnJ1cHQgaGFuZGxlciBz
aG91bGQgYmUgc2hvcnQgYXMgcG9zc2libGUuCj4gPiAKPiA+IEFzIHByaW50ayBtYXkgbGVhZCB0
byBib2dnaW5nIGRvd24gdGhlIHN5c3RlbSBvciBjYW4gZXZlbgo+ID4gY3JlYXRlIGEgbGl2ZSBs
b2NrLiBwcmludGsgc2hvdWxkIG5vdCBiZSB1c2VkIGluIElSUSBjb250ZXh0Lgo+ID4gSW5zdGVh
ZCwgdHJhY2VfcHJpbnRrIGlzIHJlY29tbWVuZGVkIGluIElSUSBjb250ZXh0Lgo+ID4gTGluazog
aHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzM2NTgzNQo+ID4gCj4gPiBSZXZpZXdlZC1ieTogSm9l
IFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gCj4gCj4gSSBtYWRlIGEgc3VnZ2VzdGlvbi4gIEkg
ZGlkIG5vdCByZXZpZXcgdGhpcy4KPiAKPiBQbGVhc2UgZG8gbm90IGFkZCBzaWduYXR1cmVzIGxp
a2UgdGhpcyBpZgo+IG5vdCBzcGVjaWZpY2FsbHkgZ2l2ZW4gYnkgc29tZW9uZS4KCisxCgo+ID4g
U2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAgIC0gT25seSBtYWtlIHRoZSBpbnRlcnJ1cHQg
dXNlcyB0aGUgdHJhY2VfcHJpbnRrIHRvIGF2b2lkCj4gPiAgICAgYWxsIDQwMDArIGRybV9kYmcv
RFJNX0RFQlVHIHVzZXMgZW1pdHRpbmcgYSB0cmFjZV9wcmludGsuCj4gPiAKPiA+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW50LmMgfCAxMCArKysrKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwo+
ID4gaW5kZXggYTE3YzhhMTRkYmE0Li43NDc4MzVkMTZmYTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bnQuYwo+ID4gQEAgLTIzNiw5ICsyMzYsMTMgQEAgdm9pZCBkcm1fZGJnKHVuc2lnbmVkIGludCBj
YXRlZ29yeSwgY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pCgpSaWdodCBhYm92ZSBoZXJlIGlzIGEg
Y2hlY2sgZm9yIGRybV9kZWJ1Zywgd2hpY2ggZGVmYXVsdHMgdG8gb2ZmLCBzbyBpbgpwcm9kdWN0
aW9uIHRoaXMgYWxsIGhhcyAwIGltcGFjdC4gQnV0IGNoYW5naW5nIGFsbCB0aGUgZGVidWcgb3V0
cHV0IGZyb20KZG1lc2cgdG8gdHJhY2luZyBpcyBzdXJlIHRvIGJyZWFrIGV2ZXJ5b25lJ3MgQ0kg
YW5kIHRlc3Qgc2V0dXBzLgoKSSdtIGFsbCBmb3IgY2xlYW5pbmcgdXAgdGhlIGRybSBsb2dnaW5n
IHN0dWZmIChpdCdzIGEgcmVhbCBtZXNzKSwgYnV0IGl0J3MKYSB2ZXJ5IGRlbGljYXRlIGhvdXNl
IG9mIGNhcmRzIGFuZCB3aXRoIHRob3VzYW5kcyBvZiB1c2Vycywgbm90IGVhc3kgdG8KY2hhbmdl
LiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgcmVhbGx5IGhhdmUgYSBzb2xpZCByZWNvbW1lbmRhdGlv
biBmb3Igd2hhdAp0aGUgaWRlYWwgZHJtIGxvZ2dpbmcgc2hvdWxkIGxvb2sgbGlrZS4gUGx1cyB3
ZSBhbHJlYWR5IGhhdmUgYSBwaWxlIG9mCmNvbXBldGluZyBhcHByb2FjaGVzIC4uLgotRGFuaWVs
Cgo+ID4gIAl2YWYuZm10ID0gZm9ybWF0Owo+ID4gIAl2YWYudmEgPSAmYXJnczsKPiA+ICAKPiA+
IC0JcHJpbnRrKEtFUk5fREVCVUcgIlsiIERSTV9OQU1FICI6JXBzXSAlcFYiLAo+ID4gLQkgICAg
ICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCAmdmFmKTsKPiA+IC0KPiA+ICsJaWYgKGlu
X2ludGVycnVwdCgpKSB7Cj4gPiArCQl0cmFjZV9wcmludGsoS0VSTl9ERUJVRyAiWyIgRFJNX05B
TUUgIjolcHNdICVwViIsCj4gPiArCQkgICAgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDAp
LCAmdmFmKTsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJCXByaW50ayhLRVJOX0RFQlVHICJbIiBEUk1f
TkFNRSAiOiVwc10gJXBWIiwKPiA+ICsJCSAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3Mo
MCksICZ2YWYpOwo+ID4gKwl9Cj4gPiAgCXZhX2VuZChhcmdzKTsKPiA+ICB9Cj4gPiAgRVhQT1JU
X1NZTUJPTChkcm1fZGJnKTsKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
