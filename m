Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E12CAD89
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC576E02B;
	Tue,  1 Dec 2020 20:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4266E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:42:43 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fc6aac10000>; Tue, 01 Dec 2020 12:42:41 -0800
Received: from [10.26.72.142] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Dec
 2020 20:42:33 +0000
Subject: Re: [PATCH v10 17/19] ARM: tegra: Add EMC OPP properties to Tegra20
 device-trees
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Georgi Djakov <georgi.djakov@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>, "Peter
 Geis" <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-18-digetx@gmail.com>
 <60657f5e-bd30-094e-f8df-6ba69e0d6a3e@nvidia.com>
 <1ed05baf-3a01-3a2b-cd79-98b356c846cf@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7725904d-e623-a389-2c41-fe0640afcf86@nvidia.com>
Date: Tue, 1 Dec 2020 20:42:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1ed05baf-3a01-3a2b-cd79-98b356c846cf@gmail.com>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606855361; bh=ld6kAg1ZGh9k+yMFotmNwIWPtWIZHMAcX5cj9qgmwHM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=Zmzy4nbs0RS7fFDgUWb4EfpZwT1/EeyUp2PWE2OS3XHzA24MgwTDAdrbXR1dWG463
 4s7OGfmpZ2IA+DjoxwmATD3NdbxYI2V+gXiW1kQOuqz65aaNww17A/wOMXjKgNOzVX
 C6sn7spIMa0nNR4I3SZiyX5PvhzcA4scysgzQmnlaZKGTN7bHCCMpHcDo4myiR4sDv
 ZeBGPbT9B4KlygU9HXq7t+Xek3nsaO1VUznLI1EFs4vf3QfXXrqHJZvheUxEr0j1uX
 Mja2NGB1syddUj+IOrYino9xivHVkTrlmgxuDRA8WA3bRslrl2EWJ4/IvG92he+geG
 2ZLiCaY1PT2MQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMwLzExLzIwMjAgMjI6NTcsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwMS4xMi4yMDIw
