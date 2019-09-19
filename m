Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB2B8BE0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DFB6F669;
	Fri, 20 Sep 2019 07:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7525F6F975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919142332euoutp011c0522ee5bdd51ee2b6830ef8c13ed8b~F3PovRO_z2320923209euoutp01J
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190919142332euoutp011c0522ee5bdd51ee2b6830ef8c13ed8b~F3PovRO_z2320923209euoutp01J
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190919142331eucas1p2796f51835a980ab05279a92068aed907~F3PoOErBV3077830778eucas1p28;
 Thu, 19 Sep 2019 14:23:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CD.1B.04309.36F838D5; Thu, 19
 Sep 2019 15:23:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142330eucas1p1eceae78b148a03f2af71657b7cdd6694~F3PnWgSvX1761817618eucas1p1F;
 Thu, 19 Sep 2019 14:23:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190919142330eusmtrp17672e43b993bed51c1c88b1c4d09ee9d~F3PnIF1Do0555105551eusmtrp1j;
 Thu, 19 Sep 2019 14:23:30 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-66-5d838f63b8af
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 47.65.04117.26F838D5; Thu, 19
 Sep 2019 15:23:30 +0100 (BST)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142329eusmtip1135a0ffecb68779a53fbb8d79a1c0bd0~F3PmUlWIN3163331633eusmtip1L;
 Thu, 19 Sep 2019 14:23:29 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 10/11] arm: dts: exynos: Add interconnects to
 Exynos4412 mixer
Date: Thu, 19 Sep 2019 16:22:35 +0200
Message-Id: <20190919142236.4071-11-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3bv7u6sq9dZdDBLHYhUpGZFTyRREnELP/hNSsSmXtR8yXa1
 Nz/kC5bam7gsU0nTkeYKdanoMtE1GmY0ylqlzllWVpAV07LobdtdL99+53/O//yfAw9NKOxS
 fzo9O5dXZ6sylZQX2X3nq2VN8tnihAjdqD823umSYfulEoQ7qtuk+MnstBTXm+5L8aO5DxS+
 cEtP4Up7BYktlnYZbrF9kmL9lFWKRwx1FHacNiFcbemX4OsmmwyPFbZQuFrzltrqy+lbyyhu
 3NpHcfaTZgl3Q3uM65jpkXCDM30S7kxnK+Ic+hWx9B6vqBQ+M/0grw7fstcr7WbhnCxnRHa4
 3TiNClA3VY7kNLDrwaEzoXLkRSvYFgQVjQ9lYjGL4KVpwtNxIDAPlEn+WIxFDwkXK9hmBM2/
 dv91THS1u/dS7DaorJp0r1rMmhBoGj6QroJgtRI4U2tx2/3YOOi69pR0McmGwJT1jVtn2E3w
 +GojEuMCQdc+4NblTn22v54UZ3xh6OJLNxPOmeKuWsIVAGwJDSfuFnnM2+H81DlCZD94Z+6U
 iRwAw5pTpMgCvOq1S0VzAQL9FZPHsBlumx84G7QzYSW0GcJFeRs0vLglc8nAesPT977iG7yh
 svsCIcoMlB5XiKgEw0Vv0QhQpLN6dnPQ1FsqqUDBNf8dU/PfMTX/YhsQ0YqW8nlCViovRGbz
 h8IEVZaQl50alrw/S4+c3274p3m2Bxm+JxkRSyPlIiboUHGCQqo6KBzJMiKgCeVipm5DUYKC
 SVEdOcqr9yeq8zJ5wYiW0aRyKZO/YDJewaaqcvkMns/h1X+6ElruX4Bi5rWl2q0KpuMef9nx
 PGxHhbFqyKQBec9UzHvbeNMQ77ORKXsdmEgsn7GOjs3HrjJM+KxgHQR8ZKbzj5Wsiz/w7sew
 3/Odga3joQm3o54FB5zQ5AqBQsTJncMh36M3ZHxLks+H7gtKj9y1JLeUyi+M61unW/ZlsMe2
 emFH9OcqJSmkqdauItSC6jdFz9/8cgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xu7pJ/c2xBkt6FS0OHdvKbnF/Xiuj
 xcYZ61ktrn95zmox/8g5VosrX9+zWUzfu4nNYtL9CSwW589vYLdYcfcjq8Wmx9dYLS7vmsNm
 8bn3CKPFjPP7mCzWHrnLbnG7cQWbxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe2x8t4PJ
 4+C7PUwefVtWMXp83iQXwBGlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRv
 Z5OSmpNZllqkb5egl7G78St7wWX2ig2HnjM2MG5j62Lk5JAQMJE41HSJuYuRi0NIYCmjxN1D
 51khEhISH9ffgLKFJf5c62KDKPrEKLFvyXMmkASbgKPEpKkP2EESIgKnGCW2Lj8HVsUssIFJ
 YvnTl0DtHBzCAqESKy7ogzSwCKhKPL72ghnE5hWwlLi6chEjxAZ5idUbDoDFOYHiX/bNZwGx
 hQQsJOY+nssIUS8ocXLmExaQkcwC6hLr5wmBhJmBWpu3zmaewCg4C0nVLISqWUiqFjAyr2IU
 SS0tzk3PLTbSK07MLS7NS9dLzs/dxAiM4W3Hfm7Zwdj1LvgQowAHoxIPr0J5c6wQa2JZcWXu
 IUYJDmYlEd45pk2xQrwpiZVVqUX58UWlOanFhxhNgV6byCwlmpwPTC95JfGGpobmFpaG5sbm
 xmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYez7s57rkwSMV/P9sGPf8kn8PzoVppfk5
 pTD/LA/9nch6ndHsFPcbQVWGI1Ivne5x9/BMydwf8yWht0V8Nf+WRV17/L1+fbaoWnEjcvO0
 9615in1iNWFqxSsS9i0NS9yhYmfPE1LE2fz+93K/BpO/q5Pes+1Yqn57dQx30OP7ySyyQr1h
 Pi5KLMUZiYZazEXFiQA6iPJh9wIAAA==
