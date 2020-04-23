Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFEC1B6737
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DB86EA5E;
	Thu, 23 Apr 2020 22:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAD076E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:19:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC5130E;
 Thu, 23 Apr 2020 10:19:27 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713D33F68F;
 Thu, 23 Apr 2020 10:19:05 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
 <20200423151250.GB65632@linaro.org>
 <ff1c8cc5-f64d-6156-7d30-97b8426c6f99@arm.com>
 <ddf89887-4fa5-f2ca-d62a-9158f7d29db2@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <a826a4cd-7cbf-3d0f-352e-2978e64024d9@arm.com>
Date: Thu, 23 Apr 2020 18:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ddf89887-4fa5-f2ca-d62a-9158f7d29db2@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA0LzIzLzIwIDY6MTUgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDIzLzA0LzIw
MjAgMTg6NTcsIEx1a2FzeiBMdWJhIHdyb3RlOgo+Pgo+Pgo+PiBPbiA0LzIzLzIwIDQ6MTIgUE0s
IERhbmllbCBMZXpjYW5vIHdyb3RlOgo+Pj4gT24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgMDk6NDI6
MDRBTSArMDEwMCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4+Pj4gQWRkIHN1cHBvcnQgZm9yIG90aGVy
IGRldmljZXMgdGhhdCBDUFVzLiBUaGUgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uCj4+Pj4gZG9lcyBu
b3QgcmVxdWlyZSBhIHZhbGlkIGNwdW1hc2sgcG9pbnRlciBhbmQgaXMgcmVhZHkgdG8gaGFuZGxl
IG5ldwo+Pj4+IGRldmljZXMuIFNvbWUgb2YgdGhlIGludGVybmFsIHN0cnVjdHVyZXMgaGFzIGJl
ZW4gcmVvcmdhbml6ZWQgaW4KPj4+PiBvcmRlciB0bwo+Pj4+IGtlZXAgY29uc2lzdGVudCB2aWV3
IChsaWtlIHJlbW92aW5nIHBlcl9jcHUgcGQgcG9pbnRlcnMpLiBUbyB0cmFjayB1c2FnZQo+Pj4+
IG9mIHRoZSBFbmVyZ3kgTW9kZWwgc3RydWN0dXJlcywgdGhleSBhcmUgcHJvdGVjdGVkIHdpdGgg
a3JlZi4KPj4+Cj4+PiBXaHkgbm90IGFkZCB0aGUgZW5lcmd5IG1vZGVsIHN0cnVjdHVyZSBpbiB0
aGUgc3RydWN0IGRldmljZSBkaXJlY3RseT8KPj4KPj4gRG8geW91IG1lYW4gdGhpcyBzdHJ1Y3R1
cmU/Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5j
bHVkZS9saW51eC9kZXZpY2UuaCNMNTM3Cj4+Cj4+IGFuZCB0byBwdXQgc29tZXRoaW5nIGxpa2U6
Cj4+IHN0cnVjdCBkZXZpY2Ugewo+PiAuLi4KPj4gIMKgwqDCoMKgc3RydWN0IGRldl9wbV9kb21h
aW7CoMKgwqAgKnBtX2RvbWFpbjsKPj4gI2lmZGVmIENPTkZJR19FTkVSR1lfTU9ERUwKPj4gIMKg
wqDCoMKgc3RydWN0IGVtX3BlcmZfZG9tYWluwqDCoMKgICplbV9wZDsKPj4gI2VuZGlmCj4+IC4u
Lgo+PiB9Owo+IAo+IFllcywgZXhhY3RseS4KPiAKClRoYW5rIHlvdSBmb3IgdGhlIGNvbmZpcm1h
dGlvbi4gSSBhbSBnb2luZyB0byBzdGFydCB3b3JraW5nIG9uIGl0LgoKQlRXLCB0aGFuayB5b3Ug
Zm9yIGFsbCBvZiB0aGUgQUNLcyBhbmQgcmV2aWV3cy4KClJlZ2FyZHMsCkx1a2FzegpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
