Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6BABBF6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417EC6E2DA;
	Fri,  6 Sep 2019 15:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863D36E2D8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 15:13:31 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M1aQN-1i8BbC4BGV-0036MD; Fri, 06 Sep 2019 17:13:10 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbdev/sa1100fb: Remove even more dead code
Date: Fri,  6 Sep 2019 17:13:00 +0200
Message-Id: <20190906151307.1127187-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:I6rpL7gCiCsYUlp6FQGbVholK0223LnZWj/mxxwbsh2wD5HPO0Y
 MgVBcVUFLW1dBmdRHCg4XJVf13q17fakxkds8ehcBiRyzFyuzAUTxekyquLBSQNqi73GnuK
 sZ1vOwTnwrszmg9WFHWB62ED8ONFwcWv3gEjZGuyAsYaw9u5kWcwqrkY49JhR48ELym/ShX
 ICERUva5XHQeD9P6oD39g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KwBM+j6sNhA=:23ZTg/QTnEz4XrkmDljwtB
 MBdqWImY+6RZZCY1helSoVRJQZLQtlx5auA31z4ZCkerN2bGZpU1wJzHJyS3eYxPG3j8s1cQD
 fwfXNzSeCwMmx/WjnOUNHcoCdV4+0gdvurE0600hcdX36SAuuDPb39EvvtNkQn9nCUlv3cviV
 o1q20+yQjrQMmNgBeF/vknJhKykartW1vGh8Go+HJMheA49YbbEP5jT2f6IaGHKQ+7wMUB5HD
 EV3WDLIEnB7WWU1NqamJj2LKye4Q64TKReDxf4krxrJ2ACBRdI5TqFGwOhUv3opeDxrJBkun6
 eru8GRr9+SV18fjXTaYfQmDR0HFFn29T6v9fyddJGpyiu8ou2tYFrm7o5mTsjoLa8sV2Ga6eQ
 Eptf6a90avgIWO1+exad423axv8jx+SqSBZgcgsDogwLoyJ8a3N7xN1Z9SWHpQv8HclVxBcyJ
 5+8PcsWHxGtm+TL3aXhbz4yX471/4N7MC93cHi4RRdow7KtK/0ZdOWHJmD8Gwv56KzXcu1XB7
 tohcl6x0mR/GV+7S0mt/6CoKp/jIrBvH7AkMP5pDk7+1e3nLdFyGeHo0Sjk43MsrGjrV35k6W
 90mdy/DlvYvQ031hrGQPt1PDYmTEIDjRj10g+X3euhe7eJoZBgRU+nM1bMSUBZ3nALhfOB23K
 C+DXCT5KqzCzX1msEBVRROa50EsIZdnaGgn2PJVgF7kfbLNhpj9ZpkVoj89XFuguvAriVISPe
 0JB8/EcOeSJWhIzpcv3pe6G3s1sE3xH9t6aNDZWlG2LNjoLkvDpei0IwViHbimKzmXngWNfs8
 e6r4WtvvxVl0i9gPzIkF1IjltyWgQ==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBsb3N0IGl0cyBvbmx5IGNhbGwgc2l0ZSBhcyBwYXJ0IG9mCmVhcmxpZXIg
ZGVhZCBjb2RlIHJlbW92YWwsIHNvIHJlbW92ZSBpdCBhcyB3ZWxsOgoKZHJpdmVycy92aWRlby9m
YmRldi9zYTExMDBmYi5jOjk3NToyMTogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnc2ExMTAwZmJf
bWluX2RtYV9wZXJpb2QnIFstV2Vycm9yLC1XdW51c2VkLWZ1bmN0aW9uXQoKRml4ZXM6IDM5MGU1
ZGUxMTI4NCAoImZiZGV2L3NhMTEwMGZiOiBSZW1vdmUgZGVhZCBjb2RlIikKU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NhMTEwMGZiLmMgfCAxMyAtLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jCmluZGV4IGFlMmJjZmVlMzM4YS4uODFhZDNhYTFj
YTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jCkBAIC05NjcsMTkgKzk2Nyw2IEBAIHN0YXRpYyB2
b2lkIHNhMTEwMGZiX3Rhc2soc3RydWN0IHdvcmtfc3RydWN0ICp3KQogfQogCiAjaWZkZWYgQ09O
RklHX0NQVV9GUkVRCi0vKgotICogQ2FsY3VsYXRlIHRoZSBtaW5pbXVtIERNQSBwZXJpb2Qgb3Zl
ciBhbGwgZGlzcGxheXMgdGhhdCB3ZSBvd24uCi0gKiBUaGlzLCB0b2dldGhlciB3aXRoIHRoZSBT
RFJBTSBiYW5kd2lkdGggZGVmaW5lcyB0aGUgc2xvd2VzdCBDUFUKLSAqIGZyZXF1ZW5jeSB0aGF0
IGNhbiBiZSBzZWxlY3RlZC4KLSAqLwotc3RhdGljIHVuc2lnbmVkIGludCBzYTExMDBmYl9taW5f
ZG1hX3BlcmlvZChzdHJ1Y3Qgc2ExMTAwZmJfaW5mbyAqZmJpKQotewotCS8qCi0JICogRklYTUU6
IHdlIG5lZWQgdG8gdmVyaWZ5IF9hbGxfIGNvbnNvbGVzLgotCSAqLwotCXJldHVybiBzYTExMDBm
Yl9kaXNwbGF5X2RtYV9wZXJpb2QoJmZiaS0+ZmIudmFyKTsKLX0KLQogLyoKICAqIENQVSBjbG9j
ayBzcGVlZCBjaGFuZ2UgaGFuZGxlci4gIFdlIG5lZWQgdG8gYWRqdXN0IHRoZSBMQ0QgdGltaW5n
CiAgKiBwYXJhbWV0ZXJzIHdoZW4gdGhlIENQVSBjbG9jayBpcyBhZGp1c3RlZCBieSB0aGUgcG93
ZXIgbWFuYWdlbWVudAotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
