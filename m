Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B12B1EB4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 16:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3676E527;
	Fri, 13 Nov 2020 15:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395246E527
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:30:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605281458; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Cc: To:
 From: Date: Sender; bh=nDk50TXEgsLL4aVwI48GMSE/ZkJsBvYxBRxqXrym8CI=;
 b=cAfhWvDWXVSPbLOxK1Ji7otf7TCy7o2Bws8nPjJi4BEi8m++fDiWCJxTsB2dCPSIoVK3ICtz
 Hea1GNyVOgclo9uBrr3xE+tZi1yhuePdN/V9a88wl9gk9Kb5X2/IPlERNwiqErbzDmAHLkUk
 Inis2AFZOQVILQAtlct0+qLwmO0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5faea68457dd92cbecc3675d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 15:30:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8B1DDC43382; Fri, 13 Nov 2020 15:30:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CF8A5C433CB;
 Fri, 13 Nov 2020 15:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF8A5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 13 Nov 2020 08:30:06 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 06/40] drm/msm/adreno/a6xx_gpu: Staticise
 local function 'a6xx_idle'
Message-ID: <20201113153006.GD2661@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113134938.4004947-7-lee.jones@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMDE6NDk6MDRQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jOjMzOjY6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYTZ4eF9pZGxl4oCZIFstV21pc3NpbmctcHJvdG90
eXBlc10KPiAKPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IENjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGxpbnV4LWFy
bS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogSm9yZGFuIENy
b3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5j
Cj4gaW5kZXggZmNiMGFhYmJjOTg1Mi4uMDNjMmY3ZTBjOTQ5NyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTZ4eF9ncHUuYwo+IEBAIC0zMCw3ICszMCw3IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBfYTZ4eF9jaGVja19pZGxlKHN0cnVjdCBtc21fZ3B1ICpncHUpCj4gIAkJQTZYWF9SQkJN
X0lOVF8wX01BU0tfUkJCTV9IQU5HX0RFVEVDVCk7Cj4gIH0KPiAgCj4gLWJvb2wgYTZ4eF9pZGxl
KHN0cnVjdCBtc21fZ3B1ICpncHUsIHN0cnVjdCBtc21fcmluZ2J1ZmZlciAqcmluZykKPiArc3Rh
dGljIGJvb2wgYTZ4eF9pZGxlKHN0cnVjdCBtc21fZ3B1ICpncHUsIHN0cnVjdCBtc21fcmluZ2J1
ZmZlciAqcmluZykKPiAgewo+ICAJLyogd2FpdCBmb3IgQ1AgdG8gZHJhaW4gcmluZ2J1ZmZlcjog
Ki8KPiAgCWlmICghYWRyZW5vX2lkbGUoZ3B1LCByaW5nKSkKPiAtLSAKPiAyLjI1LjEKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEZyZWVkcmVu
byBtYWlsaW5nIGxpc3QKPiBGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8KCi0tIApU
aGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBB
dXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
