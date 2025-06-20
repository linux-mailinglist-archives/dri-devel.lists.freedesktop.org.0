Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B338AE1075
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 02:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBE210E1C1;
	Fri, 20 Jun 2025 00:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="YONeY4yh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31CEC10E1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 00:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=6PhmZNSt67gaNP7Y+ECy5WsFEPaj5GE+ghBCyYOL18M=; b=Y
 ONeY4yhHUksl9m82p/MoIKTH9dmxEeCMXNRitsDhCZG4coTQCP12rufkYuwggPTP
 mcgFwWc5993vjmRdt1FKW3GZJDDXWMy/A4RI4mBtB5nToOlHG0un7Mkm/la6BxND
 yBx1aLw2O3uDA3mxSql1RetMkY2fHXtew0ig9YpMWI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-103 (Coremail) ; Fri, 20 Jun 2025 08:42:49 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 20 Jun 2025 08:42:49 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: "Diederik de Haas" <didi.debian@cknow.org>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 "Dang Huynh" <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re:Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <oT4pI24an4vFCCysHCInNVi7B-jsgNUVKs4olmiuQ4lWzdd0FS_nwMs-ja40ofjDElVARdad8I_eTG9tRXkgJos48eQmsWo13V5mgc-dXEg=@proton.me>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAI0A1Y753FJ.B0NMT8L5VPEH@cknow.org>
 <4b380a57.8ab2.197591815a8.Coremail.andyshrk@163.com>
 <DAISW8MXEU0G.3AMRSKNYQUJY8@cknow.org>
 <4e600374.6dc7.1975df03a2d.Coremail.andyshrk@163.com>
 <DAJNEG81JCU5.35KVU8KAT5MDU@cknow.org>
 <b25ddc.a29c.1975eea8033.Coremail.andyshrk@163.com>
 <DAJPBG7GPPH2.3BDCMH0U3FU0E@cknow.org>
 <562b38e5.a496.1975f09f983.Coremail.andyshrk@163.com>
 <oT4pI24an4vFCCysHCInNVi7B-jsgNUVKs4olmiuQ4lWzdd0FS_nwMs-ja40ofjDElVARdad8I_eTG9tRXkgJos48eQmsWo13V5mgc-dXEg=@proton.me>
