Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDB1E83DA
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 18:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536A46E94C;
	Fri, 29 May 2020 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3B6E94C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:38:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200529163221euoutp01fc4f29405a8f1ff519b3a2029ed06a03~TjNVLEva41080910809euoutp01I
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:32:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200529163221euoutp01fc4f29405a8f1ff519b3a2029ed06a03~TjNVLEva41080910809euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590769941;
 bh=ei9TQt3JZw0Vz/vutdWoNfjAEdvVJ/C/2sBby6n9XKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GwEU21DR8XVEvdl5zTovIZmKiaqHIKctu9I8lpE8/U+luLp942EI+YR4je47ewp8u
 sgtVdRbUTDAC3ympqfIYJwxFqaa4Pib+crNsxkrbYpvCYWE9vSF5zg8pJfSBjDZ+Pr
 fZFNdBm3iooQl3PYScNoiHSgKatV81d5SnWbjr+U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200529163219eucas1p14fda733b31a5459c1fbe762a0ad4d8b0~TjNUGl2k30471904719eucas1p1I;
 Fri, 29 May 2020 16:32:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 76.5D.61286.31931DE5; Fri, 29
 May 2020 17:32:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e~TjNTwJf6B1986719867eucas1p2V;
 Fri, 29 May 2020 16:32:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200529163219eusmtrp2e5592a06f3652e558393e729fa4698ea~TjNTvdO-o0721307213eusmtrp2g;
 Fri, 29 May 2020 16:32:19 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-4a-5ed139138966
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.DA.08375.31931DE5; Fri, 29
 May 2020 17:32:19 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200529163218eusmtip1f49edc74db9f603abdadde71a0e8d11b~TjNTBHTL_1044210442eusmtip1A;
 Fri, 29 May 2020 16:32:18 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [RFC PATCH v5 1/6] dt-bindings: exynos-bus: Add documentation for
 interconnect properties
Date: Fri, 29 May 2020 18:31:55 +0200
Message-Id: <20200529163200.18031-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529163200.18031-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djPc7rClhfjDI6vNba4P6+V0WLjjPWs
 Fte/PGe1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2i02Pr7FaXN41h81ixvl9TBZrj9xlt7jduILN
 4vCbdlaLGZNfsjnweWxa1cnmcefaHjaP+93HmTw2L6n36NuyitHj8ya5ALYoLpuU1JzMstQi
 fbsErozbE9oZC+6KVPQ8fc/UwLhSsIuRk0NCwERi9db9zF2MXBxCAisYJVZPvckE4XxhlGh6
 MIMFwvnMKHGpexMTTMv2Z7uhWpYzSmx5eIURruXTg2vMIFVsAoYSvUf7GEFsEQEXiban88BG
 MQvsYZLYN/sdkMPBISyQIvG6UwikhkVAVWLJwtNg9bwC1hKnrv9mhdgmL7F6wwGwmZwCNhLd
 f2YwQ9QISpyc+YQFxGYGqmneOhvsIgmBe+wSB06/Z4RodpG43j8X6mxhiVfHt7BD2DIS/3fO
 Z4JoaGaU6Nl9mx3CmcAocf/4Aqhua4k7536xgVzKLKApsX6XPkTYUeLJjXVMIGEJAT6JG28F
 IY7gk5i0bTozRJhXoqNNCKJaReL3qulQJ0hJdD/5zwJhe0g8eTSBfQKj4iwk78xC8s4shL0L
 GJlXMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBCav0/+Of9rB+PVS0iFGAQ5GJR7eCq2L
 cUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6Yklq
 dmpqQWoRTJaJg1OqgTF0zbn5zQWCHy24DzbP4Vwg86HnhZf89A9njqatM73QsPQXy/yLs128
 7L7fdrgt4vogyb9rb6TjibO3ftWsrtr/69hk/i/34hdtWJOyqVzxqvCH+KNCjTMaE8+cufXy
 32W9gIR7N1OUvff0HC6bybNgbs2JPPfn6Zf/CcXOan6uv+txmne2ZvE6JZbijERDLeai4kQA
 qYQo6loDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7rClhfjDBZ1K1jcn9fKaLFxxnpW
 i+tfnrNaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xabH11gtLu+aw2Yx4/w+Jou1R+6yW9xuXMFm
 cfhNO6vFjMkv2Rz4PDat6mTzuHNtD5vH/e7jTB6bl9R79G1ZxejxeZNcAFuUnk1RfmlJqkJG
 fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbtCe2MBXdFKnqevmdq
 YFwp2MXIySEhYCKx/dlu5i5GLg4hgaWMEktbDrB0MXIAJaQk5rcoQdQIS/y51sUGUfOJUeJj
 50smkASbgKFE79E+RhBbRMBD4lTrWlaQImaBE0wST3o3soEkhAWSJNb3fmQGsVkEVCWWLDwN
 1sArYC1x6vpvVogN8hKrNxwAq+EUsJHo/jMDzBYCqml7PIsVol5Q4uTMJ2DHMQuoS6yfJwQS
 ZgZqbd46m3kCo+AsJFWzEKpmIalawMi8ilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzAetx37
 uXkH46WNwYcYBTgYlXh4L+hcjBNiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrx
 IUZToNcmMkuJJucDU0VeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5O
 qQbGos0bLJgVpF5PvSGvPftO+PUyX51LQoyMUt3JDXcZa5/MdWb1uBcc4dz6szf/0PTIw77h
 L8TSZzEKu9449PbPocj30Ya1C4456KnWLTmg/4FJSetB+d1ofy/b3bFPtxSdXBSy56Xn1I2P
 MvMMjVfVyy+7vM3msdk9y/+mBvp3Kz6v+fxzx0N/JZbijERDLeai4kQA4JE/590CAAA=
