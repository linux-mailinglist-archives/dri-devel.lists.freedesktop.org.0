Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F5357391
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 19:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55A6E139;
	Wed,  7 Apr 2021 17:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0A6E134
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 17:51:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617817917; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YrQgPTfY48iGzzVhb/GjqH7aT+xdZHhGl9cpqh8bNVU=;
 b=aMe9JhEng0yf0m5i5+G71KtgYBusgx8vZT85u2jb0zqMv7QnHeQXySXenU3NxepHzatVnzP3
 MUbDKB0Z0AmP5aIzrhBOF3oBdMSYDcyYshvaNGIY895vy4/0w5nA8DdabtDyHxJ3szM4a1aL
 lpzpc7M9fOq1SZMtLYNoNBraBDA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 606df13c8166b7eff730beea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 17:51:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 88C10C433CA; Wed,  7 Apr 2021 17:51:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 706A9C433ED;
 Wed,  7 Apr 2021 17:51:54 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 10:51:54 -0700
From: abhinavk@codeaurora.org
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] drm/msm/dp: remove unused local variable 'hpd'
In-Reply-To: <20210407082315.2703-1-thunder.leizhen@huawei.com>
References: <20210407082315.2703-1-thunder.leizhen@huawei.com>
Message-ID: <38969a7640a5067a714fc87fb5aa7d3a@codeaurora.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wNyAwMToyMywgWmhlbiBMZWkgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL21zbS9kcC9k
cF9kaXNwbGF5LmM6IEluIGZ1bmN0aW9uCj4g4oCYZHBfZGlzcGxheV91c2JwZF9hdHRlbnRpb25f
Y2LigJk6Cj4gZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmM6NDk2OjE5OiB3YXJu
aW5nOiB2YXJpYWJsZSDigJhocGTigJkKPiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQt
c2V0LXZhcmlhYmxlXQo+IAo+IEZpeGVzOiBjNThlYjFiNTRmZWUgKCJkcm0vbXNtL2RwOiBmaXgg
Y29ubmVjdC9kaXNjb25uZWN0IGhhbmRsZWQgYXQgCj4gaXJxX2hwZCIpCj4gUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW4gTGVp
IDx0aHVuZGVyLmxlaXpoZW5AaHVhd2VpLmNvbT4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIg
PGFiaGluYXZrQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rw
L2RwX2Rpc3BsYXkuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiBpbmRleCA1YTM5ZGE2ZTFlYWYy
NzcuLjMxYmYyYTQwYTllYjJjOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rw
L2RwX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5j
Cj4gQEAgLTQ5Myw3ICs0OTMsNiBAQCBzdGF0aWMgaW50IGRwX2Rpc3BsYXlfdXNicGRfYXR0ZW50
aW9uX2NiKHN0cnVjdCAKPiBkZXZpY2UgKmRldikKPiAgCWludCByYyA9IDA7Cj4gIAl1MzIgc2lu
a19yZXF1ZXN0Owo+ICAJc3RydWN0IGRwX2Rpc3BsYXlfcHJpdmF0ZSAqZHA7Cj4gLQlzdHJ1Y3Qg
ZHBfdXNicGQgKmhwZDsKPiAKPiAgCWlmICghZGV2KSB7Cj4gIAkJRFJNX0VSUk9SKCJpbnZhbGlk
IGRldlxuIik7Cj4gQEAgLTUwNyw4ICs1MDYsNiBAQCBzdGF0aWMgaW50IGRwX2Rpc3BsYXlfdXNi
cGRfYXR0ZW50aW9uX2NiKHN0cnVjdCAKPiBkZXZpY2UgKmRldikKPiAgCQlyZXR1cm4gLUVOT0RF
VjsKPiAgCX0KPiAKPiAtCWhwZCA9IGRwLT51c2JwZDsKPiAtCj4gIAkvKiBjaGVjayBmb3IgYW55
IHRlc3QgcmVxdWVzdCBpc3N1ZWQgYnkgc2luayAqLwo+ICAJcmMgPSBkcF9saW5rX3Byb2Nlc3Nf
cmVxdWVzdChkcC0+bGluayk7Cj4gIAlpZiAoIXJjKSB7Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