X-NTES-SC: AL_Qu2eAv+Tv0kt7yOfbekfmkcVgOw9UcO5v/Qk3oZXOJF8jC3pxB8AV3NTMGPMwcWDBhmonQiHSjJy8+ZjY5ByWr8wJ9NakROcsrEAzj2pk3RWwg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4a124fa9.75b.1978ac9c8a8.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZygvCgD3v8aJrlRoK4AgAA--.33783W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gtyXmhUrUYajgABs3
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhJIFBpb3Ry77yMCgrlnKggMjAyNS0wNi0xOSAxOTo1NDoxMu+8jCJQaW90ciBaYWxld3NraSIg
PHBaMDEwMDAxMDExMTExQHByb3Rvbi5tZT4g5YaZ6YGT77yaCj5IaSBBbmR5Cj4KPj4gCj4+IFRo
ZSByb290IGNhc2UgZm9yIHRoZSBwcm9ibGVtIGlzIG5vdyBjbGVhcuOAggo+PiAKPj4gTW9zdCBv
ZiB0aGUgcmVnaXN0ZXJzIGluIFZPUCBuZWVkIHRvIHdyaXRlIHRoZSBjZmRfZG9uZSByZWdpc3Rl
cihjYWxsIHZvcDJfY2ZnX2RvbmUpCj4+IGFmdGVyIHlvdSBoYXZlIGNvbmZpZ3VyZWQgdGhlIHJl
Z2lzdGVycy4gVGhlbiwgdGhleSB3aWxsIHRha2UgZWZmZWN0IG9ubHkgd2hlbiB0aGUgVlNZTkMg
ZXZlbnQgb2NjdXJzKEl0IGRvZXNuJ3QgdGFrZSBlZmZlY3QgaW1tZWRpYXRlbHkgYWZ0ZXIgeW91
IGZpbmlzaCB3cml0aW5nLikuCj4+IFRoaXMgYWxzbyBpbmNsdWRlcyBhbGwgdGhlIFZQX0RTUF9D
VFJMIHJlZ2lzdGVycy4KPj4gCj4+IHNlZSB0aGUgY29kZToKPj4gCj4+IHZvcDJfdnBfd3JpdGUo
dnAsIFJLMzU2OF9WUF9EU1BfQ1RSTCwgZHNwX2N0cmwpOwo+PiAKPj4gdm9wMl9jcnRjX2F0b21p
Y190cnlfc2V0X2dhbW1hKHZvcDIsIHZwLCBjcnRjLCBjcnRjX3N0YXRlKTsKPj4gLS0+Cj4+IAo+
PiBzdGF0aWMgdm9pZCB2b3AyX3ZwX2RzcF9sdXRfZGlzYWJsZShzdHJ1Y3Qgdm9wMl92aWRlb19w
b3J0IHZwKQo+PiB7Cj4+IHUzMiBkc3BfY3RybCA9IHZvcDJfdnBfcmVhZCh2cCwgUkszNTY4X1ZQ
X0RTUF9DVFJMKTsKPj4gCj4+IAo+PiBXaGVuIHdlIHJlYWQgdGhpcyByZWdpc3Rlciwgd2UgYXJl
IHJlYWRpbmcgdGhlIGFjdHVhbCBlZmZlY3RpdmUgdmFsdWUsCj4+IG5vdCB0aGUgb25lKGRzcF9j
dHJsKSB0aGF0IHdhcyBqdXN0IHdyaXR0ZW4gaW4gYmVmb3JlIChpdCBoYXMgbm90IHlldCB0YWtl
biBlZmZlY3QpCj4+IAo+PiBTbyB3aGVuIHdlIGNvbnRpbnVlIHRvIHdyaXRlIGFib3V0IHRoaXMg
cmVnaXN0ZXIgaGVyZSwgd2Ugb3ZlcndyaXRlIHRoZSBhY3R1YWwKPj4gdmFsdWUgd2Ugb3JpZ2lu
YWxseSBpbnRlbmRlZCB0byBwdXQgaW4uCj4+IAo+PiAKPj4gZHNwX2N0cmwgJj0gflJLMzU2OF9W
UF9EU1BfQ1RSTF9fRFNQX0xVVF9FTjsKPj4gdm9wMl92cF93cml0ZSh2cCwgUkszNTY4X1ZQX0RT
UF9DVFJMLCBkc3BfY3RybCk7Cj4+IH0KPj4gCj4+IEkgdGhpbmsgdGhlIGNvcnJlY3Qgc29sdXRp
b24gc2hvdWxkIGJlIHNpbWlsYXIgdG8gdGhlIFdpbmRvd3MtcmVsYXRlZCByZWdpc3RyeSBzZXR0
aW5ncy4KPj4gQWxsIHRoZSByZWdpc3RlcnMgcmVsYXRlZCB0byBWaWRlbyBQb3J0cyBzaG91bGQg
YmUgc2V0IGFzIG5vbi12b2xhdGlsZSwgc2VlOgo+PiAKPj4gLwo+PiAqIFRoZSB3aW5kb3cgcmVn
aXN0ZXJzIGFyZSBvbmx5IHVwZGF0ZWQgd2hlbiBjb25maWcgZG9uZSBpcyB3cml0dGVuLgo+PiAq
IFVudGlsIHRoYXQgdGhleSByZWFkIGJhY2sgdGhlIG9sZCB2YWx1ZS4gQXMgd2UgcmVhZC1tb2Rp
Znktd3JpdGUKPj4gKiB0aGVzZSByZWdpc3RlcnMgbWFyayB0aGVtIGFzIG5vbi12b2xhdGlsZS4g
VGhpcyBtYWtlcyBzdXJlIHdlIHJlYWQKPj4gKiB0aGUgbmV3IHZhbHVlcyBmcm9tIHRoZSByZWdt
YXAgcmVnaXN0ZXIgY2FjaGUuCj4+ICovCj4+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3Jh
bmdlIHZvcDJfbm9udm9sYXRpbGVfcmFuZ2VbXSA9IHsKPj4gcmVnbWFwX3JlZ19yYW5nZSgweDEw
MDAsIDB4MjNmZiksCj4+IH07Cj4+IAo+PiBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9hY2Nl
c3NfdGFibGUgdm9wMl92b2xhdGlsZV90YWJsZSA9IHsKPj4gLm5vX3JhbmdlcyA9IHZvcDJfbm9u
dm9sYXRpbGVfcmFuZ2UsCj4+IC5uX25vX3JhbmdlcyA9IEFSUkFZX1NJWkUodm9wMl9ub252b2xh
dGlsZV9yYW5nZSksCj4+IH07Cj4KPkZvbGxvd2luZyB5b3VyIHN1Z2dlc3Rpb24gSSBhZGRlZCB2
b3AyIHZpZGVvIHBvcnQgcmVnaXN0ZXJzIGFzIG5vdAo+dm9sYXRpbGUgYW5kIGl0IGZpeGVkIHRo
ZSBpc3N1ZS4gSSB0b29rIHRoZSB2YWx1ZXMgZnJvbSBSSzM1ODggVFJNCj5QYXJ0MiBWMS4xLiBT
ZWUgdGhlIHBhdGNoIGJlbG93IGFuZCBjb25maXJtIGlmIGl0IGlzIGNvcnJlY3QuCj4KPmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRleCBkMGY1ZmVh
MTVlMjEuLmM1YzE5MTBmYTVjYSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTI1OTYsNiArMjU5Niw3IEBAIHN0YXRpYyBpbnQgdm9wMl93
aW5faW5pdChzdHJ1Y3Qgdm9wMiAqdm9wMikKPiAgKi8KPiBzdGF0aWMgY29uc3Qgc3RydWN0IHJl
Z21hcF9yYW5nZSB2b3AyX25vbnZvbGF0aWxlX3JhbmdlW10gPSB7Cj4gCXJlZ21hcF9yZWdfcmFu
Z2UoMHgxMDAwLCAweDIzZmYpLAo+KwlyZWdtYXBfcmVnX3JhbmdlKDB4MEMwMCwgMHgwZmZmKSwK
PiB9Owo+IAoKRm9yIGEgY29tcGxldGUgc29sdXRpb24sIHRoZSByZWdpc3RlcnMgb2YgYWxsIGZv
dXIgVmlkZW8gUG9ydHMgc2hvdWxkIGFsbCBiZQptYXJrZWQgYXMgbm9uLXZvbGF0aWxlLgpBbmQg
dGhleSBzaG91bGQgYmUgYXJyYW5nZWQgaW4gYXNjZW5kaW5nIG9yZGVyIG9mIGFkZHJlc3Mgc2l6
ZSwgc28gdGhleQpzaG91bGQgYmUgcGxhY2VkIGJlZm9yZSAweDEwMDAuCgpBZGRpdGlvbmFsbHks
IHRoZSBjb21tZW50cyBoZXJlIHNob3VsZCBhbHNvIGJlIHVwZGF0ZWQgYWNjb3JkaW5nbHkuCgoK
I2RlZmluZSBSSzM1NjhfVlAwX0NUUkxfQkFTRSAgICAgICAgICAgICAgICAgICAgMHgwQzAwCiNk
ZWZpbmUgUkszNTY4X1ZQMV9DVFJMX0JBU0UgICAgICAgICAgICAgICAgICAgIDB4MEQwMAojZGVm
aW5lIFJLMzU2OF9WUDJfQ1RSTF9CQVNFICAgICAgICAgICAgICAgICAgICAweDBFMDAKI2RlZmlu
ZSBSSzM1ODhfVlAzX0NUUkxfQkFTRSAgICAgICAgICAgICAgICAgICAgMHgwRjAwCgo+IHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2FjY2Vzc190YWJsZSB2b3AyX3ZvbGF0aWxlX3RhYmxlID0g
ewo+Cj4KPj4gQWN0dWFsbHksIHRoZXJlIGlzIGFub3RoZXIgcXVlc3Rpb24uIEkgc3RpbGwgaGF2
ZW4ndCBmaWd1cmVkIG91dCB3aHkKPj4gdGhpcyBwcm9ibGVtIGRvZXNuJ3Qgb2NjdXIgd2hlbiBj
b21waWxpbmcgcm9ja2NoaXBkcm09eSAuCj4KPkNvdWxkbid0IHJlYXNvbiBvdXQgd2h5IHRoaXMg
b25seSBoYXBwZW5zIHdpdGggZHJtPW0geWV0Cj51bmZvcnR1bmF0ZWx5LgoKVGhpcyBzaG91bGQg
ZXZlbnR1YWxseSBsZWFkIHRvIGFuIGFuc3dlci4gSG93ZXZlciwgSSd2ZSBiZWVuIHF1aXRlIGJ1
c3kgcmVjZW50bHkKYW5kIGhhdmVuJ3QgaGFkIHRpbWUgdG8gY29uZHVjdCBmdXJ0aGVyIGFuYWx5
c2lzIHlldC4gSSB3aWxsIGluY29ycG9yYXRlIGl0IGludG8gbXkgVE9ETyBsaXN0LgoKCj4KPkJl
c3QgcmVnYXJkcywgUGlvdHIgWmFsZXdza2kK
