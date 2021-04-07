Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59C357397
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 19:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31876E94B;
	Wed,  7 Apr 2021 17:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392EA6E134
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 17:52:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617817942; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Uf0AVv8aqmiXb0YftRz/h5+MlBMvFR0+UaFhKIo1nCw=;
 b=QHk8PICScH/dAmGiCmKrK+SrB9jjL/6qEy8gUZE4WLlmxf7DIR5nsNMtN0gXNzbqcKoNthOE
 E98TE5C6bG4akz3W4K0COMAkKSP8FygpKGt3ECQdI7/YhkoFcPprHNFrR9l9SWEERNTrRyKa
 LHHP4RHOiM+daJX81GNdDAqL8HM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 606df1522cc44d3aea4b2246 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 17:52:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A8FAC43465; Wed,  7 Apr 2021 17:52:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 130AAC433ED;
 Wed,  7 Apr 2021 17:52:17 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 10:52:17 -0700
From: abhinavk@codeaurora.org
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [Freedreno] [PATCH 1/1] drm/msm/dpu: remove unused local variable
 'cmd_enc'
In-Reply-To: <20210407083334.2762-1-thunder.leizhen@huawei.com>
References: <20210407083334.2762-1-thunder.leizhen@huawei.com>
Message-ID: <fb7d8e6daf9586c4aff0606bdcd1e32d@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wNyAwMTozMywgWmhlbiBMZWkgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYzogSW4gZnVuY3Rpb24KPiDigJhkcHVfZW5jb2Rl
cl9waHlzX2NtZF93YWl0X2Zvcl9jb21taXRfZG9uZeKAmToKPiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOjY4ODozMTogd2FybmluZzoKPiB2YXJp
YWJsZSDigJhjbWRfZW5j4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCj4gCj4gRml4ZXM6IGZlMjg2ODkzZWQzNCAoImRybS9tc20vZHB1OiBSZW1vdmUgdW51
c2VkIGNhbGwgaW4gCj4gd2FpdF9mb3JfY29tbWl0X2RvbmUiKQo+IFJlcG9ydGVkLWJ5OiBIdWxr
IFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuIExlaSA8dGh1
bmRlci5sZWl6aGVuQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhp
bmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYwo+IGluZGV4IGIyYmUzOWI5MTQ0ZTQ0OS4uMDg4OTAw
ODQxYmY4YmFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyX3BoeXNfY21kLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jCj4gQEAgLTY4NSwxMCArNjg1LDYgQEAgc3RhdGljIGlu
dCAKPiBkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0X2Zvcl90eF9jb21wbGV0ZSgKPiAgc3RhdGlj
IGludCBkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0X2Zvcl9jb21taXRfZG9uZSgKPiAgCQlzdHJ1
Y3QgZHB1X2VuY29kZXJfcGh5cyAqcGh5c19lbmMpCj4gIHsKPiAtCXN0cnVjdCBkcHVfZW5jb2Rl
cl9waHlzX2NtZCAqY21kX2VuYzsKPiAtCj4gLQljbWRfZW5jID0gdG9fZHB1X2VuY29kZXJfcGh5
c19jbWQocGh5c19lbmMpOwo+IC0KPiAgCS8qIG9ubHkgcmVxdWlyZWQgZm9yIG1hc3RlciBjb250
cm9sbGVyICovCj4gIAlpZiAoIWRwdV9lbmNvZGVyX3BoeXNfY21kX2lzX21hc3RlcihwaHlzX2Vu
YykpCj4gIAkJcmV0dXJuIDA7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
