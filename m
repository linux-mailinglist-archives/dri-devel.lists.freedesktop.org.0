Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C2845456
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 07:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FED89241;
	Fri, 14 Jun 2019 05:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A309389241
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:54:36 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 67A3060A24; Fri, 14 Jun 2019 05:54:36 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 254356079C;
 Fri, 14 Jun 2019 05:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 254356079C
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
To: Viresh Kumar <viresh.kumar@linaro.org>, swboyd@chromium.org,
 vincent.guittot@linaro.org, mturquette@baylibre.com
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
 <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <b29c1754-d719-4d7b-806f-9ea25a8b528f@codeaurora.org>
Date: Fri, 14 Jun 2019 11:24:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560491676;
 bh=wd1M0evBIXLEcGJx9iw3rlVbAxOCmtJoFg2feFLTumI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bOnuHxO8vepWrGxy5wP0hMkl/8iRkQ6gb+h6IQ12M7loZUuxZRddpRhAciAGH/8MA
 P+k2GbzqrJRMRiTFRr/zTMtT2zr2AE7SArtWjGKwQx+UjmDMIPlCcxdqeSFAYgBsYn
 OY3USkRnR3WlbVrgBCedBeGlRZJBMeTDyCd4v9PI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560491675;
 bh=wd1M0evBIXLEcGJx9iw3rlVbAxOCmtJoFg2feFLTumI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q1sGLGHqf3Og6g5QfKfG4218AP0shAWBRRrGCeuKdQJBYFYQQ/S/aPj6MOLclGqJ5
 KfHv4VOLijzIkPbNk0r6sDct0BGaiOvf5sl9xTqTkwSFeVR26QSejf2TOJ6fKEGnok
 sgNekPch6PEJN8RCCUSSNLedhogOCiYDnRe9dgoU=
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

