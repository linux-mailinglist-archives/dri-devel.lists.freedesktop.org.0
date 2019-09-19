Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910AAB7D22
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 16:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BCA6F752;
	Thu, 19 Sep 2019 14:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACEA6F752;
 Thu, 19 Sep 2019 14:45:50 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id A6E97619C8; Thu, 19 Sep 2019 14:45:48 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 09E1961576;
 Thu, 19 Sep 2019 14:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09E1961576
Date: Thu, 19 Sep 2019 08:45:44 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/msm: include linux/sched/task.h
Message-ID: <20190919144543.GA14636@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190918195722.2149227-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918195722.2149227-1-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568904349;
 bh=khMtM6rvwdQIMEeHPhJZbSxvGqMZ8YsalJllt9BvrM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnguuNys6yUkTWl3aoXgSFx7p+GQeLbiAZIvEH9k9O4ELrvNowRVmqaGkztuo5epP
 yLl5yZvBYUBdYgTxTrt+2AXw6vZy2+DUcQu1HNPr1B7pXroYuQFsGjJrH0rw0f20HI
 k4dE0WkeQOJlMUeIGODxUowK4BlQHX1QmnSTQ4ek=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568904347;
 bh=khMtM6rvwdQIMEeHPhJZbSxvGqMZ8YsalJllt9BvrM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PKhY46lwozj0vxMhCODrczhfdBRAiYyTtFbhYOFTpqmhu+9SuqqBPXNeOYtAM7S0x
 e+aPR2uTLKzWygF/8ZnFWMcrZ7aIDx8RV2EO0LpVi2PI5Nn8ckDct4qVi+9p37OwAO
 WMyr19QnBYB/CbNedLKkje8ks7G5+4H91Jt6LFCE=
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDk6NTc6MDdQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBXaXRob3V0IHRoaXMgaGVhZGVyIGZpbGUsIGNvbXBpbGUtdGVzdGluZyBtYXkgcnVu
IGludG8gYSBtaXNzaW5nCj4gZGVjbGFyYXRpb246Cj4gCj4gZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ3B1LmM6NDQ0OjQ6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAn
cHV0X3Rhc2tfc3RydWN0JyBbLVdlcnJvciwtV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQo+IAo+IEZpeGVzOiA0ODJmOTYzMjRhNGUgKCJkcm0vbXNtOiBGaXggdGFzayBkdW1wIGluIGdw
dSByZWNvdmVyeSIpCgpSZXZpZXdlZC1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVy
b3JhLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKPiBpbmRleCBhMDUy
MzY0YTVkNzQuLmVkZDQ1ZjQzNGNjZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jCj4gQEAgLTE2
LDYgKzE2LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3BtX29wcC5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvZGV2ZnJlcS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZGV2Y29yZWR1bXAuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3NjaGVkL3Rhc2suaD4KPiAgCj4gIC8qCj4gICAqIFBvd2VyIE1hbmFnZW1lbnQ6
Cj4gLS0gCj4gMi4yMC4wCj4gCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJ
bmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24g
Q29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
