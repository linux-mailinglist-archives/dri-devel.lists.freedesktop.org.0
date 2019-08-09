Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF632886E8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 01:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D7A6EF33;
	Fri,  9 Aug 2019 23:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30D56EF2F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 23:28:23 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([188.99.127.234]) by mail.gmx.com
 (mrgmx102 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0M3MAG-1iE2Cq0n8C-00r3nu for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug
 2019 01:28:20 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2] meson.build: fix intel atomics detection
Date: Sat, 10 Aug 2019 01:28:18 +0200
Message-Id: <20190809232819.22493-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:19bv2Z1SzHazKKrSdQLq9O5SD6yK3okn8g9Gx0N5FxwZEUWvgas
 OeuLm3Rd/dPLAft1l0czBCiWBmoiDlsUxgdKLEz4A9VkV84ehVDRxSgI0aWepEakHmYD8Jp
 vya8rZYyvV3SzZvuk4ynBOljZaU9JVUGGkuOLHXkG5OKFCqSau/pozLq9nk4iwMMAzd/TOr
 jQpqRkh98UaRfT1jk0lsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VnCGO3YYiP0=:Le00RrwveIhrfo00RVSlFO
 f8tm0qaWlTooAySX3a7BRnaT0uSu2znqQsPTE5ryK8sgbKTvwQmsBcFSR1jRsZDV2IK6u2Mho
 n00w2gUjfVoOZlVfBzaIiw5ebEPS40GSCcQNV+hekB3ufGFn7fcrrlJxhN0aZmB7SN1zWvW3V
 Y7/6o8rrgGGnCmOcUV+bS5bLUCW3vdhMS8/tkac9JVQva3y2jzsLTbfyM3Sk+gj0MdWdHQ8QB
 vykN+s9llA2F8dsdUMNsRBr6xw/Ymj2mSFo3XZWrCm36kzNS6bDXRuyGiCmg7z3E8uxqcuWL8
 MZmjLDO2duyKdEdGxWD0WK+/DmwpE19biM6wyLCZv+vuak9+Xj6w07Ico8dJAFJAavjtPidvt
 ut1qJhUSKpb4UGmTW8KUbMybroyvaNaJElgwRUmkelqdsyF8TN/4CeNjvHBh6TGpBQSLebhuq
 KFL+/nTxqVTIrQDhm0G7H5J3+8JFQOtqM/+MKh3AJ/cryNcXB3gSAg2cOvrVXpunmQZqHeTAH
 h+AZjB6+lFhehi7Kk1shx9d7RNc+iz1MgSjM1qh+xB6Wg19B3IewXGynCf4BBzsF/7EK99B+4
 RovhJCU98BUXQIo2+k/XDGApngkiNAPZxtwxYbjHNxbe9mN+aBRtX+GRvYZPM537v0lVmAasK
 dOfMXiM0shIzxAcE6VDvvoz1guH1ONvllOB5Tq1nrlk30bt2+DFRF83F5aBjXtx3bIzFYfxGI
 oFeQ5iyNTRbLUrP99NeTYNKP886mQRUE1JGqRAxEvC3LjDx+2aJ8KbMOkA/SNWZAux4mEsoby
 bgqc/t4QF3OUN1+28UlbqDhiR8v5MdRXeBTvcO2561jBt3FkwmYawuwOeXVnMJGh2QM86b0Gz
 XN1PPMdFZ9Ig+tk7OP+tdeXztx+aVuHzHo1YLMSrzdlsdfWXNTFTgmmr+MGd/NtAcMIz6OMXq
 XOyw6aGKKilMMmp1UNxnvvUwga1XKxIEZNQxCUBaMvqlcYGa3w2SlP7bgIdGO1e5Ulaa+UYPo
 hvh/mdI+J2CkIWvzy/0H62iCURqXi+4yILjH9BaNiMukBWsaWd0MZGVwaOizFjCAzFyxEv2LL
 JLQ1IxR4ATw/zfqovCnQU7mAItx0zwUragiFb/YafxTARy9yORstg3a8A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1565393300;
 bh=PzSrYOZzN22g4TdjgEyhxj+qlFWLojhioLITmWvVGyE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=WGo0XnKB32VbwDGsjaxZFOV3QSGufdc/Z2vZkn6/SS7d9rWdaCohX5Slz7FGY1pOi
 tuNWu9uq6HMMYFqg8lNU9kHaF++ct8LWWVU6/VvqbbbvHRFR33VXYq44eRRoNOnct1
 vKBFmkuUGWMx2fqXK9T1iXxYio4dgbhZ6uyRKZRY=
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

VXNlIHRoZSBzdHJvbmdlciBjb21waWxlci5saW5rKCkgdGVzdCAoaW5zdGVhZCBvZiB0aGUgd2Vh
a2VyCmNvbXBpbGVyLmNvbXBpbGUoKSkgdG8gZml4IHRoZSBpbnRlbCBhdG9taWNzIGRldGVjdGlv
bi4KCkZpeGVzIGZhbHNlIHBvc2l0aXZlIGluIGNhc2Ugb2Ygc3BhcmMgY29tcGlsZSAoYnVpbGRy
b290IHRvb2xjaGFpbikuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0
QGdteC5uZXQ+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gbm8gY2hhbmdlcywgcmVzZW5kIChv
bGQgc3VibWlzc2lvbiBbMV0pCgogIFsxXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1KdWx5LzE4Mzg4NS5odG1sCi0tLQogbWVzb24uYnVpbGQg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5kZXggZTI5MjU1NC4uMDg3
NzgwYiAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTQ5LDkg
KzQ5LDEwIEBAIGludGVsX2F0b21pY3MgPSBmYWxzZQogbGliX2F0b21pY3MgPSBmYWxzZQoKIGRl
cF9hdG9taWNfb3BzID0gZGVwZW5kZW5jeSgnYXRvbWljX29wcycsIHJlcXVpcmVkIDogZmFsc2Up
Ci1pZiBjYy5jb21waWxlcygnJycKK2lmIGNjLmxpbmtzKCcnJwogICAgIGludCBhdG9taWNfYWRk
KGludCAqaSkgeyByZXR1cm4gX19zeW5jX2FkZF9hbmRfZmV0Y2ggKGksIDEpOyB9CiAgICAgaW50
IGF0b21pY19jbXB4Y2hnKGludCAqaSwgaW50IGosIGludCBrKSB7IHJldHVybiBfX3N5bmNfdmFs
X2NvbXBhcmVfYW5kX3N3YXAgKGksIGosIGspOyB9CisgICAgaW50IG1haW4oKSB7IH0KICAgICAn
JycsCiAgICAgbmFtZSA6ICdJbnRlbCBBdG9taWNzJykKICAgaW50ZWxfYXRvbWljcyA9IHRydWUK
LS0KMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
