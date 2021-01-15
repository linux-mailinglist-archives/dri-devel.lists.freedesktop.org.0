Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F862F8CE7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13B86E093;
	Sat, 16 Jan 2021 10:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112D76E2DE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:07:40 +0000 (UTC)
Received: from [192.168.1.41] ([92.131.99.25]) by mwinf5d49 with ME
 id Gy7a2400L0Ys01Y03y7agg; Fri, 15 Jan 2021 11:07:37 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Jan 2021 11:07:37 +0100
X-ME-IP: 92.131.99.25
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to
 profile_name[]
To: Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210111114638.16530-1-colin.king@canonical.com>
 <20210112100706.GF5083@kadam>
 <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <f57062ac-499d-95bb-cf4f-bb7b5b1dea5b@wanadoo.fr>
Date: Fri, 15 Jan 2021 11:07:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgMTUvMDEvMjAyMSDDoCAxMDozNywgQ29saW4gSWFuIEtpbmcgYSDDqWNyaXTCoDoKPiBPbiAx
Mi8wMS8yMDIxIDEwOjA3LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+PiBPbiBNb24sIEphbiAxMSwg
MjAyMSBhdCAxMTo0NjozOEFNICswMDAwLCBDb2xpbiBLaW5nIHdyb3RlOgo+Pj4gRnJvbTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4+Cj4+PiBBIHJlY2VudCBj
aGFuZ2UgYWRkZWQgYSBuZXcgQk9PVFVQX0RFRkFVTFQgcG93ZXIgcHJvZmlsZSBtb2RlCj4+PiB0
byB0aGUgUFBfU01DX1BPV0VSX1BST0ZJTEUgZW51bSBidXQgb21pdHRlZCB1cGRhdGluZyB0aGUK
Pj4+IGNvcnJlc3BvbmRpbmcgcHJvZmlsZV9uYW1lIGFycmF5LiAgRml4IHRoaXMgYnkgYWRkaW5n
IGluIHRoZQo+Pj4gbWlzc2luZyBCT09UVVBfREVGQVVMVCB0byBwcm9maWxlX25hbWVbXS4KPj4+
Cj4+Cj4+IFN0aWxsIG5vdCBlbm91Z2ggdG8gcHJldmVudCB0aGUgYXJyYXkgb3ZlcmZsb3cuICBJ
dCBuZWVkcyBQT1dFUlNBVkUgYXMKPj4gd2VsbC4KPiAKPiBUaGFua3MgZm9yIGNoZWNraW5nLCBi
dXQgdGhlcmUgaXMgYSAxLXRvLTEgcmVsYXRpb24gc2hpcCBub3c6Cj4gCj4gZW51bSBQUF9TTUNf
UE9XRVJfUFJPRklMRSB7Cj4gICAgICAgICAgUFBfU01DX1BPV0VSX1BST0ZJTEVfQk9PVFVQX0RF
RkFVTFQgPSAweDAsCj4gICAgICAgICAgUFBfU01DX1BPV0VSX1BST0ZJTEVfRlVMTFNDUkVFTjNE
ID0gMHgxLAo+ICAgICAgICAgIFBQX1NNQ19QT1dFUl9QUk9GSUxFX1BPV0VSU0FWSU5HICA9IDB4
MiwKPiAgICAgICAgICBQUF9TTUNfUE9XRVJfUFJPRklMRV9WSURFTyAgICAgICAgPSAweDMsCj4g
ICAgICAgICAgUFBfU01DX1BPV0VSX1BST0ZJTEVfVlIgICAgICAgICAgID0gMHg0LAo+ICAgICAg
ICAgIFBQX1NNQ19QT1dFUl9QUk9GSUxFX0NPTVBVVEUgICAgICA9IDB4NSwKPiAgICAgICAgICBQ
UF9TTUNfUE9XRVJfUFJPRklMRV9DVVNUT00gICAgICAgPSAweDYsCj4gICAgICAgICAgUFBfU01D
X1BPV0VSX1BST0ZJTEVfQ09VTlQsCj4gfTsKPiAKPiB2cwo+IAo+ICAgICAgICAgIHN0YXRpYyBj
b25zdCBjaGFyICpwcm9maWxlX25hbWVbXSA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJCT09UVVBfREVGQVVMVCIsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiM0RfRlVMTF9TQ1JFRU4iLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIlBPV0VSX1NBVklORyIsCgpUaGlzIGxpbmUgaGFzIGJl
ZW4gYWRkZWQgeWVzdGVyZGF5IGluIGNvbW1pdCBmNzI3ZWJlYjU4OWQuClNvIERhbiB3YXMgcmln
aHQgd2hlbiBoZSBzZW50IGhpcyBwYXRjaCwgYnV0IHNvbWUgZWxzZSBmaXhlZCBpdC4KCkNKCgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlZJREVPIiwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJWUiIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiQ09NUFVURSIsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiQ1VTVE9NIn07Cj4gCj4gCj4gdW5sZXNzIEknbSBt
aXNzaW5nIHNvbWV0aGluZyBiZWNhdXNlIEkndmUgbm90IGhhZCBlbm91Z2ggY29mZmVlLgo+IAo+
IENvbGluCj4gCj4+Cj4+IHJlZ2FyZHMsCj4+IGRhbiBjYXJwZW50ZXIKPj4KPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
