Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE2B8BED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E006F586;
	Fri, 20 Sep 2019 07:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016446F975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919142328euoutp0176c71bdb1ee0e81851b11ae0743925d6~F3Plih1i52191721917euoutp01L
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190919142328euoutp0176c71bdb1ee0e81851b11ae0743925d6~F3Plih1i52191721917euoutp01L
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190919142328eucas1p242dc467060e42704b69ed7f086bbb466~F3Pk2708H3081730817eucas1p2s;
 Thu, 19 Sep 2019 14:23:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 51.69.04374.F5F838D5; Thu, 19
 Sep 2019 15:23:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142327eucas1p183470eede07b50c1e3acda58f2af1eba~F3PkEGT6Y0295602956eucas1p1S;
 Thu, 19 Sep 2019 14:23:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190919142326eusmtrp164d5d419c24ac75e6ccfb6e7a3e4ca01~F3Pju1HxD0555105551eusmtrp1b;
 Thu, 19 Sep 2019 14:23:26 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-06-5d838f5f5030
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 53.1F.04166.E5F838D5; Thu, 19
 Sep 2019 15:23:26 +0100 (BST)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142326eusmtip10794ddcef50859ab7030e7943910eeb3~F3Pi4fy-a3274232742eusmtip1p;
 Thu, 19 Sep 2019 14:23:25 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 07/11] interconnect: Relax condition in
 apply_constraints()
Date: Thu, 19 Sep 2019 16:22:32 +0200
Message-Id: <20190919142236.4071-8-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUyMcRzA/Z63e665PHeX9V2Muo2NTcnrzxjCeOav2vpLwqlnV9Od3KMS
 f0iJIsnd0vWily1JadzpLC055zgvy7myQqUMM2+hLpt3XU/ov8/35fP7fr/bjyVVz+gQNtmw
 VzAatCkaJoC6cvurZ8H2kznxC4c8kdh52y7DA5W5CFstF2nc43tN4yrXAxo/Gv3I4JJrNgab
 Booo7PFckuH6/s80tr3opnFXawWDR064ELZ42gnc5OqX4d5D9Qy2mN8wa5W8rSGf4fu62xh+
 4Lib4C/XHuStQy0Ef2OojeALmxsQP2KbFc1uCViVKKQkpwvGiNU7ApLqb5ynU7+y+6y9ZUQW
 qpMdQ3IWuCXgrLlF+1nF1SMY/Bx9DAWMsQ9BfrdFJgUjCNoch+m/Rof1PS0VziG4l/uE/Kc0
 F3dS/i6GiwJT8eC4HsS5EJirP1L+gORqCSgs94wpLKvmYqEmP9gvUNwcyM/zIj8rOAxeexOS
 xs2GxksO0s9ybgX42qsoqUcJd0tfjjM51pNjLx/fArhcFn58v0NI8gZwvGsnJVbDW3fzxNUz
 4b65gJJYhFdXB2hJzkJgq3NNCCvhpttL+xcluXlwsTVCSkfBBdt5wp8GLhAef1BKOwSC6UoJ
 KaUVkHdEJaEGWksDJREgu7F74m0eOiz9ZBEKK5t0TNmkY8r+j61GZAMKFtJEvU4QFxuEjHBR
 qxfTDLrwhN16Gxr7dfd/uUdbUPuPnU7EsUgzVRGakROvorXpYqbeiYAlNUGKiqXZ8SpFojZz
 v2Dcvd2YliKITjSDpTTBigNTBuNUnE67V9glCKmC8W+VYOUhWWhbUtSydHVP7KKCCkdcj9Pj
 mu9+WLLpi3IOzptuT35auk4p937riswo3Dh8pjchFhc8PGka/mmN7pC99a5PnNnsDPUlx5r3
 NM1K/9ZoCdUXdyxWBS2/HvpcPe3U3K47dZ8qz3pqj8adztL9Nses6TwaY9hSvLnPsFUpP7To
 Z1hd0BENJSZpI+eTRlH7ByHvRX9xAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7px/c2xBi/mG1scOraV3eL+vFZG
 i40z1rNaXP/ynNVi/pFzrBZXvr5ns5i+dxObxaT7E1gszp/fwG6x4u5HVotNj6+xWlzeNYfN
 4nPvEUaLGef3MVmsPXKX3eJ24wo2ixmTX7I5CHpsWtXJ5nHn2h42j/vdx5k8Ni+p99j4bgeT
 x8F3e5g8+rasYvT4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
 ziYlNSezLLVI3y5BL2PFwZWsBT85KjbensXUwLiMvYuRk0NCwETi7MY3rF2MXBxCAksZJe48
 PcIMkZCQ+Lj+BiuELSzx51oXG0TRJ0aJv3famUASbAKOEpOmPmAHSYgInGKU2Lr8HFgVs8AG
 JonlT1+CtQsLBEkcv3sezGYRUJXo7LjICGLzClhIXNy6lhFihbzE6g0HwFZzClhKfNk3nwXE
 FgKqmft4LlS9oMTJmU+A4hxAC9Ql1s8TAgkzA7U2b53NPIFRcBaSqlkIVbOQVC1gZF7FKJJa
 WpybnltsqFecmFtcmpeul5yfu4kRGMXbjv3cvIPx0sbgQ4wCHIxKPLwK5c2xQqyJZcWVuYcY
 JTiYlUR455g2xQrxpiRWVqUW5ccXleakFh9iNAV6bSKzlGhyPjDB5JXEG5oamltYGpobmxub
 WSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYJwpV9W1y7wkYfp8hfiW078fvuljPDbRZ8W+
 +W1T2wJ6r/Iuz3DieZfOe/CN8xomk8DDF2Z6JLUf4T9dcVn/j5Aa65GVl/+JLl+1J2WvnPTp
 e8vOH331T31yReisO2n77MwOh+ZHPeBmT3LVeZPkc35bjf0pJ8bfUawtN83X9fn4Mtl853vq
 X6fEUpyRaKjFXFScCADxKStz+AIAAA==
