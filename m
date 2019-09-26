Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDD2BFB79
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 00:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992B76EE1B;
	Thu, 26 Sep 2019 22:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6597D6EE1B;
 Thu, 26 Sep 2019 22:51:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FD5D30872C5;
 Thu, 26 Sep 2019 22:51:54 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1DD600C1;
 Thu, 26 Sep 2019 22:51:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm/amdgpu: Fix incorrect encoder API usages
Date: Thu, 26 Sep 2019 18:51:02 -0400
Message-Id: <20190926225122.31455-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 26 Sep 2019 22:51:54 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, Dingchen Zhang <dingchen.zhang@amd.com>,
 Thomas Lim <thomas.lim@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Francis <david.francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, "Jerry \(Fangzhi\) Zuo" <jerry.zuo@amd.com>,
 Maxime Ripard <mripard@kernel.org>,
 Brajeswar Ghosh <brajeswar.linux@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWNlZCB0aGlzIHdoaWxlIHRyeWluZyB0byByZXNwaW4gbXkgTVNUIHN1c3BlbmQvcmVzdW1l
IHBhdGNoIHNlcmllcy4KSXQncyBub3QgdGVjaG5pY2FsbHkgcG9zc2libGUgKGF0IGxlYXN0IHVu
dGlsIHNvbWVvbmUgbW92ZXMgYW1kZ3B1CmF3YXkgZnJvbSB0aGUgZGVwcmVjYXRlZCBkcm1fZGV2
aWNlLT5kcml2ZXItPntsb2FkLHVubG9hZH0gaG9va3MpIGZvcgphbWRncHUgdG8gcHJvcGVybHkg
cmVnaXN0ZXIgYWxsIG9mIGl0J3MgZW5jb2RlcnMgYmVmb3JlIHJlZ2lzdGVyaW5nIHdpdGgKdXNl
cnNwYWNlLiBIb3dldmVyLCBhbWRncHUgYWxzbyBhcHBhcmVudGx5IGFkZHMgYW5kIHJlbW92ZXMg
ZW5jb2RlcnMKYWxvbmcgd2l0aCBNU1QgY29ubmVjdG9ycyAtIHdoaWNoIGlzIGEgbXVjaCBiaWdn
ZXIgaXNzdWUgYXMgdXNlcnNwYWNlCmFwcGxpY2F0aW9ucyBkZWZpbml0ZWx5IGRvIG5vdCBleHBl
Y3QgdGhpcyB0eXBlIG9mIGJlaGF2aW9yLgoKU28sIGxldCdzIGZpeCBpdCBhbmQgYWRkIHNvbWUg
V0FSTnMoKSBzbyBuZXcgZHJpdmVycyBkb24ndCBhY2NpZGVudGFsbHkKbWFrZSB0aGlzIG1pc3Rh
a2UgaW4gdGhlIGZ1dHVyZS4KCkx5dWRlIFBhdWwgKDYpOgogIGRybS9hbWRncHUvZG0vbXN0OiBE
b24ndCBjcmVhdGUgTVNUIHRvcG9sb2d5IG1hbmFnZXJzIGZvciBlRFAgcG9ydHMKICBkcm0vYW1k
Z3B1L2RtL21zdDogUmVtb3ZlIHVubmVjZXNzYXJ5IE5VTEwgY2hlY2sKICBkcm0vYW1kZ3B1L2Rt
L21zdDogVXNlIC0+YXRvbWljX2Jlc3RfZW5jb2RlcgogIGRybS9hbWRncHUvZG0vbXN0OiBNYWtl
IE1TVCBlbmNvZGVycyBwZXItQ1JUQyBhbmQgZml4IGVuY29kZXIgdXNhZ2UKICBkcm0vYW1kZ3B1
L2RtL21zdDogUmVwb3J0IHBvc3NpYmxlX2NydGNzIGluY29ycmVjdGx5LCBmb3Igbm93CiAgZHJt
L2VuY29kZXI6IFdBUk4oKSB3aGVuIGFkZGluZy9yZW1vdmluZyBlbmNvZGVycyBhZnRlciBkZXZp
Y2UKICAgIHJlZ2lzdHJhdGlvbgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9t
b2RlLmggICAgICB8ICAzICsrCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgfCAxNSArKysrKysKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uaCB8ICAxIC0KIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMgICB8IDQ2ICsrKysrKysrKystLS0tLS0tLS0KIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmggICB8ICAzICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VuY29k
ZXIuYyAgICAgICAgICAgICAgICAgfCAzMSArKysrKysrKysrLS0tCiA2IGZpbGVzIGNoYW5nZWQs
IDcwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
