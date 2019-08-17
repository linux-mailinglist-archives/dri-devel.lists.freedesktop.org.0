Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1AD910F3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 16:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283DB6E029;
	Sat, 17 Aug 2019 14:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0F36E029
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 14:55:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A89712001F;
 Sat, 17 Aug 2019 16:55:17 +0200 (CEST)
Date: Sat, 17 Aug 2019 16:55:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Colin King <colin.king@canonical.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH][drm-next] drm/panel: remove redundant assignment to val
Message-ID: <20190817145516.GA11584@ravnborg.org>
References: <20190817122124.29650-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817122124.29650-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=DfNHnWVPAAAA:8
 a=SIPzu5pdF0Keq8NkGp0A:9 a=CjuIK1q_8ugA:10 a=rjTVMONInIDnV1a_A2c_:22
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDE6MjE6MjRQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFZhcmlhYmxlIHZhbCBpcyBpbml0aWFsaXplZCB0byBhIHZhbHVlIGluIGEgZm9yLWxvb3AgdGhh
dCBpcwo+IG5ldmVyIHJlYWQgYW5kIGhlbmNlIGl0IGlzIHJlZHVuZGFudC4gUmVtb3ZlIGl0Lgo+
IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQo+IFNpZ25lZC1vZmYtYnk6
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpUaGFua3MuIEFwcGxp
ZWQgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LgoKCVNhbQoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDA0M210ZWExLmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC10cG8tdGQwNDNtdGVhMS5jCj4gaW5kZXggM2I0ZjMwYzBmZGFlLi44NDM3
MDU2MjkxMGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10
ZDA0M210ZWExLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQz
bXRlYTEuYwo+IEBAIC0xMTYsNyArMTE2LDcgQEAgc3RhdGljIHZvaWQgdGQwNDNtdGVhMV93cml0
ZV9nYW1tYShzdHJ1Y3QgdGQwNDNtdGVhMV9wYW5lbCAqbGNkKQo+ICAJdGQwNDNtdGVhMV93cml0
ZShsY2QsIDB4MTMsIHZhbCk7Cj4gIAo+ICAJLyogZ2FtbWEgYml0cyBbNzowXSAqLwo+IC0JZm9y
ICh2YWwgPSBpID0gMDsgaSA8IDEyOyBpKyspCj4gKwlmb3IgKGkgPSAwOyBpIDwgMTI7IGkrKykK
PiAgCQl0ZDA0M210ZWExX3dyaXRlKGxjZCwgMHgxNCArIGksIGdhbW1hW2ldICYgMHhmZik7Cj4g
IH0KPiAgCj4gLS0gCj4gMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
