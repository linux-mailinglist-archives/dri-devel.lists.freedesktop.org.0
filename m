Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C9630C996
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 19:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AB46E0F0;
	Tue,  2 Feb 2021 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3956E0F0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612290301;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnGr4EooSXaQZ5ZRROa4NLkKWgLW6n+u1Od1EbAD4Lg=;
 b=Cc8vHmQeoxzVMa3TtGsO/eE1c9O0HvTcs2zVWpIrSZ1hTRcLNnXRt4eAXm+qSHUlwWOLMF
 v5jtAOO/BSS5x7li2AM0KKunSlci/hkzW0zmS1Pe54086VXo4mLoJ+Z14Oub9VEXvqqZKG
 U3P8i+2Xa0FBX7D9Mp85yO3/aVqH/5A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-A7vW7mi4Oryb0_IOxtMQww-1; Tue, 02 Feb 2021 13:24:57 -0500
X-MC-Unique: A7vW7mi4Oryb0_IOxtMQww-1
Received: by mail-qv1-f71.google.com with SMTP id a12so14810246qvo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 10:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=AnGr4EooSXaQZ5ZRROa4NLkKWgLW6n+u1Od1EbAD4Lg=;
 b=G6UugRLIazAaPv0tM2+XZWvbIqXA4+gy/uw56JZg/R9CfPYfZOMn4dwZfEaVhAUhgh
 clWHrd2akgCI9dM2d0wvZe01m5WYspYIyyCbSLAk9U1X7RvwEHY6A4J+KhIs9Bj67Sgu
 b1XwXh9Qzz88KkiBNC+PErxj6T72XV01LpdAca45b60JvR+sOImPR8QGJmDWsyf+4FBj
 OroNJLr6v4qUNCcIjJiwrzJmDXNNhwGeR4qkIlQKQcIKtCWeUorQlj8X+vpZdD/dx5tu
 in6ZJJR9fqQF3Y7Wdb+XPe9ijwv3v8rGBEpypaQ3vWK7zUe1OinlwJMkU1JADngF4hEl
 5Dig==
X-Gm-Message-State: AOAM530NQT25ewBFQd7v0bWUIKPOXEqdcdKSkQWf6/bGSJoovdwrAHVt
 dVc7llNdWnU0+dP1w3UQKjuYDCPC1VNib8ZEIC/nhpff4r3Kzw0K5Ip0ELRbGuO2HunPJ9DeMMD
 uoDQubxc5OruAfvbBh1O4MKbNpiEC
X-Received: by 2002:a05:6214:324:: with SMTP id
 j4mr21390771qvu.53.1612290297372; 
 Tue, 02 Feb 2021 10:24:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5CH5N3KAln06tkbRsEidyvbDgmef52F3iN9tUMNV+94ggr3F3Qn9K6XQ4RRxyy8rmKeIvmA==
X-Received: by 2002:a05:6214:324:: with SMTP id
 j4mr21390743qvu.53.1612290297144; 
 Tue, 02 Feb 2021 10:24:57 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id j125sm17584722qke.56.2021.02.02.10.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 10:24:56 -0800 (PST)
Message-ID: <a06e4ebe71f6809a772efc43592739e46b022b0e.camel@redhat.com>
Subject: Re: [Linaro-mm-sig] [PATCH 08/29] dma-buf: Avoid comma separated
 statements
From: Lyude Paul <lyude@redhat.com>
To: christian.koenig@amd.com, Joe Perches <joe@perches.com>, Jiri Kosina
 <trivial@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 02 Feb 2021 13:24:55 -0500
In-Reply-To: <ad79432b-9c83-ce5a-f8ca-ec45bb55fb2c@gmail.com>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
 <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
 <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
 <ad79432b-9c83-ce5a-f8ca-ec45bb55fb2c@gmail.com>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTAyLTAyIGF0IDA5OjMzICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IFllYWgsIGtub3duIGlzc3VlLgo+IAo+IEFuIE5UUCBzZXJ2ZXIgd2hpY2ggSSBkb24ndCBo
