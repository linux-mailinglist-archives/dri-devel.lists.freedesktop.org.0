Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED52A6D9B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 20:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D5F6E239;
	Wed,  4 Nov 2020 19:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7158B6E245
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 19:12:11 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa2fd0c0003>; Wed, 04 Nov 2020 11:12:12 -0800
Received: from [10.26.45.122] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 19:12:09 +0000
Subject: Re: [PATCH V2] drm/tegra: sor: Don't warn on probe deferral
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20201104092328.659169-1-jonathanh@nvidia.com>
 <420d8e9e-47d5-0d46-a774-a47bcb52bdeb@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e0c87fcc-5fe3-d2ba-0a58-41c670ac5e0a@nvidia.com>
Date: Wed, 4 Nov 2020 19:12:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <420d8e9e-47d5-0d46-a774-a47bcb52bdeb@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604517132; bh=wcT9OxMA6Jtc1260i+qV3pzxBsKsC87iufbCazK1OME=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=fsauGQVwL1kTXSdvsFTI+tIep5GjGhoLlaF/tuMeUczl1r7KLsR0d7J7Dr4uCImnF
 pM6v6GtXbwIy8hq4Z5BcUyB2CnN8iDXR0HkKEpGcg7ER0ATcU4VSF43nWH2ysq+UNB
 zNdV7ZIsWe9yIfkaNyzokf87MR18OoyX/oAsLcrm3Ey+oR5arWrxN+n38+D+ZhvjnK
 bEMo224vD5PbaSWd5snewQyltkLT3N5R50BXMP8Ml2C2XHzEOk7nD/eFa94l2RqoS8
 uwlWGVOI+i0+XNbQMPFj4pg8/xQsedzw6qEVXN0V27T2x6d3yR5pNCcaIOG4FeCIdz
 LppHoAS6XgMbA==
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzExLzIwMjAgMTA6NDksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNC4xMS4yMDIw
IDEyOjIzLCBKb24gSHVudGVyINC/0LjRiNC10YI6Cj4+IERlZmVycmVkIHByb2JlIGlzIGFuIGV4
cGVjdGVkIHJldHVybiB2YWx1ZSBmb3IgdGVncmFfb3V0cHV0X3Byb2JlKCkuCj4+IEdpdmVuIHRo
YXQgdGhlIGRyaXZlciBkZWFscyB3aXRoIGl0IHByb3Blcmx5LCB0aGVyZSdzIG5vIG5lZWQgdG8g
b3V0cHV0Cj4+IGEgd2FybmluZyB0aGF0IG1heSBwb3RlbnRpYWxseSBjb25mdXNlIHVzZXJzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPj4g
LS0tCj4+Cj4+IENoYW5nZXMgc2luY2UgVjE6Cj4+IC0gVGhpcyB0aW1lLCBJIGFjdHVhbGx5IHZh
bGlkYXRlZCBpdCEKPj4KPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8IDcgKysrLS0t
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYwo+PiBpbmRleCBlODhhMTdjMjkzN2YuLjg5OGE4MGNhMzdmYSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYwo+PiBAQCAtMzc2NCwxMCArMzc2NCw5IEBAIHN0YXRpYyBpbnQg
dGVncmFfc29yX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAJCXJldHVy
biBlcnI7Cj4+ICAKPj4gIAllcnIgPSB0ZWdyYV9vdXRwdXRfcHJvYmUoJnNvci0+b3V0cHV0KTsK
Pj4gLQlpZiAoZXJyIDwgMCkgewo+PiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8g
cHJvYmUgb3V0cHV0OiAlZFxuIiwgZXJyKTsKPj4gLQkJcmV0dXJuIGVycjsKPj4gLQl9Cj4+ICsJ
aWYgKGVyciA8IDApCj4+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIGVyciwK
Pj4gKwkJCQkgICAgICJmYWlsZWQgdG8gcHJvYmUgb3V0cHV0OiAlZFxuIiwgZXJyKTsKPiAKPiBI
ZWxsbyBKb24sCj4gCj4gVGhlcmUgaXMgbm8gbmVlZCB0byBkdXBsaWNhdGUgdGhlIGVycm9yIGNv
ZGUgaW4gdGhlIG1lc3NhZ2UgWzFdLiBQZXJoYXBzCj4gd29ydGggbWFraW5nIGEgdjM/IDopCklu
ZGVlZCEgVGhhbmtzIGZvciBjYXRjaGluZy4gVHJ5aW5nIHRvIGRvIHRvIG1hbnkgdGhpbmdzIGF0
IHRoZSBzYW1lCnRpbWUuIEkgc2hvdWxkIGhhdmUgbGVhcm5lZCBieSBub3chCgpKb24KCi0tIApu
dnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
