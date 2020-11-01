Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47FB2A1F40
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 16:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C986EAC3;
	Sun,  1 Nov 2020 15:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F37E6EAC3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:46:22 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v19so7328374lji.5
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=zX46IfLHwd4bVoupLB6sliJ0B4O7hy7KdEbX/qvcK38=;
 b=FvaV3k/iAAAahR7wKtbjzKXlSim0muqkBdvJvHwv/0IIFwQRudzdQlH9IdfJZVOjOl
 r3Jo6Q93z1tAKN/yKZCBc0wW/F8R8/O5q7j0W5lP12mcNwzcZQ9SoMhcyN/WXWjLVjt1
 V4+e8teKvWL1ODkjecjER+hnfGIz8FhHruhl2bgy3NlX3x9LIUhJnTY6VBY8Yz91gw9V
 PIshrFEljey44MIr1BXLmgNEdhlLP52AcHDoCQspEVJfIFtyaARFrM5XTwGvIZU9mOeh
 aRLbzhaW4Dtg2FN2Qmg5v1o9kyNP3yADJlDuVoUqgUi+2NdVfcvGvY5t81UwDUVAQ5PE
 oPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=zX46IfLHwd4bVoupLB6sliJ0B4O7hy7KdEbX/qvcK38=;
 b=ZHfpkoYj6nvoapErZmVawpHoO4CS23L0eI9/zxrkOFjMg5YvjZx8sAkO4ZoZqDNZQC
 NwqNVTguYeWkicoHbw1rV87qnXa/tolOm2SPBdrf4gkcoVCbiv+3I02nCtIpPbjs9OKV
 g/gzSlMi+EwZ/An2RjcHoso3iqBtLUfUyb4nC/V9wrgRYnsc8755BcLZYCKU4I6H5YAc
 Pi9qbbqRuQ4JAHg82FtGFy3y6wdepxoKVZGran2HNlpPFIW51CUNu8pc+Uhelg9eG9UZ
 5A7L440CgGt3LgVkz+b4lOCYZ/FJaG6Ttrgq1q+vkfxmnfMTWxVrcGYgmemSQWM6s1lp
 n1eg==
X-Gm-Message-State: AOAM533ggIuAH2ibrJXzYU8jbCTy7vJcd9of93zUSTbKHjwKNBAFBqfR
 Pjw/tuIJ2/+vYa07+uirijH8P8pjQTozsn2bsGE=
X-Google-Smtp-Source: ABdhPJxzkjtgFTFxQMQNdXV5G23QSL6dVE5OHZJB58MRUFp9ulnEvauc2OTiPFtT45bMx0Sr7cgnObAiG7CtycCqcqg=
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr4646697ljj.271.1604245580967; 
 Sun, 01 Nov 2020 07:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH2rBaWKox9nKM=_Wz8k65FLt1R7D8xSOUxe7xAJ1A00hA@mail.gmail.com>
 <961863f7-933d-d455-cd5d-99bab898ee75@gmail.com>
