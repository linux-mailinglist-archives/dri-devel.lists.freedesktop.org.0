Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ACE261A46
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D684E6E8A6;
	Tue,  8 Sep 2020 18:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021D6E8A6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599590068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1bqVudAN6PTbMT2dOHXBPWk66L7Z68motaomVT1aFw=;
 b=ZYgE+4PkSJb3jSSNDt2dIK7RWWSfqzcz80m5Miim5e7CEManjqyijHWsW0w/q48XGHZsC7
 TZIYN+uZvRyDurEeDnyX6Ix8QBPEqsfECKJIHod7KocqsRAE4WblJUw6nheSmQ8dlipMVK
 paVlEakXDhjfoIsvDv8slcWEsb0f8HI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-KI3H_XQeNOuoAo-E3H-cGg-1; Tue, 08 Sep 2020 14:34:26 -0400
X-MC-Unique: KI3H_XQeNOuoAo-E3H-cGg-1
Received: by mail-qt1-f200.google.com with SMTP id r22so128031qtc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=a1bqVudAN6PTbMT2dOHXBPWk66L7Z68motaomVT1aFw=;
 b=cU3WToSXsgfIPLs6g9Z0Hq9F2ll2bI2+a0AAo1z/m9K24rzIKJr3M316z4CxEQb49U
 MLp7rZcDu8vgfnS77oLJ8EUlsT3uKWOHYjuLLmtHOVSIdXsnp1kNGj4OxfIgmIen8UxK
 Tq/qrp4MQJxSSqjQjCEAHmFwtt7dCp8X7crq13IK+V6iUQ7hGC/8djBiPafHAVW75XP+
 iCKXiOLbyCUA1dJNxhwObSQuqO4hiO9+xDO7eQmIGvVtJpVaiktUvkoydETEQ6DpenjM
 3nLwOIH1psGc1wPQTBg6T5+bLNIoDD4PXCOi4KN7VkRrbWGc9Lchxe6M2Pw1VFlVWdyn
 bC5w==
X-Gm-Message-State: AOAM533Ij2jkB173DYWxaXxMS0Vck7O91V5vBrNOkaG3m2CRhbRxQ+Ad
 YSDvHy31RZI0nE8r2ilvIA5d21Xw4fmP1x69TNWebVr+1NhXFU4v9rOfzdRHqVc3lR6qoSbz3VE
 Ao36XyY0eMV5RlGbJu4NqXZSrgJFY
X-Received: by 2002:aed:2fe7:: with SMTP id m94mr1484477qtd.34.1599590066179; 
 Tue, 08 Sep 2020 11:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwErw3SP+Nwgr+3Ww39e/A26hwYIDDnZxTAad/LjvcLst1HC4Ta0nDxvynY0drrkZkkFswT9g==
X-Received: by 2002:aed:2fe7:: with SMTP id m94mr1484460qtd.34.1599590065946; 
 Tue, 08 Sep 2020 11:34:25 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e10sm278672qtq.59.2020.09.08.11.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:34:25 -0700 (PDT)
