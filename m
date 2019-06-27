Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F95855F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C546E4EA;
	Thu, 27 Jun 2019 15:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2C46E4EA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:16:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37FBF30842B0;
 Thu, 27 Jun 2019 15:16:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C67135D9D2;
 Thu, 27 Jun 2019 15:16:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4EE0A11AAF; Thu, 27 Jun 2019 17:16:33 +0200 (CEST)
Date: Thu, 27 Jun 2019 17:16:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/5] gem/vram: pin to vram in vmap
Message-ID: <20190627151633.j3xf3lkihklb2wzh@sirius.home.kraxel.org>
References: <20190627122348.5833-1-kraxel@redhat.com>
 <20190627122348.5833-2-kraxel@redhat.com>
 <8a52b578-b255-3e11-3a0c-0b68f0cb649e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a52b578-b255-3e11-3a0c-0b68f0cb649e@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 27 Jun 2019 15:16:40 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gIDEpIEludHJvZHVjZSBhIGRlZmF1bHRfcGxhY2VtZW50IGZpZWxkIGluIHN0cnVj
dCBkcm1fZ2VtX3ZyYW1faGVscGVyCj4gd2hlcmUgdGhpcyBmbGFnIGNhbiBiZSBjb25maWd1cmVk
LiBJJ2QgZmF2b3IgdGhpcyBvcHRpb24uCgo+ICAyKSBJbnRyb2R1Y2UgYSBzZXBhcmF0ZSBjYWxs
YmFjayBmdW5jdGlvbiBmb3IgcGlubmluZyB0byB2cmFtLiBUaGUKPiBkcml2ZXIgd291bGQgaGF2
ZSB0byBzZXQgdGhlIGNvcnJlY3QgZnVuY3Rpb24gcG9pbnRlcnMuCgo+ICAzKSBQaW4gdGhlIGZi
IGNvbnNvbGUgYnVmZmVyIG1hbnVhbGx5IGZyb20gd2l0aGluIHRoZSBib2NocyBkcml2ZXIuCgpI
bW0uICBCZWZvcmUgY2FsbGluZyBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpIHRoZSBibyBkb2Vz
bid0IGV4aXN0IHlldAphbmQgd2hlbiB0aGUgZnVuY3Rpb24gcmV0dXJucyBpdCBpcyBhbHJlYWR5
IHZtYXBwZWQgYW5kIHBpbm5lZCBJIHRoaW5rLgoKU28gKDMpIGlzbid0IGVhc2lseSBkb2FibGUu
ICAoMSkgbG9va3MgYmVzdCB0byBtZS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
