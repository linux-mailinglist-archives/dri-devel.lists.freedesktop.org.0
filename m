Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9224279B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 11:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE406E271;
	Wed, 12 Aug 2020 09:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBAC6E271
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:30:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597224633; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=Ut7UsXyyt3w1ZkSYeaLSTk9Ej6vXqnbWm3dpszGQbYk=;
 b=dMAQ5BJJCTKwAvLbSlon0e84g5HdUAgH9Vd4lNJtayAG+bAiTvT3l9xT9ZEsS+Z9+aJtLs+I
 zQlrSmQxH9YRf+JnjpAiYzBm6fA0wxBm1lHzbg5LAnpnlxuSnRje5cWSstN2R1r94kt/cKbd
 xhLFH00eYgZfPx0eq6tQjkEdOpc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f33b5c1d48d4625ca4b2c05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 09:26:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A7799C433CA; Wed, 12 Aug 2020 09:26:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.16] (unknown [61.1.229.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0A60C433CA;
 Wed, 12 Aug 2020 09:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0A60C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [RFC v2 03/11] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
From: Rajendra Nayak <rnayak@codeaurora.org>
To: Amit Pundir <amit.pundir@linaro.org>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-4-rnayak@codeaurora.org>
 <CALAqxLV2TBk9ScUM6MeJMCkL8kJnCihjQ7ac5fLzcqOg1rREVQ@mail.gmail.com>
 <CALAqxLWg3jJKJFLnnne-mrQEnH=m7R_9azCGaGnEmFYR4EMh=A@mail.gmail.com>
 <ec5eeb21-48e4-5dcc-583a-ac9419659e44@codeaurora.org>
 <CAMi1Hd1O+3bjQN6c9WQr+t0YXGBAukfFzJWtkgXDp1Zcir-0-w@mail.gmail.com>
 <aab760b8-2a06-ae96-584a-301d5326fc0d@codeaurora.org>
Message-ID: <fb5b6abf-b26a-5db2-1f8f-23d457c7235e@codeaurora.org>
Date: Wed, 12 Aug 2020 14:56:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <aab760b8-2a06-ae96-584a-301d5326fc0d@codeaurora.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-scsi@vger.kernel.org,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, linux-serial@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-spi@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTIvMjAyMCAxOjA5IFBNLCBSYWplbmRyYSBOYXlhayB3cm90ZToKPiAKPiBPbiA4LzEy
LzIwMjAgMTowNSBQTSwgQW1pdCBQdW5kaXIgd3JvdGU6Cj4+IEhpIFJhamVuZHJhLAo+Pgo+PiBP
biBXZWQsIDEyIEF1ZyAyMDIwIGF0IDExOjE4LCBSYWplbmRyYSBOYXlhayA8cm5heWFrQGNvZGVh
dXJvcmEub3JnPiB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gOC8xMi8yMDIwIDc6MDMgQU0sIEpvaG4g
U3R1bHR6IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgQXVnIDExLCAyMDIwIGF0IDQ6MTEgUE0gSm9obiBT
dHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiBXZWQs
IE1hciAyMCwgMjAxOSBhdCAyOjQ5IEFNIFJhamVuZHJhIE5heWFrIDxybmF5YWtAY29kZWF1cm9y
YS5vcmc+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IGdlbmkgc2VyaWFsIG5lZWRzIHRvIGV4cHJlc3Mg
YSBwZXJmb3JhbW5jZSBzdGF0ZSByZXF1aXJlbWVudCBvbiBDWAo+Pj4+Pj4gZGVwZW5kaW5nIG9u
IHRoZSBmcmVxdWVuY3kgb2YgdGhlIGNsb2NrIHJhdGVzLiBVc2UgT1BQIHRhYmxlIGZyb20KPj4+
Pj4+IERUIHRvIHJlZ2lzdGVyIHdpdGggT1BQIGZyYW1ld29yayBhbmQgdXNlIGRldl9wbV9vcHBf
c2V0X3JhdGUoKSB0bwo+Pj4+Pj4gc2V0IHRoZSBjbGsvcGVyZiBzdGF0ZS4KPj4+Pj4+Cj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBSYWplbmRyYSBOYXlhayA8cm5heWFrQGNvZGVhdXJvcmEub3JnPgo+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgo+
Pj4+Pj4gLS0tCj4+Pj4+PiDCoMKgIGRyaXZlcnMvdHR5L3NlcmlhbC9xY29tX2dlbmlfc2VyaWFs
LmMgfCAxNSArKysrKysrKysrKysrLS0KPj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBIZXksCj4+Pj4+
IMKgwqDCoCBJIGp1c3Qgd2FudGVkIHRvIGZvbGxvdyB1cCBvbiB0aGlzIHBhdGNoLCBhcyBJJ3Zl
IGJpc2VjdGVkIGl0Cj4+Pj4+IChhNTgxOWI1NDhhZjApIGRvd24gYXMgaGF2aW5nIGJyb2tlbiBx
Y2EgYmx1ZXRvb3RoIG9uIHRoZSBEcmFnb25ib2FyZAo+Pj4+PiA4NDVjLgo+Pj4+Pgo+Pj4+PiBJ
IGhhdmVuJ3QgeWV0IGhhZCB0aW1lIHRvIGRlYnVnIGl0IHlldCwgYnV0IHdhbnRlZCB0byByYWlz
ZSB0aGUgaXNzdWUKPj4+Pj4gaW4gY2FzZSBhbnlvbmUgZWxzZSBoYXMgc2VlbiBzaW1pbGFyIHRy
b3VibGUuCj4+Pj4KPj4+PiBTbyBJIGR1ZyBpbiBhIGJpdCBmdXJ0aGVyLCBhbmQgdGhpcyBjaHVu
ayBzZWVtcyB0byBiZSBjYXVzaW5nIHRoZSBpc3N1ZToKPj4+Pj4gQEAgLTk2MSw3ICs5NjMsNyBA
QCBzdGF0aWMgdm9pZCBxY29tX2dlbmlfc2VyaWFsX3NldF90ZXJtaW9zKHN0cnVjdCB1YXJ0X3Bv
cnQgKnVwb3J0LAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0X3Jlc3RhcnRfcng7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1cG9ydC0+dWFy
dGNsayA9IGNsa19yYXRlOwo+Pj4+PiAtwqDCoMKgwqDCoMKgIGNsa19zZXRfcmF0ZShwb3J0LT5z
ZS5jbGssIGNsa19yYXRlKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoCBkZXZfcG1fb3BwX3NldF9yYXRl
KHBvcnQtPmRldiwgY2xrX3JhdGUpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2VyX2Nsa19j
ZmcgPSBTRVJfQ0xLX0VOOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2VyX2Nsa19jZmcgfD0g
Y2xrX2RpdiA8PCBDTEtfRElWX1NIRlQ7Cj4+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IFdpdGggdGhhdCBh
cHBsaWVkLCBJIHNlZSB0aGUgZm9sbG93aW5nIGVycm9ycyBpbiBkbWVzZyBhbmQgYmx1ZXRvb3Ro
Cj4+Pj4gZmFpbHMgdG8gZnVuY3Rpb246Cj4+Pj4gW8KgwqDCoCA0Ljc2MzQ2N10gcWNvbV9nZW5p
X3NlcmlhbCA4OTgwMDAuc2VyaWFsOiBkZXZfcG1fb3BwX3NldF9yYXRlOgo+Pj4+IGZhaWxlZCB0
byBmaW5kIE9QUCBmb3IgZnJlcSAxMDI0MDAwMDAgKC0zNCkKPj4+PiBbwqDCoMKgIDQuNzczNDkz
XSBxY29tX2dlbmlfc2VyaWFsIDg5ODAwMC5zZXJpYWw6IGRldl9wbV9vcHBfc2V0X3JhdGU6Cj4+
Pj4gZmFpbGVkIHRvIGZpbmQgT1BQIGZvciBmcmVxIDEwMjQwMDAwMCAoLTM0KQo+Pj4+Cj4+Pj4g
V2l0aCBqdXN0IHRoYXQgY2h1bmsgcmV2ZXJ0ZWQgb24gbGludXMvSEVBRCwgYmx1ZXRvb3RoIHNl
ZW1zIHRvIHdvcmsgb2suCj4+Pgo+Pj4gVGhpcyBzZWVtcyBsaWtlIHRoZSBzYW1lIGlzc3VlIHRo
YXQgd2FzIGFsc28gcmVwb3J0ZWQgb24gdmVudXMgWzFdIGJlY2F1c2UgdGhlCj4+PiBjbG9jayBm
cmVxdWVuY3kgdGFibGVzIGFwcGFyZW50bHkgZG9uO3QgZXhhY3RseSBtYXRjaCB0aGUgYWNoaWV2
YWJsZSBjbG9jawo+Pj4gZnJlcXVlbmNpZXMgKHdoaWNoIHdlIGFsc28gdXNlZCB0byBjb25zdHJ1
Y3QgdGhlIE9QUCB0YWJsZXMpCj4+Pgo+Pj4gQ2FuIHlvdSB0cnkgdXBkYXRpbmcgdGhlIE9QUCB0
YWJsZSBmb3IgUVVQIHRvIGhhdmUgMTAyNDAwMDAwIGluc3RlYWQgb2YgdGhlCj4+PiBjdXJyZW50
IDEwMDAwMDAwMCBhbmQgc2VlIGlmIHRoYXQgZml4ZXMgaXQ/Cj4+Cj4+IFRoYXQgd29ya2VkLiBU
aGFua3MuCj4+Cj4+IFNob3VsZCB0aGlzIGNoYW5nZSBiZSBjb21tb24gdG8gYmFzZSBzZG04NDUu
ZHRzaSBvciBwbGF0Zm9ybSBzcGVjaWZpYyBkdHM/Cj4+IEZvciB3aGF0IGl0J3Mgd29ydGgsIHdl
IHNlZSB0aGlzIEJUIGJyZWFrYWdlIG9uIFBvY29GMSBwaG9uZSB0b28uCj4gCj4gVGhhbmtzIGZv
ciBjb25maXJtaW5nLCBpdCB3aWxsIGhhdmUgdG8gYmUgcGFydCBvZiB0aGUgU29DIGR0c2ksIGFu
ZCBJIGFtCj4gZ3Vlc3NpbmcgYSBzaW1pbGFyIGNoYW5nZSBpcyBwZXJoYXBzIGFsc28gbmVlZGVk
IG9uIHNjNzE4MC4KPiBJIHdpbGwgc2VuZCBhIHBhdGNoIG91dCB0byBmaXggdGhlIE9QUCB0YWJs
ZXMgZm9yIGJvdGguCgpJIHNwZW50IHNvbWUgbW9yZSB0aW1lIGxvb2tpbmcgYXQgdGhpcyBhbmQg
aXQgZG9lcyBub3QgbG9vayBsaWtlIHRoaXMgaXMgdGhlCnJvdW5kaW5nIGlzc3VlcyB3aXRoIGNs
b2NrIEZNQVggdGFibGVzLiBJIGhhZCB0aGVzZSB0YWJsZXMgcGlja2VkIGZyb20gZG93bnN0cmVh
bQpjbG9jayBjb2RlIGFuZCBpdCB0dXJucyBvdXQgdGhlc2UgdGFibGVzIHdlcmUgcmV3b3JrZWQg
YXQgY2xvY2sgaW5pdCBiYXNlZCBvbgp0aGUgc2lsaWNvbiByZXYsIHNvIEkgbmVlZCB0byBmaXgg
dXAgdGhlIE9QUCB0YWJsZXMgYWNjb3JkaW5nbHkgd2hpY2ggd2lsbCBhZGQKYSBuZXcgT1BQIGVu
dHJ5IGZvciAxMDIuNE1oei4gSSdsbCBwb3N0IGEgcGF0Y2ggc2hvcnRseS4KCj4gCj4+Cj4+IFJl
Z2FyZHMsCj4+IEFtaXQgUHVuZGlyCj4+Cj4+Cj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDIwLzcvMjcvNTA3Cj4+Pgo+Pj4+Cj4+Pj4gdGhhbmtzCj4+Pj4gLWpvaG4KPj4+Pgo+
Pj4KPj4+IC0tIAo+Pj4gUVVBTENPTU0gSU5ESUEsIG9uIGJlaGFsZiBvZiBRdWFsY29tbSBJbm5v
dmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlcgo+Pj4gb2YgQ29kZSBBdXJvcmEgRm9ydW0s
IGhvc3RlZCBieSBUaGUgTGludXggRm91bmRhdGlvbgo+IAoKLS0gClFVQUxDT01NIElORElBLCBv
biBiZWhhbGYgb2YgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIK
b2YgQ29kZSBBdXJvcmEgRm9ydW0sIGhvc3RlZCBieSBUaGUgTGludXggRm91bmRhdGlvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
