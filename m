Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F4331596
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374766E1BC;
	Mon,  8 Mar 2021 18:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55246E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 18:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KwYAVxQ8Xu/wb34tkAmEqFZ19a36NBCgir10GRki8Qs=; b=vcV1ZpPJMU9M7k+rEGYIR+UEDi
 jKoba5vA0uhkn/ojw3rNFGlQ9OuZKr2ICUNFJs2Fo/ft5IVuitlhfrRO8y785onYWhrSwh5y7hZWl
 ku44Mbo/t71KPd3ue0CrpwMHcJZHnb62vJAG369U3Yovtz3VYXF49EB+Dpj1x/+dt6upg8XrVXNNx
 4slTPtKxf0Hk7f4SUDhQPwyMUsao8mzMZnGgXVbDxRVlwfCttd5oih+2fB5QcjSa+WPChgKbDMLPy
 +gviMedSSTHDfStX46XMjHQVV2X8JoKT+q8KUZyHldfDLZlW4tJztu6pZERNyTahZWepA/S8L5D/F
 YoGoqdkw==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=56906)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lJKNN-0006wf-7l; Mon, 08 Mar 2021 19:13:05 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To: dri-devel@lists.freedesktop.org
References: <20210305163104.30756-1-noralf@tronnes.org>
 <20210305163104.30756-4-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e22eca11-6758-fb1b-5b36-0182bcf16574@tronnes.org>
Date: Mon, 8 Mar 2021 19:13:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305163104.30756-4-noralf@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDUuMDMuMjAyMSAxNy4zMSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFRoaXMgYWRk
cyBhIFVTQiBkaXNwbGF5IGRyaXZlciB3aXRoIHRoZSBpbnRlbnRpb24gdGhhdCBpdCBjYW4gYmUK
PiB1c2VkIHdpdGggZnV0dXJlIFVTQiBpbnRlcmZhY2VkIGxvdyBlbmQgZGlzcGxheXMvYWRhcHRl
cnMuIFRoZSBMaW51eAo+IGdhZGdldCBkZXZpY2UgZHJpdmVyIHdpbGwgc2VydmUgYXMgdGhlIGNh
bm9uaWNhbCBkZXZpY2UgaW1wbGVtZW50YXRpb24uCj4gCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5jCgo+
ICtzdGF0aWMgaW50IGd1ZF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgY29uc3Qg
c3RydWN0IHVzYl9kZXZpY2VfaWQgKmlkKQo+ICt7Cgo+ICsJbnVtX2Zvcm1hdHNfZGV2ID0gcmV0
Owo+ICsJZm9yIChpID0gMDsgaSA8IG51bV9mb3JtYXRzX2RldjsgaSsrKSB7Cj4gKwkJY29uc3Qg
c3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbzsKPiArCQlzaXplX3QgZm10X2J1Zl9zaXplOwo+
ICsJCXUzMiBmb3JtYXQ7Cj4gKwo+ICsJCWZvcm1hdCA9IGd1ZF90b19mb3VyY2MoZm9ybWF0c19k
ZXZbaV0pOwo+ICsJCWlmICghZm9ybWF0KSB7Cj4gKwkJCWRybV9kYmcoZHJtLCAiVW5zdXBwb3J0
ZWQgZm9ybWF0OiAweCUwMnhcbiIsIGZvcm1hdHNfZGV2W2ldKTsKPiArCQkJY29udGludWU7Cj4g
KwkJfQo+ICsKPiArCQlpZiAoZm9ybWF0ID09IEdVRF9EUk1fRk9STUFUX1IxKQo+ICsJCQlpbmZv
ID0gJmd1ZF9kcm1fZm9ybWF0X3IxOwo+ICsJCWVsc2UgaWYgKGZvcm1hdCA9PSBHVURfRFJNX0ZP
Uk1BVF9SR0IxMTEpCj4gKwkJCWluZm8gPSAmZ3VkX2RybV9mb3JtYXRfcmdiMTExOwo+ICsJCWVs
c2UKPiArCQkJaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhmb3JtYXQpOwo+ICsKPiArCQlzd2l0Y2gg
KGZvcm1hdCkgewo+ICsJCWNhc2UgR1VEX0RSTV9GT1JNQVRfUjE6Cj4gKwkJCWZhbGx0aHJvdWdo
Owo+ICsJCWNhc2UgR1VEX0RSTV9GT1JNQVRfUkdCMTExOgo+ICsJCQl4cmdiODg4OF9lbXVsYXRp
b25fZm9ybWF0ID0gaW5mbzsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBEUk1fRk9STUFUX1JHQjU2
NToKPiArCQkJcmdiNTY1X3N1cHBvcnRlZCA9IHRydWU7Cj4gKwkJCWlmICgheHJnYjg4ODhfZW11
bGF0aW9uX2Zvcm1hdCkKPiArCQkJCXhyZ2I4ODg4X2VtdWxhdGlvbl9mb3JtYXQgPSBpbmZvOwo+
ICsJCQlicmVhazsKPiArCQljYXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6Cj4gKwkJCXhyZ2I4ODg4
X3N1cHBvcnRlZCA9IHRydWU7Cj4gKwkJCWJyZWFrOwo+ICsJCX07Cj4gKwo+ICsJCWZtdF9idWZf
c2l6ZSA9IGRybV9mb3JtYXRfaW5mb19taW5fcGl0Y2goaW5mbywgMCwgZHJtLT5tb2RlX2NvbmZp
Zy5tYXhfd2lkdGgpICoKPiArCQkJICAgICAgIGRybS0+bW9kZV9jb25maWcubWF4X2hlaWdodDsK
PiArCQltYXhfYnVmZmVyX3NpemUgPSBtYXgobWF4X2J1ZmZlcl9zaXplLCBmbXRfYnVmX3NpemUp
Owo+ICsKPiArCQlpZiAoZm9ybWF0ID09IEdVRF9EUk1fRk9STUFUX1IxKQoKVGhpcyBsaW5lIHNo
b3VsZCBiZToKCgkJaWYgKGZvcm1hdCA9PSBHVURfRFJNX0ZPUk1BVF9SMSB8fCBmb3JtYXQgPT0g
R1VEX0RSTV9GT1JNQVRfUkdCMTExKQoKVGhlcmUncyBhbHNvIGEgYnVnIGluIHRoZSBmb3JtYXQg
Y29udmVyc2lvbiBmdW5jdGlvbnMgdGhhdCBzaG93cyB1cCBvbgp0cmFuc2ZlcnMgd2l0aCB3aWR0
aHMgdGhhdCBhcmUgbm90IHBpeGVscyBwZXIgYnl0ZSBhbGlnbmVkLiBJJ3ZlIGZpeGVkClIxLCBJ
J2xsIGxvb2sgYXQgUkdCMTExIHRvbW9ycm93LgoKTm9yYWxmLgoKPiArCQkJY29udGludWU7IC8q
IEludGVybmFsIG5vdCBmb3IgdXNlcnNwYWNlICovCj4gKwo+ICsJCWZvcm1hdHNbbnVtX2Zvcm1h
dHMrK10gPSBmb3JtYXQ7Cj4gKwl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
