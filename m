Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744531E3C83
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142E38958E;
	Wed, 27 May 2020 08:48:00 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203B8958E
 for <dri-devel@freedesktop.org>; Wed, 27 May 2020 08:47:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590569279; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: Cc: References: To:
 Subject: Sender; bh=uae7yIbf7LkvKzwAx7OZgJqnIs4z8A3JvYEC3/kjvas=;
 b=NDI4KXM8yGpcmNDjInXlQ7dEuEM+ZfIF6cJAmZC1QBCJ6ebO2KLzMpDgcPFZbjWsRPAS64UN
 2lWP76EvO3TrrS+KPvDyFrZ8/9zP7kP0pHp/Lciad/3NRPsDJf/Z7nea2v/r7ydG+n+BU8Q+
 lJR4d3bybH4kir36tv2DD1J1CSk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ece292dc0031c71c2b2a301 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 08:47:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D355FC43395; Wed, 27 May 2020 08:47:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.179.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D6D3AC433C6;
 Wed, 27 May 2020 08:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6D3AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
To: Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
From: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
Date: Wed, 27 May 2020 14:17:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
Content-Language: en-US
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
Cc: viresh.kumar@linaro.org, rnayak@codeaurora.org, sibis@codeaurora.org,
 saravanak@google.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KyBtb3JlIGZvbGtzCgpPbiA1LzE4LzIwMjAgOTo1NSBQTSwgUm9iIENsYXJrIHdyb3RlOgo+IE9u
