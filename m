Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8E30B27B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 23:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECF36E88B;
	Mon,  1 Feb 2021 22:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C686E88B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 22:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612217065;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfsnAlAu/McYcGw2KOXJYqmGsyF1QR4l7YGKSVjsOzo=;
 b=PFvLQPrsdWlblVE7i6/UTZpC7ZRX5q8JauFIkg6OtNfl8PDTVSWP2Z//8nQDQTI3aT8kli
 oeYBjKVlCQM7hcdXoiw4P387UmQtx9SHirjlGPtWFXFaxU0ltVdujwV3McRrWyyk7/z1+e
 kgviNRz8fHloXNs3JcnKxxlyqocqauc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-qDwC1JyhNFSFb5a0-A48nA-1; Mon, 01 Feb 2021 17:04:21 -0500
X-MC-Unique: qDwC1JyhNFSFb5a0-A48nA-1
Received: by mail-qt1-f197.google.com with SMTP id o20so11627064qtx.22
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 14:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qfsnAlAu/McYcGw2KOXJYqmGsyF1QR4l7YGKSVjsOzo=;
 b=hK0r0qcGr18SFd4zEoateAEg21I3mc+CH9bPiZ9cupNgM2FMbFXElOdKx5V2f6hIgE
 1O5/75691c6UquCellhqQtqA20a8054p7oh0voAkwZW21xhBoSpM6BbUz090Y8z1DUiU
 /hGwgRTq3MsZomCpkgb12B/qdfdEtdcuf09FZdBa1L7TuSNqd4Oruy8XeWrz+A75Qo/D
 CjLkZiDNcuPVk0Zl8sUvyPUBcifTboNtpvvuFceJCJLmF+I/ZY2iSBycyGs3rVKxJ9Tx
 NAmGr/mK6ZfQ3c30J+hUmQgHHGgCe0w//sjQxyJgyZ3z5pCMaUYQEpjOAzd5WR43dRD2
 NeVw==
X-Gm-Message-State: AOAM531hF74SjwXVZUytVQnnP5pkO7/EQ/Scj9DGuDORuroKFhmZd+Oj
 oHl8SlHMDlBhj42dGmzYcACrukyVM/+1/N6KJn6UTgZaR3SvWJ/nAs9IS4TG6W6++gRelcEHdgm
 O83AlpH04BfNB6QhY9luW7QWl7WtW
X-Received: by 2002:a05:620a:9cc:: with SMTP id
 y12mr18096794qky.484.1612217061534; 
 Mon, 01 Feb 2021 14:04:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxx/YAAPANhE5btY2ANJn+PQ9MAKqUA1ToMGepGc4545upibD3KSYzj+Fvtch0454gUx+De0w==
X-Received: by 2002:a05:620a:9cc:: with SMTP id
 y12mr18096783qky.484.1612217061352; 
 Mon, 01 Feb 2021 14:04:21 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id b17sm1613323qkh.57.2021.02.01.14.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 14:04:20 -0800 (PST)
Message-ID: <6d9dfeddd11ebe548b70898457452167af75e1ad.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/dp_mst: Don't report ports connected if nothing
 is attached to them
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
Date: Mon, 01 Feb 2021 17:04:19 -0500
In-Reply-To: <20210201120145.350258-1-imre.deak@intel.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
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
Reply-To: lyude@redhat.com
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHRoZSB3aG9sZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KCk9uIE1vbiwgMjAyMS0wMi0wMSBhdCAxNDowMSArMDIwMCwgSW1yZSBEZWFrIHdy
b3RlOgo+IFJlcG9ydGluZyBhIHBvcnQgYXMgY29ubmVjdGVkIGlmIG5vdGhpbmcgaXMgYXR0YWNo
ZWQgdG8gdGhlbSBsZWFkcyB0bwo+IGFueSBpMmMgdHJhbnNhY3Rpb25zIG9uIHRoaXMgcG9ydCB0
cnlpbmcgdG8gdXNlIGFuIHVuaW5pdGlhbGl6ZWQgaTJjCj4gYWRhcHRlciwgZml4IHRoaXMuCj4g
Cj4gTGV0J3MgYWNjb3VudCBmb3IgdGhpcyBjYXNlIGV2ZW4gaWYgYnJhbmNoIGRldmljZXMgaGF2
ZSBubyBnb29kIHJlYXNvbgo+IHRvIHJlcG9ydCBhIHBvcnQgYXMgdW5wbHVnZ2VkIHdpdGggdGhl
aXIgcGVlciBkZXZpY2UgdHlwZSBzZXQgdG8gJ25vbmUnLgo+IAo+IEZpeGVzOiBkYjFhMDc5NTY5
NjggKCJkcm0vZHBfbXN0OiBIYW5kbGUgU1NULW9ubHkgYnJhbmNoIGRldmljZSBjYXNlIikKPiBS
ZWZlcmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNz
dWVzLzI5ODcKPiBSZWZlcmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2ludGVsLy0vaXNzdWVzLzE5NjMKPiBDYzogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4K
PiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+ICMgdjUuNSsKPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxICsKPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jCj4gaW5kZXggZTgyYjU5NmQ2NDZjLi5kZWI3OTk1ZjQyZmEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtNDIyNCw2ICs0MjI0LDcgQEAgZHJtX2Rw
X21zdF9kZXRlY3RfcG9ydChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+IMKgCj4g
wqDCoMKgwqDCoMKgwqDCoHN3aXRjaCAocG9ydC0+cGR0KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoGNh
c2UgRFBfUEVFUl9ERVZJQ0VfTk9ORToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
YnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgRFBfUEVFUl9ERVZJQ0VfTVNUX0JSQU5DSElO
RzoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghcG9ydC0+bWNzKQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGNvbm5l
Y3Rvcl9zdGF0dXNfY29ubmVjdGVkOwoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hl
L2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdp
dGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElm
IHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVy
Z2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBw
bGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBz
dGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
