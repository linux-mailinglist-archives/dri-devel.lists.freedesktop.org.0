Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C40F55186
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D882B6E11D;
	Tue, 25 Jun 2019 14:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127426E120
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:22:25 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so27440031edv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=24gzO0A0maaezXLn4Sf+YkjPoPGU5cIzahsVUvGWJpM=;
 b=LbC1lwcCQydaL4e5q8+xxryn66t8L9UGDzxkcNLTg/AWvtyjjMSmst5KDHP4G/n+eD
 uJCJlW6NXdnPk1+lDeuJEnhCIjuMspB0OsgdWmDwuNKtTby5D4PGEVV7aXXLkkKbw28h
 DRiQt1yURLgknqkO5BG2pxhUwNlC7T3rEKkgKFgE3YkjKuCyjhGmFcPAgoFGK3nkVOQx
 LQhuChuxIclZM8NvD3P/NCqd7WeC4wGkpqf1RG4eGQgX/jNBCdUOzz0S+hgWXUk3YvGS
 /jO2wR1VEM9TiD8i8NWWT4kyCQ3V8QyT2mIyJfNPAqoaYalBEvJwQM6F3nRJXJfvAKWy
 R26g==
X-Gm-Message-State: APjAAAV49aIyLIj7Akho5An+ZRCX4CIKk3VdfdUKtI03r//Dynrc1Ayc
 7knJYAeFIP1oxZpfria2RuAFLw==
X-Google-Smtp-Source: APXvYqxVUUONdezXsW7E9TNE+qfMGQMUrSmhwkxeITlCJQHWjHZ7M6mojDMZlCgAoAGW7zba80GVtw==
X-Received: by 2002:aa7:d30b:: with SMTP id p11mr133074273edq.23.1561472512705; 
 Tue, 25 Jun 2019 07:21:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z2sm2477457ejp.73.2019.06.25.07.21.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 07:21:51 -0700 (PDT)
Date: Tue, 25 Jun 2019 16:21:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v2 1/2] drm: Include ddc adapter pointer in struct
 drm_connector
