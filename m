Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB9146DA
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A2B897EE;
	Mon,  6 May 2019 08:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08796897EF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:55:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A139A308792B;
 Mon,  6 May 2019 08:55:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 603EA1BC6C;
 Mon,  6 May 2019 08:55:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9BC3716E0A; Mon,  6 May 2019 10:55:18 +0200 (CEST)
Date: Mon, 6 May 2019 10:55:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: allocate fences with GFP_KERNEL
Message-ID: <20190506085518.n364e27b7hqaje2y@sirius.home.kraxel.org>
References: <20190429221021.159784-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429221021.159784-1-olvaffe@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 06 May 2019 08:55:19 +0000 (UTC)
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDM6MTA6MjFQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IEl0IHdhcyBjaGFuZ2VkIHRvIEdGUF9BVE9NSUMgaW4gY29tbWl0IGVjMmYwNTc3YyAoYWRk
ICYgdXNlCj4gdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9idWZmZXIpIGJlY2F1c2UgdGhl
IGFsbG9jYXRpb24gaGFwcGVuZWQKPiB3aXRoIGEgc3BpbmxvY2sgaGVsZC4gIFRoYXQgd2FzIG5v
IGxvbmdlciB0cnVlIGFmdGVyIGNvbW1pdAo+IDlmZGQ5MGMwZiAoYWRkIHZpcnRpb19ncHVfYWxs
b2NfZmVuY2UoKSkuCgpBZGRlZCB0byBkcm0tbWlzYy1uZXh0LgoKdGhhbmtzLAogIEdlcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
