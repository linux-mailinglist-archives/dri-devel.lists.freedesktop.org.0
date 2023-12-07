Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD68083A1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628A510E81A;
	Thu,  7 Dec 2023 08:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Thu, 07 Dec 2023 08:57:17 UTC
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D90010E81A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701938523; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R9urTP8yqnzxzzy1ZEzjauHbMOugyawl9QuaZPW1m6Y3GxKVNjv2S6USmbv4H1jVStfxuEMzbJiz6xwANzm7pN1zA4esy0xrjK2oxHfDPgXALGgf/BgruV9vNlkHC51IAIl44XQoDos8l5DMhceBYJADUMnIwTzim+uSadayneQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701938523;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+LI0SomczHj8RnpMV1CUV6g5y5XWDQw+jtR1FekMYrk=; 
 b=Is55bGmTv1fm+hZy72GZuLDXoKXsYEAcvD+NOJQMGX5TbHt9N0hmwyZ7VriWad5pjasByygBtSbkve3SOzIio1r7mt7LkPquLygpFP8wkZ45A0bOYH/alpIoqjdBerIzKOvlEQF4IFQ3KJX1ym3m6KNpdEqzvI6UfShdpYpdqpc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701938523; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=+LI0SomczHj8RnpMV1CUV6g5y5XWDQw+jtR1FekMYrk=;
 b=haEQilVhLhRJqjfaAtnIV8GrnncJxh1jZ4JuLEIRjbvj2DZWcImiyzcbUHfSR7aq
 JFxI3RqJa5i6vOCdykPlhmftbMaaH3EvjQ1/2ewq899twyo+O4VHXIXBy2aUCpbcmHO
 8u/Vw68h0I4NTuUf1btMqT2DpANga7TQQSzP3wTMoxMJbmDwzLgsmds0ufpFo8ms7sJ
 lLuJHfaxgRVqpMerPL4DqBVTVf3f7n14dDCvXBxkg5Uq5rHZH5fxOO0gISREWVJ6mpt
 NdiYGOUCjA+EO7KMsZv9Qps/Hrv7GN0tvPk6AWTMvyxn7ZNWR6YXIj7L7OxAo4KrwST
 ek8Bgx1kkQ==
Received: from edelgard.fodlan.icenowy.me (120.85.96.101 [120.85.96.101]) by
 mx.zohomail.com with SMTPS id 1701938522509602.3276219003837;
 Thu, 7 Dec 2023 00:42:02 -0800 (PST)
Message-ID: <7acd5af8fd4c5bf6ee0614f72cf6cb6751c89dc3.camel@icenowy.me>
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
From: Icenowy Zheng <uwu@icenowy.me>
To: Keith Zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Thu, 07 Dec 2023 16:41:56 +0800
In-Reply-To: <20231204123315.28456-5-keith.zhao@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Cc: aou@eecs.berkeley.edu, suijingfeng@loongson.cn,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 mripard@kernel.org, xingyu.wu@starfivetech.com, jack.zhu@starfivetech.com,
 palmer@dabbelt.com, tzimmermann@suse.de, paul.walmsley@sifive.com,
 shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5ZyoIDIwMjMtMTItMDTmmJ/mnJ/kuIDnmoQgMjA6MzMgKzA4MDDvvIxLZWl0aCBaaGFv5YaZ6YGT