Message-ID: <20190625142149.GW12905@phenom.ffwll.local>
Mail-Followup-To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 m.szyprowski@samsung.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <cover.1561458051.git.andrzej.p@collabora.com>
 <ef88f682401ae863a91e6c885d83a2756ae20b85.1561458051.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef88f682401ae863a91e6c885d83a2756ae20b85.1561458051.git.andrzej.p@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=24gzO0A0maaezXLn4Sf+YkjPoPGU5cIzahsVUvGWJpM=;
 b=Y+iwXU//8GiwvhB5OdOIwFWmfTwBckBPRRYgH6kue66lsWyh9dCVA2FaKmL02xFKEp
 ZfANSgyGzfjQvccuoaiACu2E9hFGEvf3GDPGF1PFAIvlKZ7isxVSmuGTE6shmB2zXpAr
 IoDUAySoIuAmV09dUoCcTV15LJhra9BJbO9AQ=
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6MjQ6NDBQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEFkZCBnZW5lcmljIGNvZGUgd2hpY2ggY3JlYXRlcyBzeW1ib2xpYyBs
aW5rcyBpbiBzeXNmcywgcG9pbnRpbmcgdG8gZGRjCj4gaW50ZXJmYWNlIHVzZWQgYnkgYSBwYXJ0
aWN1bGFyIHZpZGVvIG91dHB1dC4gRm9yIGV4YW1wbGU6Cj4gCj4gbHMgLWwgL3N5cy9jbGFzcy9k
cm0vY2FyZDAtSERNSS1BLTEvZGRjCj4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAx
MDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAo+IAktPiAuLi8uLi8uLi8u
Li9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCj4gCj4gVGhpcyBtYWtlcyBpdCBlYXN5IGZvciB1c2Vy
IHRvIGFzc29jaWF0ZSBhIGRpc3BsYXkgd2l0aCBpdHMgZGRjIGFkYXB0ZXIKPiBhbmQgdXNlIGUu
Zy4gZGRjdXRpbCB0byBjb250cm9sIHRoZSBjaG9zZW4gbW9uaXRvci4KPiAKPiBUaGlzIHBhdGNo
IGFkZHMgYW4gaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvci4gUGFy
dGljdWxhcgo+IGRyaXZlcnMgY2FuIHRoZW4gdXNlIGl0IGluc3RlYWQgb2YgdXNpbmcgdGhlaXIg
b3duIHByaXZhdGUgaW5zdGFuY2UuIElmIGEKPiBjb25uZWN0b3IgY29udGFpbnMgYSBkZGMsIHRo
ZW4gY3JlYXRlIGEgc3ltYm9saWMgbGluayBpbiBzeXNmcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgoKQWNrZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpBcyBtZW50aW9uZWQgaW4g
dGhlIG90aGVyIHN1YnRocmVhZCwgSSB0aGluayB0aGUgaW1wb3J0YW50IGJpdCB0byBzZWxsCnRo
aXMgaXMgcm9sbGluZyBpdCBvdXQgdG8gYXMgbWFueSBkcml2ZXJzIGFzIGZlYXNpYmxlIGFuZCBj
b2xsZWN0aW5nIGFsbAp0aGUgYWNrcyBmcm9tIGRyaXZlciBtYWludGFpbmVycy4KLURhbmllbAo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgfCAgNyArKysrKysrCj4gIGluY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaCB8IDExICsrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBpbmRleCBhZDEwODEwYmM5
NzIuLjI2ZDM1OWIzOTc4NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2Zz
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBAQCAtMjk0LDYgKzI5NCw5
IEBAIGludCBkcm1fc3lzZnNfY29ubmVjdG9yX2FkZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQo+ICAJLyogTGV0IHVzZXJzcGFjZSBrbm93IHdlIGhhdmUgYSBuZXcgY29ubmVjdG9y
ICovCj4gIAlkcm1fc3lzZnNfaG90cGx1Z19ldmVudChkZXYpOwo+ICAKPiArCWlmIChjb25uZWN0
b3ItPmRkYykKPiArCQlyZXR1cm4gc3lzZnNfY3JlYXRlX2xpbmsoJmNvbm5lY3Rvci0+a2Rldi0+
a29iaiwKPiArCQkJCSAmY29ubmVjdG9yLT5kZGMtPmRldi5rb2JqLCAiZGRjIik7Cj4gIAlyZXR1
cm4gMDsKPiAgfQo+ICAKPiBAQCAtMzAxLDYgKzMwNCwxMCBAQCB2b2lkIGRybV9zeXNmc19jb25u
ZWN0b3JfcmVtb3ZlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAgCWlm
ICghY29ubmVjdG9yLT5rZGV2KQo+ICAJCXJldHVybjsKPiArCj4gKwlpZiAoY29ubmVjdG9yLT5k
ZGMpCj4gKwkJc3lzZnNfcmVtb3ZlX2xpbmsoJmNvbm5lY3Rvci0+a2Rldi0+a29iaiwgImRkYyIp
Owo+ICsKPiAgCURSTV9ERUJVRygicmVtb3ZpbmcgXCIlc1wiIGZyb20gc3lzZnNcbiIsCj4gIAkJ
ICBjb25uZWN0b3ItPm5hbWUpOwo+ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gaW5kZXggY2E3NDVkOWZl
YWY1Li4xYWQzZDFkNTRiYTcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rv
ci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gQEAgLTIzLDYgKzIzLDcg
QEAKPiAgI2lmbmRlZiBfX0RSTV9DT05ORUNUT1JfSF9fCj4gICNkZWZpbmUgX19EUk1fQ09OTkVD
VE9SX0hfXwo+ICAKPiArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICAjaW5jbHVkZSA8bGludXgv
bGlzdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbGxpc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2N0
eXBlLmg+Cj4gQEAgLTEzMDgsNiArMTMwOSwxNiBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciB7Cj4g
IAkgKiBbMF06IHByb2dyZXNzaXZlLCBbMV06IGludGVybGFjZWQKPiAgCSAqLwo+ICAJaW50IGF1
ZGlvX2xhdGVuY3lbMl07Cj4gKwo+ICsJLyoqCj4gKwkgKiBAZGRjOiBhc3NvY2lhdGVkIGRkYyBh
ZGFwdGVyLgo+ICsJICogQSBjb25uZWN0b3IgdXN1YWxseSBoYXMgaXRzIGFzc29jaWF0ZWQgZGRj
IGFkYXB0ZXIuIElmIGEgZHJpdmVyIHVzZXMKPiArCSAqIHRoaXMgZmllbGQsIHRoZW4gYW4gYXBw
cm9wcmlhdGUgc3ltYm9saWMgbGluayBpcyBjcmVhdGVkIGluIGNvbm5lY3Rvcgo+ICsJICogc3lz
ZnMgZGlyZWN0b3J5IHRvIG1ha2UgaXQgZWFzeSBmb3IgdGhlIHVzZXIgdG8gdGVsbCB3aGljaCBp
MmMKPiArCSAqIGFkYXB0ZXIgaXMgZm9yIGEgcGFydGljdWxhciBkaXNwbGF5Lgo+ICsJICovCj4g
KwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKPiArCj4gIAkvKioKPiAgCSAqIEBudWxsX2VkaWRf
Y291bnRlcjogdHJhY2sgc2lua3MgdGhhdCBnaXZlIHVzIGFsbCB6ZXJvcyBmb3IgdGhlIEVESUQu
Cj4gIAkgKiBOZWVkZWQgdG8gd29ya2Fyb3VuZCBzb21lIEhXIGJ1Z3Mgd2hlcmUgd2UgZ2V0IGFs
bCAwcwo+IC0tIAo+IDIuMTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
