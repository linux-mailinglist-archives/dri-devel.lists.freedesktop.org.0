Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCBC185A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5842089862;
	Thu,  9 May 2019 06:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8EB89862
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 06:59:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F6B881F25;
 Thu,  9 May 2019 06:59:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEFF688FD;
 Thu,  9 May 2019 06:59:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C1A0C11AAA; Thu,  9 May 2019 08:59:55 +0200 (CEST)
Date: Thu, 9 May 2019 08:59:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pull] drm for 5.2-rc1
Message-ID: <20190509065955.ro5eagqzo4u6ds4a@sirius.home.kraxel.org>
References: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
 <CAHk-=wg6imuGGw_4d6ywhu=0Kxr+H2S=hHavoDXYjN6o7SqMUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wg6imuGGw_4d6ywhu=0Kxr+H2S=hHavoDXYjN6o7SqMUg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 09 May 2019 06:59:57 +0000 (UTC)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gVGhlIG9uZSB0byB0aGUgdmlydGdwdSBkcml2ZXIsIEkgcmVhbGx5IGRvbid0IGtu
b3cgaWYgaXMgbmVlZGVkIGFueQo+IG1vcmUuIEkgc3VzcGVjdCBJIGNvbXBsZXRlbHkgdW5uZWNl
c3NhcmlseSBtZXJnZWQgdGhhdAo+IHZpcnRncHVfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSgp
IGZ1bmN0aW9uIHRoYXQgY2FtZSBpbiBiZWNhdXNlIEkKPiBkZWNpZGVkIHRvIGRvIHRoZSBtZXJn
ZSBvZiB0aGUgcmV2ZXJ0Lgo+IAo+IEl0J3MgYSB0cml2aWFsIGZ1bmN0aW9uIHRoYXQganVzdCBy
ZXR1cm5zIGFuIGVycm9yLCBhbmQgeW91ciB0cmVlIGp1c3QKPiBsZWF2ZXMgaXQgYXMgTlVMTCwg
YW5kIEkgc3VzcGVjdCBteSBtZXJnZSBkb2Vzbid0IGh1cnQsIGJ1dCBpdCBhbHNvCj4gcHJvYmFi
bHkgZG9lc24ndCBtYXR0ZXIuCgpDaGVja2VkIHRoYXQgb25lLCB0aGUgbWVyZ2UgaXMgY29ycmVj
dC4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
