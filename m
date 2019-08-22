Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75C98D36
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A75C6EA82;
	Thu, 22 Aug 2019 08:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB56EA6F;
 Thu, 22 Aug 2019 08:04:05 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 0i4diaYaNThuu0i4hij7Mt; Thu, 22 Aug 2019 10:04:04 +0200
Subject: Re: [PATCH v7 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-3-darekm@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8d0c6d9b-d321-7e4b-8c06-92b9b816d029@xs4all.nl>
Date: Thu, 22 Aug 2019 10:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-3-darekm@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFS6JYJ0+q2LAIYGCuj6fLd3vPJORYjU0ME/5k7e+ByKAWdY7DwySnd1VrwDnra4h8Liaj9h6QVz2CkpJPjMBXo/3g493dn33GbRBDTqxc7SkLG0XiEs
 aBKLf9xZZV6Wi9Nx1llBJUoktu1pAR3UfKootbfsbcmnM2wadZF3tWvKfQUCQl/YOxE74kQSZS+TI4XeEB12wp7vRFL4nPMnrmV3CN/GLbothgeVWXH+VqBJ
 p7/N3t/Ygq7nmyFKW0rf+TG225kLl+WcWMbettDkA+r1j94Yy+K0/EZRSUeyrQYncx9kRyGyAe+X8YB9xEQxmgoHuoXdzrJl3TouvBlhv4L8DrgKBBjJI/iM
 3V2sI548xb1YuHm/4IHB//h8YBfk17LaWcA0HSgTtQxZnQGWxcTNzg9x/btYbaUVl2XxLM9ph99szDuHgiH/Qthtx0Z6dQHLK7kSpKx4MqynPS1Xr+0=
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VmlsbGUgb3IgUm9kcmlnbywKCkNhbiBvbmUgb2YgeW91IGVpdGhlciBtZXJnZSB0aGlzIHBhdGNo
IG9yIEFjayBpdCBzbyB0aGF0IEkgY2FuIG1lcmdlIHRoaXM/CgpUaGFuayB5b3UhCgpSZWdhcmRz
LAoKCUhhbnMKCk9uIDgvMTQvMTkgMTI6NDUgUE0sIERhcml1c3ogTWFyY2lua2lld2ljeiB3cm90
ZToKPiBVc2UgdGhlIG5ldyBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIoKSBmdW5jdGlv
bnMgdG8KPiAodW4pcmVnaXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUgSERNSSBjb25uZWN0b3Is
IGFuZCBmaWxsIGluCj4gdGhlIGNlY19jb25uZWN0b3JfaW5mby4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgo+IFRlc3RlZC1ieTog
SGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4gaW5kZXggYjFjYThlNWJkYjU2
ZC4uOWZjZjJjNThjMjljNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRtaS5jCj4gQEAgLTI3NTIsOCArMjc1Miw5IEBAIGludGVsX2hkbWlfY29ubmVjdG9yX3Jl
Z2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAo+ICBzdGF0aWMgdm9p
ZCBpbnRlbF9oZG1pX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAg
ewo+IC0JaWYgKGludGVsX2F0dGFjaGVkX2hkbWkoY29ubmVjdG9yKS0+Y2VjX25vdGlmaWVyKQo+
IC0JCWNlY19ub3RpZmllcl9wdXQoaW50ZWxfYXR0YWNoZWRfaGRtaShjb25uZWN0b3IpLT5jZWNf
bm90aWZpZXIpOwo+ICsJc3RydWN0IGNlY19ub3RpZmllciAqbiA9IGludGVsX2F0dGFjaGVkX2hk
bWkoY29ubmVjdG9yKS0+Y2VjX25vdGlmaWVyOwo+ICsKPiArCWNlY19ub3RpZmllcl9jb25uX3Vu
cmVnaXN0ZXIobik7Cj4gIAo+ICAJaW50ZWxfY29ubmVjdG9yX2Rlc3Ryb3koY29ubmVjdG9yKTsK
PiAgfQo+IEBAIC0zMDY4LDYgKzMwNjksNyBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0
b3Ioc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCj4gIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gaW50ZWxfZW5jb2Rlci0+YmFzZS5kZXY7Cj4gIAlzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Cj4gIAllbnVtIHBvcnQgcG9y
dCA9IGludGVsX2VuY29kZXItPnBvcnQ7Cj4gKwlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNv
bm5faW5mbzsKPiAgCj4gIAlEUk1fREVCVUdfS01TKCJBZGRpbmcgSERNSSBjb25uZWN0b3Igb24g
cG9ydCAlY1xuIiwKPiAgCQkgICAgICBwb3J0X25hbWUocG9ydCkpOwo+IEBAIC0zMTIwLDggKzMx
MjIsMTEgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9yKHN0cnVjdCBpbnRlbF9kaWdp
dGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAo+ICAJCUk5MTVfV1JJVEUoUEVHX0JBTkRfR0FQX0RB
VEEsICh0ZW1wICYgfjB4ZikgfCAweGQpOwo+ICAJfQo+ICAKPiAtCWludGVsX2hkbWktPmNlY19u
b3RpZmllciA9IGNlY19ub3RpZmllcl9nZXRfY29ubihkZXYtPmRldiwKPiAtCQkJCQkJCSBwb3J0
X2lkZW50aWZpZXIocG9ydCkpOwo+ICsJY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25u
X2luZm8sIGNvbm5lY3Rvcik7Cj4gKwo+ICsJaW50ZWxfaGRtaS0+Y2VjX25vdGlmaWVyID0KPiAr
CQljZWNfbm90aWZpZXJfY29ubl9yZWdpc3RlcihkZXYtPmRldiwgcG9ydF9pZGVudGlmaWVyKHBv
cnQpLAo+ICsJCQkJCSAgICZjb25uX2luZm8pOwo+ICAJaWYgKCFpbnRlbF9oZG1pLT5jZWNfbm90
aWZpZXIpCj4gIAkJRFJNX0RFQlVHX0tNUygiQ0VDIG5vdGlmaWVyIGdldCBmYWlsZWRcbiIpOwo+
ICB9Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