In-Reply-To: <961863f7-933d-d455-cd5d-99bab898ee75@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Mon, 2 Nov 2020 00:45:44 +0900
Message-ID: <CAGTfZH1d0t_Cp7J5LNntCPMNrkDDzwqDz3knJ6XpR0+qTD4HbA@mail.gmail.com>
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Dmitry Osipenko <digetx@gmail.com>
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
Reply-To: cwchoi00@gmail.com
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gTW9uLCBOb3YgMiwgMjAyMCBhdCAxMjoyNCBBTSBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gMDEuMTEuMjAyMCAxNzo0NCwgQ2hhbndv
byBDaG9pINC/0LjRiNC10YI6Cj4gPiBIaSBEbWl0cnksCj4gPgo+ID4gT24gTW9uLCBPY3QgMjYs
IDIwMjAgYXQgNzoyMiBBTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBtb3ZlcyBBQ1RNT04gZHJpdmVyIGF3YXkgZnJvbSBnZW5l
cmF0aW5nIE9QUCB0YWJsZSBieSBpdHNlbGYsCj4gPj4gdHJhbnNpdGlvbmluZyBpdCB0byB1c2Ug
dGhlIHRhYmxlIHdoaWNoIGNvbWVzIGZyb20gZGV2aWNlLXRyZWUuIFRoaXMKPiA+PiBjaGFuZ2Ug
YnJlYWtzIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBkZXZpY2UtdHJlZXMgaW4gb3JkZXIgdG8g
YnJpbmcKPiA+PiBzdXBwb3J0IGZvciB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yayB0byB0aGUg
ZHJpdmVyLiBUaGlzIGlzIGEgbWFuZGF0b3J5Cj4gPj4gY2hhbmdlIHdoaWNoIG5lZWRzIHRvIGJl
IGRvbmUgaW4gb3JkZXIgdG8gaW1wbGVtZW50IGludGVyY29ubmVjdC1iYXNlZAo+ID4+IG1lbW9y
eSBEVkZTLiBVc2VycyBvZiBsZWdhY3kgZGV2aWNlLXRyZWVzIHdpbGwgZ2V0IGEgbWVzc2FnZSB0
ZWxsaW5nIHRoYXQKPiA+PiB0aGVpcnMgRFQgbmVlZHMgdG8gYmUgdXBncmFkZWQuIE5vdyBBQ1RN
T04gaXNzdWVzIG1lbW9yeSBiYW5kd2lkdGggcmVxdWVzdAo+ID4+IHVzaW5nIGRldl9wbV9vcHBf
c2V0X2J3KCksIGluc3RlYWQgb2YgZHJpdmluZyBFTUMgY2xvY2sgcmF0ZSBkaXJlY3RseS4KPiA+
Pgo+ID4+IFRlc3RlZC1ieTogUGV0ZXIgR2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4KPiA+PiBU
ZXN0ZWQtYnk6IE5pY29sYXMgQ2hhdXZldCA8a3dpemFydEBnbWFpbC5jb20+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+
ICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMgfCA5MSArKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA0
MyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RldmZyZXEvdGVn
cmEzMC1kZXZmcmVxLmMgYi9kcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMKPiA+PiBp
bmRleCAzZjczMmFiNTM1NzMuLjFiMGI5MWE3MTg4NiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJz
L2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMKPiA+PiArKysgYi9kcml2ZXJzL2RldmZyZXEvdGVn
cmEzMC1kZXZmcmVxLmMKPiA+PiBAQCAtMTksNiArMTksOCBAQAo+ID4+ICAjaW5jbHVkZSA8bGlu
dXgvcmVzZXQuaD4KPiA+PiAgI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgo+ID4+Cj4gPj4g
KyNpbmNsdWRlIDxzb2MvdGVncmEvZnVzZS5oPgo+ID4+ICsKPiA+Cj4gPiBUaGlzIHBhdGNoIHRv
dWNoZXMgdGhlIE9QUC4gSXMgaXQgcmVsYXRlZCB0byB0aGlzIGNoYW5nZT8KPgo+IFllcywgdGhp
cyBpcyBuZWVkZWQgZm9yIHRoZSBkZXZfcG1fb3BwX3NldF9zdXBwb3J0ZWRfaHcoKS4KCk9LLgoK
Pgo+ID4+ICAjaW5jbHVkZSAiZ292ZXJub3IuaCIKPiA+Pgo+ID4+ICAjZGVmaW5lIEFDVE1PTl9H
TEJfU1RBVFVTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKPiA+PiBA
QCAtMTU1LDYgKzE1Nyw3IEBAIHN0cnVjdCB0ZWdyYV9kZXZmcmVxX2RldmljZSB7Cj4gPj4KPiA+
PiAgc3RydWN0IHRlZ3JhX2RldmZyZXEgewo+ID4+ICAgICAgICAgc3RydWN0IGRldmZyZXEgICAg
ICAgICAgKmRldmZyZXE7Cj4gPj4gKyAgICAgICBzdHJ1Y3Qgb3BwX3RhYmxlICAgICAgICAqb3Bw
X3RhYmxlOwo+ID4+Cj4gPj4gICAgICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbCAgICAqcmVzZXQ7
Cj4gPj4gICAgICAgICBzdHJ1Y3QgY2xrICAgICAgICAgICAgICAqY2xvY2s7Cj4gPj4gQEAgLTYx
MiwzNCArNjE1LDE5IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX2FjdG1vbl9zdG9wKHN0cnVjdCB0ZWdy
YV9kZXZmcmVxICp0ZWdyYSkKPiA+PiAgc3RhdGljIGludCB0ZWdyYV9kZXZmcmVxX3RhcmdldChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgKmZyZXEsCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgZmxhZ3MpCj4gPj4gIHsKPiA+PiAtICAgICAgIHN0cnVj
dCB0ZWdyYV9kZXZmcmVxICp0ZWdyYSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4+IC0gICAg
ICAgc3RydWN0IGRldmZyZXEgKmRldmZyZXEgPSB0ZWdyYS0+ZGV2ZnJlcTsKPiA+PiAgICAgICAg
IHN0cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4gPj4gLSAgICAgICB1bnNpZ25lZCBsb25nIHJhdGU7
Cj4gPj4gLSAgICAgICBpbnQgZXJyOwo+ID4+ICsgICAgICAgaW50IHJldDsKPiA+Pgo+ID4+ICAg
ICAgICAgb3BwID0gZGV2ZnJlcV9yZWNvbW1lbmRlZF9vcHAoZGV2LCBmcmVxLCBmbGFncyk7Cj4g
Pj4gICAgICAgICBpZiAoSVNfRVJSKG9wcCkpIHsKPiA+PiAtICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJGYWlsZWQgdG8gZmluZCBvcHAgZm9yICVsdSBIelxuIiwgKmZyZXEpOwo+ID4+ICsg
ICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBmaW5kIG9wcCBmb3IgJWx1IEh6
XG4iLCAqZnJlcSk7Cj4gPgo+ID4gWW91IHVzZWQgdGhlICdGYWlsZWQgdG8nIGZvcm1hdCBpbiBh
bG1vc3QgZXZlcnkgZXJyb3IgY2FzZS4KPiA+IERvbid0IG5lZWQgdG8gY2hhbmdlIGl0Lgo+ID4g
KHNuaXApCj4KPiBHb29kIGNhdGNoLCB0aGFua3MuCgoKCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53
b28gQ2hvaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
