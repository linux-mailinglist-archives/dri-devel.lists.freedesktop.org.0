Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC74617B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8A899BC;
	Fri, 14 Jun 2019 14:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854D4899BC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:48:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190614144825euoutp02d805c5bfad536d7a95f43d82acc2b424~oGAq-zphq1043310433euoutp02d
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:48:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190614144825euoutp02d805c5bfad536d7a95f43d82acc2b424~oGAq-zphq1043310433euoutp02d
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190614144824eucas1p28ce4a766238335181118b38c84e7adf9~oGAqZwRvZ1842218422eucas1p2w;
 Fri, 14 Jun 2019 14:48:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 74.96.04325.8B3B30D5; Fri, 14
 Jun 2019 15:48:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190614144823eucas1p1f6d5ed1905350e9933f4d7fec0a3419f~oGApS6j7R3210832108eucas1p1V;
 Fri, 14 Jun 2019 14:48:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190614144823eusmtrp175a283449c6243ce6a6c4150a43377d9~oGApDaKRT2548325483eusmtrp1J;
 Fri, 14 Jun 2019 14:48:23 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-d8-5d03b3b8da7f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 32.AE.04140.7B3B30D5; Fri, 14
 Jun 2019 15:48:23 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190614144822eusmtip18c6f39ce9009c2c74240f5194e9a9ae9~oGAoz5tG92907529075eusmtip1F;
 Fri, 14 Jun 2019 14:48:22 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/3] video: fbdev: intelfb: return -ENOMEM on
 framebuffer_alloc() failure
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <a659cb04-b16c-a3a0-30f4-b2f90b0d7196@samsung.com>
Date: Fri, 14 Jun 2019 16:48:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOd0dm5ljDSY+Fra48vU9m8WJvg+s
 Fpd3zWGz+HWSyYHF4/rPG0we97uPM3l83iQXwBzFZZOSmpNZllqkb5fAlXHv4lzGghNsFU86
 DzI1MF5g7WLk5JAQMJG4/6+FrYuRi0NIYAWjRPvTPewQzhdGiUlrJrJAOJ8ZJaY0LmCEaXm/
 +QJU1XJGiY/H77GBJIQE3jJKrG5TArHZBKwkJravAmrg4BAWiJb4N8cLJCwikCCxYvoMsDCz
 gJrE9UXVIGFeATuJQ12XmEBsFgFVid6v25lBbFGBCIn7xzawQtQISpyc+YQFxGYWEJe49WQ+
 E4QtL7H97RxmkHMkBD6zSez60soCcaeLxK2tPUwQtrDEq+Nb2CFsGYnTk3tYIBrWMUr87XgB
 1b2dUWL55H9sEFXWEoePX2SFuFRTYv0ufYiwo8S5I5tZQMISAnwSN94KQhzBJzFp23RmiDCv
 REebEES1msSGZRvYYNZ27VzJDGF7SFy+OZdlAqPiLCSvzULy2iwkr81CuGEBI8sqRvHU0uLc
 9NRi47zUcr3ixNzi0rx0veT83E2MwGRy+t/xrzsY9/1JOsQowMGoxMM7o485Vog1say4MvcQ
 owQHs5II7zxroBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5O
 qQZGP+dFx87cVe/2Ln99m/ekmJrOF4N7OxslI+xk/E/Puh5w9RGXy4x3VX01bHM3+GuWqdzb
 KDv1mekKRZ9nZ11fsqYemR2gyC0rsv2Ki9X66VpNZ5qZNQJEek3OHCt5ffHMVf7Op/KbNmXn
 tZZpNcU/SiivTA+O2TUtcON2xRl3zhxPYQtv+eytxFKckWioxVxUnAgAk1mLPiIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4Xd3tm5ljDRrbeSyufH3PZnGi7wOr
 xeVdc9gsfp1kcmDxuP7zBpPH/e7jTB6fN8kFMEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZ
 WOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZdy7OJex4ARbxZPOg0wNjBdYuxg5OSQETCTeb77A
 3sXIxSEksJRR4suzjyxdjBxACRmJ4+vLIGqEJf5c62KDqHnNKPH7YAdYM5uAlcTE9lWMIPXC
 AtES/+Z4gYRFBBIknr6ezwYSZhZQk7i+qBokzCtgJ3Go6xITiM0ioCrR+3U7M4gtKhAhceb9
 ChaIGkGJkzOfgNnMAuoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPALCQts5C0zELSMgtJywJG
 llWMIqmlxbnpucVGesWJucWleel6yfm5mxiBsbDt2M8tOxi73gUfYhTgYFTi4Z3RxxwrxJpY
 VlyZe4hRgoNZSYR3njVQiDclsbIqtSg/vqg0J7X4EKMp0EMTmaVEk/OBcZpXEm9oamhuYWlo
 bmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFxB8cOpog0E0+OuM4p4q6yL70c+zo+
 LdTaueT+6QlqyqICa7nYHZgn6a59v9IlbevEOf0PmH4eN39wdp7OjLbf5z8U7xFY5vp+8/3H
 4VN29Oo8KPM49OaF+dIzB/a9m/Ln65S0Hcv0bfIfmiip83pG6+0MWsRSyp+gUpoz14ax58/K
 RWbcF//bKbEUZyQaajEXFScCALvnrPmbAgAA
