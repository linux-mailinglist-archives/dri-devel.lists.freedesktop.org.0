Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85BB8BE2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E12D6F53E;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4D16F975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919142327euoutp02498e7cd83f014e343962722c88532cae~F3Pkmr1DF1748917489euoutp02K
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190919142327euoutp02498e7cd83f014e343962722c88532cae~F3Pkmr1DF1748917489euoutp02K
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190919142327eucas1p2ed6a1e2c127dd2789af76ab265167b07~F3PkJG0Yp3082530825eucas1p2m;
 Thu, 19 Sep 2019 14:23:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.1B.04309.F5F838D5; Thu, 19
 Sep 2019 15:23:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190919142326eucas1p204819014fe85716b47e2de4af9102cd5~F3PjKGocO2469524695eucas1p2L;
 Thu, 19 Sep 2019 14:23:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190919142326eusmtrp1095ef82681f3c06555d9fdcc527e3361~F3Pi7onA90555105551eusmtrp1a;
 Thu, 19 Sep 2019 14:23:26 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-56-5d838f5f8266
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B2.65.04117.D5F838D5; Thu, 19
 Sep 2019 15:23:25 +0100 (BST)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142325eusmtip10316e90c68f927ac1cd0f37950339202~F3PiEhIDb3226332263eusmtip1B;
 Thu, 19 Sep 2019 14:23:25 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 06/11] interconnect: Relax requirement in
 of_icc_get_from_provider()
Date: Thu, 19 Sep 2019 16:22:31 +0200
Message-Id: <20190919142236.4071-7-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3YuOxtNjlPypYvZNKEsu9DlK0UKQw5E0B8FooiuOmikU3a8
 dIEyzZqXtCaiuTArU1NMXfPSNDMbmUiuZZpQa9W63yS2kKgs57Hyv9/3Ps/zPd8LH0MoHdR8
 Zr8mnddq1MkqWk623/0+tDK+JDdudWejFPfdbZNiR1Uewq0VzRR+7H5L4QuWIQo/+jZO4/Kb
 RhrrHWdIbLW2SHG9/SuFjc5RCg+bz9PYddqCcIW1R4KbLHYpfnK8nsYVpe/pLd6csSGf5p6O
 dtOco7Bfwl2vOca1fumUcLe/dEu4YlMD4lxG/51MjDx8H5+8P5PXropIkCc1ua9SaVbpweY6
 E5GNzHQBkjHAroPeiTGyAMkZJVuPQNf0ghYPbgTOE0+nXUrWhWDgSvDfROudH0g01SG4NfIS
 /UsUGhooj4tmt4K+7LnUI/iyFgSl1ePTJQRbI4Fig5XwuHzYODgxPinxMMkuhapKm9TDChZD
 bXY1IfYthsaW3mmWsZvA3XOBFD3eMHDu1TQTU57cNgPhKQA2j4H75Q8oMbwNDBM5M6v6wId+
 k1TkhTBYWkSKLMDrGw5KDGcjMNZaZprD4E6/bUpgphqWQbN5lTjeCg/NdolnDKwXjH32Ft/g
 Bfr2ckIcK0B3UimiCsznvMQgQE7j6MzdHJSV28gzaEnlrGUqZy1T+b+2GhENyI/PEFISeWGt
 hs8KFdQpQoYmMXRvaooRTX27wcl+dycy/9zTh1gGqeYqArJy45SUOlM4lNKHgCFUvorz63Pi
 lIp96kOHeW1qvDYjmRf60AKGVPkpjsx5HqtkE9Xp/AGeT+O1f1UJI5ufjdJR1rGEZ2jRYOzy
 S20V8R1hQ26Z83Jn1MUgve+yNz26qBXxiuGzISFHO9ZF1oVsKGl58uG+entLZLjdPzqMKTTb
 DVVlAcS9JGKDznSwUPdxx7xPv+/t6g1b9GvjcFGwy2WeiA7cXZuZ+s7WteS607aZ1vfmB5lO
 xXRFXBMCO0ZYFSkkqdcsJ7SC+g9oiYmgcgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7qx/c2xBts2WFscOraV3eL+vFZG
 i40z1rNaXP/ynNVi/pFzrBZXvr5ns5i+dxObxaT7E1gszp/fwG6x4u5HVotNj6+xWlzeNYfN
 4nPvEUaLGef3MVmsPXKX3eJ24wo2ixmTX7I5CHpsWtXJ5nHn2h42j/vdx5k8Ni+p99j4bgeT
 x8F3e5g8+rasYvT4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
 ziYlNSezLLVI3y5BL2Ptl5WsBefZK9Yv38LcwLiLrYuRk0NCwERi4+HfjF2MXBxCAksZJXYd
 OsICkZCQ+Lj+BiuELSzx51oXG0TRJ0aJb+fOgyXYBBwlJk19wA6SEBE4xSixdfk5sCpmgQ1M
 EsufvgSrEhaIlvjzfiMTiM0ioCoxb9ZFdhCbV8BCYlnDAmaIFfISqzccALM5BSwlvuybD3aG
 EFDN3MdzGSHqBSVOznwCFOcAWqAusX6eEEiYGai1eets5gmMgrOQVM1CqJqFpGoBI/MqRpHU
 0uLc9NxiI73ixNzi0rx0veT83E2MwCjeduznlh2MXe+CDzEKcDAq8fAqlDfHCrEmlhVX5h5i
 lOBgVhLhnWPaFCvEm5JYWZValB9fVJqTWnyI0RTotYnMUqLJ+cAEk1cSb2hqaG5haWhubG5s
 ZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgXHzizM5okftX/LsumzmY9PM/bM/qOKUhq91
 tXuCfKn5IQmmtEd/FFnu3PCc176Zc8V+1Z3PL4SE3FOt3FTRvFFe9Lz5vKfSiumX5scK7ghe
 7/Zh9dJTuow7vObyld04cyXytZJR+bbzfGkf2nY6THwQIHQwdhVD4RmXf7LBvVXfLtxgbdGp
 u6bEUpyRaKjFXFScCAA/QVJ9+AIAAA==
