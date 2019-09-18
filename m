Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFCB6D0F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B936FD52;
	Wed, 18 Sep 2019 19:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983A96FD74
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 19:57:29 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MsJXG-1huedC0a0w-00toR3; Wed, 18 Sep 2019 21:57:24 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: include linux/sched/task.h
Date: Wed, 18 Sep 2019 21:57:07 +0200
Message-Id: <20190918195722.2149227-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ej872YyO7HXEU8CNXRPtHdXeVnbz9zTySP1CA1k40z1LeTXe3mj
 agyhpv74Sl7wE8DAVanhlat0KMZliMe8R8ywGa67hfQhJYGlR+KRVMvUxU/wHEUWlUxmbnd
 9LiD638HHbaqYm7Qb6ls3EkcaK//pUD4Q7Dq8hcNQ+MCYIoyM8I2gxs7mCOKKzlOfD8Omq3
 TMgBP/SonrzP8n2XsRq7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e7/P3QW3qJ0=:4PgFN+vYMMVxcGiM7azlrg
 HmWI/oIY0J7/xNdK8ONeJ9EYEXiDVKb2hl/JoBQZe5rboU26hT9Xp/ALIBW3W/I3YY63G3Ze8
 ZCYiGaV27/3R1WZHzprA0w1/WwxED4IcNZbnyxibmi2n8wk6/6P3lSeZk1T/owvKUePSUGy3T
 87rvpUy1PQIM+Zft6TpQHdUHU5doc7UXOTEXr4vokcYRskxEJOTJR60kq57eFlLOWw2hIH1ej
 Zw3mOjS0S7fjufGM4aF8CwVzxwQj03NMN6SQBCjcFIc9Mo4JU73flTCp36cqoTRg5MZWnEwyA
 4i6kQ3jWReHHvvxa7jsX4M7NToo+gTpRxGO5uYohsS+L5JUmFdyji2MMxiQIiLfTpYl83nmcE
 fqJTvYuYD2coj1h+iZY6iSYejtHX52aihBUZqCzkr8fX+ZWTIz4mGbH3zPixdCr2daAf6hKcj
 iN/t9Sco/HQ5T7IDAYaADkrMKogyCZ/6xGsW8J8jdNJcjC9pOXPOBMII/p/BPA6wihlomN9Ak
 SItRQ7pmDGv3+SHitfUK+cU1Vcc9ORtLmt0VWwI+orvw8oqSIcJs+etB63o9eiqhz/FPC19vP
 Z1klxsnRTmUto/4Z+BF0keJpPtSjUO6V86kc1xEtiBnH+vMWZZv4AWg9Ady+H6Ejy8XeDqI6L
 A5RA8zGdM16qBmkKsWGZGcsP1awNHBWBcw4UlqnNomzpgbI2c4DlTu2wFRFoGDGa18n9MccTg
 N37Sc6kShmA+Zjl3PhKVikXFDQ2amduC6eE+iXrLx0O7UY/LXNghESDaCmj9M35oxqnHlDCHW
 GVWTI4F0StjbEcK5dA+clzgvhoVyLq+Pvgm8MORS7FkwtJBD//rnC/bbTHvrNcE0MFPXkAgAo
 XV1BYLMMM0tkY7n4UWkQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGlzIGhlYWRlciBmaWxlLCBjb21waWxlLXRlc3RpbmcgbWF5IHJ1biBpbnRvIGEg
bWlzc2luZwpkZWNsYXJhdGlvbjoKCmRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jOjQ0NDo0
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3B1dF90YXNrX3N0cnVj
dCcgWy1XZXJyb3IsLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KCkZpeGVzOiA0ODJm
OTYzMjRhNGUgKCJkcm0vbXNtOiBGaXggdGFzayBkdW1wIGluIGdwdSByZWNvdmVyeSIpClNpZ25l
ZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ3B1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ3B1LmMKaW5kZXggYTA1MjM2NGE1ZDc0Li5lZGQ0NWY0MzRjY2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2dwdS5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8bGludXgvcG1fb3Bw
Lmg+CiAjaW5jbHVkZSA8bGludXgvZGV2ZnJlcS5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmNvcmVk
dW1wLmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgogCiAvKgogICogUG93ZXIgTWFu
YWdlbWVudDoKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
