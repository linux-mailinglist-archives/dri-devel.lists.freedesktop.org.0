Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5789D14AFD
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2B789939;
	Mon,  6 May 2019 13:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A4089939
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:37:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190506133722euoutp02f23293a61a5b7ce9dc6799b320d0c8d0~cG4gCFJZy1380313803euoutp02B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:37:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190506133722euoutp02f23293a61a5b7ce9dc6799b320d0c8d0~cG4gCFJZy1380313803euoutp02B
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190506133721eucas1p27440dc17ceb96daa52db8e2efad45a99~cG4fr_4uq1303913039eucas1p2k;
 Mon,  6 May 2019 13:37:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E0.58.04377.19830DC5; Mon,  6
 May 2019 14:37:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190506133720eucas1p21fdb024aa77d0318b927c4b5d11fd5b4~cG4e7mPNl0498204982eucas1p2F;
 Mon,  6 May 2019 13:37:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190506133720eusmtrp14885154361cfd95b7e34325a802a35a4~cG4eti-rB1141011410eusmtrp1C;
 Mon,  6 May 2019 13:37:20 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-cd-5cd038917450
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.42.04146.09830DC5; Mon,  6
 May 2019 14:37:20 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190506133720eusmtip2cb2ea03a98a265454bba097b2b135ea9~cG4eOyX-y1092710927eusmtip24;
 Mon,  6 May 2019 13:37:20 +0000 (GMT)
Subject: Re: [PATCH v3 14/26] compat_ioctl: move ATYFB_CLK handling to atyfb
 driver
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <28b28937-cd5c-61f4-6f84-c6108c006e21@samsung.com>
Date: Mon, 6 May 2019 15:37:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20190416202701.127745-3-arnd@arndb.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djP87oTLS7EGLybKm/xd9Ixdos551tY
 LK58fc9mcaLvA6vFnr0nWSwu75rDZjGx4yqTxZLO90wW5/8eZ7W40rWSyYHL4/evSYweW1be
 ZPK4332cyeP2v8fMHu/3XWXzOL5iDovH501yHpuevGUK4IjisklJzcksSy3St0vgyriy/i1L
 wQTmikcfprM2MJ5i6mLk5JAQMJG4/OElkM3FISSwglGi90gvlPOFUWLOtvtQzmdGiV1vn7HB
 tOzesJYdIrGcUWJ30wM2COcto8S36dNZQaqEBUIldu/7xghiiwgoSkx98YwZpIhZ4BSTxONd
 XWCj2ASsJCa2rwIr4hWwk7h5ogUsziKgInH79nKg3RwcogIREv1n1CFKBCVOznzCAmJzAl0x
 +9JUsFZmAQOJI4vmsELY8hLb384B2yUhcIld4sikTVCfukgcv/qRHcIWlnh1fAuULSNxenIP
 C0TDOkaJvx0voLq3M0osn/wP6mlricPHL7JC2I4SfS/aGUGukxDgk7jxVhBiM5/EpG3TmSHC
 vBIdbUIQ1WoSG5ZtYIPZ1bVzJTOE7SHxZOY5lgmMirOQ/DYLyT+zkPyzgJF5FaN4amlxbnpq
 sVFearlecWJucWleul5yfu4mRmC6Ov3v+JcdjLv+JB1iFOBgVOLhXaByPkaINbGsuDL3EKME
 B7OSCG/is3MxQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODil
 Ghgl09SnzDzCwlV9kz/ziM32xW1eCTdX8U/1Mzvvp9hx78BNv0SB6rBaz0//b1o/iOZTWy0m
 EjSDyfxs5K9L8T8sbDtTzzVLMP1c21/x9FdJkPsFrb2HA0Vm2quEfP34O/LCk13ZC60PHIkr
 aVPV3/jqqqBvgNcrrjcPVVRn+QY6fI08oG1YmK7EUpyRaKjFXFScCADNzKDUUwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7oTLC7EGNx8o2rxd9Ixdos551tY
 LK58fc9mcaLvA6vFnr0nWSwu75rDZjGx4yqTxZLO90wW5/8eZ7W40rWSyYHL4/evSYweW1be
 ZPK4332cyeP2v8fMHu/3XWXzOL5iDovH501yHpuevGUK4IjSsynKLy1JVcjILy6xVYo2tDDS
 M7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7iy/i1LwQTmikcfprM2MJ5i6mLk5JAQ
 MJHYvWEtexcjF4eQwFJGiWcvWxi7GDmAEjISx9eXQdQIS/y51sUGUfOaUeLVvn+MIAlhgVCJ
 3fu+gdkiAooSU188Y4YousMocfzVHFYQh1ngFJPE3Z3TWEGq2ASsJCa2rwLr4BWwk7h5ooUN
 xGYRUJG4fXs52EmiAhEStx52sEDUCEqcnPkEzOYEOnX2palgvcwCehI7rv9ihbDlJba/ncM8
 gVFwFpKWWUjKZiEpW8DIvIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwBrcd+7l5B+OljcGH
 GAU4GJV4eD2UzscIsSaWFVfmHmKU4GBWEuFNfHYuRog3JbGyKrUoP76oNCe1+BCjKdATE5ml
 RJPzgekhryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDo6DbE2/Z
 ih8V3GrFp3+xTDid4f357cbLeU8vpDX1X5ddvPyd7D7Z3Q7MKknKDveUuCe0ezjPOMh5Leco
 16THPtuYDmzfwpSyha+b61mIhcJErbJXjrf8i+ufvqt4p+bXdSvL1+XvxGNlOWlztW5Iz//U
 cLnK46xEkvy62ML4CUXHJi+XUVi0UYmlOCPRUIu5qDgRABYE3tPXAgAA
X-CMS-MailID: 20190506133720eucas1p21fdb024aa77d0318b927c4b5d11fd5b4
X-Msg-Generator: CA
X-RootMTR: 20190416202751epcas3p3655845bd23c19d035b72d9b178427e28
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190416202751epcas3p3655845bd23c19d035b72d9b178427e28
References: <20190416202013.4034148-1-arnd@arndb.de>
 <20190416202701.127745-1-arnd@arndb.de>
 <CGME20190416202751epcas3p3655845bd23c19d035b72d9b178427e28@epcas3p3.samsung.com>
 <20190416202701.127745-3-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1557149842;
 bh=ivWh3sjUT+u6aXhVBQL9PxM3YzbFcHNAqkhkMUc2tsY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TKUbYCignlvBQl/XrqIS4eSybjl0dZPIWOgwmep+aEb3WKSQEkOhFsgIbFl+8MBpN
 d4m534yyM1gLh/M0bbNk77gnmCjGz5UAUe5kIITO6ovj+mMqBUY6fqgAuP+clAMaSA
 OtY2x/gprxbszYmprREJUtAXIXqehELwQu+jhSuw=
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
Cc: linux-fbdev@vger.kernel.org, y2038@lists.linaro.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <syrjala@sci.fi>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikulas Patocka <mpatocka@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzE2LzIwMTkgMTA6MjUgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gVGhlc2UgYXJl
IHR3byBvYnNjdXJlIGlvY3RsIGNvbW1hbmRzLCBpbiBhIGRyaXZlciB0aGF0IG9ubHkKPiBoYXMg
Y29tcGF0aWJsZSBjb21tYW5kcywgc28ganVzdCBsZXQgdGhlIGRyaXZlciBoYW5kbGUgdGhpcwo+
IGl0c2VsZi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PgoKQWNrZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1z
dW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
