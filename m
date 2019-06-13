Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5743306
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 08:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E2892A1;
	Thu, 13 Jun 2019 06:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A881892A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 06:59:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 02FF22EED3A;
 Thu, 13 Jun 2019 06:59:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D16E17257;
 Thu, 13 Jun 2019 06:59:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0322011AB8; Thu, 13 Jun 2019 08:59:26 +0200 (CEST)
Date: Thu, 13 Jun 2019 08:59:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: davidriley@chromium.org
Subject: Re: [PATCH v2 4/4] drm/virtio: Add memory barriers for capset cache.
Message-ID: <20190613065925.c6c546uyp3n3nqk5@sirius.home.kraxel.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
 <20190610211810.253227-5-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610211810.253227-5-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 13 Jun 2019 06:59:28 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDI6MTg6MTBQTSAtMDcwMCwgZGF2aWRyaWxleUBjaHJv
bWl1bS5vcmcgd3JvdGU6Cj4gRnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0u
b3JnPgo+IAo+IEFmdGVyIGRhdGEgaXMgY29waWVkIHRvIHRoZSBjYWNoZSBlbnRyeSwgYXRvbWlj
X3NldCBpcyB1c2VkIGluZGljYXRlCj4gdGhhdCB0aGUgZGF0YSBpcyB0aGUgZW50cnkgaXMgdmFs
aWQgd2l0aG91dCBhcHByb3ByaWF0ZSBtZW1vcnkgYmFycmllcnMuCj4gU2ltaWxhcmx5IHRoZSBy
ZWFkIHNpZGUgd2FzIG1pc3NpbmcgdGhlIGNvcnJlc3BvbmRpbmcgbWVtb3J5IGJhcnJpZXJzLgoK
QWxsIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0Cgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
