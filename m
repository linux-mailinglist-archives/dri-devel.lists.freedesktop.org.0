Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF330D50
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 13:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25691892CD;
	Fri, 31 May 2019 11:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315B0892CD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 11:28:37 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51761
 helo=[192.168.10.179])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hWfi7-00018D-7R; Fri, 31 May 2019 13:28:35 +0200
Subject: Re: drm_gem_dumb_map_offset patch
To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <96fb4e89-2721-90bb-ce76-69667c2cf78a@st.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2a6c0803-b386-c8cc-78f8-26faa230ac44@tronnes.org>
Date: Fri, 31 May 2019 13:28:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <96fb4e89-2721-90bb-ce76-69667c2cf78a@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject;
 bh=IFDDPUV2RksH58x5CXR9xGazkvTLEAxc7T9SOJ2Np7Q=; 
 b=LdKdSYKYffGrvkCUdUcQVj9TfE1PJ+8Ooir8G8Fi+vfX+EI+wcqFBUp8O1KXp8ZIGvaETaZCjkoQvbp/BZFfFNneI1eK+pCn+P/ONM7QD/gsK02loqO8/OYO9CyLN/7e5mGedlyGesNa4O+vTEMRIjtXA77vfAoXMtSmSl17xKVZIGxl0sBJL1pyvj0nDeKo2AE5AbHHbr1oHC6ne5ThmKkwgikD9eg/Yalt8okFrPnp1E3qGafuCHr/CG8ZvuvSUsWaFXnZhCa8ytXbsO80I7tDOdb6SYfd3HQc1+pecXOBilxlTgiRaqGsEUoR+O/UHutcK04ffnn9OuUhyeNBdQ==;
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpbYWRkIERhbmllbCBWZXR0ZXJdCltjYyBkcmktZGV2ZWxdCgpEZW4gMjkuMDUuMjAxOSAx
NS4wOSwgc2tyZXYgUGllcnJlIFl2ZXMgTU9SRFJFVDoKPiBIZWxsbyBOb3JhbGYsCj4gCj4gU29y
cnkgZm9yIGJvdGhlcmluZyB5b3Ugd2l0aCBxdWVzdGlvbiBidXQgSSBuZWVkIHRvIGJldHRlciB1
bmRlcnN0YW5kIHRoZQo+IHJhdGlvbmFsIGFib3V0IGEgcGF0Y2ggeW91IGRpZCBpbiBEUk0vR0VN
Lgo+IAo+IEZpcnN0IG9mIGFsbCwgbGV0IG1lIGludHJvZHVjZSBteXNlbGYuCj4gSSdtIGN1cnJl
bnRseSBlbXBsb3llZSB0byBTVE1pY3JvZWxlY3Ryb25pY3MgY29tcGFueSBhbmQgaW4gY2hhcmdl
IG9mIEdQVQo+IGludGVncmF0aW9uIHdpdGhpbiBTVE0zMiBNUFUgKENvcnRleCBBNyArIENvcnRl
eCBNNCkKPiAKPiBPbiBDb3J0ZXggQTcgaXMgcnVubmluZyBhIExpbnV4IEtlcm5lbCA0LjE5IGFz
IGZvciB0b2RheS4KPiAKPiBXZSBjYW1lIGFjcm9zcyBzb21lIHRyb3VibGUgd2hlbiB3ZSBzd2l0
Y2ggZnJvbSBLZXJuZWwgNC4xNCB0byA0LjE5IGZvciBHUFUKPiBzdGFjay4gT24gYXVndXN0IHlv
dSBzdWJtaXQgdGhpcyBjb21taXQgOgo+IAo+IAk5MDM3OGU1ODkxOTI4NTYzN2FhMGYwNjNjMDRi
YTBjNjQ0OWQ5OGIxCj4gICAgIAkgICAgZHJtL2dlbTogZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQo
KTogcmVqZWN0IGRtYS1idWYKPiAKPiAgICAgCSAgICBSZWplY3QgbWFwcGluZyBhbiBpbXBvcnRl
ZCBkbWEtYnVmIHNpbmNlIGlzJ3MgYW4gaW52YWxpZCB1c2UtY2FzZS4KPiAKPiBJbiBVc2VybGFu
ZCBHUFUgc3RhY2sgd2UgaGF2ZSBzdWNoIHN0YXRlbWVudHMgOgo+ICAgIGJvX21hcF9mZAo+ICAg
ICAgICBEUk1fSU9DVExfTU9ERV9NQVBfRFVNQgo+ICAgICAgICBtbWFwIChvZmZzZXQpCj4gCj4g
V2l0aCB0aGUgcGF0Y2ggYWJvdmUsIGlvY3RsIHJldHVybnMgYW4gZXJyb3IgRUlOVkFMIGFuZCBw
cmV2ZW50cyB0aGUgbm1hcC4KPiBBcyBmb3IgdG9kYXkgd2UgcmV2ZXJ0IHRoaXMgcGF0Y2ggYW5k
IGl0IHdvcmtzIGZpbmUgaW4gb3VyIGVuZC4KPiAKPiBUaHVzIHRoZSBxdWVzdGlvbnMgYXJlIDoK
PiAgLSB3aGF0IGlzIHRoZSByYXRpb25hbCBiZWhpbmQgdGhpcyBmaXggPwo+ICAtIFdoYXQgd2Ug
ZG9pbmcgd3JvbmcgdGhpcyBzaXR1YXRpb24gPwo+ICAtIFdoYXQgZG8gd2UgbmVlZCBpbiBzdWNo
IHNpdHVhdGlvbiA/Cj4gCgpJIG5lZWQgdG8gcGFzcyB0aG9zZSBvbiB0byBEYW5pZWwgVmV0dGVy
IChEUk0gbWFpbnRhaW5lcikgc2luY2UgaGUKd2FudGVkIHRoZSBjaGFuZ2UuIFRoZSBkZXRhaWxz
IHdlcmUgbmV2ZXIgY2xlYXIgdG8gbWUuClNvbWUgb2YgdGhlIGRpc2N1c3Npb24gaXMgaGVyZToK
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzE3MjI0Mi8KCk5vcmFsZi4K
Cj4gTWFueSB0aGFua3MgaW4gYWR2YW5jZS4KPiBCZXN0IFJlZ2FyZHMKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
