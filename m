Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB82A6765
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 16:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE6E6E07D;
	Wed,  4 Nov 2020 15:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9236E056;
 Wed,  4 Nov 2020 15:20:47 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a71so17475463edf.9;
 Wed, 04 Nov 2020 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=K6GVeC3Fe9IgK5J/YT3r7SRaxsgmqxRWiVLALkEOeGY=;
 b=PP9hTYWFv/W9cNYzfhYX8FzhaEimrLPsDz9brrFV/OJkAybD8lYvaC4XBQE+4Q+qnV
 Buw7flkjUTefR5EpRQK5S+oOj0o9IXRRtZOL7UrZVSuG1SSb2fwWBX0J/iL1HRH3mLzg
 aCjmaW1gRJ1+GoVddYUUD10IaazXdpdspVK6nqe7bJ/vUwmom86pXonZZTbm4E/Bnz0e
 cxRDLX9XVcGIXcTrtYhFIMGfW5paO6NcLJAGEzy0hE1DK+fQbhY4ovPd+1tNiZPceN9V
 oACsEbcOLNOLhpp7OOs1PBTLe2jO7K0ywZZ7bVFG4bJpivRXlcb6nldf1FMrm1y4wDaJ
 X+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K6GVeC3Fe9IgK5J/YT3r7SRaxsgmqxRWiVLALkEOeGY=;
 b=kxOo/aUEBMxlf2TYgpMljWbNmkn3sdPJs8TSJziwbUMBn5oCyXdksX47xyJe6mGdmX
 kPginN6zNrvi3z9+ksOCJXHm9XjgyApliX4cdsCHGwhZaHvhdpa4F+AUdNHnt321Pi+I
 21D5KOlLfQTlpoqWTHqPZ6QYUESdX3hVkfhgPZBDVeMNaFCdYCy1CfDxYbRVR1R8qPdE
 2HZbGIgN8AH5gYwL6ySiC1T79Cn/PnznMEbwnfSGK/Gt57/JAU22IOz6nyA/w1HDhlLN
 Da+6SxTaFpnyb/To5XrVX+sLholNGJ+RfegHl5VJhfqWz549T/4s7uGRodTupEN0guu3
 XfrQ==
X-Gm-Message-State: AOAM533CXjN6eXArFbVFmDjPVUcsSlH2SIC1HjlfybMjV64I1ZvU5cYI
 GfOk9qQfNu4O2XJImDUqoPw=
X-Google-Smtp-Source: ABdhPJzOuCN7LWsNJ50reP+2044GxoJeD8b7MC874r9q4W6OkWtjk/+OVDLzSd7ZAZlauNczhrHrwg==
X-Received: by 2002:aa7:c955:: with SMTP id h21mr27922918edt.315.1604503246211; 
 Wed, 04 Nov 2020 07:20:46 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l12sm1215700edt.46.2020.11.04.07.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 07:20:45 -0800 (PST)
Subject: Re: [PATCH] drm/amdkfd: replace idr_init() by idr_init_base()
To: Deepak R Varma <mh12gx2825@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201104151359.GA69034@localhost>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4d658fdf-9953-30a1-ca5d-a3431fc899cf@gmail.com>
Date: Wed, 4 Nov 2020 16:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104151359.GA69034@localhost>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMTEuMjAgdW0gMTY6MTMgc2NocmllYiBEZWVwYWsgUiBWYXJtYToKPiBpZHJfaW5pdCgp
IHVzZXMgYmFzZSAwIHdoaWNoIGlzIGFuIGludmFsaWQgaWRlbnRpZmllci4gVGhlIG5ldyBmdW5j
dGlvbgo+IGlkcl9pbml0X2Jhc2UgYWxsb3dzIElEUiB0byBzZXQgdGhlIElEIGxvb2t1cCBmcm9t
IGJhc2UgMS4gVGhpcyBhdm9pZHMKPiBhbGwgbG9va3VwcyB0aGF0IG90aGVyd2lzZSBzdGFydHMg
ZnJvbSAwIHNpbmNlIDAgaXMgYWx3YXlzIHVudXNlZC4KPgo+IFJlZmVyZW5jZXM6IGNvbW1pdCA2
Y2U3MTFmMjc1MDAgKCJpZHI6IE1ha2UgMS1iYXNlZCBJRFJzIG1vcmUgZWZmaWNpZW50IikKPgo+
IFNpZ25lZC1vZmYtYnk6IERlZXBhayBSIFZhcm1hIDxtaDEyZ3gyODI1QGdtYWlsLmNvbT4KCkFj
a2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2V2ZW50cy5jICB8IDIgKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgfCAyICstCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZXZlbnRzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZXZlbnRzLmMKPiBpbmRleCBiYTJjMmNlMGM1NWEuLmIzMzM5
YjUzYzhhZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZXZl
bnRzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZXZlbnRzLmMKPiBA
QCAtMjMwLDcgKzIzMCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX290aGVyX2V2ZW50KHN0cnVjdCBr
ZmRfcHJvY2VzcyAqcCwgc3RydWN0IGtmZF9ldmVudCAqZXYpCj4gICB2b2lkIGtmZF9ldmVudF9p
bml0X3Byb2Nlc3Moc3RydWN0IGtmZF9wcm9jZXNzICpwKQo+ICAgewo+ICAgCW11dGV4X2luaXQo
JnAtPmV2ZW50X211dGV4KTsKPiAtCWlkcl9pbml0KCZwLT5ldmVudF9pZHIpOwo+ICsJaWRyX2lu
aXRfYmFzZSgmcC0+ZXZlbnRfaWRyLCAxKTsKPiAgIAlwLT5zaWduYWxfcGFnZSA9IE5VTEw7Cj4g
ICAJcC0+c2lnbmFsX2V2ZW50X2NvdW50ID0gMDsKPiAgIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiBpbmRleCA2NTgwM2UxNTNhMjIuLjAyMmU2MWJhYmUzMCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+IEBAIC0xMjg5
LDcgKzEyODksNyBAQCBzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICprZmRfY3JlYXRlX3Byb2Nl
c3NfZGV2aWNlX2RhdGEoc3RydWN0IGtmZF9kZXYgKmRldiwKPiAgIAlsaXN0X2FkZCgmcGRkLT5w
ZXJfZGV2aWNlX2xpc3QsICZwLT5wZXJfZGV2aWNlX2RhdGEpOwo+ICAgCj4gICAJLyogSW5pdCBp
ZHIgdXNlZCBmb3IgbWVtb3J5IGhhbmRsZSB0cmFuc2xhdGlvbiAqLwo+IC0JaWRyX2luaXQoJnBk
ZC0+YWxsb2NfaWRyKTsKPiArCWlkcl9pbml0X2Jhc2UoJnBkZC0+YWxsb2NfaWRyLCAxKTsKPiAg
IAo+ICAgCXJldHVybiBwZGQ7Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
