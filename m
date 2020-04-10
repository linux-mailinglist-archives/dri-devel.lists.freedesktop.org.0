Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1181A5227
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14F6E30F;
	Sat, 11 Apr 2020 12:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FDBF6E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 11:35:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4F11FB;
 Fri, 10 Apr 2020 04:35:09 -0700 (PDT)
Received: from [10.37.12.30] (unknown [10.37.12.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3573F73D;
 Fri, 10 Apr 2020 04:34:58 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Luis Gerhorst <linux-kernel@luisgerhorst.de>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
 <87ftdboaqr.fsf@luis-debian.luis-debian-domain>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <56053904-0314-340e-fdaa-4a8f649d7b6f@arm.com>
Date: Fri, 10 Apr 2020 12:34:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87ftdboaqr.fsf@luis-debian.luis-debian-domain>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 b.zolnierkie@samsung.com, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA0LzEwLzIwIDEyOjEyIFBNLCBMdWlzIEdlcmhvcnN0IHdyb3RlOgo+IAo+IEx1a2FzeiBM
dWJhIHdyaXRlczoKPiAKPj4gKy8qKgo+PiArICogZW1fZGV2X3VucmVnaXN0ZXJfcGVyZl9kb21h
aW4oKSAtIFVucmVnaXN0ZXIgRW5lcmd5IE1vZGVsIChFTSkgZm9yIAo+PiBhIGRldmljZQo+PiAr
ICogQGRldsKgwqDCoMKgwqDCoMKgIDogRGV2aWNlIGZvciB3aGljaCB0aGUgRU0gaXMgcmVnaXN0
ZXJlZAo+PiArICoKPj4gKyAqIFRyeSB0byB1bnJlZ2lzdGVyIHRoZSBFTSBmb3IgdGhlIHNwZWNp
ZmllZCBkZXZpY2UgKGl0IGNoZWNrcyBjdXJyZW50Cj4+ICsgKiByZWZlcmVuY2UgY291bnRlciku
IFRoZSBFTSBmb3IgQ1BVcyB3aWxsIG5vdCBiZSBmcmVlZC4KPj4gKyAqLwo+PiArdm9pZCBlbV9k
ZXZfdW5yZWdpc3Rlcl9wZXJmX2RvbWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICt7Cj4+ICvC
oMKgwqAgc3RydWN0IGVtX2RldmljZSAqZW1fZGV2LCAqdG1wOwo+PiArCj4+ICvCoMKgwqAgaWYg
KElTX0VSUl9PUl9OVUxMKGRldikpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICsKPj4g
K8KgwqDCoCAvKiBXZSBkb24ndCBzdXBwb3J0IGZyZWVpbmcgQ1BVIHN0cnVjdHVyZXMgaW4gaG90
cGx1ZyAqLwo+PiArwqDCoMKgIGlmIChfaXNfY3B1X2RldmljZShkZXYpKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBkZXZfZGJnX29uY2UoZGV2LCAiRU06IHRoZSBzdHJ1Y3R1cmVzIGFyZSBub3QgZ29p
bmcgdG8gYmUgCj4+IHJlbW92ZWRcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiAr
wqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIG11dGV4X2xvY2soJmVtX3BkX211dGV4KTsKPj4gKwo+
PiArwqDCoMKgIGlmIChsaXN0X2VtcHR5KCZlbV9wZF9kZXZfbGlzdCkpIHsKPj4gK8KgwqDCoMKg
wqDCoMKgIG11dGV4X3VubG9jaygmZW1fcGRfbXV0ZXgpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShlbV9kZXYsIHRtcCwgJmVtX3BkX2Rldl9saXN0LCAKPj4gZW1fZGV2X2xpc3QpIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChlbV9kZXYtPmRldiA9PSBkZXYpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAga3JlZl9wdXQoJmVtX2Rldi0+a3JlZiwgX2VtX3JlbGVhc2UpOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoCB9
Cj4+ICsKPj4gK8KgwqDCoCBtdXRleF91bmxvY2soJmVtX3BkX211dGV4KTsKPj4gK30KPj4gK0VY
UE9SVF9TWU1CT0xfR1BMKGVtX2Rldl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKTsKPiAKPiBPaywg
c28gZW1fZGV2X3VucmVnaXN0ZXJfcGVyZl9kb21haW4oKSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBD
UFUgZGV2aWNlCj4gYW5kIGEgc3Vic2VxdWVudCBlbV9yZWdpc3Rlcl9wZXJmX2RvbWFpbigpIHdp
bGwgZmFpbCB3aXRoIEVFWElTVC4KCkNvcnJlY3QuIEF0IHRoZSBjdXJyZW50IG1haW5saW5lIEVu
ZXJneSBNb2RlbCB3ZSBkb24ndCBldmVuIGhhdmUKZW1fdW5yZWdpc3Rlcl9wZXJmX2RvbWFpbiBm
dW5jdGlvbi4gSSBoYWQgdG8gaW50cm9kdWNlIGl0IGluIG9yZGVyCnRvIHN1cHBvcnQgb3RoZXIg
ZGV2aWNlcyB3aGljaCBtaWdodCBoYXZlIGRyaXZlcnMgbG9hZGVkL3VubG9hZGVkCmFzIG1vZHVs
ZXMuCgoKPiAKPiBJcyB0aGVyZSBhIHdheSB0byB1bnJlZ2lzdGVyL2NoYW5nZSB0aGUgQ1BVJ3Mg
ZW5lcmd5IG1vZGVsIGR1cmluZwo+IHJ1bnRpbWUgd2l0aG91dCByZXN0YXJ0aW5nIHRoZSB3aG9s
ZSBzeXN0ZW0/CgpOb3QgZm9yIHRoZSBDUFUgZm9yIG5vdy4KCkl0IGlzIHBvc3NpYmxlIGZvciBv
dGhlciBkZXZpY2VzLiBXaGVuIHlvdSBoYXZlIGkuZS4gYSBtb2R1bGUgZHJpdmVyIGZvcgphIGRl
dmljZSBhbmQgaW4geW91ciBjb2RlIHRoZXJlIGlzIGEgKCphY3RpdmVfcG93ZXIpKCksIHRoZW4g
aXQgaXMKcG9zc2libGUgdG8gY2hhbmdlIEVNIGJ5IHVubG9hZGluZy9sb2FkaW5nIHRoZSBtb2R1
bGUuCgpGb3IgdGhlIENQVSB3ZSBkb24ndCBoYXZlIHRoaXMgcmVxdWlyZW1lbnQgZm9yIHByb2R1
Y3Rpb24gY29kZS4gSSB3aWxsCmFkZCB5b3UgdG8gQ0MgbGlzdCB3aGVuIHNvbWV0aGluZyBsaWtl
IHRoaXMgd291bGQgcG9wLXVwIGZvciBhCnByb3RvdHlwaW5nL2V4cGVyaW1lbnRhdGlvbiBjb2Rl
LiBXZSBoYXZlIGJlZW4gYW5hbHl6aW5nIHNvbWUgb3B0aW9ucy4KClJlZ2FyZHMsCkx1a2FzegoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