IE1vbiwgTWF5IDE4LCAyMDIwIGF0IDc6MjMgQU0gSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2Rl
YXVyb3JhLm9yZz4gd3JvdGU6Cj4+IE9uIFRodSwgTWF5IDE0LCAyMDIwIGF0IDA0OjI0OjE4UE0g
KzA1MzAsIFNoYXJhdCBNYXNldHR5IHdyb3RlOgo+Pj4gVGhpcyBwYXRjaGVzIHJlcGxhY2VzIHRo
ZSBwcmV2aW91c2x5IHVzZWQgc3RhdGljIEREUiB2b3RlIGFuZCB1c2VzCj4+PiBkZXZfcG1fb3Bw
X3NldF9idygpIHRvIHNjYWxlIEdQVS0+RERSIGJhbmR3aWR0aCBhbG9uZyB3aXRoIHNjYWxpbmcK
Pj4+IEdQVSBmcmVxdWVuY3kuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2hhcmF0IE1hc2V0dHkg
PHNtYXNldHR5QGNvZGVhdXJvcmEub3JnPgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ211LmMgfCA2ICstLS0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dtdS5jCj4+PiBpbmRleCAyZDgxMjRiLi43OTQzM2QzIDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+Pj4gQEAgLTE0MSwxMSArMTQxLDcgQEAgdm9p
ZCBhNnh4X2dtdV9zZXRfZnJlcShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgZGV2X3BtX29w
cCAqb3BwKQo+Pj4KPj4+ICAgICAgICBnbXUtPmZyZXEgPSBnbXUtPmdwdV9mcmVxc1twZXJmX2lu
ZGV4XTsKPj4+Cj4+PiAtICAgICAvKgo+Pj4gLSAgICAgICogRXZlbnR1YWxseSB3ZSB3aWxsIHdh
bnQgdG8gc2NhbGUgdGhlIHBhdGggdm90ZSB3aXRoIHRoZSBmcmVxdWVuY3kgYnV0Cj4+PiAtICAg
ICAgKiBmb3Igbm93IGxlYXZlIGl0IGF0IG1heCBzbyB0aGF0IHRoZSBwZXJmb3JtYW5jZSBpcyBu
b21pbmFsLgo+Pj4gLSAgICAgICovCj4+PiAtICAgICBpY2Nfc2V0X2J3KGdwdS0+aWNjX3BhdGgs
IDAsIE1CcHNfdG9faWNjKDcyMTYpKTsKPj4+ICsgICAgIGRldl9wbV9vcHBfc2V0X2J3KCZncHUt
PnBkZXYtPmRldiwgb3BwKTsKPj4+ICAgfQo+PiBUaGlzIGFkZHMgYW4gaW1wbGljaXQgcmVxdWly
ZW1lbnQgdGhhdCBhbGwgdGFyZ2V0cyBuZWVkIGJhbmR3aWR0aCBzZXR0aW5ncwo+PiBkZWZpbmVk
IGluIHRoZSBPUFAgb3IgdGhleSB3b24ndCBnZXQgYSBidXMgdm90ZSBhdCBhbGwuIEkgd291bGQg
cHJlZmVyIHRoYXQKPj4gdGhlcmUgYmUgYW4gZGVmYXVsdCBlc2NhcGUgdmFsdmUgYnV0IGlmIG5v
dCB5b3UnbGwgbmVlZCB0byBhZGQKPj4gYmFuZHdpZHRoIHZhbHVlcyBmb3IgdGhlIHNkbTg0NSBP
UFAgdGhhdCB0YXJnZXQgZG9lc24ndCByZWdyZXNzLgo+Pgo+IGl0IGxvb2tzIGxpa2Ugd2UgY291
bGQgbWF5YmUgZG8gc29tZXRoaW5nIGxpa2U6Cj4KPiAgICByZXQgPSBkZXZfcG1fb3BwX3NldF9i
dyguLi4pOwo+ICAgIGlmIChyZXQpIHsKPiAgICAgICAgZGV2X3dhcm5fb25jZShkZXYsICJubyBi
YW5kd2lkdGggc2V0dGluZ3MiKTsKPiAgICAgICAgaWNjX3NldF9idyguLi4pOwo+ICAgIH0KPgo+
ID8KPgo+IEJSLAo+IC1SCgpUaGVyZSBpcyBhIGJpdCBvZiBhbiBpc3N1ZSBoZXJlIC0gTG9va3Mg
bGlrZSBpdHMgbm90IHBvc3NpYmxlIHRvIHR3byBpY2MgCmhhbmRsZXMgdG8gdGhlIHNhbWUgcGF0
aC7CoCBJdHMgY2F1c2luZyBkb3VibGUgZW51bWVyYXRpb24gb2YgdGhlIHBhdGhzIAppbiB0aGUg
aWNjIGNvcmUgYW5kIG1lc3NpbmcgdXAgcGF0aCB2b3Rlcy4gV2l0aCBbMV0gU2luY2Ugb3BwL2Nv
cmUgCmFscmVhZHkgZ2V0cyBhIGhhbmRsZSB0byB0aGUgaWNjIHBhdGggYXMgcGFydCBvZiB0YWJs
ZSBhZGQswqAgZHJtL21zbSAKY291bGQgZG8gZWl0aGVyCgphKSBDb25kaXRpb25hbGx5IGVudW1l
cmF0ZSBncHUtPmljY19wYXRoIGhhbmRsZSBvbmx5IHdoZW4gcG0vb3BwIGNvcmUgCmhhcyBub3Qg
Z290IHRoZSBpY2MgcGF0aCBoYW5kbGUuIEkgY291bGQgdXNlIHNvbWV0aGluZyBsaWtlIFsyXSB0
byAKZGV0ZXJtaW5lIGlmIHNob3VsZCBpbml0aWFsaXplIGdwdS0+aWNjX3BhdGgqCgpiKSBBZGQg
cGVhay1vcHAtY29uZmlncyBpbiA4NDUgZHQgYW5kIG1hbmRhdGUgYWxsIGZ1dHVyZSB2ZXJzaW9u
cyB0byB1c2UgCnRoaXMgYmluZGluZ3MuIFdpdGggdGhpcywgSSBjYW4gcmVtb3ZlIGdwdS0+aWNj
X3BhdGggZnJvbSBtc20vZHJtIApjb21wbGV0ZWx5IGFuZCBvbmx5IHJlbHkgb24gb3BwL2NvcmUg
Zm9yIGJ3IHZvdGluZy4KClsxXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9j
b3Zlci8xMjQwNjg3LwoKWzJdIC0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MTUyNzU3My8KCkxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMKClNoYXJhdAoKPgo+PiBKb3JkYW4K
Pj4KPj4+ICAgdW5zaWduZWQgbG9uZyBhNnh4X2dtdV9nZXRfZnJlcShzdHJ1Y3QgbXNtX2dwdSAq
Z3B1KQo+Pj4gLS0KPj4+IDIuNy40Cj4+Pgo+PiAtLQo+PiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCj4+IGEgTGlu
dXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+
PiBGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