X-CMS-MailID: 20190614144823eucas1p1f6d5ed1905350e9933f4d7fec0a3419f
X-Msg-Generator: CA
X-RootMTR: 20190614144823eucas1p1f6d5ed1905350e9933f4d7fec0a3419f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614144823eucas1p1f6d5ed1905350e9933f4d7fec0a3419f
References: <CGME20190614144823eucas1p1f6d5ed1905350e9933f4d7fec0a3419f@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560523705;
 bh=KbnWEYsgqMns3fL1M6bl1WXvL0vvlacarWBlX2so54A=;
 h=From:Subject:To:Cc:Date:References:From;
 b=u17c7vknApsshx78VtoHa92DcoTtt2IZwmtq/UlDVTUB5kYKwl4mVkZRgWJJ5aUL4
 EOv2RAeXCPaF3ojqnEMDNU79R8O9bbkpW2bApSvydSIpl7xfgvne6Rs+5CAd5qrHxY
 nWCPZcMo4C2dEEs4r2IhRM2fiM5uZ9DSbHVg/q5w=
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
Cc: Maik Broemme <mbroemme@libmpq.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGVycm9yIGNvZGUgZnJvbSAtRU5PREVWIHRvIC1FTk9NRU0uCgpDYzogTWFpayBCcm9lbW1l
IDxtYnJvZW1tZUBsaWJtcHEub3JnPgpTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJr
aWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRl
di9pbnRlbGZiL2ludGVsZmJkcnYuYyB8ICAgIDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKSW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9pbnRl
bGZiL2ludGVsZmJkcnYuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW50
ZWxmYi9pbnRlbGZiZHJ2LmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9pbnRlbGZiL2ludGVs
ZmJkcnYuYwpAQCAtNDkzLDcgKzQ5Myw3IEBAIHN0YXRpYyBpbnQgaW50ZWxmYl9wY2lfcmVnaXN0
ZXIoc3RydWN0IHAKIAlpbmZvID0gZnJhbWVidWZmZXJfYWxsb2Moc2l6ZW9mKHN0cnVjdCBpbnRl
bGZiX2luZm8pLCAmcGRldi0+ZGV2KTsKIAlpZiAoIWluZm8pIHsKIAkJRVJSX01TRygiQ291bGQg
bm90IGFsbG9jYXRlIG1lbW9yeSBmb3IgaW50ZWxmYl9pbmZvLlxuIik7Ci0JCXJldHVybiAtRU5P
REVWOworCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAJaWYgKGZiX2FsbG9jX2NtYXAoJmluZm8tPmNt
YXAsIDI1NiwgMSkgPCAwKSB7CiAJCUVSUl9NU0coIkNvdWxkIG5vdCBhbGxvY2F0ZSBjbWFwIGZv
ciBpbnRlbGZiX2luZm8uXG4iKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
