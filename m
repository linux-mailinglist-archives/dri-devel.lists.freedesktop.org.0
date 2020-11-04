Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C7A2A6FFE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 22:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7539089C68;
	Wed,  4 Nov 2020 21:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15B789C68
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604527098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mjZwPLaDvRK7gqbusRFvnTm5i/SsM/Ov+R4VsFUYjM=;
 b=FpmTyS7JpBsTwNj92aNC6kvFU0ApWGIZeuUD0mSt0pImtTlOERDtLQmJHlJs2aoSGtQWnm
 2IvJHhNmy0a3PxqSzumK+himQUc3wT+14ZZ9rIZF8g4pnAj2MM5CU5gGFVr6ArAD4m7Quj
 QE6afuEppcC3958IF19j9hqkdyDOr0Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-G6pZ-NYiPJ27vLNo3aoLRA-1; Wed, 04 Nov 2020 16:58:16 -0500
X-MC-Unique: G6pZ-NYiPJ27vLNo3aoLRA-1
Received: by mail-qt1-f200.google.com with SMTP id h16so11232542qtr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 13:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=7mjZwPLaDvRK7gqbusRFvnTm5i/SsM/Ov+R4VsFUYjM=;
 b=Z3a7HvDQEsnlv9SfODT2QgjPOKz/Fi70XBRV23NfJhOh3i0xDUJ7CqYExNN8EkP+zz
 mfQ7MUMvdVv/nwxvW+iCjbqGgX5KtjBVV1TVLg5b0N1u0I+c90UPoTPvW+SMLLJ9W8gb
 XT+o+UVHLuE/sExGyYJAcFqoMLKqQ3R7e/IxVpbm0TF1E5eZGzdhB7oCTXAj8LhUHinV
 D2Hpdpd/swmacBiJDhlSo1G7nUHNYiRdg/7RQg7Ig1GcZkKgfx5xL2QMovBLctaBD5pb
 hTIQpJ68ILSEDO6QEqQlUIUM/sOrPKR6BAYlbCUdYFiZ5SdBnEflZCyl3m8vpiqWMp2V
 s3dg==
X-Gm-Message-State: AOAM533INZ41NmH7bWZMnPbPI8hvGzbNhk0dYJ3YL0V0QfAH29cf641c
 Rp0j01IPKP7qd+nCWtQMgAzLqXiVA5VWkikAA6rQPbfmEoiOB+4OeS7jpPsAw3CP1pL4DHvS+QE
 pcvEn85cZjCI826OR8rvhLCR3Hcd0
X-Received: by 2002:a05:6214:943:: with SMTP id
 dn3mr33862203qvb.45.1604527095997; 
 Wed, 04 Nov 2020 13:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxSZm4vplpN0Yy5FprMLUzwx1P8wIztIZ0XeZy6PFsHKkN0jK/iuyznPLC3n2hCWarebqwgw==
X-Received: by 2002:a05:6214:943:: with SMTP id
 dn3mr33862190qvb.45.1604527095807; 
 Wed, 04 Nov 2020 13:58:15 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id q7sm1153656qtd.49.2020.11.04.13.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 13:58:15 -0800 (PST)
Message-ID: <71dc852e52bfeafc8c03a6fa3cd5f3cdd4eb6609.camel@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
From: Lyude Paul <lyude@redhat.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Dave Airlie
 <airlied@gmail.com>
Date: Wed, 04 Nov 2020 16:58:14 -0500
In-Reply-To: <20201103222013.hypmzlq7uuqufe76@box>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QUNLLCBJIHdpbGwgc2VuZCBvdXQgYSBwYXRjaCBmb3IgdGhpcyBhc2FwCgpPbiBXZWQsIDIwMjAt
MTEtMDQgYXQgMDE6MjAgKzAzMDAsIEtpcmlsbCBBLiBTaHV0ZW1vdiB3cm90ZToKPiBPbiBUaHUs
IE9jdCAxNSwgMjAyMCBhdCAxMTozMzowOEFNICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+
IMKgwqDCoMKgwqAgZHJtL25vdXZlYXUva21zOiBTZWFyY2ggZm9yIGVuY29kZXJzJyBjb25uZWN0
b3JzIHByb3Blcmx5Cj4gCj4gVGhpcyBjb21taXQgKDA5ODM4YzRlZmU5YSkgYnJva2UgYm9vdCBm
b3IgbWUuIFRoZXNlIHR3byBodW5rcyBpbgo+IHBhcnRpY3VsYXI6Cj4gCj4gQCAtMjA2Niw3ICsy
MTIwLDcgQEAgbnY1MF9kaXNwX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZQo+ICpzdGF0ZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBvdXRwLT5jbHIubWFzaywgb3V0cC0+c2V0Lm1hc2spOwo+IAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAob3V0cC0+Y2xyLm1hc2spIHsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGVscC0+ZGlzYWJsZShlbmNvZGVy
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGVscC0+
YXRvbWljX2Rpc2FibGUoZW5jb2Rlciwgc3RhdGUpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJsb2NrW05WNTBfRElTUF9JTlRFUkxPQ0tfQ09S
RV0gfD0gMTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChvdXRwLT5mbHVzaF9kaXNhYmxlKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnY1MF9kaXNwX2F0b21pY19jb21t
aXRfd25kdyhzdGF0ZSwKPiBpbnRlcmxvY2spOwo+IEBAIC0yMTA1LDcgKzIxNTksNyBAQCBudjUw
X2Rpc3BfYXRvbWljX2NvbW1pdF90YWlsKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlCj4gKnN0YXRl
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG91
dHAtPnNldC5tYXNrLCBvdXRwLT5jbHIubWFzayk7Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChvdXRwLT5zZXQubWFzaykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZWxwLT5lbmFibGUoZW5jb2Rlcik7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhlbHAtPmF0b21pY19lbmFibGUo
ZW5jb2Rlciwgc3RhdGUpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50ZXJsb2NrW05WNTBfRElTUF9JTlRFUkxPQ0tfQ09SRV0gPSAxOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gCj4gSSBoYWNrZWQgdXAgcGF0Y2ggdG8g
dXNlIGhlbHAtPmRpc2FibGUvaGVscC0+ZW5hYmxlIGlmIGF0b21pY18gdmVyc2lvbnMKPiBhcmUg
TlVMTC4gSXQgd29ya2VkLgo+IAo+IEluIG15IHNldHVwIEkgc3RlcHBlZCBvbnRvIG52NTBfbXN0
b19oZWxwLT5hdG9taWNfZW5hYmxlID09IE5VTEwuIEJ1dAo+IHRoZXJlIGFyZSB0d28gbW9yZSBk
cm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgaW4gZGlzcG52NTAvZGlzcC5jIHRoYXQgZG9uJ3QKPiBo
YXZlIGF0b21pY19lbmFibGUvZGlzYWJsZSBzZXQ6IG52NTBfZGFjX2hlbHAsIG52NTBfcGlvcl9o
ZWxwLgo+IAoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdh
cmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1h
aWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBt
ZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwg
ZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVl
IHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3Qg
Yml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