X-CMS-MailID: 20190919142330eucas1p1eceae78b148a03f2af71657b7cdd6694
X-Msg-Generator: CA
X-RootMTR: 20190919142330eucas1p1eceae78b148a03f2af71657b7cdd6694
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190919142330eucas1p1eceae78b148a03f2af71657b7cdd6694
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142330eucas1p1eceae78b148a03f2af71657b7cdd6694@eucas1p1.samsung.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568903012;
 bh=TV1z+igvsoIbVfWWAwJfb3ELED5sMO01fLplbggkMEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=so7tlrb4EJFRN5H0a/t2QfQeloVQlmEZoQkL2PIFwtajjdETyoyIvX10shYA99QcD
 i72G6wt0+jBLEYNNuft8u//kic+PgUz6wkB0vxoLlqlRKhk68ddGNMNsW5Y8LbiRF3
 OtG9JdF5k6UI748aAebbl7rD7kbL7aZaCeSnZJJ4=
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

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+CgpUaGlz
IHBhdGNoIGFkZHMgYW4gJ2ludGVyY29ubmVjdHMnIHByb3BlcnR5IHRvIEV4eW5vczQ0MTIgRFRT
IGluIG9yZGVyIHRvCmRlY2xhcmUgdGhlIGludGVyY29ubmVjdCBwYXRoIHVzZWQgYnkgdGhlIG1p
eGVyLiBQbGVhc2Ugbm90ZSB0aGF0IHRoZQonaW50ZXJjb25uZWN0LW5hbWVzJyBwcm9wZXJ0eSBp
cyBub3QgbmVlZGVkIHdoZW4gdGhlcmUgaXMgb25seSBvbmUgcGF0aCBpbgonaW50ZXJjb25uZWN0
cycsIGluIHdoaWNoIGNhc2UgY2FsbGluZyBvZl9pY2NfZ2V0KCkgd2l0aCBhIE5VTEwgbmFtZSBz
aW1wbHkKcmV0dXJucyB0aGUgcmlnaHQgcGF0aC4KClNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2ln
b8WEIDxhLnN3aWdvbkBwYXJ0bmVyLnNhbXN1bmcuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczQ0MTIuZHRzaSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCmluZGV4IGE3MGE2NzFhY2FjZC4uZmFhZWM2YzQwNDEy
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCkBAIC03ODksNiArNzg5LDcgQEAKIAljbG9j
ay1uYW1lcyA9ICJtaXhlciIsICJoZG1pIiwgInNjbGtfaGRtaSIsICJ2cCI7CiAJY2xvY2tzID0g
PCZjbG9jayBDTEtfTUlYRVI+LCA8JmNsb2NrIENMS19IRE1JPiwKIAkJIDwmY2xvY2sgQ0xLX1ND
TEtfSERNST4sIDwmY2xvY2sgQ0xLX1ZQPjsKKwlpbnRlcmNvbm5lY3RzID0gPCZidXNfZGlzcGxh
eSAmYnVzX2RtYz47CiB9OwogCiAmcG11IHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
