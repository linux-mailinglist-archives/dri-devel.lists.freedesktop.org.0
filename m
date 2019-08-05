Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C98219B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B47789F61;
	Mon,  5 Aug 2019 16:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEE689F61
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:24:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so44490928edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 09:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=JXeUZYg/9AJUDSihciUvJprkRBIRGJYxSA84S9jr6q0=;
 b=KJfeG4vzdYfhZlTtRfJOC6ajNryZQBlUbGh6BlQlAW7h9cc9uEde3p2EJjVAXTB3SC
 932w1LXa2MaamghZlP/OTleHPPIoFQNSnNFwV1BT7aiPRBK64C7pPfGmFwAc92ie/idb
 6w6IopHRs9hbKzpfctKWQOyNhNxCNKWeP2zw55Ju5cM1w49zg7yLvgXRcBOJvTT0Wi76
 P+RHt+MJn1ux/8Aen55RUo9KVoc5tKxDboGsTc+PUmXMbsNblRgGNbGEP8asQf6+05T/
 oVbrXJxFg6Flwxd0fwsTIXVUuaRrPqR9VH171aNZGJaahGON1Hn3QD6DN9H1sopNJrCI
 /kcw==
X-Gm-Message-State: APjAAAVpxVytx5sLnNd+akToKKNHUtq9GP9BSImhQcquXdx8do9MctuW
 nLV6bDKYCRtbieM0f8OPQm8=
X-Google-Smtp-Source: APXvYqzgJgILAzLMJsokj9kmScwkFDvPXiNr49lKrcQbCyNQcxvTyfxcKovhyfweN3oJywoKAzHT0A==
X-Received: by 2002:a17:907:2101:: with SMTP id
 qn1mr120566592ejb.3.1565022261086; 
 Mon, 05 Aug 2019 09:24:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h10sm19069052edn.86.2019.08.05.09.24.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:24:19 -0700 (PDT)
Date: Mon, 5 Aug 2019 18:24:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH] drm/crc-debugfs: Add notes about CRC<->commit interactions
Message-ID: <20190805162417.GS7444@phenom.ffwll.local>
Mail-Followup-To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20190802140910.GN7444@phenom.ffwll.local>
 <20190805151143.12317-1-brian.starkey@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805151143.12317-1-brian.starkey@arm.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JXeUZYg/9AJUDSihciUvJprkRBIRGJYxSA84S9jr6q0=;
 b=XR2Db8aNX3U0yinlF4xRpe2Z0CZc48/D6+huDhKJ1zdxAe0Vr4yoVMRR+j5xxwaCNK
 bvVyF3Zn1J8UC+6KdhglbaxP0Ma2sECYDkvhmhdmvZBJbKPRx35uT9pL0UFNGPN4CI3/
 EBrnaGNBnFGhQt9JAjOSD0IL3HMeXhXC4jx8o=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDQ6MTE6NDNQTSArMDEwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBDUkMgZ2VuZXJhdGlvbiBjYW4gYmUgaW1wYWN0ZWQgYnkgY29tbWl0cyBjb21pbmcg
