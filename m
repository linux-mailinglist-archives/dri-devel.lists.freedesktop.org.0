Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7BE25A619
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BFB6E902;
	Wed,  2 Sep 2020 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63066E0DE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 05:24:14 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kDLE4-0005ia-UK
 for dri-devel@lists.freedesktop.org; Wed, 02 Sep 2020 05:22:29 +0000
Received: by mail-pf1-f198.google.com with SMTP id x125so2049232pfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 22:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wMqbe9fjKIQ0LZl5FhPinVHwgKbnNs2WDnA3NP2bLUs=;
 b=cVVQvfmLpBHNtXM5PyiXGdt/rZrbtIpmZ8lGMMgTm5oa66OYjTEuNttgkY+ei5UVwK
 6t1hHxbsL9l8PIzBt90Ah483hYxyDeQqieGebsJRK0zfQZHF0+yJePAH8MSPQSqJP2kY
 RLcgHuYfJ/1ewE6iEYNeuko9S23cHlHdO+inAohsM10C49e6Oinfgg1CdgK6gEvNshkE
 vPonp9VjhZ2JqYw4aY26zC4wAWV9b2Q8nkLu8uxDy2tx4tqLrXVJ45E6nM9bKmRbOcn2
 AE7dDstcTg4w9fsUDYJjOl54ZVt4UlkSiMmXuSA9kHz/gUETZb1g/eOJ8K8OS3SMP9sL
 RipA==
X-Gm-Message-State: AOAM530wwsfoIamCqNTrqVIJI9kcgRdyjLno6eK3biuyKj0vSdGxTImB
 BH4pUSI+6XE09kJ5Wguak50XeGTsIBfyEXJ9ftCiALpnZX4rvR4V5FA6dki8XrVoBv2FA2L6Dz9
 w0Vy/BX1GGDj1H0obfXDixCbY+rla8Gr07Ym3eo4WH8TvpQ==
X-Received: by 2002:a17:90a:af82:: with SMTP id
 w2mr722047pjq.185.1599024146761; 
 Tue, 01 Sep 2020 22:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwViL3221ms+ijBjNKHR4OA2XAP9LtY9zANzX6D+Esz/RzAKY2p2wPTcMpDjCcWoSdimi1SAg==
X-Received: by 2002:a17:90a:af82:: with SMTP id
 w2mr722004pjq.185.1599024146154; 
 Tue, 01 Sep 2020 22:22:26 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id t11sm3826352pfe.165.2020.09.01.22.22.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 22:22:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] drm/i915/lspcon: Limits to 8 bpc for RGB/YCbCr444
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200831194820.GB6112@intel.com>
Date: Wed, 2 Sep 2020 13:22:22 +0800
Message-Id: <F51DEE39-6D93-41A2-9EA4-C7FE94F04E72@canonical.com>
References: <20200826052143.17607-1-kai.heng.feng@canonical.com>
 <20200826162458.GP6112@intel.com>
 <6D40F1E0-AFF6-4D38-BB9B-C52B43F83266@canonical.com>
 <20200831194820.GB6112@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIFNlcCAxLCAyMDIwLCBhdCAwMzo0OCwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gCj4gT24gVGh1LCBBdWcgMjcsIDIwMjAgYXQg
