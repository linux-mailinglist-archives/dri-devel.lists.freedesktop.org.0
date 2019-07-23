Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43171F29
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2109B6E379;
	Tue, 23 Jul 2019 18:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jul 2019 15:32:05 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07CC6E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:32:05 +0000 (UTC)
Received: from linux-e202.suse.de ([195.135.221.2]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M8hR1-1hlHjw0RF3-004hcK; Tue, 23 Jul 2019 17:19:09 +0200
From: Fabian Vogt <fabian@ritter-vogt.de>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
Date: Tue, 23 Jul 2019 17:19:03 +0200
Message-ID: <1709073.y2qmsckc0Q@linux-e202.suse.de>
In-Reply-To: <20190723133755.22677-2-linus.walleij@linaro.org>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-2-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qbbt6grsJIsyGherZqvzoLnN+i3Fk+bBk8p3cfTPzw6k18vjWPR
 YThHS4X6qHTBNgDADWo1YxJa7eLwRzkQhdU/JW3sfVwpe7rtB59jcoSZ7Pm1RWUDC31YHIh
 fvjE80dskaFFhtTVhV846Xj6CUv4J2u4UUlfWODbOSQqRxgng7iqVO5rvlQmPhGWqxfvxk1
 YJJ0NomiTWSyJFMgDXrdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZClphUkrZ04=:KN7ks0cnwkAs5eTXcQQwd5
 OQ6H7Osuuxr8rA+U+C6ZXL3hKGPSHDtRMD4/iEK4GqNuR+w3EC/mPkkTBKGZXAOYPFkOvzQs/
 M+zRthyobzTGo4zHM+wIRCl0WdtntzXWqbwtggwm44Ovci/0HTnJ9aCyOlaqWET0/oY/BTbvM
 WnD3RMUr43Wp0SrgHDDZ4KKbScr03JjVRPAgDCnuNnqpp73Udnp22ooxOvsgI2MRIG1Tg+4VU
 vT42Y1qF4Hz0XGBYW2q+AF+k8tynsnu0lE89mOsU4L3riiwNB3QHChSZi2E8M1p9RMBzq4KrP
 3xTsRe3wBrJ5BKer6EsJmzXen+zTMep5g4sJECNIAoozoQ8YObmGBS26guqYYIbnOThcs8L3g
 I6rRwH1oGQsUEggC98AWXhvdZWK7Wv3BfiY9HkKPn7zoMcc4f+LHFl/VJuEdobL5IBzT8ZK0N
 MjiC3qNwC0tChgL9a5Q41JlvIHDwR6LqGAH5m9ZZsbCAq5yt1nYjQPBuIL4/XtD7UeeJfXX00
 +EXGzdMfhnJv9AONvogV7Dti9HSwSzyAzTziCI86jt5AfkgDL7IS2EedTw82H2tSzLKxnvOXm
 8YMwgTZHt/1+k7K8NMBdLM2JsMK8aXNWUO3+n2vSK3N5ABCwX+wh6G6Xk89/UBJexV5MdF2vL
 9qswJtn80wlmpXV06+YEqeap7kO/FBOwyx0eBSHjy4SBSdglwWblYC5hknSB1QTAzk/UpD3Ao
 yt8CCH2lt7+Y02WKimNbXxyisxBKsuR204yexw8qSTuGONvpTvHSV1Wg+Mo=
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
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
Cc: Daniel Tang <dt.tangr@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpJIGdhdmUgdGhlIHNlcmllcyBhIHRyeSAodmlydHVhbCBDWCBhbmQgVFAgc28gZmFyLCB3
aWxsIGRvIG9uIGEgcmVhbCBDWCBsYXRlcik6Ck9PUFMgd2l0aCBhIG51bGxwdHIgZGVyZWYgZHVy
aW5nIHByb2JlLgpUaGlzIGRpZmYgd2hpY2gganVzdCBtb3ZlcyBzb21lIGxpbmVzIGFyb3VuZCBm
aXhlcyB0aGF0IGFuZCB0aGUgTENEIGFwcGVhcnMgdG8Kd29yayBwcm9wZXJseS4KCk9uY2UgSSB2
ZXJpZmllZCB0aGUgMjRiaXQgZGVwdGggYW5kIGNsb2NrIHNwZWVkIGNvbmZpZyBvbiBIVyBhcyB3
ZWxsLCBJIGNhbgpnaXZlIHlvdSBteSBUZXN0ZWQtYnksIG9yIHdvdWxkIHlvdSBwcmVmZXIgdGhh
dCBJIHJlc3VibWl0IHlvdXIgc2VyaWVzIHdpdGggdGhlCmZpeCBiZWxvdz8KClRoYW5rcywKRmFi
aWFuCgotLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCmluZGV4IDU4N2I0ZDE0
OGMxOC4uYmQ4NGQ3YTVhMGY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwx
MTFfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMK
QEAgLTEzMywxMCArMTMzLDYgQEAgc3RhdGljIHZvaWQgcGwxMTFfZGlzcGxheV9lbmFibGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCXUzMiBjcGwsIHRpbTI7CiAJaW50
IHJldDsKIAotCWlmIChjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5udW1fYnVzX2Zvcm1hdHMgPT0g
MSAmJgotCSAgICBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5idXNfZm9ybWF0c1swXSA9PSBNRURJ
QV9CVVNfRk1UX1k4XzFYOCkKLQkJZ3JheXNjYWxlID0gdHJ1ZTsKLQogCXJldCA9IGNsa19zZXRf
cmF0ZShwcml2LT5jbGssIG1vZGUtPmNsb2NrICogMTAwMCk7CiAJaWYgKHJldCkgewogCQlkZXZf
ZXJyKGRybS0+ZGV2LApAQCAtMTkxLDYgKzE4NywxMCBAQCBzdGF0aWMgdm9pZCBwbDExMV9kaXNw
bGF5X2VuYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCSAgICBE
Uk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9ORUdFREdFKQogCQkJdGltMiB8PSBUSU0yX0lQQzsK
IAorCQlpZiAoY29ubmVjdG9yLT5kaXNwbGF5X2luZm8ubnVtX2J1c19mb3JtYXRzID09IDEgJiYK
KwkJICAgIGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJ1c19mb3JtYXRzWzBdID09IE1FRElBX0JV
U19GTVRfWThfMVg4KQorCQkJZ3JheXNjYWxlID0gdHJ1ZTsKKwogCQkvKgogCQkgKiBUaGUgQUMg
cGluIGJpYXMgZnJlcXVlbmN5IGlzIHNldCB0byBtYXggY291bnQgd2hlbiB1c2luZwogCQkgKiBn
cmF5c2NhbGUgc28gYXQgbGVhc3Qgb25jZSBpbiBhIHdoaWxlIHdlIHdpbGwgcmV2ZXJzZQoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
