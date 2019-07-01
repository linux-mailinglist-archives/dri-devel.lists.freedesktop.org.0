Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A55C4B3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E789D84;
	Mon,  1 Jul 2019 20:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4246389CA2;
 Mon,  1 Jul 2019 19:07:47 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2ABCE6028D; Mon,  1 Jul 2019 19:07:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1039860159;
 Mon,  1 Jul 2019 19:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1039860159
Subject: Re: [PATCH 4/5] drm/msm/dsi: get the clocks into OFF state at init
To: Rob Clark <robdclark@gmail.com>
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-5-robdclark@gmail.com>
 <75a2921d-bf1a-c4c1-6d9a-122474eface4@codeaurora.org>
 <CAF6AEGufiSU_sFZFdLH=KT5iCQGwccszURqAQCHd=dhuZafvZg@mail.gmail.com>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <9fbf9226-578a-90aa-693d-9ea4fcda8281@codeaurora.org>
Date: Mon, 1 Jul 2019 13:07:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGufiSU_sFZFdLH=KT5iCQGwccszURqAQCHd=dhuZafvZg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562008067;
 bh=JOuG+nTYGCjaeKzLDowBOJbURARYzc8K6dnbmDqxo5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ck38QBfhx0ASNbTLUs/P7hIZ/CHzVCxwrz+NbEpXD3OEIsHZe2T6LtR8briEtk0LK
 GWqgTvbW+tP+p+Wwb7vlXbN2cYcPcppYPG6jK6ituM1S012ZCzq3dgQwy3BCYYW5Nf
 KzSOwmJDz16LR+fzu6wOimuHBwIGOz3ZxAR8WRr4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562008066;
 bh=JOuG+nTYGCjaeKzLDowBOJbURARYzc8K6dnbmDqxo5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LU5l7gGr1FEPmta4AJmGEQAPQFGo0rdKD+PFdW62YuNsghwk7IwzUe6tzRFn6F7js
 PyWhjfYebOvd+IaTv+2fyeLFffPjkvQUKRJ/KTt/WY3HqzlSUUaWp1m3/ThDO3xO16
 QU7nH04rCu8zINAGQPc/dTsdQoiuGfUSocRV9tp4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jhugo@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Linux PM <linux-pm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xLzIwMTkgMTI6NTggUE0sIFJvYiBDbGFyayB3cm90ZToKPiBPbiBNb24sIEp1bCAxLCAy