X-CMS-MailID: 20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e
X-Msg-Generator: CA
X-RootMTR: 20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e@eucas1p2.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sw0312.kim@samsung.com, a.swigon@samsung.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIG5ldyBvcHRpb25hbCBwcm9wZXJ0aWVzIGluIHRoZSBleHlu
b3MgYnVzIG5vZGVzOgpzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQsICNpbnRlcmNvbm5lY3Qt
Y2VsbHMuClRoZXNlIHByb3BlcnRpZXMgYWxsb3cgdG8gc3BlY2lmeSB0aGUgU29DIGludGVyY29u
bmVjdCBzdHJ1Y3R1cmUgd2hpY2gKdGhlbiBhbGxvd3MgdGhlIGludGVyY29ubmVjdCBjb25zdW1l
ciBkZXZpY2VzIHRvIHJlcXVlc3Qgc3BlY2lmaWMKYmFuZHdpZHRoIHJlcXVpcmVtZW50cy4KClNp
Z25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KU2lnbmVk
LW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgotLS0K
Q2hhbmdlcyBmb3IgdjU6CiAtIGV4eW5vcyxpbnRlcmNvbm5lY3QtcGFyZW50LW5vZGUgcmVuYW1l
ZCB0byBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQKLS0tCiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dCB8IDE1ICsrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEvZXh5bm9z
LWJ1cy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlu
b3MtYnVzLnR4dAppbmRleCBlNzFmNzUyLi5lMGQyZGFhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dApAQCAt
NTEsNiArNTEsMTEgQEAgT3B0aW9uYWwgcHJvcGVydGllcyBvbmx5IGZvciBwYXJlbnQgYnVzIGRl
dmljZToKIC0gZXh5bm9zLHNhdHVyYXRpb24tcmF0aW86IHRoZSBwZXJjZW50YWdlIHZhbHVlIHdo
aWNoIGlzIHVzZWQgdG8gY2FsaWJyYXRlCiAJCQl0aGUgcGVyZm9ybWFuY2UgY291bnQgYWdhaW5z
dCB0b3RhbCBjeWNsZSBjb3VudC4KCitPcHRpb25hbCBwcm9wZXJ0aWVzIGZvciBpbnRlcmNvbm5l
Y3QgZnVuY3Rpb25hbGl0eSAoUW9TIGZyZXF1ZW5jeSBjb25zdHJhaW50cyk6CistIHNhbXN1bmcs
aW50ZXJjb25uZWN0LXBhcmVudDogcGhhbmRsZSB0byB0aGUgcGFyZW50IGludGVyY29ubmVjdCBu
b2RlOyBmb3IKKyAgcGFzc2l2ZSBkZXZpY2VzIHNob3VsZCBwb2ludCB0byBzYW1lIG5vZGUgYXMg
dGhlIGV4eW5vcyxwYXJlbnQtYnVzIHByb3BlcnR5LgorLSAjaW50ZXJjb25uZWN0LWNlbGxzOiBz
aG91bGQgYmUgMAorCiBEZXRhaWxlZCBjb3JyZWxhdGlvbiBiZXR3ZWVuIHN1Yi1ibG9ja3MgYW5k
IHBvd2VyIGxpbmUgYWNjb3JkaW5nIHRvIEV4eW5vcyBTb0M6CiAtIEluIGNhc2Ugb2YgRXh5bm9z
MzI1MCwgdGhlcmUgYXJlIHR3byBwb3dlciBsaW5lIGFzIGZvbGxvd2luZzoKIAlWRERfTUlGIHwt
LS0gRE1DCkBAIC0xODUsOCArMTkwLDkgQEAgRXhhbXBsZTE6CiAJLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKIEV4YW1wbGUyIDoKLQlU
aGUgYnVzIG9mIERNQyAoRHluYW1pYyBNZW1vcnkgQ29udHJvbGxlcikgYmxvY2sgaW4gZXh5bm9z
MzI1MC5kdHNpCi0JaXMgbGlzdGVkIGJlbG93OgorCVRoZSBidXMgb2YgRE1DIChEeW5hbWljIE1l
bW9yeSBDb250cm9sbGVyKSBibG9jayBpbiBleHlub3MzMjUwLmR0c2kgaXMKKwlsaXN0ZWQgYmVs
b3cuIEFuIGludGVyY29ubmVjdCBwYXRoICJidXNfbGNkMCAtLSBidXNfbGVmdGJ1cyAtLSBidXNf
ZG1jIgorCWlzIGRlZmluZWQgZm9yIGRlbW9uc3RyYXRpb24gcHVycG9zZXMuCgogCWJ1c19kbWM6
IGJ1c19kbWMgewogCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zLWJ1cyI7CkBAIC0zNzYs
MTIgKzM4MiwxNSBAQCBFeGFtcGxlMiA6CiAJJmJ1c19kbWMgewogCQlkZXZmcmVxLWV2ZW50cyA9
IDwmcHBtdV9kbWMwXzM+LCA8JnBwbXVfZG1jMV8zPjsKIAkJdmRkLXN1cHBseSA9IDwmYnVjazFf
cmVnPjsJLyogVkREX01JRiAqLworCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQlzdGF0
dXMgPSAib2theSI7CiAJfTsKCiAJJmJ1c19sZWZ0YnVzIHsKIAkJZGV2ZnJlcS1ldmVudHMgPSA8
JnBwbXVfbGVmdGJ1c18zPiwgPCZwcG11X3JpZ2h0YnVzXzM+OwogCQl2ZGQtc3VwcGx5ID0gPCZi
dWNrM19yZWc+OworCQlzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQgPSA8JmJ1c19kbWM+Owor
CQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQlzdGF0dXMgPSAib2theSI7CiAJfTsKCkBA
IC0zOTIsNiArNDAxLDggQEAgRXhhbXBsZTIgOgoKIAkmYnVzX2xjZDAgewogCQlkZXZmcmVxID0g
PCZidXNfbGVmdGJ1cz47CisJCXNhbXN1bmcsaW50ZXJjb25uZWN0LXBhcmVudCA9IDwmYnVzX2xl
ZnRidXM+OworCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQlzdGF0dXMgPSAib2theSI7
CiAJfTsKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
