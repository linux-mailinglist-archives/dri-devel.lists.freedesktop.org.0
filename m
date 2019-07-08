Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918DB62256
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 17:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F8A89D42;
	Mon,  8 Jul 2019 15:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96E89D42;
 Mon,  8 Jul 2019 15:24:56 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 68A9C60C5F; Mon,  8 Jul 2019 15:24:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 33C9360DAD;
 Mon,  8 Jul 2019 15:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33C9360DAD
Date: Mon, 8 Jul 2019 09:24:53 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
Message-ID: <20190708152453.GB10188@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190703140055.26300-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703140055.26300-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562599496;
 bh=LaN53jeBYi5tmPR5ezGeeym0cUuS5a/xgbX3lDsZMh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONNmY6hh8UETji6VY4CPGNI9BNgDf1TfHiCcbM8ph7nNlivKTcA8F4ptLXFT27cQf
 +nCkVIfIRYCHNcUpZldX8dvnHlQ/VCitu7yWegFZoy4CIY13H0J3o1KVd7lXPpnNmR
 h7v//ZnmbhGp8EESOjxSCQhsGJeljGtl1F+wkgc0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562599496;
 bh=LaN53jeBYi5tmPR5ezGeeym0cUuS5a/xgbX3lDsZMh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONNmY6hh8UETji6VY4CPGNI9BNgDf1TfHiCcbM8ph7nNlivKTcA8F4ptLXFT27cQf
 +nCkVIfIRYCHNcUpZldX8dvnHlQ/VCitu7yWegFZoy4CIY13H0J3o1KVd7lXPpnNmR
 h7v//ZnmbhGp8EESOjxSCQhsGJeljGtl1F+wkgc0=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDc6MDA6MzVBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBGb3IgcGxh
dGZvcm1zIHRoYXQgcmVxdWlyZSB0aGUgInphcCBzaGFkZXIiIHRvIHRha2UgdGhlIEdQVSBvdXQg
b2YKPiBzZWN1cmUgbW9kZSBhdCBib290LCB3ZSBhbHNvIG5lZWQgdGhlIHphcCBmdyB0byBlbmQg
dXAgaW4gdGhlIGluaXRyZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVu
b19kZXZpY2UuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwo+IGluZGV4IGQ5
YWM4YzRjZDg2Ni4uYWE2NDUxNGFmZDVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2FkcmVub19kZXZpY2UuYwo+IEBAIC0xNzQsNiArMTc0LDEwIEBAIE1PRFVMRV9GSVJNV0FS
RSgicWNvbS9hNTMwX3phcC5iMDEiKTsKPiAgTU9EVUxFX0ZJUk1XQVJFKCJxY29tL2E1MzBfemFw
LmIwMiIpOwo+ICBNT0RVTEVfRklSTVdBUkUoInFjb20vYTYzMF9zcWUuZnciKTsKPiAgTU9EVUxF
X0ZJUk1XQVJFKCJxY29tL2E2MzBfZ211LmJpbiIpOwo+ICtNT0RVTEVfRklSTVdBUkUoInFjb20v
YTYzMF96YXAubWR0Iik7Cj4gK01PRFVMRV9GSVJNV0FSRSgicWNvbS9hNjMwX3phcC5iMDAiKTsK
PiArTU9EVUxFX0ZJUk1XQVJFKCJxY29tL2E2MzBfemFwLmIwMSIpOwo+ICtNT0RVTEVfRklSTVdB
UkUoInFjb20vYTYzMF96YXAuYjAyIik7CgpIb3BlZnVsbHkgd2UgYXJlIGluIHRoZSB2ZXJ5IGxh
c3QgZGF5cyBvZiB0aGUgc3BsaXQgUElMIHNvIHdlIGNhbiBsZWF2ZSB0aGlzCnVnbGluZXNzIGJl
aGluZCB1cyBvbmNlIGFuZCBmb3IgYWxsLgoKUmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpj
cm91c2VAY29kZWF1cm9yYS5vcmc+Cgo+ICBzdGF0aWMgaW5saW5lIGJvb2wgX3Jldl9tYXRjaCh1
aW50OF90IGVudHJ5LCB1aW50OF90IGlkKQo+ICB7Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKVGhl
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVy
b3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
