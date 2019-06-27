Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619358437
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1766E415;
	Thu, 27 Jun 2019 14:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8FE6E415
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:07:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190627140745euoutp028dca74985bb6c7ce5a179cc5dca5fe1e~sE14f9fff2237622376euoutp02k
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:07:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190627140745euoutp028dca74985bb6c7ce5a179cc5dca5fe1e~sE14f9fff2237622376euoutp02k
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190627140745eucas1p11b0a7d6c492a778e735bfcdcb3315e0d~sE14DV-b-1939219392eucas1p1e;
 Thu, 27 Jun 2019 14:07:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 85.F1.04298.0BDC41D5; Thu, 27
 Jun 2019 15:07:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c~sE13UtZ0v0868408684eucas1p1b;
 Thu, 27 Jun 2019 14:07:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190627140744eusmtrp2f308e03b19720ad74dba616f7ead0be0~sE13GopYg0769707697eusmtrp2P;
 Thu, 27 Jun 2019 14:07:44 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-4c-5d14cdb035cc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.B3.04146.0BDC41D5; Thu, 27
 Jun 2019 15:07:44 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190627140744eusmtip26e4cc91b9c381ef565f6d51ad49fdc1e~sE126Tn0q1699316993eusmtip2d;
 Thu, 27 Jun 2019 14:07:44 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/3] video: fbdev: mmp: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <d21a19ea-8c18-80df-ae79-76de7c5ee67c@samsung.com>
Date: Thu, 27 Jun 2019 16:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduzned0NZ0ViDR43WVlc+fqezeJE3wdW
 i8u75rA5MHvc7z7O5PF5k1wAUxSXTUpqTmZZapG+XQJXxq0fXxgLdnBVTLw+i7mB8Q1HFyMn
 h4SAicT12bcZuxi5OIQEVjBK7H6zkwkkISTwhVHiU38kROIzo8Tfi+0sMB175jUzQySWM0qc
 mt4P5bxllLjUc5kNpIpNwEpiYvsqRhBbWMBBYubsk6wgtohAgsSK6TPA4rwCdhIre1rB1rEI
 qErserKbHcQWFYiQuH9sAytEjaDEyZlPwDYzC4hL3HoynwnClpfY/nYO2GIJgdtsEs8a/jJB
 nOciceXoPWYIW1ji1fEt7BC2jMT/nSDNIA3rgP7peAHVvZ1RYvnkf2wQVdYSh49fBFrNAbRC
 U2L9Ln2IsKPE7msbmUDCEgJ8EjfeCkIcwScxadt0Zogwr0RHmxBEtZrEhmUb2GDWdu1cCXWO
 h8SOrmkskOCNldjev5xxAqPCLCRvzkLy5iwkb85CuGcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi
 0rx0veT83E2MwPRx+t/xTzsYv15KOsQowMGoxMOrsFMkVog1say4MvcQowQHs5IIb34YUIg3
 JbGyKrUoP76oNCe1+BCjNAeLkjhvNcODaCGB9MSS1OzU1ILUIpgsEwenVAPjVoeyy4Ff0ifd
 131YfaXh6ZYW+Z6k/syNd+Nv5n1oUbApCdvx5GWt0Qr13aXH73JOWbOrVfDPlh1xdfI2QvEV
 jg7ffk/lPLys5bhVYl3XjykVby8cXadYeHXT5ZoQJsvzB+J0TQXFFbliw3MXRsr/3BpRdkq8
 X/4U18xJwjtC4lufyl/e5H9AiaU4I9FQi7moOBEAEzkjJRsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsVy+t/xe7obzorEGnzbzG9x5et7NosTfR9Y
 LS7vmsPmwOxxv/s4k8fnTXIBTFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkam
 Svp2NimpOZllqUX6dgl6Gbd+fGEs2MFVMfH6LOYGxjccXYycHBICJhJ75jUzdzFycQgJLGWU
 2Dn7DnsXIwdQQkbi+PoyiBphiT/Xutggal4zSizpm80OkmATsJKY2L6KEcQWFnCQmDn7JCuI
 LSKQIPH09Xw2EJtXwE5iZU8rE4jNIqAqsevJbrBeUYEIiTPvV7BA1AhKnJz5BMxmFlCX+DPv
 EjOELS5x68l8JghbXmL72znMExj5ZyFpmYWkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0u
 zUvXS87P3cQIDPJtx35u3sF4aWPwIUYBDkYlHl6FnSKxQqyJZcWVuYcYJTiYlUR488OAQrwp
 iZVVqUX58UWlOanFhxhNgR6ayCwlmpwPjMC8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Ykl
 qdmpqQWpRTB9TBycUg2MNnMO1X+3fOy595/W0e97evqNGTRfp7JbdT81lY75Zvo3dcdBiZYN
 Gx46KR3Nq2SNbYrVmH1+13OZFxK6v+6bxAkd3HI0RbWn+UITKw9fgW7Uq70P83YuORFn1CYe
 MPFLO8PeyWo73d6VfGc435/vrC8TZKFQ1cj10085JG+66GbuWe75k9mUWIozEg21mIuKEwF9
 7/0uiAIAAA==