ZnJvbSB1c2Vyc3BhY2UsIGFuZAo+IGVuYWJsaW5nIENSQyBnZW5lcmF0aW9uIG1heSBpdHNlbGYg
dHJpZ2dlciBhIGNvbW1pdC4gQWRkIG5vdGVzIGFib3V0Cj4gdGhpcyB0byB0aGUga2VybmVsZG9j
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNv
bT4KPiAtLS0KPiAKPiBJIG1pZ2h0IGhhdmUgZ290IHRoZSB3cm9uZyBlbmQgb2YgdGhlIHN0aWNr
LCBidXQgdGhpcyBpcyB3aGF0IEkKPiB1bmRlcnN0b29kIGZyb20gd2hhdCB5b3Ugc2FpZC4KPiAK
PiBDaGVlcnMsCj4gLUJyaWFuCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMu
YyB8IDE1ICsrKysrKysrKysrLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oICAgICAgICAg
ICAgfCAgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3Jj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBpbmRleCA3Y2E0ODZkNzUw
ZTkuLjFkZmY5NTZiY2M3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBAQCAt
NjUsMTAgKzY1LDE3IEBACj4gICAqIGl0IHN1Ym1pdHMuIEluIHRoaXMgZ2VuZXJhbCBjYXNlLCB0
aGUgbWF4aW11bSB1c2Vyc3BhY2UgY2FuIGRvIGlzIHRvIGNvbXBhcmUKPiAgICogdGhlIHJlcG9y
dGVkIENSQ3Mgb2YgZnJhbWVzIHRoYXQgc2hvdWxkIGhhdmUgdGhlIHNhbWUgY29udGVudHMuCj4g
ICAqCj4gLSAqIE9uIHRoZSBkcml2ZXIgc2lkZSB0aGUgaW1wbGVtZW50YXRpb24gZWZmb3J0IGlz
IG1pbmltYWwsIGRyaXZlcnMgb25seSBuZWVkIHRvCj4gLSAqIGltcGxlbWVudCAmZHJtX2NydGNf
ZnVuY3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZSBhdXRvbWF0aWNhbGx5
Cj4gLSAqIHNldCB1cCBpZiB0aGF0IHZmdW5jIGlzIHNldC4gQ1JDIHNhbXBsZXMgbmVlZCB0byBi
ZSBjYXB0dXJlZCBpbiB0aGUgZHJpdmVyIGJ5Cj4gLSAqIGNhbGxpbmcgZHJtX2NydGNfYWRkX2Ny
Y19lbnRyeSgpLgo+ICsgKiBPbiB0aGUgZHJpdmVyIHNpZGUgdGhlIGltcGxlbWVudGF0aW9uIGVm
Zm9ydCBpcyBtaW5pbWFsLCBkcml2ZXJzIG9ubHkgbmVlZAo+ICsgKiB0byBpbXBsZW1lbnQgJmRy
bV9jcnRjX2Z1bmNzLnNldF9jcmNfc291cmNlLiBUaGUgZGVidWdmcyBmaWxlcyBhcmUKPiArICog
YXV0b21hdGljYWxseSBzZXQgdXAgaWYgdGhhdCB2ZnVuYyBpcyBzZXQuIENSQyBzYW1wbGVzIG5l
ZWQgdG8gYmUgY2FwdHVyZWQKPiArICogaW4gdGhlIGRyaXZlciBieSBjYWxsaW5nIGRybV9jcnRj
X2FkZF9jcmNfZW50cnkoKS4gRGVwZW5kaW5nIG9uIHRoZSBkcml2ZXIKPiArICogYW5kIEhXIHJl
cXVpcmVtZW50cywgJmRybV9jcnRjX2Z1bmNzLnNldF9jcmNfc291cmNlIG1heSByZXN1bHQgaW4g
YSBjb21taXQKPiArICogKGV2ZW4gYSBmdWxsIG1vZGVzZXQpLgo+ICsgKgo+ICsgKiBJdCdzIGFs
c28gcG9zc2libGUgdGhhdCBhICJub3JtYWwiIGNvbW1pdCB2aWEgRFJNX0lPQ1RMX01PREVfQVRP
TUlDIG9yIHRoZQo+ICsgKiBsZWdhY3kgcGF0aHMgbWF5IGludGVyZmVyZSB3aXRoIENSQyBnZW5l
cmF0aW9uLiBTbywgaW4gdGhlIGdlbmVyYWwgY2FzZSwKPiArICogdXNlcnNwYWNlIGNhbid0IHJl
bHkgb24gdGhlIHZhbHVlcyBpbiBjcnRjLU4vY3JjL2RhdGEgYmVpbmcgdmFsaWQKPiArICogYWNy
b3NzIGEgY29tbWl0LgoKSXQncyBub3QganVzdCB0aGUgdmFsdWVzLCBidXQgdGhlIGdlbmVyYXRp
b24gaXRzZWxmIG1pZ2h0IGdldCBkaXNhYmxlZAooZS5nLiBvbiBpOTE1IGlmIHlvdSBzZWxlY3Qg
ImF1dG8iIG9uIHNvbWUgY2hpcHMgeW91IGdldCB0aGUgRFAgcG9ydApzYW1wbGluZyBwb2ludCwg
YnV0IGZvciBIRE1JIG1vZGUgeW91IGdldCBhIGRpZmZlcmVudCBzYW1wbGluZyBwbG9pbnQsIGFu
ZAppZiB5b3UgZ2V0IHRoZSB3cm9uZyBvbmUgdGhlcmUgd29uJ3QgYmUgYW55IGNyYyBmb3IgeW91
KS4gQWxzbyBpdCdzIG5vdApqdXN0IGFueSBhdG9taWMgY29tbWl0LCBvbmx5IHRoZSBvbmVzIHdp
dGggQUxMT1dfTU9ERVNFVC4KCk1heWJlIHNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyB0ZXh0OgoK
IlBsZWFzZSBub3RlIHRoYXQgYW4gYXRvbWljIG1vZGVzZXQgY29tbWl0IHdpdGggdGhlCkRSTV9N
T0RFX0FUT01JQ19BTExPV19NT0RFU0VULCBvciBhIGNhbGwgdG8gdGhlIGxlZ2FjeSBTRVRDUlRS
IGlvY3RsCih3aGljaCBhbW91bnRzIHRvIHRoZSBzYW1lKSwgY2FuIGRlc3RyeSB0aGUgQ1JDIHNl
dHVwIGR1ZSB0byBoYXJkd2FyZQpyZXF1aXJlbWVudHMuIFRoaXMgcmVzdWx0cyBpbiBpbmNvbnNp
c3RlbnQgQ1JDIHZhbHVlcyBvciBub3QgZXZlbiBhbnkgQ1JDCnZhbHVlcyBnZW5lcmF0ZWQuIEdl
bmVyaWMgdXNlcnNwYWNlIHRoZXJlZm9yZSBuZWVkcyB0byByZS1zZXR1cCB0aGUgQ1JDCmFmdGVy
IGVhY2ggc3VjaCBtb2Rlc2V0LiIKCj4gIAo+ICBzdGF0aWMgaW50IGNyY19jb250cm9sX3Nob3co
c3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fY3J0Yy5oIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAo+IGluZGV4IDEyOGQ4YjIxMDYy
MS4uMGY3ZWEwOTRhOTAwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiAr
KysgYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gQEAgLTc1Niw2ICs3NTYsOCBAQCBzdHJ1Y3Qg
ZHJtX2NydGNfZnVuY3Mgewo+ICAJICogcHJvdmlkZWQgZnJvbSB0aGUgY29uZmlndXJlZCBzb3Vy
Y2UuIERyaXZlcnMgbXVzdCBhY2NlcHQgYW4gImF1dG8iCj4gIAkgKiBzb3VyY2UgbmFtZSB0aGF0
IHdpbGwgc2VsZWN0IGEgZGVmYXVsdCBzb3VyY2UgZm9yIHRoaXMgQ1JUQy4KPiAgCSAqCj4gKwkg
KiBUaGlzIG1heSB0cmlnZ2VyIGEgY29tbWl0IGlmIG5lY2Vzc2FyeSwgdG8gZW5hYmxlIENSQyBn
ZW5lcmF0aW9uLgoKSSdkIGNsYXJpZnkgdGhpcyBhcyAiYXRvbWljIG1vZGVzZXQgY29tbWl0IiBq
dXN0IHRvIGJlIHN1cmUuCgpXaXRoIHRoZXNlIHR3byBjb21tZW50cyBhZGRyZXNzZWQgc29tZWhv
dzoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoK
Cj4gKwkgKgo+ICAJICogTm90ZSB0aGF0ICJhdXRvIiBjYW4gZGVwZW5kIHVwb24gdGhlIGN1cnJl
bnQgbW9kZXNldCBjb25maWd1cmF0aW9uLAo+ICAJICogZS5nLiBpdCBjb3VsZCBwaWNrIGFuIGVu
Y29kZXIgb3Igb3V0cHV0IHNwZWNpZmljIENSQyBzYW1wbGluZyBwb2ludC4KPiAgCSAqCj4gQEAg
LTc2Nyw2ICs3NjksNyBAQCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3Mgewo+ICAJICogMCBvbiBzdWNj
ZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+ICAJICovCj4gIAlpbnQg
KCpzZXRfY3JjX3NvdXJjZSkoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFyICpzb3Vy
Y2UpOwo+ICsKPiAgCS8qKgo+ICAJICogQHZlcmlmeV9jcmNfc291cmNlOgo+ICAJICoKPiAtLSAK
PiAyLjE3LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
