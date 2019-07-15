Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200BD6A04F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184EF6E061;
	Tue, 16 Jul 2019 01:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC7E89AB3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:04:11 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id k8so8697699plt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KvkisiFAqnFhJQH/sxc+6YmwW4354mTDG0KMmG7pklg=;
 b=pVl2nP5m+2ZoZtV3DVAcpFQjlbIx8VeZwuSymn/mS4+Gzy0uICb2c13wQVfW64G7PZ
 dQrg2IWf5zDcsq0IlCr0Mo0V3teYJdthX9alPx2AYqcaGNYt8n91RmP676HuQeFl01lQ
 f852zdslg3/tR/XaXpIsILbLB/2e787K8HhqasnBjV6eznF8PeGV8bNZ2kcUxqKi0DPK
 EkOfSrq08GlA1OurB9HvmWYkXc3bzXblwdF875JItD4JTVy1X3fcN3usmZete+7UN310
 lhDnIlxkEP4iMzUf4QFi6facYxoRksKsS0DvmrllBw/Wa451Ax+MeRTHBGsZI2bKTsBz
 i8Mw==
X-Gm-Message-State: APjAAAX8w7gvH4YJd7MmMndrnke6zlzBvKYA6EawzjyY6zZ6QLVxF9ZQ
 QDfe+qzDk8z569632Y7Sm88=
X-Google-Smtp-Source: APXvYqw6IG5z/VMRUXcDYY8AewGKSghmfEmS9vk7liPYPXslN0meA+PtO10qAzp1UKLlff63OBk+Vw==
X-Received: by 2002:a17:902:26c:: with SMTP id
 99mr30828389plc.215.1563213850480; 
 Mon, 15 Jul 2019 11:04:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id a6sm10839127pfa.162.2019.07.15.11.04.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 11:04:09 -0700 (PDT)
Date: Mon, 15 Jul 2019 11:04:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Life is hard, and then you die" <ronald@innovation.ch>
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control
 optional.
Message-ID: <20190715180407.GB131063@dtor-ws>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
 <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
 <20190703063956.GA32102@innovation.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703063956.GA32102@innovation.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=KvkisiFAqnFhJQH/sxc+6YmwW4354mTDG0KMmG7pklg=;
 b=pPInN/AyZm7yn31pdN9aPbHJrSV5r8RPqxRFFlF92ahU4VhGQ5f4XvpcGyfyB8D+nq
 yuowytOH19HNeMj9r7VQZoU+WJFA5YoYw2E+7p9XFt9lGlTKuRc9QqvICZSurnDE8OqA
 uTCBzOc9rdVSmEq/HijM20PPPiJNIl0taqUQ2tD/D1/Ea9Oh189GyTZiHPp2v2mAEsj7
 SHH6PGa9I+cZ/hM1VRc3R56AfkjrYSdJegDX1sMFeQdnwVy33q+ozPVVgApH/5GS2tlU
 wHX1RkinKZeYRdmEUkQmMiVso+37YX6wkKxcH0omOCWf4/Oq/M/U3cZ2Fy/7RtPPGEmO
 THRQ==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Federico Lorenzi <federico@travelground.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIEp1bCAwMiwgMjAxOSBhdCAxMTozOTo1NlBNIC0wNzAwLCBMaWZlIGlzIGhh
