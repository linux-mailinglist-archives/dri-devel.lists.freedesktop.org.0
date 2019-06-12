Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62F41DF9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1DA89341;
	Wed, 12 Jun 2019 07:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06B489341
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:42:58 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 7928F60CF1; Wed, 12 Jun 2019 07:42:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.131.117.43]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rnayak@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F04D960CF1;
 Wed, 12 Jun 2019 07:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F04D960CF1
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
To: Viresh Kumar <viresh.kumar@linaro.org>, swboyd@chromium.org
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
Date: Wed, 12 Jun 2019 13:12:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560325378;
 bh=akNFareB34O+WoELW9a+vXLpK/S7e9w6RCo5AwPjb2A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b6L0hfL3FpRwBcfm7DqTiSOJXV1qO+cKG6vdFUKA92yPW42Gg4GSTg7oWylS6l0CP
 NT1Qa14L+91OHy3VP0yw1NC7oTgFa8WU/nEZ+rwAXpxqniua5APd1uwAV5WysKbNeq
 U4zu3+X2m030hPWSus3HgHdDx30BlqWfec1xEzII=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560325377;
 bh=akNFareB34O+WoELW9a+vXLpK/S7e9w6RCo5AwPjb2A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U/s1AWqwx7q0I8Ng/jLB1n8gUT0Mk/9P2K9ccSQ7OCjYnbfmz3j/qMd/2j7W+KCy8
 E34Zus5a4XaR6M5L9kZwN0qpKgm6ECocxs25r9Fw3cev2eJHHhQZJNVk4z+w5ABMnd
 ThX+4IziXS3BDPUulhM0GRvNTDLUqxX6Tbi1AUG4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=rnayak@codeaurora.org
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, linux-scsi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTEvMjAxOSA0OjI0IFBNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gT24gMjAtMDMtMTks
IDE1OjE5LCBSYWplbmRyYSBOYXlhayB3cm90ZToKPj4gRnJvbTogU3RlcGhlbiBCb3lkIDxzd2Jv
eWRAY2hyb21pdW0ub3JnPgo+Pgo+PiBEb2luZyB0aGlzIGFsbG93cyB1cyB0byBjYWxsIHRoaXMg
QVBJIHdpdGggYW55IHJhdGUgcmVxdWVzdGVkIGFuZCBoYXZlCj4+IGl0IG5vdCBuZWVkIHRvIG1h
dGNoIGluIHRoZSBPUFAgdGFibGUuIEluc3RlYWQsIHdlJ2xsIHJvdW5kIHRoZSByYXRlIHVwCj4+
IHRvIHRoZSBuZWFyZXN0IE9QUCB0aGF0IHdlIHNlZSBzbyB0aGF0IHdlIGNhbiBnZXQgdGhlIHZv
bHRhZ2Ugb3IgbGV2ZWwKPj4gdGhhdCdzIHJlcXVpcmVkIGZvciB0aGF0IE9QUC4gVGhpcyBzdXBw
b3J0cyB1c2VycyBvZiBPUFAgdGhhdCB3YW50IHRvCj4+IHNwZWNpZnkgdGhlICdmbWF4JyB0YWJs
ZXMgb2YgYSBkZXZpY2UgaW5zdGVhZCBvZiBldmVyeSBzaW5nbGUgZnJlcXVlbmN5Cj4+IHRoYXQg
dGhleSBuZWVkLiBBbmQgZm9yIGRldmljZXMgdGhhdCByZXF1aXJlZCB0aGUgZXhhY3QgZnJlcXVl
bmN5LCB3ZQo+PiBjYW4gcmVseSBvbiB0aGUgY2xrIGZyYW1ld29yayB0byByb3VuZCB0aGUgcmF0
ZSB0byB0aGUgbmVhcmVzdCBzdXBwb3J0ZWQKPj4gZnJlcXVlbmN5IGluc3RlYWQgb2YgdGhlIE9Q
UCBmcmFtZXdvcmsgdG8gZG8gc28uCj4+Cj4+IE5vdGUgdGhhdCB0aGlzIG1heSBhZmZlY3QgZHJp
dmVycyB0aGF0IGRvbid0IHdhbnQgdGhlIGNsayBmcmFtZXdvcmsgdG8KPj4gZG8gcm91bmRpbmcs
IGJ1dCBpbnN0ZWFkIHdhbnQgdGhlIE9QUCB0YWJsZSB0byBkbyB0aGUgcm91bmRpbmcgZm9yIHRo
ZW0uCj4+IERvIHdlIGhhdmUgdGhhdCBjYXNlPyBTaG91bGQgd2UgYWRkIHNvbWUgZmxhZyB0byB0
aGUgT1BQIHRhYmxlIHRvCj4+IGluZGljYXRlIHRoaXMgYW5kIHRoZW4gbm90IGhhdmUgdGhhdCBm
bGFnIHNldCB3aGVuIHRoZXJlIGlzbid0IGFuIE9QUAo+PiB0YWJsZSBmb3IgdGhlIGRldmljZSBh
bmQgYWxzbyBpbnRyb2R1Y2UgYSBwcm9wZXJ0eSBsaWtlICdvcHAtdXNlLWNsaycgdG8KPj4gdGVs
bCB0aGUgdGFibGUgdGhhdCBpdCBzaG91bGQgdXNlIHRoZSBjbGsgQVBJcyB0byByb3VuZCByYXRl
cyBpbnN0ZWFkIG9mCj4+IE9QUD8KPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWplbmRyYSBOYXlhayA8cm5h
eWFrQGNvZGVhdXJvcmEub3JnPgo+PiAtLS0KCltdLi4uCgo+IAo+IEkgc2VlIGEgbG9naWNhbCBw
cm9ibGVtIHdpdGggdGhpcyBwYXRjaC4KPiAKPiBTdXBwb3NlIHRoZSBjbG9jayBkcml2ZXIgc3Vw
cG9ydHMgZm9sbG93aW5nIGZyZXF1ZW5jaWVzOiA1MDBNLCA4MDBNLAo+IDFHLCAxLjJHIGFuZCB0
aGUgT1BQIHRhYmxlIGNvbnRhaW5zIGZvbGxvd2luZyBsaXN0OiA1MDBNLCAxRywgMS4yRwo+IChp
LmUuIG1pc3NpbmcgODAwTSkuCj4gCj4gTm93IDgwME0gc2hvdWxkIG5ldmVyIGdldCBwcm9ncmFt
bWVkIGFzIGl0IGlzbid0IHBhcnQgb2YgdGhlIE9QUAo+IHRhYmxlLiBCdXQgaWYgeW91IHBhc3Mg
NjAwTSB0byBvcHAtc2V0LXJhdGUsIHRoZW4gaXQgd2lsbCBlbmQgdXAKPiBzZWxlY3RpbmcgODAw
TSBhcyBjbG9jayBkcml2ZXIgd2lsbCByb3VuZCB1cCB0byB0aGUgY2xvc2VzdCB2YWx1ZS4KCmNv
cnJlY3QKCj4gCj4gRXZlbiBpZiBubyBvbmUgaXMgZG9pbmcgdGhpcyByaWdodCBub3csIGl0IGlz
IGEgc2Vuc2libGUgdXNlY2FzZSwKPiBzcGVjaWFsbHkgZHVyaW5nIHRlc3Rpbmcgb2YgcGF0Y2hl
cyBhbmQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgYXZvaWQKPiBpdC4KPiAKPiBXaGF0IGV4YWN0
bHkgaXMgdGhlIHVzZSBjYXNlIGZvciB3aGljaCB3ZSBuZWVkIHRoaXMgcGF0Y2ggPyAKTGlrZSB0
aGUgY2hhbmdlbG9nIHNheXMgJ1RoaXMgc3VwcG9ydHMgdXNlcnMgb2YgT1BQIHRoYXQgd2FudCB0
bwpzcGVjaWZ5IHRoZSAnZm1heCcgdGFibGVzIG9mIGEgZGV2aWNlIGluc3RlYWQgb2YgZXZlcnkg
c2luZ2xlIGZyZXF1ZW5jeQp0aGF0IHRoZXkgbmVlZCcKCnNvIHRoZSAnZm1heCcgdGFibGVzIGJh
c2ljYWxseSBzYXkgd2hhdCB0aGUgbWF4IGZyZXF1ZW5jeSB0aGUgZGV2aWNlIGNhbgpvcGVyYXRl
IGF0IGZvciBhIGdpdmVuIHBlcmZvcm1hbmNlIHN0YXRlL3ZvbHRhZ2UgbGV2ZWwuCgpzbyBpbiB5
b3VyIGV4YW1wbGUgaXQgd291bGQgYmUgZm9yIGluc3RhbmNlCgo1MDBNLCBQZXJmIHN0YXRlID0g
MgoxRywgUGVyZiBzdGF0ZSA9IDMKMS4yRywgUGVyZiBzdGF0ZSA9IDQKCk5vdyB3aGVuIHRoZSBk
ZXZpY2Ugd2FudHMgdG8gb3BlcmF0ZSBhdCBzYXkgODAwTWh6LCB5b3UgbmVlZCB0byBzZXQgdGhl
ClBlcmYgc3RhdGUgdG8gMywgc28gdGhpcyBwYXRjaCBiYXNpY2FsbHkgYXZvaWRzIHlvdSBoYXZp
bmcgdG8gcHV0IHRob3NlIGFkZGl0aW9uYWwKT1BQcyBpbiB0aGUgdGFibGUgd2hpY2ggd291bGQg
b3RoZXJ3aXNlIGxvb2sgc29tZXRoaW5nIGxpa2UgdGhpcwoKNTAwTSwgUGVyZiBzdGF0ZSA9IDIK
ODAwTSwgUGVyZiBzdGF0ZSA9IDMgPC0tIHJlZHVuZGFudCBPUFAKMUcsIFBlcmYgc3RhdGUgPSAz
CjEuMkcsIFBlcmYgc3RhdGUgPSA0CgpZb3VyIGV4YW1wbGUgaGFkIGp1c3QgMSBtaXNzaW5nIGVu
dHJ5IGluIHRoZSAnZm1heCcgdGFibGVzIGluIHJlYWxpdHkgaXRzIGEgbG90IG1vcmUsCmF0bGVh
c3Qgb24gYWxsIHF1YWxjb21tIHBsYXRmb3Jtcy4KCgotLSAKUVVBTENPTU0gSU5ESUEsIG9uIGJl
aGFsZiBvZiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlcgpvZiBD
b2RlIEF1cm9yYSBGb3J1bSwgaG9zdGVkIGJ5IFRoZSBMaW51eCBGb3VuZGF0aW9uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
