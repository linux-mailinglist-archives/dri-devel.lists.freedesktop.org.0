Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FB250EE
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 15:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC29893AB;
	Tue, 21 May 2019 13:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AC689349
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 13:44:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521134443euoutp013f628f05407e1ccfe967513f0c60644f~gtqNhY2NY2435824358euoutp01E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 13:44:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190521134443euoutp013f628f05407e1ccfe967513f0c60644f~gtqNhY2NY2435824358euoutp01E
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190521134443eucas1p2a0361c7efc2c3d4dee8fcee519c6addc~gtqM0XIxT3113031130eucas1p2Z;
 Tue, 21 May 2019 13:44:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3B.80.04325.AC004EC5; Tue, 21
 May 2019 14:44:42 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190521134442eucas1p2bf6236c3af24bb023f11f8d119a822be~gtqL9Aldk1363313633eucas1p2s;
 Tue, 21 May 2019 13:44:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521134441eusmtrp1c9cddd818c93cd6503e93b5e28897d74~gtqLtfH792230522305eusmtrp1P;
 Tue, 21 May 2019 13:44:41 +0000 (GMT)
X-AuditID: cbfec7f5-fbbf09c0000010e5-f4-5ce400ca0d61
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E0.9D.04140.9C004EC5; Tue, 21
 May 2019 14:44:41 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190521134441eusmtip172871ea8af1b007e36dc816b66719ebe~gtqLcK_Z72907329073eusmtip1e;
 Tue, 21 May 2019 13:44:41 +0000 (GMT)
To: Russell King <linux@armlinux.org.uk>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: cyber2000fb: remove superfluous CONFIG_PCI ifdef
Message-ID: <214f05e0-a448-b1cf-7475-4fa7eeaa9949@samsung.com>
Date: Tue, 21 May 2019 15:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj281w8Skc+N8MXraxBkZGaTWFlDLOQEXTxV5FGW3lSy03ZvOYP
 L4HKErHUtINUxMoU75nzkhKazktq6hCzwkwLEyQvWSg1cjta/nve58L3PPAxhIin3JloTTyn
 1ahiJLQT2di9OuTdZzcTfsjyQCozr3ynZfXTY5SsJ2+Bko22lNKyjqI2FEQpRseGCcXkbZO9
 4rkhTbFcv+scedHpWAQXE53IaX3lSqeopcFOh7hSJnl6pIlORx9pPXJkAPuDOXuW0iMnRoSf
 IZjNaEXC8QOB8Va5g3AsI5h61fYv8rPXQghCGYLiiq+kVRDheQQNr5VW7Ir3Q13JGm01ETgL
 wRfeTFkFGh+FO9kVyIrFOBQ6C7vWeYZhsRyqJxgrTeK90DXH2yzb8QWY7K61RVnsAr33Z2xv
 EdgNJmYe2gvYE4zzpbZCgLMd4H3eO0poehKW+XxCwGKYMzU4CHgH9BfkkkKgGsGfnNmNtBFB
 WYFlY2cgdJqGbe0I7AU1Lb4CfRzGB4doKw3YGcbnXYQSznC3sZgQaBZyskSCex/UPq2lN5/V
 N5dvWBSQ8ZLJR3v4Lcv4Lcv4Lcv4/xUeIbICuXEJOnUkp5NquCQfnUqtS9BE+lyNVdej9R/T
 bzGtNKH231c6EGaQZBsrm5oOF1GqRF2KugMBQ0hc2f6+z+EiNkKVcpPTxl7WJsRwug7kwZAS
 NzbV7lOYCEeq4rkbHBfHaTdVe8bRPR0N0eLStD7lG2mhPDSgpO7skV+c40LvZIO7X/7a+Rov
 887M00vNEcEfikPj7wUODOx+kco/YvWFwVUGsW97S9C1PPKUsrKy0cMQkpyzKO45POI5yvp7
 n3kcUNX6tjJpVeost4taPfHtYBTbTdbl8rGZ1QH+RYvy634GY0jik7BLElIXpfI7QGh1qr8d
 ZThcLQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7onGZ7EGPT9M7e48vU9m8Wmx9dY
 LU70fWC1uLxrDpvFoal7GR1YPS5fu8jscb/7OJPH5iX1Hp83yQWwROnZFOWXlqQqZOQXl9gq
 RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlfDp3mL1gDkfF40s72BoY77J1
 MXJySAiYSHw7+Y+5i5GLQ0hgKaPE3KaZTF2MHEAJGYnj68sgaoQl/lzrAqsXEnjNKHFuIzeI
 LSKgIbFxxi82kF5mgTZGiQMzTzODJNgErCQmtq9iBLGFBQIlDk85ygoyk1fATmLdLQ6QMIuA
 qsTRV7PASkQFIiTOvF/BAmLzCghKnJz5BMxmFlCX+DPvEjOELS5x68l8JghbXmL72znMExgF
 ZiFpmYWkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjJBtx35u2cHY9S74
 EKMAB6MSD++De49jhFgTy4orcw8xSnAwK4nwnj71KEaINyWxsiq1KD++qDQntfgQoynQQxOZ
 pUST84HRm1cSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgVH8SFWb
 GF9gzut5NRcaUpKeHk1Z33knMXfTlSYfNeX4cxyatjVPrMrLwj02GvudcV8hJPa2oJKhIqXA
 6ZwWg3he+u6Je6x9mLu/39fZeOpOZ4XfrIbXPjk75mYd33GlcieXbbaqn/NJN63s495v3rNH
 qW74sK3v46n4yekxX443yZw2OGarr8RSnJFoqMVcVJwIANdnKJ2mAgAA