X-CMS-MailID: 20190919142326eucas1p204819014fe85716b47e2de4af9102cd5
X-Msg-Generator: CA
X-RootMTR: 20190919142326eucas1p204819014fe85716b47e2de4af9102cd5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190919142326eucas1p204819014fe85716b47e2de4af9102cd5
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142326eucas1p204819014fe85716b47e2de4af9102cd5@eucas1p2.samsung.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568903007;
 bh=AnLAppA40BqI8z9CshVPHeubC24brELzTHSPwO597YU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cGGCO4gw0XNbaT4tGaFmmq24vCXg6zOwdLdDc+/kh6RY1gK3MCaTKtNiadylqGYs3
 9Wys+2ExITVJBhA9dGuAorow4BiGfoVVMRd8TYahzKApA58QvVY+uk8DQ55idgUFYG
 6JfoCtdtMgyjbemZznTW3r3nJNM4PpLQESWvfAFs=
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
IHBhdGNoIHJlbGF4ZXMgdGhlIGNvbmRpdGlvbiBpbiBvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIo
KSBzbyB0aGF0IGl0CmlzIG5vIGxvbmdlciByZXF1aXJlZCB0byBzZXQgI2ludGVyY29ubmVjdC1j
ZWxscyA9IDwxPiBpbiB0aGUgRFQuIEluIGNhc2UKb2YgdGhlIGRldmZyZXEgZHJpdmVyIGZvciBl
eHlub3MtYnVzLCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvLgoKU2lnbmVkLW9m
Zi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+CkFja2Vk
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9p
bnRlcmNvbm5lY3QvY29yZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5j
IGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCmluZGV4IDk1ODUwNzAwZTM2Ny4uZjM1N2Mz
YTc4ODU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMKKysrIGIvZHJp
dmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCkBAIC0yODQsNyArMjg0LDcgQEAgc3RydWN0IGljY19u
b2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3Bl
YykKIAlzdHJ1Y3QgaWNjX25vZGUgKm5vZGUgPSBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOwogCXN0
cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyOwogCi0JaWYgKCFzcGVjIHx8IHNwZWMtPmFyZ3Nf
Y291bnQgIT0gMSkKKwlpZiAoIXNwZWMpCiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCiAJ
bXV0ZXhfbG9jaygmaWNjX2xvY2spOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
