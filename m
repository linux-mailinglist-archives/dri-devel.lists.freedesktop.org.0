Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20DB07681
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0118410E28B;
	Wed, 16 Jul 2025 13:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ExaBptvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6CF2E10E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=b+O16EHi6+OgaieHCvV/ddJBsiec8Rf8oT5frpBM7cQ=; b=E
 xaBptvoz2Nbk4ELLdUSNbfC9rxgaB/LJNBJFDXj+MpEXanorr14wEijQ3MNTG/hw
 IT20nFOQu/htl6bsjRuLCCpmLV/UI0vI6J9XGAxXXVZe7AYTLrJlRHqfRf4bLpxH
 HcAM4cNoyKoVG7KOjgnguvK8BbFI8UBMGV9OtExP2Y=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Wed, 16 Jul 2025 21:00:19 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 16 Jul 2025 21:00:19 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Intel Graphics" <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re:linux-next: build warning after merge of the drm-misc tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250716203115.6e02e50c@canb.auug.org.au>
References: <20250716203115.6e02e50c@canb.auug.org.au>
X-NTES-SC: AL_Qu2eAPqcv0Aq7yafYukfmkcVgOw9UcO5v/Qk3oZXOJF8jCPp9C0vUnNTMUnG6MWDDiCwnQiHWzVR6spgbahGYoQgOxQv46vnKE/sRjyZt5I8dg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <73ab4497.98ab.19813525561.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bSgvCgD3H_Jjondou30FAA--.40498W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBiMXmh3ljHqCwACsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpIaSBhbGwsCgpBdCAyMDI1LTA3LTE2IDE4OjMxOjE1LCAiU3RlcGhlbiBSb3Rod2VsbCIgPHNm
ckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToKPkhpIGFsbCwKPgo+QWZ0ZXIgbWVyZ2luZyB0aGUg
ZHJtLW1pc2MgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChodG1sZG9jcykKPnByb2R1
Y2VkIHRoaXMgd2FybmluZzoKPgo+ZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYzoxMjQyOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnY29ubmVjdG9yJyBu
b3QgZGVzY3JpYmVkIGluICdkcm1fYnJpZGdlX2RldGVjdCcKPgo+SW50cm9kdWNlZCBieSBjb21t
aXQKPgo+ICA1ZDE1NmE5YzNkNWUgKCJkcm0vYnJpZGdlOiBQYXNzIGRvd24gY29ubmVjdG9yIHRv
IGRybSBicmlkZ2UgZGV0ZWN0IGhvb2siKQoKT25jZSBhZ2FpbiwgSSBhcG9sb2dpemUuIEkgaGF2
ZSBzZW50IGEgcGF0Y2hbMF0gIHdoaWNoIEkgaG9wZSB3aWxsIGZpeCB0aGlzIGlzc3VlLgpXaGVu
IEkgcmFuICJtYWtlIGh0bWxkb2NzIiBsb2NhbGx5LCBJIGRpZG4ndCBzZWUgdGhpcyB3YXJuaW5n
LiBJJ20gbm90IHN1cmUgaWYgaXQncyBiZWNhdXNlIG15IG1ldGhvZCB3YXMgaW5jb3JyZWN0LgoK
ClswXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDI1MDcxNjEyNTYwMi4zMTY2
NTczLTEtYW5keXNocmtAMTYzLmNvbS9ULyN1CgoKPgo+LS0gCj5DaGVlcnMsCj5TdGVwaGVuIFJv
dGh3ZWxsCg==