YXZlIGFjY2VzcyB0byBoYXMgZ29uZSBiYW5hbmFzIGFuZCAKPiBzb21ldGltZXMgc3BpdHMgb3V0
IGludmFsaWQgdGltZSBzdGFtcHMuCj4gCj4gT25seSB0aGluZyBJIGNhbiBkbyBpcyB3YWl0IGZv
ciBhbiBhZG1pbiB0byB0YWtlIGNhcmUgb2YgdGhpcy4KCmhhaGEgaXQncyBvayEgSSBqdXN0IHRo
b3VnaHQgaXQgd2FzIG1pbGRseSBlbnRlcnRhaW5pbmcgdG8gc2VlLCBhcyBteSBlbWFpbApjbGll
bnQgZm9ybWF0dGVkIHRoZSBtZXNzYWdlIHRpbWVzdGFtcCAiTmV4dCBXZWRuZXNkYXkiIDopCgo+
IAo+IENocmlzdGlhbi4KPiAKPiBBbSAwMS4wMi4yMSB1bSAyMjo1NCBzY2hyaWViIEx5dWRlIFBh
dWw6Cj4gPiBUaGlzIGlzIGVudGlyZWx5IHVucmVsYXRlZCB0byB0aGlzIHRocmVhZCwgYnV0IEkg
bm90aWNlZCB3aGVuIGdvaW5nIHRocm91Z2gKPiA+IGRyaS0KPiA+IGRldmVsIHRoYXQgdGhpcyBl
bWFpbCBpcyBzb21laG93IGRhdGVkIHR3byBkYXlzIGluIHRoZSBmdXR1cmUgZnJvbSBub3cuCj4g
PiAKPiA+IE9uIFdlZCwgMjAyMS0wMi0wMyBhdCAxNDoyNiArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiA+ID4gQW0gMzAuMDEuMjEgdW0gMTk6NDcgc2NocmllYiBKb2UgUGVyY2hlczoK
PiA+ID4gPiBPbiBNb24sIDIwMjAtMDgtMjQgYXQgMjE6NTYgLTA3MDAsIEpvZSBQZXJjaGVzIHdy
b3RlOgo+ID4gPiA+ID4gVXNlIHNlbWljb2xvbnMgYW5kIGJyYWNlcy4KPiA+ID4gPiBQaW5nPwo+
ID4gPiA+IMKgwqAgCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBl
cmNoZXMuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+ID4gPiAKPiA+ID4gRG8geW91IGhhdmUgY29tbWl0IHJpZ2h0cyB0
byBkcm0tbWlzYy1uZXh0Pwo+ID4gPiAKPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gwqDCoMKgZHJp
dmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIHwgNyArKysrKy0tCj4gPiA+ID4gPiDCoMKgwqAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIGIv
ZHJpdmVycy9kbWEtYnVmL3N0LWRtYS0KPiA+ID4gPiA+IGZlbmNlLmMKPiA+ID4gPiA+IGluZGV4
IGU1OTMwNjQzNDFjOC4uYzhhMTJkN2FkNzFhIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYv
c3QtZG1hLWZlbmNlLmMKPiA+ID4gPiA+IEBAIC00NzEsOCArNDcxLDExIEBAIHN0YXRpYyBpbnQg
dGhyZWFkX3NpZ25hbF9jYWxsYmFjayh2b2lkICphcmcpCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9mZW5jZV9zaWduYWwoZjEp
Owo+ID4gPiA+ID4gwqDCoCAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNtcF9zdG9yZV9tYihjYi5zZWVuLCBmYWxzZSk7Cj4gPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFmMiB8fCBkbWFfZmVuY2VfYWRkX2Nh
bGxiYWNrKGYyLCAmY2IuY2IsCj4gPiA+ID4gPiBzaW1wbGVfY2FsbGJhY2spKQo+ID4gPiA+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaXNzKyssIGNi
LnNlZW4gPSB0cnVlOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
ICghZjIgfHwKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmMiwgJmNiLmNiLAo+ID4gPiA+ID4gc2ltcGxlX2NhbGxi
YWNrKSkgewo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBtaXNzKys7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNiLnNlZW4gPSB0cnVlOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiA+IMKgwqAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXQtPmJlZm9yZSkKPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2Zl
bmNlX3NpZ25hbChmMSk7Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUg
UGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTog
SSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkg
cGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSBy
ZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBh
IHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVj
awpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
