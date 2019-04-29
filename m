Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B9DCF1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9703E89003;
	Mon, 29 Apr 2019 07:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E28A88FF7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:35:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w37so8238708edw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 00:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4GRBl9r3eWWMjmHDPI2MKNTN3HIKFsl5JlCT1ZSAH7s=;
 b=Ba3UfuIgurLd6fTx4VQcs/GNk8XnEux0XS90CSKOyhL9B/nX2r0AhPBf74FgDKB16n
 CH9gGapMKd/WNQ8384TMfAftC1eGyK0hvaNAmunSK0szN/3eVkvLDueXlzyABJHKvEXp
 8S4yuXyt7nBPT7N4ADK/Db7BvRC1E32DzNrWn1/9cG1HqI05AC55wtBtW4nclM94hfvI
 qfMhR+YrKwGlRYNXWfNrGakqk3/8WlD5S0ChrAhD7gW8cePlqz+nHbZsUEOG5Qm5tioD
 WQCFikpmRuXK3jvklJl/ic12r5v7tmlFf1rabM2oTDAOoGFjK7wyFiYO94tvEv7mcRqV
 TaSw==
X-Gm-Message-State: APjAAAUhawJCEX+RR6qDhFWuvp07J21FHU4aL7SljoAO51wEmnD/m4Mz
 RMd6BShXljLbzYwqni477TrEQA==
X-Google-Smtp-Source: APXvYqw+HVpQADojEBJoYzEl6zU4Fu0xYJloXoyFmXJNng+PynUs1KNFpxgn6+gWmyYmvAXa17UCsQ==
X-Received: by 2002:a17:906:e241:: with SMTP id
 gq1mr30422178ejb.5.1556523341916; 
 Mon, 29 Apr 2019 00:35:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j13sm2144716eda.91.2019.04.29.00.35.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 00:35:41 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:35:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v5 10/12] drm/i915: update the hdcp state with uevent
Message-ID: <20190429073539.GH3271@phenom.ffwll.local>
References: <20190418085805.5648-1-ramalingam.c@intel.com>
 <20190418085805.5648-11-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190418085805.5648-11-ramalingam.c@intel.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4GRBl9r3eWWMjmHDPI2MKNTN3HIKFsl5JlCT1ZSAH7s=;
 b=INpsZBjhPpRCQL63NTgPBswCAqGTGhwJH6BucVSEWE/EEJuTrlUWDYlIxcyDcv/CZQ
 b25YQKGTSX5bIQm7uY7FAH6hGDbscNLg0X8NSAdPLr97dnDhuLSwMFz42D088/RBohj7
 ubeckVkd4SZpIRG+bvedS33AK2rfqiXR9LWxY=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gwan-gyeong.mun@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDI6Mjg6MDNQTSArMDUzMCwgUmFtYWxpbmdhbSBDIHdy
b3RlOgo+IGRybSBmdW5jdGlvbiB0byB1cGRhdGUgdGhlIGNvbnRlbnQgcHJvdGVjdGlvbiBwcm9w
ZXJ0eSBzdGF0ZSBhbmQgdG8KPiBnZW5lcmF0ZSBhIHVldmVudCBpcyBpbnZva2VkIGZyb20gdGhl
IGludGVsIGhkY3AgcHJvcGVydHkgd29yay4KPiAKPiBIZW5jZSB3aGVuZXZlciBrZXJuZWwgY2hh
bmdlcyB0aGUgcHJvcGVydHkgc3RhdGUsIHVzZXJzcGFjZSB3aWxsIGJlCj4gdXBkYXRlZCB3aXRo
IGEgdWV2ZW50Lgo+IAo+IHYyOgo+ICAgc3RhdGUgdXBkYXRlIGlzIG1vdmVkIGludG8gZHJtIGZ1
bmN0aW9uIFtkYW5pZWxdCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGlu
Z2FtLmNAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZGNwLmMg
fCA4ICsrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkY3Au
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkY3AuYwo+IGluZGV4IGRlNjM0ZjNmYmQx
Yi4uODRhYzIzZWE3NWFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2hkY3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkY3AuYwo+IEBAIC04
NjYsNyArODY2LDYgQEAgc3RhdGljIHZvaWQgaW50ZWxfaGRjcF9wcm9wX3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQo+ICAJCQkJCSAgICAgICBwcm9wX3dvcmspOwo+ICAJc3RydWN0IGlu
dGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gaW50ZWxfaGRjcF90b19jb25uZWN0b3IoaGRjcCk7
Cj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5iYXNlLmRldjsKPiAtCXN0
cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpzdGF0ZTsKPiAgCj4gIAlkcm1fbW9kZXNldF9sb2Nr
KCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgsIE5VTEwpOwo+ICAJbXV0ZXhfbG9j
aygmaGRjcC0+bXV0ZXgpOwo+IEBAIC04NzYsMTAgKzg3NSw5IEBAIHN0YXRpYyB2b2lkIGludGVs
X2hkY3BfcHJvcF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCSAqIHRob3NlIHRv
IFVOREVTSVJFRCBpcyBoYW5kbGVkIGJ5IGNvcmUuIElmIHZhbHVlID09IFVOREVTSVJFRCwKPiAg
CSAqIHdlJ3JlIHJ1bm5pbmcganVzdCBhZnRlciBoZGNwIGhhcyBiZWVuIGRpc2FibGVkLCBzbyBq
dXN0IGV4aXQKPiAgCSAqLwo+IC0JaWYgKGhkY3AtPnZhbHVlICE9IERSTV9NT0RFX0NPTlRFTlRf
UFJPVEVDVElPTl9VTkRFU0lSRUQpIHsKPiAtCQlzdGF0ZSA9IGNvbm5lY3Rvci0+YmFzZS5zdGF0
ZTsKPiAtCQlzdGF0ZS0+Y29udGVudF9wcm90ZWN0aW9uID0gaGRjcC0+dmFsdWU7Cj4gLQl9Cj4g
KwlpZiAoaGRjcC0+dmFsdWUgIT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX1VOREVTSVJF
RCkKPiArCQlkcm1faGRjcF91cGRhdGVfY29udGVudF9wcm90ZWN0aW9uKCZjb25uZWN0b3ItPmJh
c2UsCj4gKwkJCQkJCSAgIGhkY3AtPnZhbHVlKTsKPiAgCj4gIAltdXRleF91bmxvY2soJmhkY3At
Pm11dGV4KTsKPiAgCWRybV9tb2Rlc2V0X3VubG9jaygmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0
aW9uX211dGV4KTsKPiAtLSAKPiAyLjE5LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