MDE6MDQ6NTRQTSArMDgwMCwgS2FpIEhlbmcgRmVuZyB3cm90ZToKPj4gSGkgVmlsbGUsCj4+IAo+
Pj4gT24gQXVnIDI3LCAyMDIwLCBhdCAxMjoyNCBBTSwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+PiAKPj4+IE9uIFdlZCwgQXVnIDI2LCAy
MDIwIGF0IDAxOjIxOjE1UE0gKzA4MDAsIEthaS1IZW5nIEZlbmcgd3JvdGU6Cj4+Pj4gTFNQQ09O
IG9ubHkgc3VwcG9ydHMgOCBicGMgZm9yIFJHQi9ZQ2JDcjQ0NC4KPj4+PiAKPj4+PiBTZXQgdGhl
IGNvcnJlY3QgYnBwIG90aGVyd2lzZSBpdCByZW5kZXJzIGJsYW5rIHNjcmVlbi4KPj4+IAo+Pj4g
SG1tLiBEb2VzIAo+Pj4gZ2l0Oi8vZ2l0aHViLmNvbS92c3lyamFsYS9saW51eC5naXQgZHBfZG93
bnN0cmVhbV9wb3J0c181Cj4+PiB3b3JrPwo+Pj4gCj4+PiBBY3R1YWxseSBiZXR0ZXIgbWFrZSB0
aGF0IGRwX2Rvd25zdHJlYW1fcG9ydHNfNV5eXl5eXl5eXl5eIGFrYS4KPj4+IDU0ZDg0NmNlNjJh
MiAoImRybS9pOTE1OiBEbyBZQ2JDciA0NDQtPjQyMCBjb252ZXJzaW9uIHZpYSBEUCBwcm90b2Nv
bAo+Pj4gY29udmVydGVycyIpIHRvIGF2b2lkIHRoZSBleHBlcmltZW50cyBhbmQgaGFja3MgSSBo
YXZlIHNpdHRpbmcgb24gdG9wLgo+PiAKPj4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIGl0IHRvIG1h
aW5saW5lIG1hc3RlciBvciBkcm0tdGlwPwo+IAo+IGdpdDovL2dpdGh1Yi5jb20vdnN5cmphbGEv
bGludXguZ2l0IGRwX2Rvd25zdHJlYW1fcG9ydHNfNgoKWWVzIHRoaXMgc29sdmVzIHRoZSBpc3N1
ZS4gVGhhbmtzIGEgbG90IQoKQW55IHRpbWVsaW5lIHRoaXMgd2lsbCBnZXQgbWVyZ2VkPwoKS2Fp
LUhlbmcgCgo+IAo+IEkgdGhyZXcgb3V0IHRoZSBoYWNrcy9leHBlcmltZW50YWwgc3R1ZmYuCj4g
Cj4+IAo+PiBJIGFtIGdldHRpbmcgZXJyb3JzIG9uIHRoZSBicmFuY2g6Cj4+IAo+PiAgREVTQ0VO
RCAgb2JqdG9vbAo+PiAgQ0FMTCAgICBzY3JpcHRzL2F0b21pYy9jaGVjay1hdG9taWNzLnNoCj4+
ICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaAo+PiAgQ0hLICAgICBpbmNsdWRlL2dl
bmVyYXRlZC9jb21waWxlLmgKPj4gIEJ1aWxkaW5nIG1vZHVsZXMsIHN0YWdlIDIuCj4+ICBNT0RQ
T1NUIDE2NiBtb2R1bGVzCj4+ICBMRCAgICAgIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC92bWxp
bnV4Cj4+IGxkOiBhcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvcGd0YWJsZV82NC5vOiguYnNzKzB4
MCk6IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYF9fZm9yY2Vfb3JkZXInOyBhcmNoL3g4Ni9ib290
L2NvbXByZXNzZWQva2FzbHJfNjQubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4g
bGQ6IGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9oZWFkXzY0Lm86IHdhcm5pbmc6IHJlbG9jYXRp
b24gaW4gcmVhZC1vbmx5IHNlY3Rpb24gYC5oZWFkLnRleHQnCj4+IGxkOiB3YXJuaW5nOiBjcmVh
dGluZyBEVF9URVhUUkVMIGluIGEgUElFCj4+IG1ha2VbMl06ICoqKiBbYXJjaC94ODYvYm9vdC9j
b21wcmVzc2VkL01ha2VmaWxlOjExOTogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL3ZtbGludXhd
IEVycm9yIDEKPj4gbWFrZVsxXTogKioqIFthcmNoL3g4Ni9ib290L01ha2VmaWxlOjExMzogYXJj
aC94ODYvYm9vdC9jb21wcmVzc2VkL3ZtbGludXhdIEVycm9yIDIKPj4gbWFrZTogKioqIFthcmNo
L3g4Ni9NYWtlZmlsZToyODQ6IGJ6SW1hZ2VdIEVycm9yIDIKPj4gbWFrZTogKioqIFdhaXRpbmcg
Zm9yIHVuZmluaXNoZWQgam9icy4uLi4KPj4gCj4+IEthaS1IZW5nCj4+IAo+Pj4gCj4+Pj4gCj4+
Pj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNz
dWVzLzIxOTUKPj4+PiBTaWduZWQtb2ZmLWJ5OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5n
QGNhbm9uaWNhbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9sc3Bjb24uYyB8IDMgKystCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2xzcGNvbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9sc3Bjb24uYwo+Pj4+IGluZGV4IGI3ODFiZjQ2OTY0NC4uYzdhNDRmY2FhZGU4
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNw
Y29uLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2xzcGNv
bi5jCj4+Pj4gQEAgLTE5Niw3ICsxOTYsOCBAQCB2b2lkIGxzcGNvbl95Y2JjcjQyMF9jb25maWco
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPj4+PiAJCWNydGNfc3RhdGUtPnBvcnRf
Y2xvY2sgLz0gMjsKPj4+PiAJCWNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgPSBJTlRFTF9PVVRQ
VVRfRk9STUFUX1lDQkNSNDQ0Owo+Pj4+IAkJY3J0Y19zdGF0ZS0+bHNwY29uX2Rvd25zYW1wbGlu
ZyA9IHRydWU7Cj4+Pj4gLQl9Cj4+Pj4gKwl9IGVsc2UKPj4+PiArCQljcnRjX3N0YXRlLT5waXBl
X2JwcCA9IDI0Owo+Pj4+IH0KPj4+PiAKPj4+PiBzdGF0aWMgYm9vbCBsc3Bjb25fcHJvYmUoc3Ry
dWN0IGludGVsX2xzcGNvbiAqbHNwY29uKQo+Pj4+IC0tIAo+Pj4+IDIuMTcuMQo+Pj4gCj4+PiAt
LSAKPj4+IFZpbGxlIFN5cmrDpGzDpAo+Pj4gSW50ZWwKPiAKPiAtLSAKPiBWaWxsZSBTeXJqw6Rs
w6QKPiBJbnRlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
