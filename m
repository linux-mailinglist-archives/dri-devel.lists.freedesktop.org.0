Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DB47945
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 06:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582DE89159;
	Mon, 17 Jun 2019 04:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE42889159
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 04:25:06 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 969F160A44; Mon, 17 Jun 2019 04:25:06 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D977860735;
 Mon, 17 Jun 2019 04:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D977860735
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
 <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
 <20190614052732.4w6vvwwich2h4cgu@vireshk-i7>
 <20190617035058.veo7uwqjrpa6kykt@vireshk-i7>
 <a912c8b2-080d-7ab7-670b-b687ec3a2c92@codeaurora.org>
 <20190617041721.5xdr3kl4xxe6gy4m@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a97f991d-539a-ce22-834b-ce19944e4f57@codeaurora.org>
Date: Mon, 17 Jun 2019 09:55:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617041721.5xdr3kl4xxe6gy4m@vireshk-i7>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560745506;
 bh=5HZNkcP2zjhga4bMIOWXDoG0/nXxrlZAjw0ECMvGYK8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kQVJ9Osh3eNJuFAi59AX3O0oOU/n2R1TLKeFsvszpLQZT49bJMj86kNYSvp7k6e+J
 5RPT6GNe3kh9dMasg/eJlxZnFiHsAI9fTu/bzk9oq1kQaQ2tikD3pkVWsd3LaXag9a
 hTlnLJOVQjC7nbGJBX0MOWdSTiKTWm5+JadThbZ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560745505;
 bh=5HZNkcP2zjhga4bMIOWXDoG0/nXxrlZAjw0ECMvGYK8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=G3dth9pBIldbPRyid5w1N1yL/bTUx8NuG1TbpDv3Y2g4jKBqOHr9ICd/Ucdl2ISGf
 zpAQa/+hK2ijNE1odvZQHhIT8OEW/U9CuNLp5iSChIt6UAp8Sz4aHfprpBQPeE1gcH
 FgAekDIFTXanc5VeqZtXhzbOybouHaMjoY15PVN8=
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, vincent.guittot@linaro.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mturquette@baylibre.com, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA2LzE3LzIwMTkgOTo0NyBBTSwgVmlyZXNoIEt1bWFyIHdyb3RlOgo+IE9uIDE3LTA2LTE5
LCAwOTozNywgUmFqZW5kcmEgTmF5YWsgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDYvMTcvMjAxOSA5OjIw
IEFNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4+PiBPbiAxNC0wNi0xOSwgMTA6NTcsIFZpcmVzaCBL
dW1hciB3cm90ZToKPj4+PiBIbW0sIHNvIHRoaXMgcGF0Y2ggd29uJ3QgYnJlYWsgYW55dGhpbmcg
YW5kIEkgYW0gaW5jbGluZWQgdG8gYXBwbHkgaXQgYWdhaW4gOikKPj4+Pgo+Pj4+IERvZXMgYW55
b25lIHNlZSBhbnkgb3RoZXIgaXNzdWVzIHdpdGggaXQsIHdoaWNoIEkgbWlnaHQgYmUgbWlzc2lu
ZyA/Cj4+Pgo+Pj4gSSBoYXZlIHVwZGF0ZWQgdGhlIGNvbW1pdCBsb2cgYSBiaXQgbW9yZSB0byBj
bGFyaWZ5IG9uIHRoaW5ncywgcGxlYXNlIGxldCBtZQo+Pj4ga25vdyBpZiBpdCBsb29rcyBva2F5
Lgo+Pj4KPj4+ICAgICAgIG9wcDogRG9uJ3Qgb3ZlcndyaXRlIHJvdW5kZWQgY2xrIHJhdGUKPj4+
ICAgICAgIFRoZSBPUFAgdGFibGUgbm9ybWFsbHkgY29udGFpbnMgJ2ZtYXgnIHZhbHVlcyBjb3Jy
ZXNwb25kaW5nIHRvIHRoZQo+Pj4gICAgICAgdm9sdGFnZSBvciBwZXJmb3JtYW5jZSBsZXZlbHMg
b2YgZWFjaCBPUFAsIGJ1dCB3ZSBkb24ndCBuZWNlc3NhcmlseSB3YW50Cj4+PiAgICAgICBhbGwg
dGhlIGRldmljZXMgdG8gcnVuIGF0IGZtYXggYWxsIHRoZSB0aW1lLiBSdW5uaW5nIGF0IGZtYXgg
bWFrZXMgc2Vuc2UKPj4+ICAgICAgIGZvciBkZXZpY2VzIGxpa2UgQ1BVL0dQVSwgd2hpY2ggaGF2
ZSBhIGZpbml0ZSBhbW91bnQgb2Ygd29yayB0byBkbyBhbmQKPj4+ICAgICAgIHNpbmNlIGEgc3Bl
Y2lmaWMgYW1vdW50IG9mIGVuZXJneSBpcyBjb25zdW1lZCBhdCBhbiBPUFAsIGl0cyBiZXR0ZXIg
dG8KPj4+ICAgICAgIHJ1biBhdCB0aGUgaGlnaGVzdCBwb3NzaWJsZSBmcmVxdWVuY3kgZm9yIHRo
YXQgdm9sdGFnZSB2YWx1ZS4KPj4+ICAgICAgIE9uIHRoZSBvdGhlciBoYW5kLCB3ZSBoYXZlIElP
IGRldmljZXMgd2hpY2ggbmVlZCB0byBydW4gYXQgc3BlY2lmaWMKPj4+ICAgICAgIGZyZXF1ZW5j
aWVzIG9ubHkgZm9yIHRoZWlyIHByb3BlciBmdW5jdGlvbmluZywgaW5zdGVhZCBvZiBtYXhpbXVt
Cj4+PiAgICAgICBwb3NzaWJsZSBmcmVxdWVuY3kuCj4+PiAgICAgICBUaGUgT1BQIGNvcmUgY3Vy
cmVudGx5IHJvdW5kdXAgdG8gdGhlIG5leHQgcG9zc2libGUgT1BQIGZvciBhIGZyZXF1ZW5jeQo+
Pj4gICAgICAgYW5kIHNlbGVjdCB0aGUgZm1heCB2YWx1ZS4gVG8gc3VwcG9ydCB0aGUgSU8gZGV2
aWNlcyBieSB0aGUgT1BQIGNvcmUsCj4+PiAgICAgICBsZXRzIGRvIHRoZSByb3VuZHVwIHRvIGZl
dGNoIHRoZSB2b2x0YWdlIG9yIHBlcmZvcm1hbmNlIHN0YXRlIHZhbHVlcywKPj4+ICAgICAgIGJ1
dCBub3QgdXNlIHRoZSBPUFAgZnJlcXVlbmN5IHZhbHVlLiBSYXRoZXIgdXNlIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBieQo+Pj4gICAgICAgY2xrX3JvdW5kX3JhdGUoKS4KPj4+ICAgICAgIFRoZSBjdXJy
ZW50IHVzZXIsIGNwdWZyZXEsIG9mIGRldl9wbV9vcHBfc2V0X3JhdGUoKSBhbHJlYWR5IGRvZXMg
dGhlCj4+PiAgICAgICByb3VuZGluZyB0byB0aGUgbmV4dCBPUFAgYmVmb3JlIGNhbGxpbmcgdGhp
cyByb3V0aW5lIGFuZCBpdCB3b24ndAo+Pj4gICAgICAgaGF2ZSBhbnkgc2lkZSBhZmZlY3RzIGJl
Y2F1c2Ugb2YgdGhpcyBjaGFuZ2UuCj4+Cj4+IExvb2tzIGdvb2QgdG8gbWUuIFNob3VsZCB0aGlz
IGFsc28gYmUgZG9jdW1lbnRlZCBzb21lcGxhY2UgdGhhdCBkZXZfcG1fb3BwX3NldF9yYXRlKCkK
Pj4gd291bGQgbm90IGJlIGFibGUgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBpdHMgdXNlcnMgdHJ5
aW5nIHRvIHNjYWxlIENQVS9HUFUncyB2cyBJTwo+PiBkZXZpY2VzLCBzbyBpdHMgdGhlIGNhbGxl
cnMgcmVzcG9uc2liaWxpdHkgdG8gcm91bmQgaXQgYWNjb3JkaW5nbHkgYmVmb3JlIGNhbGxpbmcg
dGhlCj4+IEFQST8KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vcHAvY29yZS5jIGIvZHJpdmVy
cy9vcHAvY29yZS5jCj4gaW5kZXggMGZiYzc3ZjA1MDQ4Li5iYWU5NGJmYTFlOTYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9vcHAvY29yZS5jCj4gKysrIGIvZHJpdmVycy9vcHAvY29yZS5jCj4gQEAg
LTc1MSw4ICs3NTEsMTEgQEAgc3RhdGljIGludCBfc2V0X3JlcXVpcmVkX29wcHMoc3RydWN0IGRl
dmljZSAqZGV2LAo+ICAgICogQGRldjogICAgICAgIGRldmljZSBmb3Igd2hpY2ggd2UgZG8gdGhp
cyBvcGVyYXRpb24KPiAgICAqIEB0YXJnZXRfZnJlcTogZnJlcXVlbmN5IHRvIGFjaGlldmUKPiAg
ICAqCj4gLSAqIFRoaXMgY29uZmlndXJlcyB0aGUgcG93ZXItc3VwcGxpZXMgYW5kIGNsb2NrIHNv
dXJjZSB0byB0aGUgbGV2ZWxzIHNwZWNpZmllZAo+IC0gKiBieSB0aGUgT1BQIGNvcnJlc3BvbmRp
bmcgdG8gdGhlIHRhcmdldF9mcmVxLgo+ICsgKiBUaGlzIGNvbmZpZ3VyZXMgdGhlIHBvd2VyLXN1
cHBsaWVzIHRvIHRoZSBsZXZlbHMgc3BlY2lmaWVkIGJ5IHRoZSBPUFAKPiArICogY29ycmVzcG9u
ZGluZyB0byB0aGUgdGFyZ2V0X2ZyZXEsIGFuZCBwcm9ncmFtcyB0aGUgY2xvY2sgdG8gYSB2YWx1
ZSA8PQo+ICsgKiB0YXJnZXRfZnJlcSwgYXMgcm91bmRlZCBieSBjbGtfcm91bmRfcmF0ZSgpLiBE
ZXZpY2Ugd2FudGluZyB0byBydW4gYXQgZm1heAo+ICsgKiBwcm92aWRlZCBieSB0aGUgb3BwLCBz
aG91bGQgaGF2ZSBhbHJlYWR5IHJvdW5kZWQgdG8gdGhlIHRhcmdldCBPUFAncwo+ICsgKiBmcmVx
dWVuY3kuCj4gICAgKi8KClBlcmZlY3QsIHRoYW5rcy4KCi0tIApRVUFMQ09NTSBJTkRJQSwgb24g
YmVoYWxmIG9mIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyCm9m
IENvZGUgQXVyb3JhIEZvcnVtLCBob3N0ZWQgYnkgVGhlIExpbnV4IEZvdW5kYXRpb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
