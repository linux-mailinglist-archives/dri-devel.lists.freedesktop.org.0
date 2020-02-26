Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97912170086
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 14:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C44A6E2AF;
	Wed, 26 Feb 2020 13:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E22E6E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 13:56:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E36C30E;
 Wed, 26 Feb 2020 05:56:02 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1C723F9E6;
 Wed, 26 Feb 2020 05:55:55 -0800 (PST)
Subject: Re: [PATCH v3 4/4] drm/panfrost: Register to the Energy Model with
 devfreq device
To: Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-5-lukasz.luba@arm.com>
 <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
 <96d3287c-4559-7c4a-2f99-0a3aad9e42f6@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <67aef493-82ab-e3e0-7564-610ef8756b48@arm.com>
Date: Wed, 26 Feb 2020 13:55:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <96d3287c-4559-7c4a-2f99-0a3aad9e42f6@arm.com>
Content-Language: en-GB
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
Cc: Nishanth Menon <nm@ti.com>, juri.lelli@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, bsegall@google.com,
 Morten Rasmussen <Morten.Rasmussen@arm.com>, patrick.bellasi@matbug.net,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Zhang Rui <rui.zhang@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 orjan.eide@arm.com, Sascha Hauer <kernel@pengutronix.de>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, mgorman@suse.de,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, David Airlie <airlied@linux.ie>,
 javi.merino@arm.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 qperret@google.com, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Gross <agross@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Dietmar.Eggemann@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDIvMjAyMCAxMDowNiBhbSwgTHVrYXN6IEx1YmEgd3JvdGU6ClsuLi5dCj4+PiBAQCAt
MTE4LDYgKzEyMCw3IEBAIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgCj4+PiAqcGZkZXYpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChw
ZmRldi0+ZGV2ZnJlcS5jb29saW5nKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2ZnJlcV9jb29saW5nX3VucmVnaXN0ZXIocGZkZXYtPmRldmZyZXEuY29vbGluZyk7Cj4+
PiArwqDCoMKgwqDCoMKgIGRldl9wbV9vcHBfb2ZfdW5yZWdpc3Rlcl9lbSgmcGZkZXYtPnBkZXYt
PmRldik7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKCZw
ZmRldi0+cGRldi0+ZGV2KTsKPj4KPj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGtlZXAgdGhpcyAo
YW5kIHRoZSByZWdpc3RyYXRpb24gc2lkZSkgYXMKPj4gc2VwYXJhdGUgY2FsbHM/IFBlcmhhcHMg
dGhlcmUncyBzb21lIG9yZGVyaW5nIHJlcXVpcmVtZW50IHdpdGgKPj4gZXZlcnl0aGluZyBiZXR3
ZWVuIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkgYW5kCj4+IGRldl9wbV9vcHBfb2ZfcmVnaXN0
ZXJfZW0oKT8KPiAKPiBZZXMsIGRldl9wbV9vcHBfb2ZfcmVnaXN0ZXJfZW0oKSB1c2VzIGVtX2Rh
dGFfY2FsbGJhY2sgd2hpY2ggb3BlcmF0ZXMKPiBvbiBPUFBzIHRvIGNhbGN1bGF0ZSBwb3dlciB2
YWx1ZXMgYW5kIGNvc3RzLCBzbyB0aGUgdGhlIE9QUCB0YWJsZSBzaG91bGQKPiBiZSBhbHJlYWR5
IHRoZXJlLgo+IAo+Pgo+PiBXaGlsZSB5b3UncmUganVzdCBhZGRpbmcgMiBsaW5lcywgaXQgc2Vl
bXMgdGhlcmUncyBhIGxvdCBvZiBjb21wbGV4aXR5Cj4+IGV4cG9zZWQgdG8gdGhlIGRyaXZlciBq
dXN0IHRvIGluaXRpYWxpemUgZGV2ZnJlcS9vcHAuCj4gCj4gSXQgZGVwZW5kcywgZm9yIGV4YW1w
bGUgZGV2ZnJlcSBkZXZpY2VzIGxpa2UgYnVzZXMgd291bGQgbGlrZWx5IG5ldmVyCj4gdXNlIHRo
ZSBlbmVyZ3kgbW9kZWwuIFBvdGVudGlhbCBjbGllbnRzIHdvdWxkIGJlIEdQVXMsIERTUHMsIElT
UHMuCgpTdGlsbCwgaXQgc2VlbXMgbGVzcyB0aGFuIGlkZWFsIGZvciBldmVyeSBjbGllbnQgdG8g
aGF2ZSB0byByZW1lbWJlciB0byAKbWFrZSBhbGwgdGhlc2UgaW5kaXZpZHVhbCBjYWxscywgYWxs
IGluIHRoZSByaWdodCBvcmRlciAoZXNwZWNpYWxseSB3aGVuIAppdCBjb21lcyB0byB1bmRvaW5n
IHRoZW0gaW4gZmFpbHVyZSBwYXRocykuCgpJIGhhdmVuJ3QgcXVpdGUgZ3Jhc3BlZCB3aGV0aGVy
IHRoZSBlbmVyZ3kgbW9kZWwgaXMgY29uY2VwdHVhbGx5ICJvd25lZCIgCmJ5IHRoZSBPUFAgdGFi
bGUgb3IgYnkgdGhlIGNvb2xpbmcgZGV2aWNlLCBidXQgZWl0aGVyIHdheSBpdCB3b3VsZCBzZWVt
IAp0byBiZSBhIG11Y2ggbmljZXIgQVBJIGlmIHRoZXJlIHdlcmUgc2ltcGx5IGFuIGFkZGl0aW9u
YWwgIndpdGggZW5lcmd5IAptb2RlbCIgdmFyaWFudCBvZiB0aGUgcmVnaXN0cmF0aW9uIGNhbGws
IGFuZCB0aGUgc3RhbmRhcmQgcmVtb3ZhbCBjYWxsIApqdXN0IGF1dG9tYXRpY2FsbHkgY2xlYW5l
ZCB1cCBhbiBlbmVyZ3kgbW9kZWwgYXMgd2VsbCBpZiBvbmUgd2FzIHByZXNlbnQuCgpSb2Jpbi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