X-CMS-MailID: 20190919142327eucas1p183470eede07b50c1e3acda58f2af1eba
X-Msg-Generator: CA
X-RootMTR: 20190919142327eucas1p183470eede07b50c1e3acda58f2af1eba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190919142327eucas1p183470eede07b50c1e3acda58f2af1eba
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142327eucas1p183470eede07b50c1e3acda58f2af1eba@eucas1p1.samsung.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568903008;
 bh=+PvoXwVxpcTid0j87bA2tcY3zWf42daZc3R0G6YTUlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O0nxRAO4tUYx/UWqvgBfue3TX0tKH1+XYs+SbuQaVSwJrmVLxETapr3zaXoKXXP9X
 Bf9ijyrcTjBNT8x+2W7LJuYzF/5iltC/BpqqVcxxpynER6OD8gWOT6UiaZqERSIkFd
 O+FDZUCBswhEpUviySQlD7VhJAjmxDaqGvz3ZjME=
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
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>,
 b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+CgpUaGUg
ZXh5bm9zLWJ1cyBkZXZmcmVxIGRyaXZlciBpcyBleHRlbmRlZCB3aXRoIGludGVyY29ubmVjdCBm
dW5jdGlvbmFsaXR5CmJ5IGEgc3Vic2VxdWVudCBwYXRjaC4gVGhpcyBwYXRjaCByZW1vdmVzIGEg
Y2hlY2sgZnJvbSB0aGUgaW50ZXJjb25uZWN0CmZyYW1ld29yayB0aGF0IHByZXZlbnRzIGludGVy
Y29ubmVjdCBmcm9tIHdvcmtpbmcgb24gZXh5bm9zLWJ1cywgaW4gd2hpY2gKZXZlcnkgYnVzIGlz
IGEgc2VwYXJhdGUgaW50ZXJjb25uZWN0IHByb3ZpZGVyLgoKU2lnbmVkLW9mZi1ieTogQXJ0dXIg
xZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9pbnRl
cmNvbm5lY3QvY29yZS5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW50ZXJjb25uZWN0L2Nv
cmUuYyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwppbmRleCBmMzU3YzNhNzg4NTguLmU4
MjQzNjY1ZDViYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCisrKyBi
L2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwpAQCAtMjI0LDExICsyMjQsOCBAQCBzdGF0aWMg
aW50IGFwcGx5X2NvbnN0cmFpbnRzKHN0cnVjdCBpY2NfcGF0aCAqcGF0aCkKIAlmb3IgKGkgPSAw
OyBpIDwgcGF0aC0+bnVtX25vZGVzOyBpKyspIHsKIAkJbmV4dCA9IHBhdGgtPnJlcXNbaV0ubm9k
ZTsKIAotCQkvKgotCQkgKiBCb3RoIGVuZHBvaW50cyBzaG91bGQgYmUgdmFsaWQgbWFzdGVyLXNs
YXZlIHBhaXJzIG9mIHRoZQotCQkgKiBzYW1lIGludGVyY29ubmVjdCBwcm92aWRlciB0aGF0IHdp
bGwgYmUgY29uZmlndXJlZC4KLQkJICovCi0JCWlmICghcHJldiB8fCBuZXh0LT5wcm92aWRlciAh
PSBwcmV2LT5wcm92aWRlcikgeworCQkvKiBib3RoIGVuZHBvaW50cyBzaG91bGQgYmUgdmFsaWQg
bWFzdGVyLXNsYXZlIHBhaXJzICovCisJCWlmICghcHJldikgewogCQkJcHJldiA9IG5leHQ7CiAJ
CQljb250aW51ZTsKIAkJfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