77yaCipzbmlwKgoKPiArc3RhdGljIHZvaWQgdXBkYXRlX2N1cnNvcl9wbGFuZShzdHJ1Y3QgdnNf
ZGMgKmRjLCBzdHJ1Y3QgdnNfcGxhbmUKPiAqcGxhbmUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9wbGFu
ZSAqZHJtX3BsYW5lLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpkcm1fc3RhdGUp
Cj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSA9Cj4g
ZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKGRybV9zdGF0ZSwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoAo+IMKgIGRybV9wbGFuZSk7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHZzX3Bs
YW5lX3N0YXRlICpwbGFuZV9zdGF0ZSA9Cj4gdG9fdnNfcGxhbmVfc3RhdGUoc3RhdGUpOwo+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmRybV9mYiA9IHN0YXRlLT5mYjsK
PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGNfaHdfY3Vyc29yIGN1cnNvcjsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgY3Vyc29yLmFkZHJlc3MgPSBwbGFuZV9zdGF0ZS0+ZG1hX2FkZHJbMF07Cj4gK8Kg
wqDCoMKgwqDCoMKgY3Vyc29yLnggPSBzdGF0ZS0+Y3J0Y194Owo+ICvCoMKgwqDCoMKgwqDCoGN1
cnNvci55ID0gc3RhdGUtPmNydGNfeTsKCkZyb20gbXkgZXhwZXJpbWVudHMgb24gcG9raW5nIHdp
dGggcmVnaXN0ZXJzIG9uIFQtSGVhZCBUSDE1MjAgKGFsc28KdXNlcyBEQzgyMDAgZGlzcGxheSBj
b250cm9sbGVyIGFuZCBhIHNpbWlsYXIgZHJpdmVyKSwgdGhlIERDODIwMApoYXJkd2FyZSBoYXZl
IGEgZGlmZmVyZW50IGRlZmluaXRpb24gb2YgY3Vyc29yIHBvc2l0aW9uIFggYW5kIFkgd2l0aAp0
aGUgQ1JUQyBwbGFuZSBzdGF0ZS4KCkZvciBDUlRDIHBsYW5lIHN0YXRlLCBob3RfeCBhbmQgaG90
X3kgYXJlIG9ubHkgcHJvdmlkZWQgYXMgcmVmZXJlbmNlLAphbmQgdGhlIGN1cnNvciBzaG91bGQg
YmUgZGlzcGxheWVkIHdpdGggaXRzICgwLDApIGRyYXduIHRvIChjcnRjX3gsCmNydGNfeSkgKFtY
WV1fY3J0YyBhcmUgdmFsdWVzIHNwZWNpZmllZCBpbiBDUlRDIHN0YXRlLCB0aGUgcmlnaHQgcGFy
dApvZiB0aGUgYXNzaWdubWVudHMgaGVyZSksIHdoZW4gdGhlIGN1cnNvciBpcyBtb3ZlZCB0byAo
MCwwKSBidXQgdGhlIGhvdApwb2ludCBpcyBub3QgKDAsMCksIGl0IGNvdWxkIGJlIG5lZ2F0aXZl
LgoKSG93ZXZlciwgZm9yIERDODIwMCByZWdpc3RlcnMgZGVmaW5pdGlvbiwgY3Vyc29yIFhZIHBv
c2l0aW9uIGNvdWxkIG5vdApiZSBuZWdhdGl2ZSAtLSB0aGUgY3Vyc29yIHdpbGwgZGlzYXBwZWFy
IHRoZW47IGJlY2F1c2UgaW4gaXRzCmRlZmluaXRpb24sIHRoZSBjdXJzb3IgWFkgcG9zaXRpb24g
c2hvdWxkIGJlIHdoZXJlIHRoZSBjdXJzb3IgaXMKcG9pbnRpbmcgdG8sIGluc3RlYWQgb2YgaXRz
ICgwLDApLiBEQzgyMDAgd2lsbCBkcmF3ICgwLDApIG9mIHRoZSBjdXJzb3IKdG8gKHggLSBob3Rf
eCwgeSAtIGhvdF95KS4gU28gdG8gbWV0IHRoZSBleHBlY3RhdGlvbiBvZiB0aGUgS01TIHBsYW5l
CnNldHRpbmdzLCB0aGUgREM4MjAwIHBvc2l0aW9uIHNob3VsZCBiZSBzZXQgdG8gKGNydGNfeCAr
IGhvdF94LCBjcnRjX3kKKyBob3RfeSkgaW5zdGVhZC4gVGh1cyB0aGVzZSB0d28gbGluZXMgb2Yg
Y29kZSBzaG91bGQgYmU6CgpgYGAKICAgICAgICBjdXJzb3IueCA9IHN0YXRlLT5jcnRjX3ggKyBk
cm1fZmItPmhvdF94OwogICAgICAgIGN1cnNvci55ID0gc3RhdGUtPmNydGNfeSArIGRybV9mYi0+
aG90X3k7CmBgYAoKCj4gK8KgwqDCoMKgwqDCoMKgY3Vyc29yLmhvdF94ID0gZHJtX2ZiLT5ob3Rf
eDsKPiArwqDCoMKgwqDCoMKgwqBjdXJzb3IuaG90X3kgPSBkcm1fZmItPmhvdF95Owo+ICvCoMKg
wqDCoMKgwqDCoGN1cnNvci5kaXNwbGF5X2lkID0gdG9fdnNfZGlzcGxheV9pZChkYywgc3RhdGUt
PmNydGMpOwo+ICvCoMKgwqDCoMKgwqDCoHVwZGF0ZV9jdXJzb3Jfc2l6ZShzdGF0ZSwgJmN1cnNv
cik7Cj4gK8KgwqDCoMKgwqDCoMKgY3Vyc29yLmVuYWJsZSA9IHRydWU7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoGRjX2h3X3VwZGF0ZV9jdXJzb3IoJmRjLT5odywgY3Vyc29yLmRpc3BsYXlfaWQsICZj
dXJzb3IpOwo+ICt9CipzbmlwCg==

