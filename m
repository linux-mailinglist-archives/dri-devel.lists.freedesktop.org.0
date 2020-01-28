Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803B14B4AC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 14:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FA06E05C;
	Tue, 28 Jan 2020 13:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320F56E05C;
 Tue, 28 Jan 2020 13:07:25 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MnWx3-1jOJIF2sWT-00jah4; Tue, 28 Jan 2020 14:07:14 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] Revert "drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC"
Date: Tue, 28 Jan 2020 14:06:13 +0100
Message-Id: <20200128130710.4154835-1-arnd@arndb.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:jR2l1s+z5kbbpiXAPBoXFcIwZf1d5sfaUoAveWe7BXOdoM8VEhw
 MgtLRbEvnZniSJSRMdkKtieu1Wa6lGggNCLlnV0B10jUud1mKAT2sWe+un4QvDtf5O/YXnH
 ZaEARxTnOTBVv034KYNb033JOFXCxahqjlumSvV8INXhz+AWKX2L/FTQZJ3S2GqlJhR8T0z
 2SjvhbmJ66CsQEqxGKdxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gq/3jwAUlUk=:AkxXnmXnBxr4cx1PP6b973
 oECszSyCfZmYjFBZJoggzjJoUCLupIKeZSPfvp3g1cIlqkJ6AecfG35as/vxqLhYd5RTDj8pW
 z7qEp6rZNPfgcnteY5Koqf0zkh3hDXGuSywOz7BHNXsCyTLp+deCsM6MBUb9KE3vbE8w+wq+B
 nByeZe2bw/O2mtsPitLFsyaqUBn7duQKwFdacxTiZw1e+T9jZoBo8/XkVwVYsMEv0vfCXq8et
 54SHmxnWwprOoim8Y9HZiQH4XZV7fPDSE1wvZzkcsQv7ZqVVtj6doUCZh1JtCTvxe8JWeHrN/
 l0zc+nI3cIrPzuAi9eunD/bQDo4JMC4ZJZ06PllSuz7GsukujqCZ+8KLsisSvJT27yPJ2Fmm7
 dhdyM4sP/IwHr5Jd8AyFb3Hb/3tv1wsjndnUCCdB71E2aT/MgOrWTa2JfXz/x1X6GCMQoCN1G
 unZI+lEmQmVLfCip46hzCS6Z2EXChR/+p08d5CVQnl6AYBfd3SaegDjuqXsZDu+ygdNUEinEb
 u6FR5gwEkRshKdkKYqDJCVXV0JM1hGKPxiId5H9CTRPYQWr6d27WbUtC/N1oIMOKKp04GOaLN
 HmHw9lWM4h3K5PjgA0OUgpA/avrMED8JuzkeX+Fpa6uFqpaHk9eY8wTUwRlXDuLZe3v0KVIfG
 Gri+3+0y2pMnHdaU+00hEw2O8i5FKEWp7Al0Og1E7AH0r/pL1H5LTBmJAULbaETlCIILGnTTm
 mzMrK7tqEzN17l0yIIP2ZfcZFejU+E9E9zFfFzUep01XCMqbHUJFUmkOwhalysFNkG4LzfdFD
 mxpLhu4wKFPy+NB0mzqhfLLZIqvQMXSivUv+4jrqitLSyxgqjs=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAxNzJhMjE2ZmYzMzRhZDg2OWIwZDc0MTg4YTcwNzYzZTQxNjdm
ZDllLgoKR3VpZG8gR8O8bnRoZXIgcmVwb3J0ZWQgaXNzdWVzIHdpdGggdGhpcyBwYXRjaCB0aGF0
IGJyb2tlIGV4aXN0aW5nCnVzZXIgc3BhY2UuIExldCdzIHJldmVydCBpdCBmb3Igbm93IGFuZCBm
aXggaXQgcHJvcGVybHkgbGF0ZXIgb24uCgpMaW5rOiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzExMjkxMDg5LwpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwMTIx
MTE0NTUzLjI2Njc1NTYtMS1hcm5kQGFybmRiLmRlLwpDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBz
aWd4Y3B1Lm9yZz4KU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
LS0tCkkndmUgYWRkZWQgdGhpcyB0byBteSBicmFuY2ggZm9yIGluY2x1c2lvbiBpbiB2NS42IHRv
IGF2b2lkIHRoZQpyZWdyZXNzaW9uLgoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
ZHJ2LmMgfCA5IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMKaW5kZXggM2ViMGY5MjIzYmVhLi5hYzI2YzA4
NGYzMGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwpAQCAtMjkyLDkgKzI5
Miw2IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9pb2N0bF9nZW1fY3B1X3ByZXAoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpZiAoYXJncy0+b3AgJiB+KEVUTkFfUFJFUF9SRUFE
IHwgRVROQV9QUkVQX1dSSVRFIHwgRVROQV9QUkVQX05PU1lOQykpCiAJCXJldHVybiAtRUlOVkFM
OwogCi0JaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykKLQkJcmV0dXJu
IC1FSU5WQUw7Ci0KIAlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFu
ZGxlKTsKIAlpZiAoIW9iaikKIAkJcmV0dXJuIC1FTk9FTlQ7CkBAIC0zNTgsOSArMzU1LDYgQEAg
c3RhdGljIGludCBldG5hdml2X2lvY3RsX3dhaXRfZmVuY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwKIAlpZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykp
CiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNf
UEVSX1NFQykKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlpZiAoYXJncy0+cGlwZSA+PSBFVE5BX01B
WF9QSVBFUykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTQxMiw5ICs0MDYsNiBAQCBzdGF0aWMg
aW50IGV0bmF2aXZfaW9jdGxfZ2VtX3dhaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKIAlpZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykpCiAJCXJldHVy
biAtRUlOVkFMOwogCi0JaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykK
LQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlpZiAoYXJncy0+cGlwZSA+PSBFVE5BX01BWF9QSVBFUykK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
