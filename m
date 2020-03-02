Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E81753D8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 07:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AA06E093;
	Mon,  2 Mar 2020 06:36:18 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6E06E093
 for <dri-devel@freedesktop.org>; Mon,  2 Mar 2020 06:36:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583130977; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YYalt6l/N7I/mSLT1TfY3UB/16G6fmRPNEGmAhNeO4I=;
 b=GWagZs9/i5oL22p45SV36WpGpHhl6ztsR5Hvd5z7HFgfaW+hlF7RMOJXPWgezGNXsRntSGAv
 MPQCAQPoVuqa+dDntbC3NHxr/LDt9RtQ+VDOBXhdKFLzv61Y1Sv4+MPEgAwAgcKMi+dA9xv2
 xzAlUqGcIZi7AF2p3APVLstnwSM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5ca951.7eff5ace4c00-smtp-out-n02;
 Mon, 02 Mar 2020 06:36:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 976F6C433A2; Mon,  2 Mar 2020 06:36:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.67.17]
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C6A9CC43383;
 Mon,  2 Mar 2020 06:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6A9CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
To: Rob Herring <robh@kernel.org>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
 <20200220203509.GA14697@bogus>
 <6a7c1f39-a85f-4a99-fed3-71001bdb6128@codeaurora.org>
 <CAL_JsqKVNENPZKbCy4FrGRO=D79hBL3keuE-U2tTwDVViCrdPQ@mail.gmail.com>
From: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <3f9ae835-5146-d5db-1caf-01ede5bc9a1f@codeaurora.org>
Date: Mon, 2 Mar 2020 12:05:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKVNENPZKbCy4FrGRO=D79hBL3keuE-U2tTwDVViCrdPQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
 Doug Anderson <dianders@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMjYvMjAyMCA4OjAzIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBXZWQsIEZlYiAy
NiwgMjAyMCBhdCA1OjE3IEFNIFNoYXJhdCBNYXNldHR5IDxzbWFzZXR0eUBjb2RlYXVyb3JhLm9y
Zz4gd3JvdGU6Cj4+Cj4+IE9uIDIvMjEvMjAyMCAyOjA1IEFNLCBSb2IgSGVycmluZyB3cm90ZToK
Pj4+IE9uIFRodSwgMjAgRmViIDIwMjAgMTM6NDI6MjIgKzA1MzAsIFNoYXJhdCBNYXNldHR5IHdy
b3RlOgo+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBhIGNsb2NrIGRlZmluaXRpb24gbmVlZGVkIGZvciBw
b3dlcmluZyBvbiB0aGUgR1BVIFRCVXMKPj4+PiBhbmQgdGhlIEdQVSBUQ1UuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBTaGFyYXQgTWFzZXR0eSA8c21hc2V0dHlAY29kZWF1cm9yYS5vcmc+Cj4+
Pj4gLS0tCj4+Pj4gICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2Fy
bSxzbW11LnlhbWwgfCAzICsrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPj4+Pgo+Pj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdf
Y2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4+Pgo+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc2ltcGxlLWZyYW1lYnVmZmVyLmV4YW1wbGUuZHRzOjIxLjE2LTM3LjEx
OiBXYXJuaW5nIChjaG9zZW5fbm9kZV9pc19yb290KTogL2V4YW1wbGUtMC9jaG9zZW46IGNob3Nl
biBub2RlIG11c3QgYmUgYXQgcm9vdCBub2RlCj4+PiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgt
ZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9hcm0sc21t
dS5leGFtcGxlLmR0LnlhbWw6IGlvbW11QGQwMDAwMDogY2xvY2stbmFtZXM6IFsnYnVzJywgJ2lm
YWNlJ10gaXMgdG9vIHNob3J0Cj4+PiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9hcm0sc21tdS5leGFtcGxl
LmR0LnlhbWw6IGlvbW11QGQwMDAwMDogY2xvY2tzOiBbWzQyOTQ5NjcyOTUsIDEyM10sIFs0Mjk0
OTY3Mjk1LCAxMjRdXSBpcyB0b28gc2hvcnQKPj4+Cj4+PiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wYXRjaC8xMjQxMjk3Cj4+PiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4K
Pj4gSGkgUm9iLCBUaGVzZSBpc3N1ZXMgc2VlbSB0byBiZSBmcm9tIHRoZSBvcmlnaW5hbCBjb2Rl
IGFuZCBub3QgcmVsYXRlZAo+PiB0byBteSBwYXRjaC4gQXJlIHRoZXNlIGdvaW5nIHRvIGJlIGJs
b2NraW5nIGVycm9ycz8KPiBUaGVyZSBhcmUgbm8gZXJyb3JzIGluIHRoaXMgYmluZGluZyBpbiBt
YWlubGluZS4gWW91J3ZlIGFkZGVkIGEgM3JkCj4gY2xvY2sgd2hlbiBhbGwgdGhlIGV4aXN0aW5n
IHVzZXJzIGhhdmUgZXhhY3RseSAyIGNsb2Nrcy4KClJvYiwKCkFkZGluZyBzb21ldGhpbmcgbGlr
ZSB0aGUgZm9sbG93aW5nIHNlZW1zIHRvIGJlIHNvbHZpbmcgdGhlIGJvdCBlcnJvcnMsIApidXQg
SSBhbSBub3QgY2VydGFpbiBpZiB0aGlzIGlzIHRoZSByaWdodCB3YXkgdG8gYWRkcmVzcyB0aGlz
IGlzc3VlLiBDYW4gCnlvdSBwbGVhc2UgY29tbWVudD8KCiDCoMKgIGNsb2NrLW5hbWVzOgorwqDC
oMKgIG1pbkl0ZW1zOiAyCivCoMKgwqAgbWF4SXRlbXM6IDMKIMKgwqDCoMKgIGl0ZW1zOgogwqDC
oMKgwqDCoMKgIC0gY29uc3Q6IGJ1cwogwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGlmYWNlCivCoMKg
wqDCoMKgIC0gY29uc3Q6IG1lbV9pZmFjZV9jbGsKCiDCoMKgIGNsb2NrczoKK8KgwqDCoCBtaW5J
dGVtczogMgorwqDCoMKgIG1heEl0ZW1zOiAzCiDCoMKgwqDCoCBpdGVtczoKIMKgwqDCoMKgwqDC
oCAtIGRlc2NyaXB0aW9uOiBidXMgY2xvY2sgcmVxdWlyZWQgZm9yIGRvd25zdHJlYW0gYnVzIGFj
Y2VzcyBhbmQgCmZvciB0aGUKIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtbXUgcHR3CiDCoMKgwqDC
oMKgwqAgLSBkZXNjcmlwdGlvbjogaW50ZXJmYWNlIGNsb2NrIHJlcXVpcmVkIHRvIGFjY2VzcyBz
bW11J3MgcmVnaXN0ZXJzCiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aHJvdWdoIHRoZSBUQ1UncyBw
cm9ncmFtbWluZyBpbnRlcmZhY2UuCivCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IGNvcmUgY2xv
Y2sgcmVxdWlyZWQgZm9yIHRoZSBHUFUgU01NVSBUQlVzIGFuZCB0aGUgCkdQVSBUQ1UuCgo+Cj4g
Um9iCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
