Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1D22E8F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D313E892E7;
	Mon, 20 May 2019 08:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77A892D7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:56 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w33so22505989edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjcLsPlsjE209Q795HkarLAUj4qVY5QZ6l/8BCYUlrU=;
 b=N/Lo2k9xnJMkg+P2GRFmj0Ku+1+raMN0FaEU0JLImE9C/Z8ivO3Ap7UdwS4++gN8eL
 Ccd4AeHKrCfjOypTXhRPtPVWdG2waXaGwsS1yWK8sYmFr4inumBQON3uRwG5RIOO/uyn
 BffYz+mkiNAx81+amIEk5ecMuc21TMUqKhQWHVIafYycloHT81lllpPYtRTGHZenROpH
 VQ/K2p6ywVQmkNnZe7mtp+hmBg+SgipQdgy6yBoPaYZCOhomUM8ypZyEmYNx//JGZU6d
 cccaiSZ61Mb9d5wmlpSBFZzOc1fpCw7AB4kEUfKSuQFSlem/XliXITx7Gwm90xMNL7NM
 VTbw==
X-Gm-Message-State: APjAAAVZNVR0dCPX7l/hfle1Icgaq/F11SWVgBqocPLjyAFrNNKDQT6I
 RHJOyIGtv+YlV79ABvPvWIvOurxeot0=
X-Google-Smtp-Source: APXvYqz6gMGaKw7InNRAYh/FfyGrrZIJCiKRyHBCsxnsADOp8agSMiMyM3ffksqbZU0sp3KMCISA6Q==
X-Received: by 2002:a50:a485:: with SMTP id w5mr28701154edb.78.1558340573984; 
 Mon, 20 May 2019 01:22:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/33] fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
Date: Mon, 20 May 2019 10:22:10 +0200
Message-Id: <20190520082216.26273-28-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjcLsPlsjE209Q795HkarLAUj4qVY5QZ6l/8BCYUlrU=;
 b=F8LgFcDyNEbgtqr09gmvby+A70IlXFhvdKJQGuQU76/bnBUMWD33WhmzV8anIfkPi0
 mD3mM5zUjNuB3gBIUmxNtzHTrHn1ZPQphxPlYuP0ARRH9XNaNMlrnJClFCLSGQcOWL0g
 Q7q+eBvuuOnPjNkfowVtPdLB0l/WbtympM+P0=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVjdXJzaW9uIGJyb2tlbiBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggd2UgY2FuIGRy
b3AgdGhlCkZCSU5GT19NSVNDX1VTRVJFVkVOVCBmbGFnIGFyb3VuZCBjYWxscyB0byBmYl9ibGFu
ayAtIHJlY3Vyc2lvbgpwcmV2ZW50aW9uIHdhcyBpdCdzIG9ubHkgam9iLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2lj
eiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4KQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4KQ2M6ICJNaWNo
YcWCIE1pcm9zxYJhdyIgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgpDYzogUGV0ZXIgUm9zaW4g
PHBlZGFAYXhlbnRpYS5zZT4KQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNv
bT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJjb24uYyAgIHwgNSArKy0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZibWVtLmMgICB8IDMgLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jIHwg
MiAtLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwppbmRleCBmODVkNzk0YTNiZWUuLmMxYTc0NzZlOTgwZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKQEAgLTIzODIsOSArMjM4Miw4IEBAIHN0YXRpYyBp
bnQgZmJjb25fYmxhbmsoc3RydWN0IHZjX2RhdGEgKnZjLCBpbnQgYmxhbmssIGludCBtb2RlX3N3
aXRjaCkKIAkJCWZiY29uX2N1cnNvcih2YywgYmxhbmsgPyBDTV9FUkFTRSA6IENNX0RSQVcpOwog
CQkJb3BzLT5jdXJzb3JfZmxhc2ggPSAoIWJsYW5rKTsKIAotCQkJaWYgKCEoaW5mby0+ZmxhZ3Mg
JiBGQklORk9fTUlTQ19VU0VSRVZFTlQpKQotCQkJCWlmIChmYl9ibGFuayhpbmZvLCBibGFuaykp
Ci0JCQkJCWZiY29uX2dlbmVyaWNfYmxhbmsodmMsIGluZm8sIGJsYW5rKTsKKwkJCWlmIChmYl9i
bGFuayhpbmZvLCBibGFuaykpCisJCQkJZmJjb25fZ2VuZXJpY19ibGFuayh2YywgaW5mbywgYmxh
bmspOwogCQl9CiAKIAkJaWYgKCFibGFuaykKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5kZXgg
N2Y5NWM3ZTgwMTU1Li42NWEwNzVjY2FjNGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBA
IC0xMTk0LDEwICsxMTk0LDcgQEAgc3RhdGljIGxvbmcgZG9fZmJfaW9jdGwoc3RydWN0IGZiX2lu
Zm8gKmluZm8sIHVuc2lnbmVkIGludCBjbWQsCiAJY2FzZSBGQklPQkxBTks6CiAJCWNvbnNvbGVf
bG9jaygpOwogCQlsb2NrX2ZiX2luZm8oaW5mbyk7Ci0JCWluZm8tPmZsYWdzIHw9IEZCSU5GT19N
SVNDX1VTRVJFVkVOVDsKIAkJcmV0ID0gZmJfYmxhbmsoaW5mbywgYXJnKTsKLQkJaW5mby0+Zmxh
Z3MgJj0gfkZCSU5GT19NSVNDX1VTRVJFVkVOVDsKLQogCQkvKiBtaWdodCBhZ2FpbiBjYWxsIGlu
dG8gZmJfYmxhbmsgKi8KIAkJZmJjb25fZmJfYmxhbmtlZChpbmZvLCBhcmcpOwogCQl1bmxvY2tf
ZmJfaW5mbyhpbmZvKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5
c2ZzLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jCmluZGV4IDI1MmQ0ZjUy
ZDJhNS4uODgyYjQ3MWQ2MTllIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJzeXNmcy5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5c2ZzLmMKQEAgLTMx
MCw5ICszMTAsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9ibGFuayhzdHJ1Y3QgZGV2aWNlICpk
ZXZpY2UsCiAKIAlhcmcgPSBzaW1wbGVfc3RydG91bChidWYsICZsYXN0LCAwKTsKIAljb25zb2xl
X2xvY2soKTsKLQlmYl9pbmZvLT5mbGFncyB8PSBGQklORk9fTUlTQ19VU0VSRVZFTlQ7CiAJZXJy
ID0gZmJfYmxhbmsoZmJfaW5mbywgYXJnKTsKLQlmYl9pbmZvLT5mbGFncyAmPSB+RkJJTkZPX01J
U0NfVVNFUkVWRU5UOwogCS8qIG1pZ2h0IGFnYWluIGNhbGwgaW50byBmYl9ibGFuayAqLwogCWZi
Y29uX2ZiX2JsYW5rZWQoZmJfaW5mbywgYXJnKTsKIAljb25zb2xlX3VubG9jaygpOwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
