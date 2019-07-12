Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF166A1C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 11:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828E6E334;
	Fri, 12 Jul 2019 09:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486F76E334;
 Fri, 12 Jul 2019 09:40:17 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MwQCb-1ie6cI24qj-00sKbe; Fri, 12 Jul 2019 11:40:11 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: return 'NULL' instead of 'false' from
 dcn20_acquire_idle_pipe_for_layer
Date: Fri, 12 Jul 2019 11:39:52 +0200
Message-Id: <20190712094009.1535662-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3cpkDgxIhIsadjRAYBvtn1DUyn+BUx4TJsnFE7RqYAa5qmUsTy6
 ZFEWWtos2jSr8XJqGbISEDbpNjknjjyG9gOydIRFynjICGXMb1KjAkon8PG4aAb1JAjEzma
 AHDoJXR1FwIQHXXfZ6oorG8LKXZJrnCGniYroO08K5/hrWuUrJyWyfGGD6IbPMMiazMUfKK
 ewxOssRMv/wrh7Cmz9ZMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oRQbMjjvoFQ=:No9erCSCNWW+VJd/nxNhyr
 6OIu1qjtUork6mvRXgF9CoyGhOzQGkOATDOd+8MhfahUOLpWn+L8svIDug83SSQ/7iAxMuSmx
 UrNw0VrqwduicMcLa+nRC8oH5lpP8V9RuBpXbsDJNeUIXyD8lhYApZQr7TCs4q5dn6C76CpC5
 Gwyg4aMd/cRD2vQ40hhDjZicgD8qQZN++JKALp1vl0SDa2GqIOfJuyoLM/AxVaB9BsLdRxNaK
 CJdKCFxr2akRoHyPTMTqFffdefAE/NxJOwyLUjcplYD3jclo9o9pNZPorygWG8DnAfIwWcDXG
 J9R9bPanREK3s4gsxF4LYCrS6CLqyCF71J+3mG11TKA8oRJQXt/cFkUYW9KmDZap0y/dwgy9t
 T4NQSvQI9ZIYH8HAim4kYVHrDxeQVQrR0Bh64IWpOJLDJclJ5+nQAiAQPRiHr/lbxtuHAH2lh
 s5xpzuWjhVdhXQRzveJoMYS171SlizoNBgxs01FJSzvR5UWcaASBlmgkPYmTYRPmx1wUYamzE
 cKu++M6LrFPoQOxxLNx/bTbgdQB1WnxFM1IyEfqcYrloSdTtoIhNTCGaIZcsspJBuLclBNJvI
 m4DF+ruvt1dNq/hJa1h2QHFX3ww0+kI2F6mWmMR0YP+UHoUMbXCK37CLEFgwuNCmuU+1wZBbB
 ZuJhpWGiZ20xa0VH1MXAJ2eIfALilxi2CpFAYKbYq9HeYwWNoPg5VCDsJI9Ayyb3HX/+JaWuq
 skFB7ZWyVD61qKRx4CE6mJxDQGNEBrS8y3JB/w==
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
Cc: Charlene Liu <charlene.liu@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, clang-built-linux@googlegroups.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2xhbmcgY29tcGxhaW5zIHRoYXQgJ2ZhbHNlJyBpcyBhIG5vdCBhIHBvaW50ZXI6Cgpkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmM6
MjQyODoxMDogZXJyb3I6IGV4cHJlc3Npb24gd2hpY2ggZXZhbHVhdGVzIHRvIHplcm8gdHJlYXRl
ZCBhcyBhIG51bGwgcG9pbnRlciBjb25zdGFudCBvZiB0eXBlICdzdHJ1Y3QgcGlwZV9jdHggKicg
Wy1XZXJyb3IsLVdub24tbGl0ZXJhbC1udWxsLWNvbnZlcnNpb25dCiAgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7CgpDaGFuZ2luZyBpdCB0byAnTlVMTCcgbG9va3MgbGlrZSB0aGUgcmlnaHQg
dGhpbmcgdGhhdCB3aWxsIHNodXQgdXAKdGhlIHdhcm5pbmcgYW5kIG1ha2UgaXQgZWFzaWVyIHRv
IHJlYWQsIHdoaWxlIG5vdCBjaGFuZ2luZyBiZWhhdmlvci4KCkZpeGVzOiA3ZWQ0ZTYzNTJjMTYg
KCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBEQ04yIEhXIFNlcXVlbmNlciBhbmQgUmVzb3VyY2UiKQpT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRl
eCA3MGFjOGE5NWQyZGIuLjY2YWE0MTRhZDM4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTI0MjUsNyArMjQy
NSw3IEBAIHN0cnVjdCBwaXBlX2N0eCAqZGNuMjBfYWNxdWlyZV9pZGxlX3BpcGVfZm9yX2xheWVy
KAogCQlBU1NFUlQoMCk7CiAKIAlpZiAoIWlkbGVfcGlwZSkKLQkJcmV0dXJuIGZhbHNlOworCQly
ZXR1cm4gTlVMTDsKIAogCWlkbGVfcGlwZS0+c3RyZWFtID0gaGVhZF9waXBlLT5zdHJlYW07CiAJ
aWRsZV9waXBlLT5zdHJlYW1fcmVzLnRnID0gaGVhZF9waXBlLT5zdHJlYW1fcmVzLnRnOwotLSAK
Mi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