cmQsIGFuZCB0aGVuIHlvdSBkaWUgd3JvdGU6Cj4gCj4gT24gVHVlLCBKdWwgMDIsIDIwMTkgYXQg
MDM6NTA6NDlQTSArMDIwMCwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiA+IE9uIDE5LjA0LjIwMTkg
MTA6MTksIFJvbmFsZCBUc2NoYWzDpHIgd3JvdGU6Cj4gPiA+IGNvbW1pdCBkNmFiZTZkZjcwNmMg
KGRybS9icmlkZ2U6IHNpbF9zaWk4NjIwOiBkbyBub3QgaGF2ZSBhIGRlcGVuZGVuY3kKPiA+ID4g
b2YgUkNfQ09SRSkgY2hhbmdlZCB0aGUgZHJpdmVyIHRvIHNlbGVjdCBib3RoIFJDX0NPUkUgYW5k
IElOUFVULgo+ID4gPiBIb3dldmVyLCB0aGlzIGNhdXNlcyBwcm9ibGVtcyB3aXRoIG90aGVyIGRy
aXZlcnMsIGluIHBhcnRpY3VsYXIgYW4gaW5wdXQKPiA+ID4gZHJpdmVyIHRoYXQgZGVwZW5kcyBv
biBNRkRfSU5URUxfTFBTU19QQ0kgKHRvIGJlIGFkZGVkIGluIGEgc2VwYXJhdGUKPiA+ID4gY29t
bWl0KToKPiA+ID4gCj4gPiA+ICAgZHJpdmVycy9jbGsvS2NvbmZpZzo5OmVycm9yOiByZWN1cnNp
dmUgZGVwZW5kZW5jeSBkZXRlY3RlZCEKPiA+ID4gICBkcml2ZXJzL2Nsay9LY29uZmlnOjk6ICAg
ICAgICBzeW1ib2wgQ09NTU9OX0NMSyBpcyBzZWxlY3RlZCBieSBNRkRfSU5URUxfTFBTUwo+ID4g
PiAgIGRyaXZlcnMvbWZkL0tjb25maWc6NTY2OiAgICAgIHN5bWJvbCBNRkRfSU5URUxfTFBTUyBp
cyBzZWxlY3RlZCBieSBNRkRfSU5URUxfTFBTU19QQ0kKPiA+ID4gICBkcml2ZXJzL21mZC9LY29u
ZmlnOjU4MDogICAgICBzeW1ib2wgTUZEX0lOVEVMX0xQU1NfUENJIGlzIGltcGxpZWQgYnkgS0VZ
Qk9BUkRfQVBQTEVTUEkKPiA+ID4gICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWc6NzM6
ICAgIHN5bWJvbCBLRVlCT0FSRF9BUFBMRVNQSSBkZXBlbmRzIG9uIElOUFVUCj4gPiA+ICAgZHJp
dmVycy9pbnB1dC9LY29uZmlnOjg6ICAgICAgc3ltYm9sIElOUFVUIGlzIHNlbGVjdGVkIGJ5IERS
TV9TSUxfU0lJODYyMAo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZzo4Mzog
ICAgc3ltYm9sIERSTV9TSUxfU0lJODYyMCBkZXBlbmRzIG9uIERSTV9CUklER0UKPiA+ID4gICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWc6MTogICAgIHN5bWJvbCBEUk1fQlJJREdFIGlz
IHNlbGVjdGVkIGJ5IERSTV9QTDExMQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9wbDExMS9LY29u
ZmlnOjE6ICAgICAgc3ltYm9sIERSTV9QTDExMSBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiA+ID4g
Cj4gPiA+IEFjY29yZGluZyB0byB0aGUgZG9jcyBhbmQgZ2VuZXJhbCBjb25zZW5zdXMsIHNlbGVj
dCBzaG91bGQgb25seSBiZSB1c2VkCj4gPiA+IGZvciBub24gdXNlci12aXNpYmxlIHN5bWJvbHMs
IGJ1dCBib3RoIFJDX0NPUkUgYW5kIElOUFVUIGFyZQo+ID4gPiB1c2VyLXZpc2libGUuIEZ1cnRo
ZXJtb3JlIGFsbW9zdCBhbGwgb3RoZXIgcmVmZXJlbmNlcyB0byBJTlBVVAo+ID4gPiB0aHJvdWdo
b3V0IHRoZSBrZXJuZWwgY29uZmlnIGFyZSBkZXBlbmRzLCBub3Qgc2VsZWN0cy4gRm9yIHRoaXMg
cmVhc29uCj4gPiA+IHRoZSBmaXJzdCBwYXJ0IG9mIHRoaXMgY2hhbmdlIHJldmVydHMgY29tbWl0
IGQ2YWJlNmRmNzA2Yy4KPiA+ID4gCj4gPiA+IEluIG9yZGVyIHRvIGFkZHJlc3MgdGhlIG9yaWdp
bmFsIHJlYXNvbiBmb3IgY29tbWl0IGQ2YWJlNmRmNzA2YywgbmFtZWx5Cj4gPiA+IHRoYXQgbm90
IGFsbCBib2FyZHMgdXNlIHRoZSByZW1vdGUgY29udHJvbGxlciBmdW5jdGlvbmFsaXR5IGFuZCBo
ZW5jZQo+ID4gPiBzaG91bGQgbm90IG5lZWQgaGF2ZSB0byBkZWFsIHdpdGggUkNfQ09SRSwgdGhl
IHNlY29uZCBwYXJ0IG9mIHRoaXMKPiA+ID4gY2hhbmdlIG5vdyBtYWtlcyB0aGUgcmVtb3RlIGNv
bnRyb2wgc3VwcG9ydCBpbiB0aGUgZHJpdmVyIG9wdGlvbmFsIGFuZAo+ID4gPiBjb250aW5nZW50
IG9uIFJDX0NPUkUgYmVpbmcgZGVmaW5lZC4gQW5kIHdpdGggdGhpcyB0aGUgaGFyZCBkZXBlbmRl
bmN5Cj4gPiA+IG9uIElOUFVUIGFsc28gZ29lcyBhd2F5IGFzIHRoYXQgaXMgb25seSBuZWVkZWQg
aWYgUkNfQ09SRSBpcyBkZWZpbmVkCj4gPiA+ICh3aGljaCBpbiB0dXJuIGFscmVhZHkgZGVwZW5k
cyBvbiBJTlBVVCkuCj4gPiA+IAo+ID4gPiBDQzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcu
Y29tPgo+ID4gPiBDQzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiA+ID4g
Q0M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4K
PiA+ID4gQ0M6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIFRzY2hhbMOkciA8cm9uYWxkQGlubm92YXRpb24uY2g+
Cj4gPiA+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+
ID4gCj4gPiAKPiA+IEFwcGFyZW50bHkgdGhpcyBwYXRjaCB3YXMgbm90IHF1ZXVlZCB0byBrZXJu
ZWwgeWV0LiBJZiB0aGVyZSBhcmUgbm8KPiA+IG9iamVjdGlvbnMgSSB3aWxsIHF1ZXVlIGl0IHZp
YSBkcm0tbWlzYy1uZXh0IHRyZWUgdG9tb3Jyb3cuCj4gCj4gSWYgdGhpcyBwYXRjaCBzZXQgd29u
J3QgYmUgcXVldWVkIGZvciA1LjMgdGhlbiBJIGd1ZXNzIHRoYXQgd291bGQgYmUgYQo+IGdvb2Qg
aWRlYS4KPiAKPiBCdXQgbWF5IEkgYXNrIHdoYXQgaXMgcHJldmVudGluZyB0aGlzIHBhdGNoIHNl
dCBmcm9tIGJlaW5nIHF1ZXVlZCBmb3IKPiB1cHN0cmVhbSwgc28gSSBjYW4gdHJ5IGFuZCBmaXgg
d2hhdGV2ZXIgdGhlIGlzc3VlIGlzPwoKQXMgSSBtZW50aW9uZWQgaW4gbXkgcHVsbCByZXF1ZXN0
IHRvIExpbnV4IEkgd2lsbCBiZSBwaWNraW5nIHVwIHRoZQpBcHBsZSBrZXlib2FyZCBkcml2ZXIg
Zm9yIHRoaXMgbWVyZ2Ugd2luZG93IGV2ZW4gdGhvdWdoIGl0IHdhcyBub3QgaW4KbmV4dCAobXkg
ZmF1bHQpLgoKSSBjcmVhdGVkIGFuZCBpbW11dGFibGUgYnJhbmNoIGZvciB0aGlzIGNoYW5nZSBp
ZiB5b3UnZCBsaWtlIHRvIHB1bGwgaXQKaW4gc28gd2UgZG8gbm90IGR1cGxpY2F0ZSBjb21taXQg
YW5kIHJpc2sgdGhlIGNvbmZsaWN0cyAoYnV0IEkgYmVsaWV2ZQpnaXQgc2hvdWxkIHJlc29sdmUg
aXQgZWl0aGVyIHdheSkuCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9kdG9yL2lucHV0LmdpdCBpZC81LjItc2lsX3NpaTg2MjAtcmMtb3B0aW9uYWwKClRo
YW5rcy4KCi0tIApEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
