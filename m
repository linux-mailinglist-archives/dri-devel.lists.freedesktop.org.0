Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F91104DCE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881CB6EB91;
	Thu, 21 Nov 2019 08:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1666EB91;
 Thu, 21 Nov 2019 08:26:32 +0000 (UTC)
Received: from 1.general.tjaalton.uk.vpn ([10.172.193.56])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <tjaalton@ubuntu.com>)
 id 1iXhnK-0002bL-Fy; Thu, 21 Nov 2019 08:26:30 +0000
Subject: Re: [RESEND PATCH v2] drm: Add getfb2 ioctl
To: Daniel Vetter <daniel@ffwll.ch>, Juston Li <juston.li@intel.com>
References: <20191003183125.4520-1-juston.li@intel.com>
 <20191009155054.GM16989@phenom.ffwll.local>
From: Timo Aaltonen <tjaalton@ubuntu.com>
Autocrypt: addr=tjaalton@ubuntu.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <14d291d3-774b-faec-370d-0d0164f33447@ubuntu.com>
Date: Thu, 21 Nov 2019 10:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191009155054.GM16989@phenom.ffwll.local>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS4xMC4yMDE5IDE4LjUwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFRodSwgT2N0IDAz
LCAyMDE5IGF0IDExOjMxOjI1QU0gLTA3MDAsIEp1c3RvbiBMaSB3cm90ZToKPj4gRnJvbTogRGFu
aWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5jb20+Cj4+Cj4+IGdldGZiMiBhbGxvd3MgdXMg
dG8gcGFzcyBtdWx0aXBsZSBwbGFuZXMgYW5kIG1vZGlmaWVycywganVzdCBsaWtlIGFkZGZiMgo+
PiBvdmVyIGFkZGZiLgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAgLSB1bnVzZWQgbW9kaWZp
ZXJzIHNldCB0byAwIGluc3RlYWQgb2YgRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRAo+PiAgLSB1cGRh
dGUgaW9jdGwgbnVtYmVyCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVs
c0Bjb2xsYWJvcmEuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKdXN0b24gTGkgPGp1c3Rvbi5saUBp
bnRlbC5jb20+Cj4gCj4gTG9va3MgYWxsIGdvb2QgZnJvbSBhIHZlcnkgcXVpY2sgZ2xhbmNlIChr
ZXJuZWwsIGxpYmRybSwgaWd0KSwgYnV0IHdoZXJlJ3MKPiB0aGUgdXNlcnNwYWNlPyBMaW5rIHRv
IHdlc3Rvbi9kcm1faHdjL3doYXRldmVyIE1SIGdvb2QgZW5vdWdoLgo+IC1EYW5pZWwKCnhzZXJ2
ZXIgdG9vCgpodHRwczovL2xpc3RzLngub3JnL2FyY2hpdmVzL3hvcmctZGV2ZWwvMjAxOC1NYXJj
aC8wNTYzNjMuaHRtbAoKdG8gZml4CgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9y
Zy94c2VydmVyL2lzc3Vlcy8zMwoKd2hpY2ggZm9yY2VzIFVidW50dSB0byBkaXNhYmxlIENDUyBj
b21wcmVzc2lvbiwgYW5kIEknZCBsaWtlIHRvIGdldCByaWQKb2YgdGhhdCBwYXRjaC4KClRoYW5r
cyBKdXN0b24gZm9yIHB1c2hpbmcgdGhpcyEKCgotLSAKdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
