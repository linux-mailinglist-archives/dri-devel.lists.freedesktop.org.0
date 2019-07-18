Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2686CE0D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 14:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2671F6E3B0;
	Thu, 18 Jul 2019 12:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B196E3B0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:27:28 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59204
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1ho5VO-0008Mp-Kt; Thu, 18 Jul 2019 14:27:26 +0200
Subject: Re: [PATCH 10/10] drm/tinydrm: Move tinydrm_display_pipe_init() to
 mipi-dbi
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-11-noralf@tronnes.org>
 <ddb52c29-0063-33aa-96f6-d399117d1b4c@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <ff6e1389-1fcf-50be-6c7c-821eb818cff5@tronnes.org>
Date: Thu, 18 Jul 2019 14:27:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ddb52c29-0063-33aa-96f6-d399117d1b4c@lechnology.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=TescixSwB8w057JEQZGzziyzO1YqN8OZH924+wMXkJQ=; 
 b=OrQsyw7C10bzkP2p9OPO7pcDUNIbKiSjnp7tWbn4lNxSWf3tslJBQ3SonqWJcrMOnsgNlrNq6f8YP06gQkFi/bcOzuV1wBZs8qkFawWb+V3iTHlEouj9OCL66+LbzE0C86rb5qcZq25i2+m1cXyrT/o2sceMiStaUdkIPyCA1a8ykG5WjdiEv9Qk1suffCJFNr0n+/vtzb8xdRn088ymSJv2KYe1Y/6DELm1QOlb4pqZ5kOWXDmeq7eodHwQCwoFLn5VsSNeFN3CYSk0+qLJhvJTUL50wYr7gv7VKdlQVyhUL76D5+HJNWqqmpECdHHJQ7HCucOKYJ3eZZeYyIPyYw==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDcuMjAxOSAyMi40Niwgc2tyZXYgRGF2aWQgTGVjaG5lcjoKPiBPbiA3LzE3LzE5
IDY6NTggQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gdGlueWRybV9kaXNwbGF5X3BpcGVf
aW5pdCgpIGhhcyBvbmx5IG9uZSB1c2VyIG5vdywgc28gbW92ZSBpdCB0bwo+PiBtaXBpLWRiaS4K
Pj4KPj4gQ2hhbmdlczoKPj4gLSBSZW1vdmUgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MuZGV0
ZWN0LCBpdCdzIGFsd2F5cyBjb25uZWN0ZWQuCj4+IC0gU3RvcmUgdGhlIGNvbm5lY3RvciBhbmQg
bW9kZSBpbiBtaXBpX2RiaSBpbnN0ZWFkIG9mIGl0J3Mgb3duIHN0cnVjdC4KPj4KPj4gT3RoZXJ3
aXNlIHJlbW92ZSBzb21lIGxlZnRvdmVyIHRpbnlkcm0taGVscGVycy5oIGluY2x1c2lvbnMuCj4g
Cj4gV2VyZSB0aGUgdXNlcyBvZiB0aW55ZHJtLWhlbHBlcnMuaCByZW1vdmVkIGluIHRoaXMgc2Vy
aWVzPyBJZiBzbywgdGhlbiB0aAo+ICNpbmNsdWRlIHNob3VsZCBwcm9iYWJseSBiZSByZW1vdmVk
IGF0IHRoZSBzYW1lIHRpbWUuIElmIG5vdCwgcmVtb3ZpbmcgdGhlCj4gI2luY2x1ZGUgbGluZXMg
Y291bGQganVzdCBiZSBhbiBpbmRlcGVuZGVudCBwYXRjaCBmcm9tIHRoaXMgc2VyaWVzLgoKdGlu
eWRybS1oZWxwZXJzLmggaGFzIG9ubHkgb25lIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIHRoYXQgaXMg
cmVtb3ZlIGluCnRoaXMgcGF0Y2gsIHNvIHRoZSBmaWxlIGlzIGRlbGV0ZWQuIFRoYXQncyB3aHkg
SSBuZWVkIHRvIHJlbW92ZSB0aGUKI2luY2x1ZGUncy4KCk5vcmFsZi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
