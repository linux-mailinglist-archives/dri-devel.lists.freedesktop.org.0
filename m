Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1EE38A65
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2902E89CF3;
	Fri,  7 Jun 2019 12:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50E89CF3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:33:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607123312euoutp01eda8820047f98002ada6164bf2dc3130~l6pnC-GeR0273702737euoutp01d
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:33:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607123312euoutp01eda8820047f98002ada6164bf2dc3130~l6pnC-GeR0273702737euoutp01d
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607123311eucas1p2138a022084a5943aa2fe0382621c335d~l6pmojjbH2443324433eucas1p2i;
 Fri,  7 Jun 2019 12:33:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4F.3B.04377.7895AFC5; Fri,  7
 Jun 2019 13:33:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607123310eucas1p17702bc47693555b2e3d4354c2d997d03~l6pl3hAuo0536405364eucas1p1x;
 Fri,  7 Jun 2019 12:33:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607123310eusmtrp21751413f4019d6f4f4c9f43fbc990d4f~l6plmV3ki0991909919eusmtrp2R;
 Fri,  7 Jun 2019 12:33:10 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-6e-5cfa598711d4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E5.F2.04140.6895AFC5; Fri,  7
 Jun 2019 13:33:10 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607123310eusmtip2533c3314a7be362f283b58452646ab5a~l6plS6G8N2446724467eusmtip2C;
 Fri,  7 Jun 2019 12:33:10 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: cyber2000fb: remove superfluous
 CONFIG_PCI ifdef
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Russell King <linux@armlinux.org.uk>
Message-ID: <2bacb06a-eb78-50fa-3e11-76ce20d89d6b@samsung.com>
Date: Fri, 7 Jun 2019 14:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <214f05e0-a448-b1cf-7475-4fa7eeaa9949@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djP87rtkb9iDE79EbC48vU9m8Wmx9dY
 LU70fWC1uLxrDpvFoal7GR1YPS5fu8jscb/7OJPH5iX1Hp83yQWwRHHZpKTmZJalFunbJXBl
 LD3fzFiwmbni9an7TA2MT5i6GDk5JARMJBY/2cAGYgsJrGCU+PbZoouRC8j+wijxbsdyZgjn
 M6PE/uk7GLsYOcA6HrcEQsSXM0p8WLufDcJ5yyhxZuYnFpBRwgKhEt/Oz2QGsdkErCQmtq9i
 BLFFBDQkNs74BdbALNDGKPF01hVWkASvgJ3EnI/LwZpZBFQkrr39BnafqECExP1jG6BqBCVO
 znzCAnIFp4C9xLqLziBhZgFxiVtP5jNB2PIS29/OAbtaQmAeu0TD4ecsEH+6SPQd/sIKYQtL
 vDq+hR3ClpH4vxOkGaRhHaPE344XUN3bGSWWT/7HBlFlLXH4+EVWkM3MApoS63fpQ4LCUaLj
 aRyEySdx460gxA18EpO2TWeGCPNKdLQJQcxQk9iwbAMbzNaunSuZJzAqzULy2Cwk38xC8s0s
 hLULGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBCaY0/+Of9nBuOtP0iFGAQ5GJR5e
 B4afMUKsiWXFlbmHGCU4mJVEeMsu/IgR4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9
 sSQ1OzW1ILUIJsvEwSnVwGh0fS/LC7vi54b3zLeZ2Sf8F+6W6eoJyDL6d4xjf/+dNYUrnCMu
 SCfot3rLhEafcnR6bDU3/iWndf/VSYnPi32n+tpMZytozLKca5o/M+iBYuqyjN5fZ1hnz9st
 +GNS3v0dlk4/dbcJialOUAhPyHvBmJm+VYjXoX+uZ6Pxu8g7uuoLV6aqKrEUZyQaajEXFScC
 ACaPMxYsAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7ptkb9iDP70yVpc+fqezWLT42us
 Fif6PrBaXN41h83i0NS9jA6sHpevXWT2uN99nMlj85J6j8+b5AJYovRsivJLS1IVMvKLS2yV
 og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQylp5vZizYzFzx+tR9pgbGJ0xd
 jBwcEgImEo9bArsYOTmEBJYySsz77gIRlpE4vr4MJCwhICzx51oXWxcjF1DJa0aJl9+nsYDU
 CAuESvyZXQVSwyZgJTGxfRUjiC0ioCGxccYvsHpmgTZGiQMzTzNDzLeTOPDuAxOIzQtkz/m4
 nAXEZhFQkbj29htYXFQgQuLM+xUsEDWCEidnPgHbxSlgL7HuojNImFlAXeLPvEvMELa4xK0n
 85kgbHmJ7W/nME9gFJqFpHsWkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cT
 IzCath37uWUHY9e74EOMAhyMSjy8M5h+xgixJpYVV+YeYpTgYFYS4S278CNGiDclsbIqtSg/
 vqg0J7X4EKMp0G8TmaVEk/OBkZ5XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1
 CKaPiYNTqoHRc8uUQob5X85cU5qvVuipvb17OU+Dc9H3ncZuIo4yd8JPCEkZTNg2JW3TtrPZ
 r9dnmN5geOu9oYEpcqH5/qlPmxemacQ9ef9F3bbn/BnvVe+vX+Y7uosnhfGVZt+bTW76kvLJ
 d5rZAjWOX7v3JlrBtT/vwsczXanbXSfMvL8gUzotq131ReZcJZbijERDLeai4kQA5pEQ5rwC
 AAA=
X-CMS-MailID: 20190607123310eucas1p17702bc47693555b2e3d4354c2d997d03
X-Msg-Generator: CA
X-RootMTR: 20190607123310eucas1p17702bc47693555b2e3d4354c2d997d03
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607123310eucas1p17702bc47693555b2e3d4354c2d997d03
References: <214f05e0-a448-b1cf-7475-4fa7eeaa9949@samsung.com>
 <CGME20190607123310eucas1p17702bc47693555b2e3d4354c2d997d03@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910792;
 bh=8wnpy/r4amIarIKyUKZJdO9TIeHXMh0A0miVAgNTdpk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tknfD4LXX2ZxurZEC+g1jy35nR/FujMuRcBjonMUYOiYVLduWJlEzPEN3ObBvDwbF
 U3ZDcZ5/xuKdF0kMEriV8GU5gsc74hxxxXJ/vWvg81t/K4v3DbCKc04HQ6aLBJW+dJ
 aI+2TLr5YyWhcbZJfS3qyBU8WiBpnFO1MeFlBM/U=
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

Ck9uIDUvMjEvMTkgMzo0NCBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiBU
aGlzIGlzIGEgUENJIGRyaXZlciBhbmQgRkJfQ1lCRVIyMDAwIGRlcGVuZHMgb24gUENJIGluIEtj
b25maWcgc28KPiB0aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrIGZvciBQQ0kgaW5zaWRlIHRoZSBk
cml2ZXIgY29kZS4KPiAKPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+
Cj4gU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2ll
QHNhbXN1bmcuY29tPgoKSSBxdWV1ZWQgdGhlIHBhdGNoIGZvciB2NS4zLgoKQmVzdCByZWdhcmRz
LAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xh
bmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
