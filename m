Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8272F7642
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 11:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6886489893;
	Fri, 15 Jan 2021 10:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0DA89893;
 Fri, 15 Jan 2021 10:10:16 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l0M3b-0001kr-77; Fri, 15 Jan 2021 10:10:15 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to
 profile_name[]
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210111114638.16530-1-colin.king@canonical.com>
 <20210112100706.GF5083@kadam>
 <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
 <f57062ac-499d-95bb-cf4f-bb7b5b1dea5b@wanadoo.fr>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <01121c1c-5e7c-9d47-2400-c7644f6b8254@canonical.com>
Date: Fri, 15 Jan 2021 10:10:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f57062ac-499d-95bb-cf4f-bb7b5b1dea5b@wanadoo.fr>
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUvMDEvMjAyMSAxMDowNywgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+IExlIDE1LzAx
LzIwMjEgw6AgMTA6MzcsIENvbGluIElhbiBLaW5nIGEgw6ljcml0wqA6Cj4+IE9uIDEyLzAxLzIw
MjEgMTA6MDcsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4+PiBPbiBNb24sIEphbiAxMSwgMjAyMSBh
dCAxMTo0NjozOEFNICswMDAwLCBDb2xpbiBLaW5nIHdyb3RlOgo+Pj4+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4+Pj4KPj4+PiBBIHJlY2VudCBjaGFu
Z2UgYWRkZWQgYSBuZXcgQk9PVFVQX0RFRkFVTFQgcG93ZXIgcHJvZmlsZSBtb2RlCj4+Pj4gdG8g
dGhlIFBQX1NNQ19QT1dFUl9QUk9GSUxFIGVudW0gYnV0IG9taXR0ZWQgdXBkYXRpbmcgdGhlCj4+
Pj4gY29ycmVzcG9uZGluZyBwcm9maWxlX25hbWUgYXJyYXkuwqAgRml4IHRoaXMgYnkgYWRkaW5n
IGluIHRoZQo+Pj4+IG1pc3NpbmcgQk9PVFVQX0RFRkFVTFQgdG8gcHJvZmlsZV9uYW1lW10uCj4+
Pj4KPj4+Cj4+PiBTdGlsbCBub3QgZW5vdWdoIHRvIHByZXZlbnQgdGhlIGFycmF5IG92ZXJmbG93
LsKgIEl0IG5lZWRzIFBPV0VSU0FWRSBhcwo+Pj4gd2VsbC4KPj4KPj4gVGhhbmtzIGZvciBjaGVj
a2luZywgYnV0IHRoZXJlIGlzIGEgMS10by0xIHJlbGF0aW9uIHNoaXAgbm93Ogo+Pgo+PiBlbnVt
IFBQX1NNQ19QT1dFUl9QUk9GSUxFIHsKPj4gwqDCoMKgwqDCoMKgwqDCoCBQUF9TTUNfUE9XRVJf
UFJPRklMRV9CT09UVVBfREVGQVVMVCA9IDB4MCwKPj4gwqDCoMKgwqDCoMKgwqDCoCBQUF9TTUNf
UE9XRVJfUFJPRklMRV9GVUxMU0NSRUVOM0QgPSAweDEsCj4+IMKgwqDCoMKgwqDCoMKgwqAgUFBf
U01DX1BPV0VSX1BST0ZJTEVfUE9XRVJTQVZJTkfCoCA9IDB4MiwKPj4gwqDCoMKgwqDCoMKgwqDC
oCBQUF9TTUNfUE9XRVJfUFJPRklMRV9WSURFT8KgwqDCoMKgwqDCoMKgID0gMHgzLAo+PiDCoMKg
wqDCoMKgwqDCoMKgIFBQX1NNQ19QT1dFUl9QUk9GSUxFX1ZSwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSAweDQsCj4+IMKgwqDCoMKgwqDCoMKgwqAgUFBfU01DX1BPV0VSX1BST0ZJTEVfQ09NUFVURcKg
wqDCoMKgwqAgPSAweDUsCj4+IMKgwqDCoMKgwqDCoMKgwqAgUFBfU01DX1BPV0VSX1BST0ZJTEVf
Q1VTVE9NwqDCoMKgwqDCoMKgID0gMHg2LAo+PiDCoMKgwqDCoMKgwqDCoMKgIFBQX1NNQ19QT1dF
Ul9QUk9GSUxFX0NPVU5ULAo+PiB9Owo+Pgo+PiB2cwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIHN0
YXRpYyBjb25zdCBjaGFyICpwcm9maWxlX25hbWVbXSA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIkJPT1RVUF9ERUZBVUxUIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIjNEX0ZV
TExfU0NSRUVOIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlBPV0VSX1NBVklORyIsCj4g
Cj4gVGhpcyBsaW5lIGhhcyBiZWVuIGFkZGVkIHllc3RlcmRheSBpbiBjb21taXQgZjcyN2ViZWI1
ODlkLgo+IFNvIERhbiB3YXMgcmlnaHQgd2hlbiBoZSBzZW50IGhpcyBwYXRjaCwgYnV0IHNvbWUg
ZWxzZSBmaXhlZCBpdC4KCkFoLCBteSBiYWQgZm9yIG5vdCBzZWVpbmcgdGhhdC4gOi0vCgo+IAo+
IENKCj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJWSURFTyIsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICJWUiIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJDT01QVVRFIiwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkNVU1RPTSJ9Owo+Pgo+Pgo+PiB1bmxlc3MgSSdt
IG1pc3Npbmcgc29tZXRoaW5nIGJlY2F1c2UgSSd2ZSBub3QgaGFkIGVub3VnaCBjb2ZmZWUuCj4+
Cj4+IENvbGluCj4+Cj4+Pgo+Pj4gcmVnYXJkcywKPj4+IGRhbiBjYXJwZW50ZXIKPj4+Cj4+Cj4+
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