IDAwOjE3LCBKb24gSHVudGVyINC/0LjRiNC10YI6Cj4+IEhpIERtaXRyeSwKPj4KPj4gT24gMjMv
MTEvMjAyMCAwMDoyNywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gQWRkIEVNQyBPUFAgRFZG
UyB0YWJsZXMgYW5kIHVwZGF0ZSBib2FyZCBkZXZpY2UtdHJlZXMgYnkgcmVtb3ZpbmcKPj4+IHVu
c3VwcG9ydGVkIE9QUHMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPgo+PiBUaGlzIGNoYW5nZSBpcyBnZW5lcmF0aW5nIHRoZSBmb2xsb3dp
bmcgd2FybmluZyBvbiBUZWdyYTIwIFZlbnRhbmEKPj4gYW5kIHByZXZlbnRzIHRoZSBFTUMgZnJv
bSBwcm9iaW5nIC4uLgo+Pgo+PiBbICAgIDIuNDg1NzExXSB0ZWdyYTIwLWVtYyA3MDAwZjQwMC5t
ZW1vcnktY29udHJvbGxlcjogZGV2aWNlLXRyZWUgZG9lc24ndCBoYXZlIG1lbW9yeSB0aW1pbmdz
Cj4+IFsgICAgMi40OTkzODZdIHRlZ3JhMjAtZW1jIDcwMDBmNDAwLm1lbW9yeS1jb250cm9sbGVy
OiAzMmJpdCBEUkFNIGJ1cwo+PiBbICAgIDIuNTA1ODEwXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJl
IF0tLS0tLS0tLS0tLS0KPj4gWyAgICAyLjUxMDUxMV0gV0FSTklORzogQ1BVOiAwIFBJRDogMSBh
dCAvbG9jYWwvd29ya2Rpci90ZWdyYS9tbHQtbGludXhfbmV4dC9rZXJuZWwvZHJpdmVycy9vcHAv
b2YuYzo4NzUgX29mX2FkZF9vcHBfdGFibGVfdjIrMHg1OTgvMHg2MWMKPj4gWyAgICAyLjUyOTc0
Nl0gTW9kdWxlcyBsaW5rZWQgaW46Cj4+IFsgICAgMi41NDAxNDBdIENQVTogMCBQSUQ6IDEgQ29t
bTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUuMTAuMC1yYzUtbmV4dC0yMDIwMTEzMCAjMQo+PiBb
ICAgIDIuNTU0NjA2XSBIYXJkd2FyZSBuYW1lOiBOVklESUEgVGVncmEgU29DIChGbGF0dGVuZWQg
RGV2aWNlIFRyZWUpCj4+IFsgICAgMi41NjA4OTJdIFs8YzAxMTEzNmM+XSAodW53aW5kX2JhY2t0
cmFjZSkgZnJvbSBbPGMwMTBiYjYwPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQo+PiBbICAgIDIu
NTY4NjQwXSBbPGMwMTBiYjYwPl0gKHNob3dfc3RhY2spIGZyb20gWzxjMGJjZWU1ND5dIChkdW1w
X3N0YWNrKzB4YzgvMHhkYykKPj4gWyAgICAyLjU3NTg2Nl0gWzxjMGJjZWU1ND5dIChkdW1wX3N0
YWNrKSBmcm9tIFs8YzAxMjM1ZGM+XSAoX193YXJuKzB4MTA0LzB4MTA4KQo+PiBbICAgIDIuNTgy
OTEyXSBbPGMwMTIzNWRjPl0gKF9fd2FybikgZnJvbSBbPGMwMTIzNjkwPl0gKHdhcm5fc2xvd3Bh
dGhfZm10KzB4YjAvMHhiOCkKPj4gWyAgICAyLjU5MDM5N10gWzxjMDEyMzY5MD5dICh3YXJuX3Ns
b3dwYXRoX2ZtdCkgZnJvbSBbPGMwODI1YWQwPl0gKF9vZl9hZGRfb3BwX3RhYmxlX3YyKzB4NTk4
LzB4NjFjKQo+PiBbICAgIDIuNTk5MjY5XSBbPGMwODI1YWQwPl0gKF9vZl9hZGRfb3BwX3RhYmxl
X3YyKSBmcm9tIFs8YzA4MjViOTA+XSAoZGV2X3BtX29wcF9vZl9hZGRfdGFibGUrMHgzYy8weDFh
MCkKPj4gWyAgICAyLjYwODU4Ml0gWzxjMDgyNWI5MD5dIChkZXZfcG1fb3BwX29mX2FkZF90YWJs
ZSkgZnJvbSBbPGMwODdiNzc0Pl0gKHRlZ3JhX2VtY19wcm9iZSsweDQ3OC8weDk0MCkKPj4gWyAg
ICAyLjYxNzU0OF0gWzxjMDg3Yjc3ND5dICh0ZWdyYV9lbWNfcHJvYmUpIGZyb20gWzxjMDY1NDM5
OD5dIChwbGF0Zm9ybV9kcnZfcHJvYmUrMHg0OC8weDk4KQo+PiBbICAgIDIuNjI1ODk5XSBbPGMw
NjU0Mzk4Pl0gKHBsYXRmb3JtX2Rydl9wcm9iZSkgZnJvbSBbPGMwNjUyMjM4Pl0gKHJlYWxseV9w
cm9iZSsweDIxOC8weDNiOCkKPj4gWyAgICAyLjYzNDE2Ml0gWzxjMDY1MjIzOD5dIChyZWFsbHlf
cHJvYmUpIGZyb20gWzxjMDY1MjU0MD5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NWMvMHhiNCkK
Pj4gWyAgICAyLjY0MjMzOF0gWzxjMDY1MjU0MD5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKSBmcm9t
IFs8YzA2NTI3NDA+XSAoZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg1OC8weDYwKQo+PiBbICAgIDIu
NjUxMjA4XSBbPGMwNjUyNzQwPl0gKGRldmljZV9kcml2ZXJfYXR0YWNoKSBmcm9tIFs8YzA2NTI3
Yzg+XSAoX19kcml2ZXJfYXR0YWNoKzB4ODAvMHhiYykKPj4gWyAgICAyLjY1OTczMF0gWzxjMDY1
MjdjOD5dIChfX2RyaXZlcl9hdHRhY2gpIGZyb20gWzxjMDY1MDYxMD5dIChidXNfZm9yX2VhY2hf
ZGV2KzB4NzQvMHhiNCkKPj4gWyAgICAyLjY2NzkwNV0gWzxjMDY1MDYxMD5dIChidXNfZm9yX2Vh
Y2hfZGV2KSBmcm9tIFs8YzA2NTE1Zjg+XSAoYnVzX2FkZF9kcml2ZXIrMHgxNjQvMHgxZTgpCj4+
IFsgICAgMi42NzYxNjhdIFs8YzA2NTE1Zjg+XSAoYnVzX2FkZF9kcml2ZXIpIGZyb20gWzxjMDY1
MzJhOD5dIChkcml2ZXJfcmVnaXN0ZXIrMHg3Yy8weDExNCkKPj4gWyAgICAyLjY4NDI1OV0gWzxj
MDY1MzJhOD5dIChkcml2ZXJfcmVnaXN0ZXIpIGZyb20gWzxjMDEwMjIwOD5dIChkb19vbmVfaW5p
dGNhbGwrMHg1NC8weDJiMCkKPj4gWyAgICAyLjY5MjQ0MV0gWzxjMDEwMjIwOD5dIChkb19vbmVf
aW5pdGNhbGwpIGZyb20gWzxjMTAwMTBjYz5dIChrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDFhNC8w
eDFmNCkKPj4gWyAgICAyLjcwMTE0NV0gWzxjMTAwMTBjYz5dIChrZXJuZWxfaW5pdF9mcmVlYWJs
ZSkgZnJvbSBbPGMwYmQ0NTEwPl0gKGtlcm5lbF9pbml0KzB4OC8weDExOCkKPj4gWyAgICAyLjcw
OTMyMV0gWzxjMGJkNDUxMD5dIChrZXJuZWxfaW5pdCkgZnJvbSBbPGMwMTAwMWIwPl0gKHJldF9m
cm9tX2ZvcmsrMHgxNC8weDI0KQo+PiBbICAgIDIuNzE2ODg1XSBFeGNlcHRpb24gc3RhY2soMHhj
MTUwMWZiMCB0byAweGMxNTAxZmY4KQo+PiBbICAgIDIuNzIxOTMzXSAxZmEwOiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMAo+PiBbICAgIDIuNzMwMTA2XSAxZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+PiBbICAgIDIuNzM4
Mjc4XSAxZmUwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAxMyAw
MDAwMDAwMAo+PiBbICAgIDIuNzUxOTQwXSAtLS1bIGVuZCB0cmFjZSA2MWUzYjc2ZGVjYTI3ZWYz
IF0tLS0KPj4KPj4KPj4gQ2hlZXJzCj4+IEpvbgo+Pgo+IAo+IEhlbGxvIEpvbiwKPiAKPiBUaGF0
IGlzIGhhcm1sZXNzIGFuZCBleHBlY3RlZCB0byBoYXBwZW4gYmVjYXVzZSB0aGUgcGF0Y2ggIm1l
bW9yeToKPiB0ZWdyYTIwOiBTdXBwb3J0IGhhcmR3YXJlIHZlcnNpb25pbmcgYW5kIGNsZWFuIHVw
IE9QUCB0YWJsZQo+IGluaXRpYWxpemF0aW9uIiBpc24ndCBhcHBsaWVkIHlldCwgd2hpbGUgVGhp
ZXJyeSBhbHJlYWR5IGFwcGxpZWQgdGhlIERUCj4gcGF0Y2hlcyBmcm9tIHRoaXMgdjEwLgoKClRo
YW5rcywgcHVsbGluZyBpbiB0aGF0IHBhdGNoIGRpZCBmaXggaXQuCgpKb24KCi0tIApudnB1Ymxp
YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