X-CMS-MailID: 20190521134442eucas1p2bf6236c3af24bb023f11f8d119a822be
X-Msg-Generator: CA
X-RootMTR: 20190521134442eucas1p2bf6236c3af24bb023f11f8d119a822be
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521134442eucas1p2bf6236c3af24bb023f11f8d119a822be
References: <CGME20190521134442eucas1p2bf6236c3af24bb023f11f8d119a822be@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558446283;
 bh=RLKuvBEG6Mny/Pi7NLR0Nbvy2HIvFuNlpcTPZlMZBXk=;
 h=To:Cc:From:Subject:Date:References:From;
 b=Vb6ydFvKm9z1RR1Gb0tMkhE9r7REcltW89yYJLNHhCIzVRDFLCyOcsB8eTCRxIYcB
 uSSxxREujTovpQu+wX7rhZwgTUJzFjW1wkeKD2EHIJm2tk0MOSwqTiWThVTXdkZ3JZ
 tlHT1QwdSq/I+IF5f8U51gzvmoPLTIoFNCTjW480=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIFBDSSBkcml2ZXIgYW5kIEZCX0NZQkVSMjAwMCBkZXBlbmRzIG9uIFBDSSBpbiBL
Y29uZmlnIHNvCnRoZXJlIGlzIG5vIG5lZWQgdG8gY2hlY2sgZm9yIFBDSSBpbnNpZGUgdGhlIGRy
aXZlciBjb2RlLgoKQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3Vu
Zy5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jeWJlcjIwMDBmYi5jIHwgICAgNSAtLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpJbmRleDogYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2N5YmVyMjAwMGZiLmMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2N5YmVyMjAwMGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jeWJlcjIwMDBmYi5jCkBA
IC0xNjQyLDEwICsxNjQyLDYgQEAgc3RhdGljIHZvaWQgY3liZXJwcm9fY29tbW9uX3Jlc3VtZShz
dHJ1YwogfQogCiAvKgotICogUENJIHNwZWNpZmljIHN1cHBvcnQuCi0gKi8KLSNpZmRlZiBDT05G
SUdfUENJCi0vKgogICogV2UgbmVlZCB0byB3YWtlIHVwIHRoZSBDeWJlclBybywgYW5kIG1ha2Ug
c3VyZSBpdHMgaW4gbGluZWFyIG1lbW9yeQogICogbW9kZS4gIFVuZm9ydHVuYXRlbHksIHRoaXMg
aXMgc3BlY2lmaWMgdG8gdGhlIHBsYXRmb3JtIGFuZCBjYXJkIHRoYXQKICAqIHdlIGFyZSBydW5u
aW5nIG9uLgpAQCAtMTg2MSw3ICsxODU3LDYgQEAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIGN5
YmVycHJvX2RyaXZlcgogCS5yZXN1bWUJCT0gY3liZXJwcm9fcGNpX3Jlc3VtZSwKIAkuaWRfdGFi
bGUJPSBjeWJlcnByb19wY2lfdGFibGUKIH07Ci0jZW5kaWYKIAogLyoKICAqIEkgZG9uJ3QgdGhp
bmsgd2UgY2FuIHVzZSB0aGUgIm1vZHVsZV9pbml0IiBzdHVmZiBoZXJlIGJlY2F1c2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
