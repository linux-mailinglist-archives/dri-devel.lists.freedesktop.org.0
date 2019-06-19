Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC254C1AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 21:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818316E356;
	Wed, 19 Jun 2019 19:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCB26E356
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 19:46:13 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id r6so274511oti.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AppOhepgnEe0jjnJnZQBJyzyqCwLm69rPfFkLY+t1bc=;
 b=D0PIO/f/Aap1o8t/O+5NQKT1bFLBpB/w2EGQst7qqB6FhLhcmFp283v8dSFTLHRkqr
 z0Mf0QRX8Til3pn45CEOseabnm/2+q6lxSyaoE6wQKpiCclnSBOuXeXuObS75sCUh/Qh
 FE0WVDzv88nIgFmut8oRjuBShaLMb1cMuH47wL7JJ0zTNubM4hN681xa0D7cuVVskMZb
 bmn2Dut2AC0C3cefjctnVxBNx7rQOvDtolNpWUdh56ZBMyCtYqBlDtnJlUJlIGPXZhoB
 VrTlfz3WPLC11U1YlAkhCfrPBsrPuKe4EB9/C339ODSzV3h42+CQqUovgAnQDa8wVlkO
 JCKA==
X-Gm-Message-State: APjAAAXah28iBBucluYLQfGWL49s36iYLz6qfNYzG7XSE+iN1pK1xKvf
 a769rEAZt5593XrY1g4BxrnNPagPXduEF4X3njLbDg==
X-Google-Smtp-Source: APXvYqyF4/fQjVQSHjLx0TTlLSRvNfoC1XWgfZBLjCA5t1eNPRU75djqD3lZLhJzoRPj37ekmpc9LL5nqKSkBxWsIsE=
X-Received: by 2002:a9d:470d:: with SMTP id a13mr36193657otf.126.1560973572970; 
 Wed, 19 Jun 2019 12:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
 <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
 <20190619192719.GO9374@mellanox.com>
In-Reply-To: <20190619192719.GO9374@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 19 Jun 2019 12:46:01 -0700
Message-ID: <CAPcyv4j+zk_5WvFXbUbQ7bWisjWSwzwLsXide1AuVL4kLX8iyQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AppOhepgnEe0jjnJnZQBJyzyqCwLm69rPfFkLY+t1bc=;
 b=L+LW3co1OBHWplV01UpK1fvt6NIcRF2qR2+gyrISeEZDbLPi91YZXqNIJExJQhxjVL
 7NO7u5O4wqUQFCjZA8X/xN5IC6nTONNL0PLEmadz1t01bknVW+LPFjhIpUDlZICWj1OK
 Gog3pb+AQtERVqv6j7fTaoTVYFpk5W1Hfef0DgmAjMPes0MNZ9hclPMHOd3R6z/1niZy
 xhltfPQTbipOo4AOyWvfdtdcgObLiRuElMk7blxcxcA8+NrVrohUYIrXM1xWntr04dh1
 fdyvcy8a9IUZO0qDkJUM7+nBLab/Ub+ZVWPgR39zFgOFrotnlWhaK61bEldeFuweA1TX
 hgpA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6NDIgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA2OjIzOjA0UE0g
LTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPiA+IE9uIDYvMTMvMTkgNTo0MyBQTSwgSXJhIFdl
aW55IHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAwNzo1ODoyOVBNICswMDAw
LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+PiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAx
Mjo1MzowMlBNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiA+ID4+Pgo+ID4gLi4uCj4g
PiA+PiBIdW0sIHNvIHRoZSBvbmx5IHRoaW5nIHRoaXMgY29uZmlnIGRvZXMgaXMgc2hvcnQgY2ly
Y3VpdCBoZXJlOgo+ID4gPj4KPiA+ID4+IHN0YXRpYyBpbmxpbmUgYm9vbCBpc19kZXZpY2VfcHVi
bGljX3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+PiB7Cj4gPiA+PiAgICAgICAg
IHJldHVybiBJU19FTkFCTEVEKENPTkZJR19ERVZfUEFHRU1BUF9PUFMpICYmCj4gPiA+PiAgICAg
ICAgICAgICAgICAgSVNfRU5BQkxFRChDT05GSUdfREVWSUNFX1BVQkxJQykgJiYKPiA+ID4+ICAg
ICAgICAgICAgICAgICBpc196b25lX2RldmljZV9wYWdlKHBhZ2UpICYmCj4gPiA+PiAgICAgICAg
ICAgICAgICAgcGFnZS0+cGdtYXAtPnR5cGUgPT0gTUVNT1JZX0RFVklDRV9QVUJMSUM7Cj4gPiA+
PiB9Cj4gPiA+Pgo+ID4gPj4gV2hpY2ggaXMgY2FsbGVkIGFsbCBvdmVyIHRoZSBwbGFjZS4uCj4g
PiA+Cj4gPiA+IDxzaWdoPiAgeWVzIGJ1dCB0aGUgZWFybGllciBwYXRjaDoKPiA+ID4KPiA+ID4g
W1BBVENIIDAzLzIyXSBtbTogcmVtb3ZlIGhtbV9kZXZtZW1fYWRkX3Jlc291cmNlCj4gPiA+Cj4g
PiA+IFJlbW92ZXMgdGhlIG9ubHkgcGxhY2UgdHlwZSBpcyBzZXQgdG8gTUVNT1JZX0RFVklDRV9Q
VUJMSUMuCj4gPiA+Cj4gPiA+IFNvIEkgdGhpbmsgaXQgaXMgb2suICBGcmFua2x5IEkgd2FzIHdv
bmRlcmluZyBpZiB3ZSBzaG91bGQgcmVtb3ZlIHRoZSBwdWJsaWMKPiA+ID4gdHlwZSBhbHRvZ2V0
aGVyIGJ1dCBjb25jZXB0dWFsbHkgaXQgc2VlbXMgb2suICBCdXQgSSBkb24ndCBzZWUgYW55IHVz
ZXJzIG9mIGl0Cj4gPiA+IHNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUgY29k
ZSByYXRoZXIgdGhhbiB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwo+ID4gPgo+ID4gPiBJcmEKPiA+
Cj4gPiBUaGF0IHNlZW1zIHJlYXNvbmFibGUuIEkgcmVjYWxsIHRoYXQgdGhlIGhvcGUgd2FzIGZv
ciB0aG9zZSBJQk0gUG93ZXIgOQo+ID4gc3lzdGVtcyB0byB1c2UgX1BVQkxJQywgYXMgdGhleSBo
YXZlIGhhcmR3YXJlLWJhc2VkIGNvaGVyZW50IGRldmljZSAoR1BVKQo+ID4gbWVtb3J5LCBhbmQg
c28gdGhlIG1lbW9yeSByZWFsbHkgaXMgdmlzaWJsZSB0byB0aGUgQ1BVLiBBbmQgdGhlIElCTSB0
ZWFtCj4gPiB3YXMgdGhpbmtpbmcgb2YgdGFraW5nIGFkdmFudGFnZSBvZiBpdC4gQnV0IEkgaGF2
ZW4ndCBzZWVuIGFueXRoaW5nIG9uCj4gPiB0aGF0IGZyb250IGZvciBhIHdoaWxlLgo+Cj4gRG9l
cyBhbnlvbmUga25vdyB3aG8gdGhvc2UgcGVvcGxlIGFyZSBhbmQgY2FuIHdlIGVuY291cmFnZSB0
aGVtIHRvCj4gc2VuZCBzb21lIHBhdGNoZXM/IDopCgpJIGV4cGVjdCBtYXJraW5nIGl0IENPTkZJ
R19CUk9LRU4gd2l0aCB0aGUgdGhyZWF0IG9mIGRlbGV0aW5nIGl0IGlmIG5vCnBhdGNoZXMgc2hv
dyB1cCAqaXMqIHRoZSBlbmNvdXJhZ2VtZW50LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
