Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AD7A9B6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780A38940F;
	Tue, 30 Jul 2019 13:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8198940F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:34:56 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58319
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsSHG-0002fj-52; Tue, 30 Jul 2019 15:34:54 +0200
Subject: Re: [PATCH 1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725105132.22545-2-noralf@tronnes.org>
 <fc848de3-93b3-5299-261d-475b7277cb83@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5a340b9f-6329-f9a0-991e-47d67c9ab481@tronnes.org>
Date: Tue, 30 Jul 2019 15:34:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc848de3-93b3-5299-261d-475b7277cb83@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=x++dl68bzMlgaBjM+BiSSDczqgfzlfyfjlLFMxS3ekI=; 
 b=m6sUO/GhYTDacocQQciVFG7KmOfJaJjS64uGCiEDZjKYANpd9053MC01TfzTu5SeBmQ1wW6MewR5nygP1KbjIV0cwuPpEGrexva2Dhv/hEVCG9dWuTiwYzxCmlnJUAaDC1FBv2CEcKL9gW4t1FTCGTbluDychqzBfZxjdYzhlLHILr53pneFd7r7prdnmRNrKuP3MerA5iTjEeZUuN2PrRYKOu5XnmxBpyY9aOBdtOBWytWWIuBpSupNqH7sYfSfWoTAtAHryyn4NvphmOZWAdqZ5y0iH4+Kj5gc9v9Epa24iLf/TDPTMPa/heOVrqmz2XoRWjHs7uqGgdeVC1rV8w==;
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzAuMDcuMjAxOSAxNS4xOSwgc2tyZXYgSGFucyBkZSBHb2VkZToKPiBIaSwKPiAKPiBP
biAyNS0wNy0xOSAxMjo1MSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+PiBUaGlzIG1ha2VzIHRo
ZSB0aW55IGRyaXZlcnMgdmlzaWJsZSBieSBkZWZhdWx0IHdpdGhvdXQgaGF2aW5nIHRvIGVuYWJs
ZSBhCj4+IGtub2IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlwqDCoMKg
wqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZyB8
IDM3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+PiDCoCAyIGZpbGVzIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+PiBiL2RyaXZlcnMvZ3B1L2RybS90aW55
ZHJtL0tjb25maWcKPj4gaW5kZXggNDJiMDZmNGY4OTg5Li5mOGM5YTBlNzFkZGUgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+PiBAQCAtMSwxNiArMSw5IEBACj4+IMKgICMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiAtbWVudWNvbmZpZyBEUk1fVElOWURS
TQo+PiAtwqDCoMKgIHRyaXN0YXRlICJTdXBwb3J0IGZvciBzaW1wbGUgZGlzcGxheXMiCj4+IC3C
oMKgwqAgZGVwZW5kcyBvbiBEUk0KPj4gLcKgwqDCoCBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPj4g
LcKgwqDCoCBzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCj4+IC3CoMKgwqAgaGVscAo+PiAtwqDC
oMKgwqDCoCBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYSB0aW55ZHJtIHN1cHBvcnRl
ZCBkaXNwbGF5Lgo+PiAtwqDCoMKgwqDCoCBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2ls
bCBiZSBjYWxsZWQgdGlueWRybS4KPj4gLQo+PiDCoCBjb25maWcgVElOWURSTV9IWDgzNTdECj4+
IMKgwqDCoMKgwqAgdHJpc3RhdGUgIkRSTSBzdXBwb3J0IGZvciBIWDgzNTdEIGRpc3BsYXkgcGFu
ZWxzIgo+PiAtwqDCoMKgIGRlcGVuZHMgb24gRFJNX1RJTllEUk0gJiYgU1BJCj4+ICvCoMKgwqAg
ZGVwZW5kcyBvbiBEUk0gJiYgU1BJCj4+ICvCoMKgwqAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4+
ICvCoMKgwqAgc2VsZWN0IERSTV9LTVNfQ01BX0hFTFBFUgo+PiDCoMKgwqDCoMKgIHNlbGVjdCBE
Uk1fTUlQSV9EQkkKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQo+
PiDCoMKgwqDCoMKgIGhlbHAKPiAKPiA8c25pcD4KPiAKPiBkcml2ZXJzL2dwdS9kcm0vdGlueWRy
bS9NYWtlZmlsZSBoYXM6Cj4gCj4gb2JqLSQoQ09ORklHX0RSTV9USU5ZRFJNKcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKz0gY29yZS8KPiAKPiBBbmQgQUZBSUsgYXQgbGVhc3QgbW9zdCBv
ZiB0aGUgZHJpdmVycyB1bmRlciBkcml2ZXJzL2dwdS9kcm0vdGlueWRybQo+IGFjdHVhbGx5IG5l
ZWQgdGhlIHRpbnlkcm0tY29yZS4KPiAKClRoaXMgaXMgZ29uZSBpbiBjdXJyZW50IGRybS1taXNj
LW5leHQuCkl0IHdlbnQgYXdheSB3aXRoOgpkcm0vdGlueWRybTogUmVtb3ZlIHRpbnlkcm0ua28K
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MzgxMS8KCk5vcmFsZi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