X-CMS-MailID: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
X-Msg-Generator: CA
X-RootMTR: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
References: <CGME20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561644465;
 bh=wtMYutJk4G/BEWGw2w2IiAwGKBfNmaG+t5JjuWLikZY=;
 h=From:Subject:To:Date:References:From;
 b=Jnr33lW6/TCGOlaoPoTkVkD1xmIKnKqWGiLsrzWOoCA7FEWdUDiSPHyRST08fIQW4
 zcqQrmaDDpMOvLJ8Mr9LFT31qXj04PABjQsXuAE2TiW8/OH+H6nf8k0DI6RfREi3Ze
 059JxtVmzqA1R/CMlfn2puNronYEfOoZjcBsGNOw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIG1tcCBkaXNwbGF5IHN1YnN5c3RlbSBmb3IgYmV0
dGVyIGNvbXBpbGUKdGVzdGluZyBjb3ZlcmFnZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L21tcC9LY29uZmlnICAgIHwgICAgMiArLQogZHJpdmVycy92aWRlby9mYmRldi9t
bXAvaHcvS2NvbmZpZyB8ICAgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL0tjb25m
aWcKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9LY29uZmlnCisrKyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL0tjb25maWcKQEAgLTEsNyArMSw3IEBACiAjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIG1lbnVjb25maWcgTU1QX0RJU1AKIAl0
cmlzdGF0ZSAiTWFydmVsbCBNTVAgRGlzcGxheSBTdWJzeXN0ZW0gc3VwcG9ydCIKLQlkZXBlbmRz
IG9uIENQVV9QWEE5MTAgfHwgQ1BVX01NUDIKKwlkZXBlbmRzIG9uIENQVV9QWEE5MTAgfHwgQ1BV
X01NUDIgfHwgQ09NUElMRV9URVNUCiAJaGVscAogCSAgTWFydmVsbCBEaXNwbGF5IFN1YnN5c3Rl
bSBzdXBwb3J0LgogCkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25maWcK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9ody9LY29uZmlnCisrKyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25maWcKQEAgLTEsNyArMSw4IEBACiAjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGNvbmZpZyBNTVBfRElTUF9DT05U
Uk9MTEVSCiAJYm9vbCAibW1wIGRpc3BsYXkgY29udHJvbGxlciBodyBzdXBwb3J0IgotCWRlcGVu
ZHMgb24gQ1BVX1BYQTkxMCB8fCBDUFVfTU1QMgorCWRlcGVuZHMgb24gSEFWRV9DTEsgJiYgSEFT
X0lPTUVNCisJZGVwZW5kcyBvbiBDUFVfUFhBOTEwIHx8IENQVV9NTVAyIHx8IENPTVBJTEVfVEVT
VAogCWhlbHAKIAkJTWFydmVsbCBNTVAgZGlzcGxheSBodyBjb250cm9sbGVyIHN1cHBvcnQKIAkJ
dGhpcyBjb250cm9sbGVyIGlzIHVzZWQgb24gTWFydmVsbCBQWEE5MTAgYW5kCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
