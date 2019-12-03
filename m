Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA88110564
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F2D6EB2D;
	Tue,  3 Dec 2019 19:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EBB6E874
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 19:43:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB3JhODG074918;
 Tue, 3 Dec 2019 13:43:24 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB3JhO27070473
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Dec 2019 13:43:24 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Dec
 2019 13:43:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Dec 2019 13:43:23 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB3JhKsZ016836;
 Tue, 3 Dec 2019 13:43:21 -0600
Subject: Re: [PATCH v1 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
To: kbuild test robot <lkp@intel.com>, Yuti Amonkar <yamonkar@cadence.com>
References: <1575368166-861-3-git-send-email-yamonkar@cadence.com>
 <201912040137.xx69sYBY%lkp@intel.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dfe5888a-e9c6-05d3-24bd-05883cf909ca@ti.com>
Date: Tue, 3 Dec 2019 21:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201912040137.xx69sYBY%lkp@intel.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575402204;
 bh=lYrywAX+KBCDofvH9GZ6EwhgGoKgnSVDEDRj5QGZU3I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ofwS9+Z9knJUERRk1ya5R504pd/sm4EKyxtROM44WvpyYNoFxCpH3gwHlhXVaaU/t
 OaalSuVnu8gNPPiIOJAliKA+F+yMj2c1mq9Ns6gUyWOJjAgpBlHszTGQoDZIn7tfmP
 KcAKGVmrS+jy2TENzC27rybplxHoLSay8Ms2rDdg=
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
Cc: mparab@cadence.com, kbuild-all@lists.01.org, praneeth@ti.com,
 dkangude@cadence.com, dri-devel@lists.freedesktop.org, "ABRAHAM,
 KISHON VIJAY" <kishon@ti.com>, tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMTIvMjAxOSAxOTozMSwga2J1aWxkIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4gSGkgWXV0aSwK
PiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEgWWV0IHNvbWV0aGluZyB0byBpbXByb3ZlOgo+
IAo+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gZHJtLWV4eW5vcy9leHlub3MtZHJtLW5leHRd
Cj4gW2Fsc28gYnVpbGQgdGVzdCBFUlJPUiBvbiB2NS40IG5leHQtMjAxOTEyMDNdCj4gW2lmIHlv
dXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVz
IGEgbm90ZSB0byBoZWxwCj4gaW1wcm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28gc3VnZ2Vz
dCB0byB1c2UgJy0tYmFzZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhlCj4gYmFzZSB0cmVlIGluIGdp
dCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBzZWUgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3
NDA2OTgyXQo+IAo+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29t
bWl0cy9ZdXRpLUFtb25rYXIvZHJtLUFkZC1zdXBwb3J0LWZvci1DYWRlbmNlLU1IRFAtRFBJLURQ
LWJyaWRnZS1hbmQtSjcyMUUtd3JhcHBlci8yMDE5MTIwMy0yMzAzMzUKPiBiYXNlOiAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RhZWlua2kvZHJtLWV4
eW5vcy5naXQgZXh5bm9zLWRybS1uZXh0Cj4gY29uZmlnOiBzaC1hbGxtb2Rjb25maWcgKGF0dGFj
aGVkIGFzIC5jb25maWcpCj4gY29tcGlsZXI6IHNoNC1saW51eC1nY2MgKEdDQykgNy41LjAKPiBy
ZXByb2R1Y2U6Cj4gICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNv
bS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNy
b3NzCj4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICAjIHNhdmUg
dGhlIGF0dGFjaGVkIC5jb25maWcgdG8gbGludXggYnVpbGQgdHJlZQo+ICAgICAgICAgR0NDX1ZF
UlNJT049Ny41LjAgbWFrZS5jcm9zcyBBUkNIPXNoIAo+IAo+IElmIHlvdSBmaXggdGhlIGlzc3Vl
LCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Cj4gCj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOgo+IAo+Pj4gZHJpdmVycy9ncHUvL2RybS9icmlkZ2UvY2Rucy1taGRwLmM6MjA6MTA6IGZh
dGFsIGVycm9yOiBsaW51eC9waHkvcGh5LWRwLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
PiAgICAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHktZHAuaD4KPiAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn4KCkhtbW0sIG1heWJlIHdlIHNob3VsZCBhZnRlciBhbGwgd2Ugc2hvdWxk
IHB1dCB0aGlzIHNlcmllcyB0b2dldGhlciB3aXRoCnRoZSB0b3JyZW50IHBoeSBzZXJpZXMgWzFd
LCBzaW5jZSB0aGUgcGh5IERpc3BsYXlQb3J0IGNvbmZpZ3VyYXRpb24Kb3B0aW9ucyBwYXRjaFsy
XSBpcyBwYXJ0IG9mIHRoYXQgc2VyaWVzLgoKWzFdCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LURlY2VtYmVyLzI0NzM0My5odG1sClsyXQpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1EZWNlbWJl
ci8yNDczNDQuaHRtbAoKS2lzaG9uLCBhbnkgb2JqZWN0aW9ucyBpZiB0aGUgdG9ycmVuIHBoeSBz
ZXJpZXMgd2l0aCB0aGUgcGh5IGRwIG9wdGlvbnMKcGF0Y2ggd2lsbCBiZSBtZXJnZWQgdG8gbWFp
bmxpbmUgdmlhIGRybSB0cmVlIHdpdGggdGhlIGNkbnMtbWhkcCBwYXRjaGVzCih3aGVuIHdlIGFy
ZSBkb25lIHdpdGggdGhlIHJldmlld3MpPwoKQmVzdCByZWdhcmRzLApKeXJpCgoKPiAgICBjb21w
aWxhdGlvbiB0ZXJtaW5hdGVkLgo+IAo+IHZpbSArMjAgZHJpdmVycy9ncHUvL2RybS9icmlkZ2Uv
Y2Rucy1taGRwLmMKPiAKPiAgID4gMjAJI2luY2x1ZGUgPGxpbnV4L3BoeS9waHktZHAuaD4KPiAg
ICAgMjEJI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgICAgMjIJCj4gCj4gLS0tCj4gMC1EQVkg
a2VybmVsIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRl
Y2hub2xvZ3kgQ2VudGVyCj4gaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2ti
dWlsZC1hbGxAbGlzdHMuMDEub3JnIEludGVsIENvcnBvcmF0aW9uCj4gCgoKLS0gClRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