Message-ID: <fa772231854424f2b4edc69e23b0edd924695e6c.camel@redhat.com>
Subject: Re: [PATCH v2 00/18] drm/i915: Pimp DP DFP handling
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 08 Sep 2020 14:34:24 -0400
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgbml0cGlja3MgYWRkcmVzc2VkIChub3RlIHRoZXJlIHdlcmUgYSBjb3VwbGUgb2Yg
b3RoZXIgc3BvdHMgd2hlcmUgd2UKd2FudGVkIHRvIHVzZSBSZXR1cm46IGluIHRoZSBrZG9jcywg
YnV0IEkgZGlkbid0IGJvdGhlciBwb2ludGluZyBhbGwgb2YgdGhlbQpvdXQpLCBhbGwgYnV0IHBh
dGNoIDA3IGlzOgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpP
biBGcmksIDIwMjAtMDktMDQgYXQgMTQ6NTMgKzAzMDAsIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4g
RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAK
PiBBdHRlbXB0IHRvIGRlYWwgd2l0aCBEUCBkb3duc3RyZWFtIGZhY2luZyBwb3J0cyAoREZQKSBt
b3JlCj4gdGhvcm91Z2hseS4gVGhpcyBpbnZvbHZlcyByZWFkaW5nIG1vcmUgb2YgdGhlIHBvcnQg
Y2Fwcwo+IGFuZCBkZWFsaW5nIHdpdGggdmFyaW91cyBjbG9jay9icGMgbGltaXRhdGlvbnMuCj4g
Cj4gQW5kIHdlIHRyeSB0byBlbmFibGUgWUNiQ3IgNDQ0LT40MjAgY29udmVyc2lvbiBmb3IgSERN
SSBERlBzCj4gd2hpY2ggY291bGQgYWxsb3cgc29tZSA0ayBkaXNwbGF5cyB0byBhY3R1YWxseSB1
c2UgNGsgb24KPiBwcmUtaWNsIGhhcmR3YXJlICh3aGljaCBkb2Vzbid0IGhhdmUgbmF0aXZlIDQy
MCBvdXRwdXQpLAo+IGFzc3VtaW5nIHdlIGRvbid0IHJ1biBpbnRvIHNvbWUgb3RoZXIgaGFyZHdh
cmUgbGltaXRzLgo+IAo+IEkgZHJvcHBlZCBteSBlYXJsaWVyIHBhdGNoZXMgdG8gYWxzbyBob29r
IGluIHRoZSBEUCBkdWFsIG1vZGUKPiBhZGFwdGVyIHByb2Jpbmcgc2luY2Ugc2FkbHkgSSd2ZSBu
b3QgYWN0dWFsbHkgc2VlbiBhIERQLT5EUCsrCj4gZG9uZ2xlIHRoYXQgcGFzc2VzIHRocm91Z2gg
dGhlIGkyYyB0cmFmZmljIGZvciB0aG9zZS4KPiAKPiBPbmx5IHBpbXBlZCB0aGUgU1NUIHNpZGUg
b2YgdGhpbmdzLiBOb3Qgc3VyZSB3aGF0IHdvdWxkCj4gYmUgcmVxdWlyZWQgdG8gZ2V0IGl0IGFs
bCB3b3JraW5nIGZvciBNU1QuCj4gCj4gVmlsbGUgU3lyasOkbMOkICgxOCk6Cj4gICBkcm0vZHA6
IER1bXAgZG93bnN0cmVhbSBmYWNpbmcgcG9ydCBjYXBzCj4gICBkcm0vaTkxNS9sc3Bjb246IERv
IG5vdCBzZW5kIGluZm9mcmFtZXMgdG8gbm9uLUhETUkgc2lua3MKPiAgIGRybS9kcDogRGVmaW5l
IHByb3RvY29sIGNvbnZlcnRlciBEUENEIHJlZ2lzdGVycwo+ICAgZHJtL2RwOiBEZWZpbmUgbW9y
ZSBkb3duc3RyZWFtIGZhY2luZyBwb3J0IGNhcHMKPiAgIGRybS9pOTE1OiBSZXdvcmtkIERGUCBt
YXggYnBjIGhhbmRsaW5nCj4gICBkcm0vZHA6IEFkZCBoZWxwZXJzIHRvIGlkZW50aWZ5IGRvd25z
dHJlYW0gZmFjaW5nIHBvcnQgdHlwZXMKPiAgIGRybS9kcDogUGltcCBkcm1fZHBfZG93bnN0cmVh
bV9tYXhfYnBjKCkKPiAgIGRybS9kcDogUmVkbyBkcm1fZHBfZG93bnN0cmVhbV9tYXhfY2xvY2so
KSBhcwo+ICAgICBkcm1fZHBfZG93bnN0cmVhbV9tYXhfZG90Y2xvY2soKQo+ICAgZHJtL2k5MTU6
IFJld29ya2QgRFAgREZQIGNsb2NrIGhhbmRsaW5nCj4gICBkcm0vZHA6IEFkZCBkcm1fZHBfZG93
bnN0cmVhbV97bWluLG1heH1fdG1kc19jbG9jaygpCj4gICBkcm0vaTkxNTogRGVhbCB3aXRoIFRN
RFMgREZQIGNsb2NrIGxpbWl0cwo+ICAgZHJtL2k5MTU6IENvbmZpZ3VyZSBEUCAxLjMrIHByb3Rv
Y29sIGNvbnZlcnRlZCBIRE1JIG1vZGUKPiAgIGRybS9kcDogQWRkIGRybV9kcF9kb3duc3RyZWFt
X21vZGUoKQo+ICAgZHJtL2k5MTU6IEhhbmRsZSBkb3duc3RyZWFtIGZhY2luZyBwb3J0cyB3L28g
RURJRAo+ICAgZHJtL2k5MTU6IEV4dHJhY3QgaW50ZWxfaGRtaV9oYXNfYXVkaW8oKQo+ICAgZHJt
L2k5MTU6IERQLT5IRE1JIFRNRFMgY2xvY2sgbGltaXRzIHZzLiBkZWVwIGNvbG9yCj4gICBkcm0v
ZHA6IEFkZCBoZWxwZXJzIGZvciBERlAgWUNiQ3IgNDoyOjAgaGFuZGxpbmcKPiAgIGRybS9pOTE1
OiBEbyBZQ2JDciA0NDQtPjQyMCBjb252ZXJzaW9uIHZpYSBEUCBwcm90b2NvbCBjb252ZXJ0ZXJz
Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgICAgICB8IDM4
MiArKysrKysrKysrKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAg
ICAgICAgICAgICAgIHwgIDE5ICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYyAgICAgIHwgIDExICstCj4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfZGVidWdmcy5jICB8ICAgMyArLQo+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5X3R5cGVzLmggICAgfCAgIDkgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMgICAgICAgfCAzMDQgKysrKysrKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgICAgIHwgIDgyICsrLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmggICAgIHwgICAyICsKPiAgaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgIHwgIDYzICsrLQo+ICBpbmNsdWRlL2RybS9k
cm1fZWRpZC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+ICAxMSBmaWxlcyBjaGFu
Z2VkLCA3MzggaW5zZXJ0aW9ucygrKSwgMTQyIGRlbGV0aW9ucygtKQo+IAotLSAKQ2hlZXJzLAoJ
THl1ZGUgUGF1bCAoc2hlL2hlcikKCVNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
