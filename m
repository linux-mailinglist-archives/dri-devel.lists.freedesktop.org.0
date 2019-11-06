Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB08F1566
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 12:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488D6ECE8;
	Wed,  6 Nov 2019 11:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7056ECE8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 11:48:55 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51162
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iSJnx-0001sv-Ht; Wed, 06 Nov 2019 12:48:53 +0100
Subject: Re: [PATCH v2 4/4] drm/udl: Remove struct udl_gem_object and functions
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
References: <20191106104722.19700-1-tzimmermann@suse.de>
 <20191106104722.19700-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>
Date: Wed, 6 Nov 2019 12:48:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106104722.19700-5-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JoMbg8ZfJNbcrwuBlYZOmeMcxfMzs6iP+SiHRPSl6hM=; b=EHbeYpNd+HQvmBwW0yr5y5H9s9
 x8rSB1uLz9NutFvY+NmpyFnr8cRjXgiYacjrnqYmdYuqzVOYjLMSiyAA4n+zlMQwRXqRyUWQOYbDo
 liUTZgX0CZm3NqkJXii7lsDAaH7yy1AdHRuGT++jauDQ9jU3UJNWmndi0/Eto1JcNaCRcmCLgMe5S
 HxcsAaUVpOGSLxB/1p0cblJfqr24tLix9fnbDpw3wl4JDi6ovnOfy+pDsEceuHC9KQC/msoVAEg0u
 PVoqmrBnXwGCCDh/7fZGO1IQ7fyS2OX6zOHUVwAWRSN7vGiUKSrCxQ9ZBFoTL9VXYtZamIlfyNCc9
 AxH0LpMw==;
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDYuMTEuMjAxOSAxMS40Nywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gU2ltcGx5
IHJlbW92ZXMgYWxsIHRoZSBvYnNvbGV0ZSBHRU0gY29kZSBmcm9tIHVkbC4gTm8gZnVuY3Rpb25h
bAo+IGNoYW5nZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvTWFrZWZpbGUgICAg
IHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2RtYWJ1Zi5jIHwgMjU0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2
LmggICAgfCAgMjkgLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyAgICB8IDIw
NiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDQ5MCBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX2RtYWJ1Zi5jCj4gCgo8c25pcD4KCj4gLWludCB1ZGxfZ2VtX3ZtYXAoc3Ry
dWN0IHVkbF9nZW1fb2JqZWN0ICpvYmopCj4gLXsKPiAtCWludCBwYWdlX2NvdW50ID0gb2JqLT5i
YXNlLnNpemUgLyBQQUdFX1NJWkU7Cj4gLQlpbnQgcmV0Owo+IC0KPiAtCWlmIChvYmotPmJhc2Uu
aW1wb3J0X2F0dGFjaCkgewo+IC0JCW9iai0+dm1hcHBpbmcgPSBkbWFfYnVmX3ZtYXAob2JqLT5i
YXNlLmltcG9ydF9hdHRhY2gtPmRtYWJ1Zik7Cj4gLQkJaWYgKCFvYmotPnZtYXBwaW5nKQo+IC0J
CQlyZXR1cm4gLUVOT01FTTsKPiAtCQlyZXR1cm4gMDsKPiAtCX0KPiAtCj4gLQlyZXQgPSB1ZGxf
Z2VtX2dldF9wYWdlcyhvYmopOwo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0KPiAt
CW9iai0+dm1hcHBpbmcgPSB2bWFwKG9iai0+cGFnZXMsIHBhZ2VfY291bnQsIDAsIFBBR0VfS0VS
TkVMKTsKClRoaXMgZGlmZmVycyBmcm9tIHRoZSBzaG1lbSBoZWxwZXIgdm1hcDoKCglzaG1lbS0+
dmFkZHIgPSB2bWFwKHNobWVtLT5wYWdlcywgb2JqLT5zaXplID4+IFBBR0VfU0hJRlQsCgkJCSAg
ICBWTV9NQVAsIHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKCkJvcmlzIGFkZGVk
IHRoZSBXQyBpbiBiZTdkOWYwNWM1M2U6CgogZHJtL2dlbV9zaG1lbTogVXNlIGEgd3JpdGVjb21i
aW5lIG1hcHBpbmcgZm9yIC0+dmFkZHIKCiBSaWdodCBub3csIHRoZSBCTyBpcyBtYXBwZWQgYXMg
YSBjYWNoZWQgcmVnaW9uIHdoZW4gLT52bWFwKCkgaXMgY2FsbGVkCiBhbmQgdGhlIHVuZGVybHlp
bmcgb2JqZWN0IGlzIG5vdCBhIGRtYWJ1Zi4KIERvaW5nIHRoYXQgbWFrZXMgY2FjaGUgbWFuYWdl
bWVudCBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkICh5b3UnZCBuZWVkCiB0byBjYWxsIGRtYV9tYXAv
dW5tYXBfc2coKSBvbiB0aGUgLT5zZ3QgZmllbGQgZXZlcnl0aW1lIHRoZSBCTyBpcyBhYm91dAog
dG8gYmUgcGFzc2VkIHRvIHRoZSBHUFUvQ1BVKSwgc28gbGV0J3MgbWFwIHRoZSBCTyB3aXRoIHdy
aXRlY29tYmluZQogYXR0cmlidXRlcyBpbnN0ZWFkIChhcyBkb25lIGluIG1vc3QgZHJpdmVycyku
CgpJIGRvbid0IGtub3cgd2hhdCB0aGUgaW1wbGljYXRpb25zIG9mIHRoaXMgYXJlLCBqdXN0IHBv
aW50aW5nIG91dCBhCmRpZmZlcmVuY2UuCgpOb3JhbGYuCgo+IC0JaWYgKCFvYmotPnZtYXBwaW5n
KQo+IC0JCXJldHVybiAtRU5PTUVNOwo+IC0JcmV0dXJuIDA7Cj4gLX0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