MDE5IGF0IDExOjM3IEFNIEplZmZyZXkgSHVnbyA8amh1Z29AY29kZWF1cm9yYS5vcmc+IHdyb3Rl
Ogo+Pgo+PiBPbiA2LzMwLzIwMTkgOTowMSBBTSwgUm9iIENsYXJrIHdyb3RlOgo+Pj4gRnJvbTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+Pj4KPj4+IERvIGFuIGV4dHJhIGVu
YWJsZS9kaXNhYmxlIGN5Y2xlIGF0IGluaXQsIHRvIGdldCB0aGUgY2xrcyBpbnRvIGRpc2FibGVk
Cj4+PiBzdGF0ZSBpbiBjYXNlIGJvb3Rsb2FkZXIgbGVmdCB0aGVtIGVuYWJsZWQuCj4+Pgo+Pj4g
SW4gY2FzZSB0aGV5IHdlcmUgYWxyZWFkeSBlbmFibGVkLCB0aGUgY2xrX3ByZXBhcmVfZW5hYmxl
KCkgaGFzIG5vIHJlYWwKPj4+IGVmZmVjdCwgb3RoZXIgdGhhbiBnZXR0aW5nIHRoZSBlbmFibGVf
Y291bnQvcHJlcGFyZV9jb3VudCBpbnRvIHRoZSByaWdodAo+Pj4gc3RhdGUgc28gdGhhdCB3ZSBj
YW4gZGlzYWJsZSBjbG9ja3MgaW4gdGhlIGNvcnJlY3Qgb3JkZXIuICBUaGlzIHdheSB3ZQo+Pj4g
YXZvaWQgaGF2aW5nIHN0dWNrIGNsb2NrcyB3aGVuIHdlIGxhdGVyIHdhbnQgdG8gZG8gYSBtb2Rl
c2V0IGFuZCBzZXQgdGhlCj4+PiBjbG9jayByYXRlcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKy0t
LQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTBubS5jIHwgIDEg
Kwo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3Bs
bF8xMG5tLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMKPj4+
IGluZGV4IGFhYmFiNjMxMTA0My4uZDAxNzJkOGRiODgyIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTBubS5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMKPj4+IEBAIC0zNTQsNiArMzU0LDcgQEAg
c3RhdGljIGludCBkc2lfcGxsXzEwbm1fbG9ja19zdGF0dXMoc3RydWN0IGRzaV9wbGxfMTBubSAq
cGxsKQo+Pj4gICAgICAgIGlmIChyYykKPj4+ICAgICAgICAgICAgICAgIHByX2VycigiRFNJIFBM
TCglZCkgbG9jayBmYWlsZWQsIHN0YXR1cz0weCUwOHhcbiIsCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgcGxsLT5pZCwgc3RhdHVzKTsKPj4+ICtyYyA9IDA7IC8vIEhBQ0ssIHRoaXMgd2lsbCBm
YWlsIGlmIFBMTCBhbHJlYWR5IHJ1bm5pbmcuLgo+Pgo+PiBVbW0sIHdoeT8gIElzIHRoaXMgaW50
ZW50aW9uYWw/Cj4+Cj4gCj4gSSBuZWVkIHRvIHNvcnQgb3V0IGEgcHJvcGVyIHNvbHV0aW9uIGZv
ciB0aGlzLi4gYnV0IFBMTCBsb2NrIHdpbGwgZmFpbAo+IGlmIHRoZSBjbGsgaXMgYWxyZWFkeSBy
dW5uaW5nICh3aGljaCwgaW4gdGhhdCBjYXNlLCBpcyBmaW5lIHNpbmNlIGl0Cj4gaXMgYWxyZWFk
eSBydW5uaW5nIGFuZCBsb2NrZWQpLCB3aGljaCB3aWxsIGNhdXNlIHRoZSBjbGtfZW5hYmxlIHRv
Cj4gZmFpbC4uCj4gCj4gSSBndWVzcyB0aGVyZSBpcyBzb21lIHdheSB0aGF0IEkgY2FuIGNoZWNr
IHRoYXQgY2xrIGlzIGFscmVhZHkgcnVubmluZwo+IGFuZCBza2lwIHRoaXMgY2hlY2suLgoKCkkn
bSBzb3JyeSwgYnV0IHRoaXMgbWFrZXMgbm8gc2Vuc2UgdG8gbWUuICBXaGF0IGNsb2NrIGFyZSB3
ZSB0YWxraW5nIAphYm91dCBoZXJlPwoKSWYgdGhlIHBsbCBpcyBsb2NrZWQsIHRoZSB0aGUgbG9j
ayBjaGVjayBzaG91bGQganVzdCBkcm9wIHRocm91Z2guICBJZiAKdGhlIHBsbCBjYW5ub3QgbG9j
aywgeW91IGhhdmUgYW4gaXNzdWUuICBJJ20gY29uZnVzZWQgYXMgdG8gaG93IGFueSBvZiAKdGhl
IGRvd25zdHJlYW0gY2xvY2tzIGNhbiBhY3R1YWxseSBiZSBydW5uaW5nIGlmIHRoZSBwbGwgaXNu
J3QgbG9ja2VkLgoKSSBmZWVsIGxpa2Ugd2UgYXJlIG5vdCB5ZXQgb24gdGhlIHNhbWUgcGFnZSBh
Ym91dCB3aGF0IHNpdHVhdGlvbiB5b3UgCnNlZW0gdG8gYmUgaW4uICBDYW4geW91IGRlc2NyaWJl
IGluIGV4YWN0aW5nIGRldGFpbD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
