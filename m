Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C739FB3B4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51B26ED62;
	Wed, 13 Nov 2019 15:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E8C6ED62
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:27:19 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58970
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iUuY9-0003UG-VO; Wed, 13 Nov 2019 16:27:17 +0100
Subject: Re: [PATCH v4 3/3] fbdev: Unexport unlink_framebuffer()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <26c62d04-760e-cecc-3642-d91b083b12e5@tronnes.org>
Date: Wed, 13 Nov 2019 16:27:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113115233.18483-4-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3cBhEL11TGC3fnSyP5Uz6kpf1ieE2CexsDAQNrKRMk=; b=dWTVEzq8AVJUFgT0XnDVseKSbJ
 Epk0zNq7pDL4zUFVIItRub2ov743QmczScDiDqeKFLjiiV4ePKEo9SEbRfnT0a3bi3e5R7SYuW72G
 yZIIez3vEpJtIsgALmJmtavusX1eILGYL4qOoiF3m03P0Td2nhPyYAtytXFNw6WnpC1kHhEDm/uFh
 giREU2UG0g9n17CbWkDsIk6fOsAkF5GUGa4aiw2SqyXG3vrDe5l2DHqqjjBby5YsP0ueKiyA+l/wb
 TxwU45xzkP7uOQEe9iq2AiTtwvEFB7bbOuFtixtbj6cBCQSH0wkya7nzpncihgdQRoKCL2tctyMCG
 cvdDtNBQ==;
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTMuMTEuMjAxOSAxMi41Miwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlcmUg
YXJlIG5vIGV4dGVybmFsIGNhbGxlcnMgb2YgdW5saW5rX2ZyYW1lYnVmZmVyKCkgbGVmdC4gTWFr
ZSB0aGUKPiBmdW5jdGlvbiBhbiBpbnRlcm5hbCBpbnRlcmZhY2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCgpSZXZpZXdl
ZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
