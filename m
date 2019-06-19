Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E374C083
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 20:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A9A6E447;
	Wed, 19 Jun 2019 18:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448886E444;
 Wed, 19 Jun 2019 18:06:44 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 1895C60FEB; Wed, 19 Jun 2019 18:06:41 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AC5E60767;
 Wed, 19 Jun 2019 18:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6AC5E60767
Date: Wed, 19 Jun 2019 12:06:36 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [Freedreno] [PATCH 2/6] dt-bindings: display: msm: gmu: add
 optional ocmem property
Message-ID: <20190619180636.GB17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, agross@kernel.org,
 david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-3-masneyb@onstation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560967604;
 bh=cRtFEDEdDY9qsoG0YiGJNOgq+ZtfuWbo77zTDOq85pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8boX3gfLvHoD8JdAII+iqLZgXN94ujkMws7Iw1Xs2y+qJN03j0bx8lO191jkhuFN
 M7aDsrRPTVkVycLjXKPf79NoKd5BgB2NZrCEc0KE0nxeUwq/6vs/BiWPue+y3yXU2n
 8prf7UaWzqV2+zP/UwZpx3g+DgTKnNtAY/FzZtQ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560967599;
 bh=cRtFEDEdDY9qsoG0YiGJNOgq+ZtfuWbo77zTDOq85pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=chg/Ig6T36Zu2mJ+jaUuwXT7prZ20QYxzrpLnZeHwBzVxdn/36etOP0FWgkY7yFWX
 ++O1Gkqp7x90PwUN1sI65+ui+frWbhHLbDNxHtSXoJgoSKsYK7xBjcUXNl/yvqj2qC
 4mzpmqT4Dvj/+YwrN37+lrGy2JLjBpvJgTrILZVw=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMDk6Mjk6MjZBTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+IFNvbWUgQTN4eCBhbmQgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGlu
c2lkZSB0aGUgR1BVIGNvcmUgYW5kCj4gbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01F
TSkgaW4gb3JkZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQo+IG9wdGlvbmFsIG9jbWVtIHBy
b3BlcnR5IHRvIHRoZSBBZHJlbm8gR3JhcGhpY3MgTWFuYWdlbWVudCBVbml0IGJpbmRpbmdzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+
IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211
LnR4dCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9n
bXUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dt
dS50eHQKPiBpbmRleCA5MGFmNWIwYTU2YTkuLmM3NDZiOTVlOTVkNCAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0
Cj4gQEAgLTMxLDYgKzMxLDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gaW9tbXVzOiBw
aGFuZGxlIHRvIHRoZSBhZHJlbm8gaW9tbXUKPiAgLSBvcGVyYXRpbmctcG9pbnRzLXYyOiBwaGFu
ZGxlIHRvIHRoZSBPUFAgb3BlcmF0aW5nIHBvaW50cwo+ICAKPiArT3B0aW9uYWwgcHJvcGVydGll
czoKPiArLSBvY21lbTogcGhhbmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0
J3MgcHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24KPiArICAgICAgICAgU29Dcy4gU2VlIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwuCj4g
Kwo+ICBFeGFtcGxlOgoKWW91IHNob3VsZCBhZGQgYSBmdWxsLWZsZWRnZWQgYTR4eCBleGFtcGxl
IGhlcmUgaW5jbHVkaW5nIGEgb2NtZW0gcGhhbmRsZS4KCkpvcmRhbgoKPiAgLyB7CgotLSAKVGhl
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVy
b3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
