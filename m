Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9879146D6
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DDB897E7;
	Mon,  6 May 2019 08:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07085897E7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:53:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 34C92C06645C;
 Mon,  6 May 2019 08:53:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC2BC61B60;
 Mon,  6 May 2019 08:53:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B5EB16E0A; Mon,  6 May 2019 10:53:36 +0200 (CEST)
Date: Mon, 6 May 2019 10:53:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH 1/3] drm/virtio: set seqno for dma-fence
Message-ID: <20190506085336.wzzcx2t3bopnftr5@sirius.home.kraxel.org>
References: <20190429220825.156644-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429220825.156644-1-olvaffe@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 06 May 2019 08:53:42 +0000 (UTC)
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

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDM6MDg6MjNQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IFRoaXMgaXMgbW90aXZhdGVkIGJ5IGhhdmluZyBtZWFuaW5nZnVsIGZ0cmFjZSBldmVudHMs
IGJ1dCBpdCBhbHNvCj4gZml4ZXMgdXNlIGNhc2VzIHdoZXJlIGRtYV9mZW5jZV9pc19sYXRlciBp
cyBjYWxsZWQsIHN1Y2ggYXMgaW4KPiBzeW5jX2ZpbGVfbWVyZ2UuCj4gCj4gSW4gb3RoZXIgZHJp
dmVycywgZmVuY2UgY3JlYXRpb24gYW5kIGNtZGJ1ZiBzdWJtaXNzaW9uIG5vcm1hbGx5Cj4gaGFw
cGVuIGF0b21pY2FsbHksCj4gCj4gICBtdXRleF9sb2NrKCk7Cj4gICBmZW5jZSA9IGRtYV9mZW5j
ZV9jcmVhdGUoLi4uLCArK3RpbWVsaW5lLT5zZXFubyk7Cj4gICBzdWJtaXRfY21kYnVmKCk7Cj4g
ICBtdXRleF91bmxvY2soKTsKPiAKPiBhbmQgaGF2ZSBubyBzdWNoIGlzc3VlLiAgQnV0IGluIG91
ciBkcml2ZXIsIGJlY2F1c2UgbW9zdCBpb2N0bHMKPiBxdWV1ZSBjb21tYW5kcyBpbnRvIGN0cmxx
LCB3ZSBkbyBub3Qgd2FudCB0byBncmFiIGEgbG9jay4gIEluc3RlYWQsCj4gd2Ugc2V0IHNlcW5v
IHRvIDAgd2hlbiBhIGZlbmNlIGlzIGNyZWF0ZWQsIGFuZCB1cGRhdGUgaXQgd2hlbiB0aGUKPiBj
b21tYW5kIGlzIGZpbmFsbHkgcXVldWVkIGFuZCB0aGUgc2Vxbm8gaXMga25vd24uCgpTZXJpZXMg
cHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