Cj4gTm93LCB0aGUgcmVxdWVzdCB0byBjaGFuZ2UgdGhlIGZyZXF1ZW5jeSBzdGFydHMgZnJvbSBj
cHVmcmVxCj4gZ292ZXJub3JzLCBsaWtlIHNjaGVkdXRpbCB3aGVuIHRoZXkgY2FsbHM6Cj4gCj4g
X19jcHVmcmVxX2RyaXZlcl90YXJnZXQocG9saWN5LCA1OTkgTUh6LCBDUFVGUkVRX1JFTEFUSU9O
X0wpOwo+IAo+IENQVUZSRVFfUkVMQVRJT05fTCBtZWFuczogbG93ZXN0IGZyZXF1ZW5jeSBhdCBv
ciBhYm92ZSB0YXJnZXQuIEFuZCBzbwo+IEkgd291bGQgZXhwZWN0IHRoZSBmcmVxdWVuY3kgdG8g
Z2V0IHNldCB0byA2MDBNSHogKGlmIHdlIGxvb2sgYXQgY2xvY2sKPiBkcml2ZXIpIG9yIDcwME1I
eiAoaWYgd2UgbG9vayBhdCBPUFAgdGFibGUpLiBJIHRoaW5rIHdlIHNob3VsZCBkZWNpZGUKPiB0
aGlzIHRoaW5nIGZyb20gdGhlIE9QUCB0YWJsZSBvbmx5IGFzIHRoYXQncyB3aGF0IHRoZSBwbGF0
Zm9ybSBndXlzCj4gd2FudCB1cyB0byB1c2UuIFNvLCB3ZSBzaG91bGQgZW5kIHVwIHdpdGggNzAw
IE1Iei4KPiAKPiBUaGVuIHdlIGxhbmQgaW50byBkZXZfcG1fb3BwX3NldF9yYXRlKCksIHdoaWNo
IGRvZXMgdGhpcyAod2hpY2ggaXMKPiBjb2RlIGNvcGllZCBmcm9tIGVhcmxpZXIgdmVyc2lvbiBv
ZiBjcHVmcmVxLWR0IGRyaXZlcik6CgpzbyBiZWZvcmUgd2UgbGFuZCBpbnRvIGRldl9wbV9vcHBf
c2V0X3JhdGUoKSBmcm9tIGEgX19jcHVmcmVxX2RyaXZlcl90YXJnZXQoKQpJIGd1ZXNzIHdlIGRv
IGhhdmUgYSBjcHVmcmVxIGRyaXZlciBjYWxsYmFjayB0aGF0IGdldHMgY2FsbGVkIGluIGJldHdl
ZW4/CndoaWNoIGlzIGVpdGhlciAudGFyZ2V0X2luZGV4IG9yIC50YXJnZXQKCkluIGNhc2Ugb2Yg
LnRhcmdldF9pbmRleCwgdGhlIGNwdWZyZXEgY29yZSBsb29rcyBmb3IgYSBPUFAgaW5kZXgKYW5k
IHdlIHdvdWxkIGxhbmQgdXAgd2l0aCA3MDBNaHogaSBndWVzcywgc28gd2UgYXJlIGdvb2QuCgpJ
biBjYXNlIG9mIC50YXJnZXQgdGhvdWdoIHRoZSAncmVsYXRpb24nIENQVUZSRVFfUkVMQVRJT05f
TCBkb2VzIGdldCBwYXNzZWQgb3Zlcgp0byB0aGUgY3B1ZnJlcSBkcml2ZXIgd2hpY2ggSSBhbSBn
dWVzc2luZyBpcyBleHBlY3RlZCB0byBoYW5kbGUgaXQgaW4gc29tZSB3YXkgdG8KbWFrZSBzdXJl
IHRoZSB0YXJnZXQgZnJlcXVlbmN5IHNldCBpcyBub3QgbGVzcyB0aGFuIHdoYXRzIHJlcXVlc3Rl
ZD8gaW5zdGVhZCBvZgpzaW1wbHkgcGFzc2luZyB0aGUgcmVxdWVzdGVkIGZyZXF1ZW5jeSBvdmVy
IHRvIGRldl9wbV9vcHBfc2V0X3JhdGUoKT8KCkxvb2tpbmcgYXQgYWxsIHRoZSBleGlzdGluZyBj
cHVmcmVxIGRyaXZlcnMgdXBzdHJlYW0sIHdoaWxlIG1vc3Qgc3VwcG9ydCAudGFyZ2V0X2luZGV4
CnRoZSAzIHdoaWNoIGRvIHN1cHBvcnQgLnRhcmdldCBzZWVtIHRvIGNvbXBsZXRlbHkgaWdub3Jl
IHRoaXMgJ3JlbGF0aW9uJyBpbnB1dCB0aGF0J3MKcGFzc2VkIHRvIHRoZW0uCgpkcml2ZXJzL2Nw
dWZyZXEvY3BwY19jcHVmcmVxLmM6CS50YXJnZXQgPSBjcHBjX2NwdWZyZXFfc2V0X3RhcmdldCwK
ZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtbmZvcmNlMi5jOgkudGFyZ2V0ID0gbmZvcmNlMl90YXJn
ZXQsCmRyaXZlcnMvY3B1ZnJlcS9wY2MtY3B1ZnJlcS5jOgkudGFyZ2V0ID0gcGNjX2NwdWZyZXFf
dGFyZ2V0LAoKPiBUaGlzIGtpbmQgb2YgYmVoYXZpb3IgKGludHJvZHVjZWQgYnkgdGhpcyBwYXRj
aCkgaXMgaW1wb3J0YW50IGZvcgo+IG90aGVyIGRldmljZXMgd2hpY2ggd2FudCB0byBydW4gYXQg
dGhlIG5lYXJlc3QgZnJlcXVlbmN5IHRvIHRhcmdldAo+IG9uZSwgYnV0IG5vdCBmb3IgQ1BVcy9H
UFVzLiBTbywgd2UgbmVlZCB0byB0YWcgdGhlc2UgSU8gZGV2aWNlcwo+IHNlcGFyYXRlbHksIG1h
eWJlIGZyb20gRFQgPyBTbyB3ZSBzZWxlY3QgdGhlIGNsb3Nlc3QgbWF0Y2ggaW5zdGVhZCBvZgo+
IG1vc3Qgb3B0aW1hbCBvbmUuCgp5ZXMgd2UgZG8gbmVlZCBzb21lIHdheSB0byBkaXN0aW5ndWlz
aCBiZXR3ZWVuIENQVS9HUFUgZGV2aWNlcyBhbmQgb3RoZXIKSU8gZGV2aWNlcy4gQ1BVL0dQVSBj
YW4gYWx3YXlzIHJ1biBhdCBmbWF4IGZvciBhIGdpdmVuIHZvbHRhZ2UsIHRoYXQncyBub3QgdHJ1
ZQpmb3IgSU8gZGV2aWNlcyBhbmQgSSBkb24ndCBzZWUgaG93IHdlIGNhbiBzYXRpc2Z5IGJvdGgg
Y2FzZXMgd2l0aG91dApjbGVhcmx5IGtub3dpbmcgaWYgd2UgYXJlIHNlcnZpbmcgYSBwcm9jZXNz
b3Igb3IgYW4gSU8gZGV2aWNlLCB1bmxlc3MgdGhlCmhpZ2hlciBsYXllcnMgKGNwdWZyZXEvZGV2
ZnJlcSkgYXJlIGFibGUgdG8gaGFuZGxlIHRoaXMgc29tZWhvdyB3aXRob3V0CmV4cGVjdGluZyB0
aGUgT1BQIGxheWVyIHRvIGhhbmRsZSB0aGUgZGlmZmVyZW5jZXMuCgotLSAKUVVBTENPTU0gSU5E
SUEsIG9uIGJlaGFsZiBvZiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1l
bWJlcgpvZiBDb2RlIEF1cm9yYSBGb3J1bSwgaG9zdGVkIGJ5IFRoZSBMaW51eCBGb3VuZGF0aW9u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
