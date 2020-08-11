Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D724225A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 00:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8D96E854;
	Tue, 11 Aug 2020 22:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5546E858
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 22:09:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597183786; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8nVYNeSoMlj/0DZnpTkkfpxc5/vnT3kxypEjr4vqN8U=;
 b=OUCqnGPA6wvJ1/9HD9siZEQ+9R+UamMeoXBQ1FDq5FBPXlCSFpruv7lM8mZNphEW0njM+Mxo
 k14WZENU6QiX/CDFIJLqorqWNSZTuIO6yyzwVvo+mOh5ydWutplAgB3KywmPAPUBP/FzI78J
 H/KapqmuhovyPH9Zyzl/eM66DWo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f331729f2b697637a4d1e3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 22:09:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C0B31C433C9; Tue, 11 Aug 2020 22:09:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E81ABC433C6;
 Tue, 11 Aug 2020 22:09:43 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 11 Aug 2020 15:09:43 -0700
From: Tanmay Shah <tanmay@codeaurora.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Freedreno] [PATCH v9 3/5] drm/msm/dp: add support for DP PLL
 driver
In-Reply-To: <7222ceca-9fe2-f91b-4129-5a70952875f7@infradead.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
 <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
 <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
 <639438051c1b2fe1d9bec5f6343a6dec@codeaurora.org>
 <7222ceca-9fe2-f91b-4129-5a70952875f7@infradead.org>
Message-ID: <9624e970765dc0739793612c2a5c53bc@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0xMSAxMzoyMSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDgvMTEvMjAgMTI6
NDkgUE0sIHRhbm1heUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMjAyMC0wOC0wNyAxMzoy
OCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4gT24gOC83LzIwIDE6MjQgUE0sIFN0ZXBoZW4gQm95
ZCB3cm90ZToKPj4+PiBRdW90aW5nIFJvYiBDbGFyayAoMjAyMC0wOC0wNyAwODo1MTo0OCkKPj4+
Pj4gT24gRnJpLCBBdWcgNywgMjAyMCBhdCA4OjI3IEFNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPgo+Pj4+PiB3cm90ZToKPj4+Pj4+IAo+Pj4+Pj4gT24gOC83LzIwIDEyOjE3
IEFNLCBUYW5tYXkgU2hhaCB3cm90ZToKPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9LY29uZmlnIAo+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCj4+
Pj4+Pj4gaW5kZXggZWEzYzRkMDk0ZDA5Li5jYzEzOTJiMjkwMjIgMTAwNjQ0Cj4+Pj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9LY29uZmlnCj4+Pj4+Pj4gQEAgLTYwLDYgKzYwLDcgQEAgY29uZmlnIERSTV9NU01f
SERNSV9IRENQCj4+Pj4+Pj4gwqBjb25maWcgRFJNX01TTV9EUAo+Pj4+Pj4+IMKgwqDCoMKgwqAg
Ym9vbCAiRW5hYmxlIERQIHN1cHBvcnQgaW4gTVNNIERSTSBkcml2ZXIiCj4+Pj4+Pj4gwqDCoMKg
wqDCoCBkZXBlbmRzIG9uIERSTV9NU00KPj4+Pj4+PiArwqDCoMKgwqAgZGVmYXVsdCB5Cj4+Pj4+
Pj4gwqDCoMKgwqDCoCBoZWxwCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgQ29tcGlsZSBpbiBzdXBw
b3J0IGZvciBEUCBkcml2ZXIgaW4gbXNtIGRybSBkcml2ZXIuIERQIAo+Pj4+Pj4+IGV4dGVybmFs
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgZGlzcGxheSBzdXBwb3J0IGlzIGVuYWJsZWQgdGhyb3Vn
aCB0aGlzIGNvbmZpZyBvcHRpb24uIEl0IAo+Pj4+Pj4+IGNhbgo+Pj4+Pj4gCj4+Pj4+PiBIaSwK
Pj4+Pj4+IAo+Pj4+Pj4gWW91IG5lZWQgYSB2ZXJ5IHN0cm9uZyBqdXN0aWZpY2F0aW9uIHRvIG1h
a2UgYW4gb3B0aW9uYWwgcGFydCBvZiBhCj4+Pj4+PiBkcml2ZXIKPj4+Pj4+IHRvIGJlICJkZWZh
dWx0IHkiLgo+Pj4+PiAKPj4+Pj4gTXkgb3BpbmlvbiBpcyB0aGF0IGlmIHRoZSBkcml2ZXIgaXMg
YnVpbHQsIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlIAo+Pj4+PiBidWlsdC4KPj4+Pj4gVGhpcyBpcyB3
aGF0IG1ha2VzIHNlbnNlIGZvciBkaXN0cm8ncy7CoCBJdCBpcyBvbmx5IHRoZSBlbWJlZGRlZCAK
Pj4+Pj4gY2FzZQo+Pj4+PiB3aGVyZSB5b3Ugd2FudCB0byB0cmltIGRvd24gdW5uZWVkZWQgZmVh
dHVyZXMgd2hlcmUgeW91IG1pZ2h0IHdhbnQgCj4+Pj4+IHRvCj4+Pj4+IGRpc2FibGUgc29tZSBw
YXJ0cy7CoCBTbyAnZGVmYXVsdCB5JyBtYWtlcyBzZW5zZSB0byBtZS4KPj4+IAo+Pj4gV2UgZG9u
J3Qgc2V0IGRlZmF1bHRzIGZvciBkaXN0cm8gY29udmVuaWVuY2UuCj4+PiAKPj4+PiAKPj4+PiBN
YXliZSB1c2UgJ2RlZmF1bHQgRFJNX01TTScgc28gdGhhdCBpdCBkb2Vzbid0IHRyaWdnZXIgdGhl
ICdkZWZhdWx0IAo+Pj4+IHknCj4+Pj4gZmlsdGVycyBwZW9wbGUgaGF2ZT8KPj4+IAo+Pj4gTW9z
dCBwZW9wbGUgY2FuIGZpZ3VyZSB0aGF0IG9uZSBvdXQuwqAgOykKPj4+IEkgZG9uJ3QgaGF2ZSBh
bnkgYXV0b21hdGVkIGZpbHRlcnMuCj4+IAo+PiBBZnRlciBhZnRlciBmdXJ0aGVyIHJldmlld3Ms
IEkgYWdyZWUgd2l0aCBSb2IuIERpc3BsYXkgUG9ydCBpcyAKPj4gcmVxdWlyZWQgbW9kdWxlIGFz
IG9mIG5vdyBzbyBpdCBtYWtlcyBzZW5zZSB0byBrZWVwICdkZWZhdWx0IHknLgo+IAo+IElmIGl0
IGlzIHJlcXVpcmVkLCB0aGVuIHlvdSBkb24ndCBuZWVkIHRvIGhhdmUgYSBLY29uZmlnIGVudHJ5
L3N5bWJvbCAKPiBmb3IgaXQuCgpLY29uZmlnIG1ha2VzIGRyaXZlciBmbGV4aWJsZS4gT3RoZXIg
bW91ZGxlcyBpbiB0aGUgZHJpdmVyIGFyZSBhbHNvIAonZGVmYXVsdCB5JyBzdWNoIGFzIERTSS4g
SSB3aWxsIGxldCBSb2IgZ3VpZGUgdXMgZnVydGhlciBvbiB0aGlzIGFzIGhlIAppcyB0aGUgbWFp
bnRhaW5lci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
