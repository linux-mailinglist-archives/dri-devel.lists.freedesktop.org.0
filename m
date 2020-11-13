Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1F2B24C1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 20:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77026E58B;
	Fri, 13 Nov 2020 19:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5433C6E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 19:42:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605296561; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wMOoKM+IAAOuxYQjJIwgkzyOd2gA5G5ffuKMZt+F2ko=;
 b=NJpv0tshdfx3GKBbP9CKR+Ej7noq0k+8+k4dFcGhZF4LVc9TL2cfBE0oRlXXEI5QkYUcqBE3
 Y2mR+loFhRecwGQNNVYiY4LzFh9V5msXNADqk6KMBfpRoEvtPh0vdLxj6cS9s4ZISphWNwja
 wva7WqsBBPCRT0FrdDqDYwwzlpk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5faee1989a53d19da94270b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 19:42:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CABFCC433C8; Fri, 13 Nov 2020 19:42:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A4488C433C6;
 Fri, 13 Nov 2020 19:42:15 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 11:42:15 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 38/40] drm/msm/disp/dpu1/dpu_core_perf: Remove
 set but unused variable 'dpu_cstate'
In-Reply-To: <20201113134938.4004947-39-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-39-lee.jones@linaro.org>
Message-ID: <7922eb5036c43bdae7f15e7a73fbfe62@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0xMyAwNTo0OSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmM6IEluIGZ1bmN0aW9uCj4g4oCYX2RwdV9jb3JlX3Bl
cmZfY2FsY19jcnRj4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29y
ZV9wZXJmLmM6MTEzOjI1OiB3YXJuaW5nOgo+IHZhcmlhYmxlIOKAmGRwdV9jc3RhdGXigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAKPiBDYzogUm9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEthbHlhbiBUaG90YSA8a2FseWFuX3RAY29kZWF1
cm9yYS5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
ClJldmlld2VkLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jIHwgMyAt
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYwo+IGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jCj4gaW5kZXggMzdjODI3MDY4MWMy
My4uMzY5MjdmYzA0YTM4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY29yZV9wZXJmLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfY29yZV9wZXJmLmMKPiBAQCAtMTEwLDE0ICsxMTAsMTEgQEAgc3RhdGljIHZvaWQgX2Rw
dV9jb3JlX3BlcmZfY2FsY19jcnRjKHN0cnVjdCAKPiBkcHVfa21zICprbXMsCj4gIAkJc3RydWN0
IGRybV9jcnRjX3N0YXRlICpzdGF0ZSwKPiAgCQlzdHJ1Y3QgZHB1X2NvcmVfcGVyZl9wYXJhbXMg
KnBlcmYpCj4gIHsKPiAtCXN0cnVjdCBkcHVfY3J0Y19zdGF0ZSAqZHB1X2NzdGF0ZTsKPiAtCj4g
IAlpZiAoIWttcyB8fCAha21zLT5jYXRhbG9nIHx8ICFjcnRjIHx8ICFzdGF0ZSB8fCAhcGVyZikg
ewo+ICAJCURQVV9FUlJPUigiaW52YWxpZCBwYXJhbWV0ZXJzXG4iKTsKPiAgCQlyZXR1cm47Cj4g
IAl9Cj4gCj4gLQlkcHVfY3N0YXRlID0gdG9fZHB1X2NydGNfc3RhdGUoc3RhdGUpOwo+ICAJbWVt
c2V0KHBlcmYsIDAsIHNpemVvZihzdHJ1Y3QgZHB1X2NvcmVfcGVyZl9wYXJhbXMpKTsKPiAKPiAg
CWlmIChrbXMtPnBlcmYucGVyZl90dW5lLm1vZGUgPT0gRFBVX1BFUkZfTU9ERV9NSU5JTVVNKSB7
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
