Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B9FA1FC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 03:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16BE6EC55;
	Wed, 13 Nov 2019 02:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA86EC55
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 02:01:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07CCB2247B;
 Wed, 13 Nov 2019 02:01:04 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 52/68] backlight: lm3639: Unconditionally call
 led_classdev_unregister
Date: Tue, 12 Nov 2019 20:59:16 -0500
Message-Id: <20191113015932.12655-52-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015932.12655-1-sashal@kernel.org>
References: <20191113015932.12655-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573610465;
 bh=julWjBlCYWiwOVW4slF5Jvmglxdu1fcIEx8uEPF98IM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ObDn8rqLneBkJYBleh0/jwlMK17Yo3wPp0F3usIh1vGfLL0v778Aalv4FunyvXE7d
 /wP0/djAx7p7nhAdXjGTBWJQT3P4QJGqIPkrBZacVlSv4vHPFqxIJkq2uBTBmZJTbq
 UkiXPTdTwLiS/uo3WoAIemTDzFT4deRhGiazq95k=
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
Cc: Sasha Levin <sashal@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KClsgVXBz
dHJlYW0gY29tbWl0IDdjZWE2NDVhZTljNWE1NGFhNzkwNGZkZGIyY2RmMjUwYWNkNjNhNmMgXQoK
Q2xhbmcgd2FybnMgdGhhdCB0aGUgYWRkcmVzcyBvZiBhIHBvaW50ZXIgd2lsbCBhbHdheXMgZXZh
bHVhdGVkIGFzIHRydWUKaW4gYSBib29sZWFuIGNvbnRleHQuCgpkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9sbTM2MzlfYmwuYzo0MDM6MTQ6IHdhcm5pbmc6IGFkZHJlc3Mgb2YKJ3BjaGlwLT5jZGV2
X3RvcmNoJyB3aWxsIGFsd2F5cyBldmFsdWF0ZSB0byAndHJ1ZScKWy1XcG9pbnRlci1ib29sLWNv
bnZlcnNpb25dCiAgICAgICAgaWYgKCZwY2hpcC0+Y2Rldl90b3JjaCkKICAgICAgICB+fiAgIH5+
fn5+fn5efn5+fn5+fn5+CmRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzOV9ibC5jOjQwNTox
NDogd2FybmluZzogYWRkcmVzcyBvZgoncGNoaXAtPmNkZXZfZmxhc2gnIHdpbGwgYWx3YXlzIGV2
YWx1YXRlIHRvICd0cnVlJwpbLVdwb2ludGVyLWJvb2wtY29udmVyc2lvbl0KICAgICAgICBpZiAo
JnBjaGlwLT5jZGV2X2ZsYXNoKQogICAgICAgIH5+ICAgfn5+fn5+fl5+fn5+fn5+fn4KMiB3YXJu
aW5ncyBnZW5lcmF0ZWQuCgpUaGVzZSBzdGF0ZW1lbnRzIGhhdmUgYmVlbiBwcmVzZW50IHNpbmNl
IDIwMTIsIGludHJvZHVjZWQgYnkKY29tbWl0IDBmNTk4NThkNTExOSAoImJhY2tsaWdodDogYWRk
IG5ldyBsbTM2MzkgYmFja2xpZ2h0CmRyaXZlciIpLiBHaXZlbiB0aGF0IHRoZXkgaGF2ZSBiZWVu
IGNhbGxlZCB1bmNvbmRpdGlvbmFsbHkgc2luY2UKdGhlbiBwcmVzdW1hYmx5IHdpdGhvdXQgYW55
IGlzc3VlcywgcmVtb3ZpbmcgdGhlIGFsd2F5cyB0cnVlIGlmCnN0YXRlbWVudHMgdG8gZml4IHRo
ZSB3YXJuaW5ncyB3aXRob3V0IGFueSByZWFsIHdvcmxkIGNoYW5nZXMuCgpMaW5rOiBodHRwczov
L2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xMTkKU2lnbmVkLW9mZi1i
eTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KUmV2aWV3ZWQt
Ynk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+ClNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sbTM2MzlfYmwuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xt
MzYzOV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjM5X2JsLmMKaW5kZXggY2Q1
MGRmNTgwN2VhZC4uMDg2NjExYzdiYzAzYyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvbG0zNjM5X2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjM5X2Js
LmMKQEAgLTQwMCwxMCArNDAwLDggQEAgc3RhdGljIGludCBsbTM2MzlfcmVtb3ZlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCiAKIAlyZWdtYXBfd3JpdGUocGNoaXAtPnJlZ21hcCwgUkVHX0VO
QUJMRSwgMHgwMCk7CiAKLQlpZiAoJnBjaGlwLT5jZGV2X3RvcmNoKQotCQlsZWRfY2xhc3NkZXZf
dW5yZWdpc3RlcigmcGNoaXAtPmNkZXZfdG9yY2gpOwotCWlmICgmcGNoaXAtPmNkZXZfZmxhc2gp
Ci0JCWxlZF9jbGFzc2Rldl91bnJlZ2lzdGVyKCZwY2hpcC0+Y2Rldl9mbGFzaCk7CisJbGVkX2Ns
YXNzZGV2X3VucmVnaXN0ZXIoJnBjaGlwLT5jZGV2X3RvcmNoKTsKKwlsZWRfY2xhc3NkZXZfdW5y
ZWdpc3RlcigmcGNoaXAtPmNkZXZfZmxhc2gpOwogCWlmIChwY2hpcC0+YmxlZCkKIAkJZGV2aWNl
X3JlbW92ZV9maWxlKCYocGNoaXAtPmJsZWQtPmRldiksICZkZXZfYXR0cl9ibGVkX21vZGUpOwog
CXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
