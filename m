Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29A80843D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BBB10E833;
	Thu,  7 Dec 2023 09:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 974 seconds by postgrey-1.36 at gabe;
 Thu, 07 Dec 2023 09:19:52 UTC
Received: from m133.mail.163.com (m133.mail.163.com [220.181.13.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE83310E836
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=S0Dg85MYxbzWzz6JpvnPwr5bJdqD/IYGAk3vcMTo7A8=; b=N
 5Toopd71roA1NJeOJPGeSEWZLTtkCT+4BQDwf3O99weZvthzVdn6rqmjZPJNFYkh
 oFmU8YTz34KYzvlukAJM8HTxFTl8yN8mD5tGYeQzm2o53sIyhJYhgW8BfsgAuE9X
 R2mCrNFOqbHhe7PXfpkKD8QPysmMwVydPnwzSMr6uk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by ajax-webmail-wmsvr3
 (Coremail) ; Thu, 7 Dec 2023 17:02:03 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 7 Dec 2023 17:02:03 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Keith Zhao" <keith.zhao@starfivetech.com>
Subject: Re:Re: [v3 5/6] drm/vs: Add hdmi driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
X-NTES-SC: AL_Qu2bA/WYtk8p5SGYYOkXn0kXhec2W8Czvvgg34JRP5k0tinH2yYZXkdABEDs0s6MLC+JiCCtXCV+5sBIXqhZWbonSnjhy3zxeOPDLWRlKtSc
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: A8GowADnT74LinFlZaUtAA--.21688W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhA-XmVOA0buTwABst
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, Maxime Ripard <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoKCkhpIEtlaXRo77yaCgoKCgoKCgoKCgoKQXQgMjAyMy0xMi0wNiAyMjoxMTozMywgIktlaXRo
IFpoYW8iIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4KPk9uIDIwMjMv
MTIvNiAyMDo1NiwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4gT24gV2VkLCBEZWMgMDYsIDIwMjMg
YXQgMDg6MDI6NTVQTSArMDgwMCwgS2VpdGggWmhhbyB3cm90ZToKPj4+ID4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdGFyZml2ZV9oZG1pX2R0X2lkc1tdID0gewo+Pj4gPj4g
Kwl7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1pbm5vLWhkbWkiLH0sCj4+PiA+IAo+
Pj4gPiBTbyBpdCdzIGlubm8gaGRtaSwganVzdCBsaWtlIFJvY2tjaGlwIHRoZW4/Cj4+PiA+IAo+
Pj4gPiBUaGlzIHNob3VsZCBiZSBhIGNvbW1vbiBkcml2ZXIuCj4+Pgo+Pj4gUm9ja2NoaXAgaGFz
IGEgaW5ubyBoZG1pIElQLiBhbmQgU3RhcmZpdmUgaGFzIGEgaW5ubyBoZG1pIElQLgo+Pj4gYnV0
IHRoZSBoYXJld2F3cmUgZGlmZmVyZW5jZSBvZiB0aGVtIGlzIGJpZyAsIGl0IGlzIG5vdCBlYXN5
IHRvIHVzZSB0aGUgY29tbW9uIGRyaXZlcgo+Pj4gbWF5YmUgaSBuZWVkIHRoZSBpbm5vIGhkbWkg
dmVyc2lvbiBoZXJlIHRvIG1ha2UgYSBkaXN0aW5jdGlvbgo+PiAKPj4gSSBqdXN0IGhhZCBhIGxv
b2sgYXQgdGhlIHJvY2tjaGlwIGhlYWRlciBmaWxlOiBhbGwgdGhlIHJlZ2lzdGVycyBidXQgdGhl
Cj4+IFNUQVJGSVZFXyogb25lcyBhcmUgaWRlbnRpY2FsLgo+PiAKPj4gVGhlcmUncyBubyBuZWVk
IHRvIGhhdmUgdHdvIGlkZW50aWNhbCBkcml2ZXJzIHRoZW4sIHBsZWFzZSB1c2UgdGhlCj4+IHJv
Y2tjaGlwIGRyaXZlciBpbnN0ZWFkLgo+PiAKPj4gTWF4aW1lCj4KPm9rLCBoYXZlIGEgc2ltcGxl
IHRlc3QgLCBlZGlkIGNhbiBnZXQgLiBpIHdpbGwgY29udGludWUgCgpNYXliZSB5b3UgY2FuIHRh
a2UgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pIGFzIGEgcmVmZXJlbmNl
77yMIHRoaXMKaXMgYWxzbyBhIGhkbWkgaXAgdXNlZCBieSByb2NrY2hpcC9tZXNvbi9zdW54aS9q
ei9pbXjjgIIKV2UgZmluYWxseSBtYWtlIGl0IHNoYXJlIG9uZSBkcml2ZXLjgIIKPgo+Cj5fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+bGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj5saW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj5odHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
