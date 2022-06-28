Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E155F0B5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F4C112DC1;
	Tue, 28 Jun 2022 21:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4391A112D63
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453363;
 bh=dr4bCyXZ+36PZ+la7orHXZ1y8r374w+cQsUNEpPZ6oo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BUjBJPi48Hw+jwF27MoM82j63tQCqqLWmd9m8K+rPbT2nSAVF7dJhpPfBmXpdD/7D
 d5oYivVz7gZWncNC0cnfdkZEJ7iK9XA2xZl7Ka4LFd+BNwwPSuYj4jGGt6NhHfKIAj
 XNK6ljaU2nW3/K029wFtdgRXEVoDylArxRfW4XIM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MA7Ka-1nuib50z50-00BdLi; Tue, 28
 Jun 2022 23:56:03 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 27/32] drm/via: Add new VIA Technologies Chrome supporting
 PCI IDs to DRM
Date: Tue, 28 Jun 2022 16:55:15 -0500
Message-Id: <20220628215520.20674-8-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/NfN2jIOn6Or+2xY29E8VS80+Qpp0kzNC35ADIKPHrAvmJckY/L
 mCPjNG7PdNpYZ9bzVfTkl8gLCVXlPzXvlAUKCGBTEAOQkZMCzCyt571tf30TBPt9xtRFcRq
 k4v9jmR+j0LqsFMgrqeCvcb6E1c601QctJ/hgGSjnvLOWGwMgExgSHgNUJFddPuI3Q3Xhiz
 SjpYeUgSSj0qn32Fy6zmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sUUW1FMHWxw=:XqtVEZ05VIUqefCGDBMhfS
 newthSE8Xhh1O3Xz4cqdDBjQw9iFOYGoMw4DTGGLn9nCOfywd+zNDyjBYSigp7z6Q6kkFb1Ey
 zZ6EU9FaIRjY10TxhV7qhiWhKL0qFMTn0uUBmj+SeoZwvvwILfl12SiOweCxYN90i2LxqJjVm
 ozWNW5HB9kkXQgxYYnNUaN2JHzF3n4VvhAkOYNhx31Ff12rZzJpD/X967Hr/o69T8WguWXeV3
 fUyUO8UUaJPFBOhbODzmoXVg7Oq5hI7uVGPeg1ulTQgmxLdosucF4Yz7pBLfcRKLh/dcohUUV
 KS7cAhNfsNaJ8R97ehLdH4biZw5ZgY6th67PMtw6G7b6p7Av/UBVIysvHcBJOeIxuByNfM9Ex
 ykL3QIjvar4l2W3y5wDNooFtJjoFtKCHySlokPUtDQ3ns0KAwuGHS8yGNFTLDlpnwv9uEraEh
 +oGQ05avSCJC/YUjgaZKf7zFaHo6GGF7gOK665QHnRpHby1j7lHdYmCoJz/DZDw4T4UZ/FI8e
 3zz0HI+eUz21Z3SCrrWcMEw+aulNDOBkQc7tdzXVE+6np3sie5IiDTjh9ZZvDxU6EtlvjUle0
 9MESFNTK+yZfmRDIEg/i1mkmw6/WtF6yV3oj2N1OCcIUxkFj/nLYIC34Aja7xPIL0yFctZl4x
 M3FeZhSQXrGBgp2f1f5lqdwU+ReCVNoHhKvStiL4pqB1yMILR7JNggddrBcpWUyROD0/62Gqr
 j9Tc9PgMvdoD1W6s76GcYralpV6FpIjVm808N095vb589T7ScDqlYYmVEd/Su0L0oEuNcyHDg
 eJ0PpV0TWNpbmVXa+Bs9Ge8tRLGVnDAyF9XZ6ulWBKcXfw8uBXKI04T+WwPCWmGL2RHIEf+rk
 0uVLEC+olq38+N/zzOvjqQJTnt0Ye+tjIx9XYk5ylIOoYhSn7BId0s67FjlAfKUbZ0cvPmeJh
 UgySdrJTLS0ayoWLI+/63Et3mFQ+7IBY5loycm2Net3aCgqQrWZUcrAoU8E6M9cXUsFMh3Atb
 Mrs7FV1+z6U+p9jCP72m6E1HJLF2JoqtGezXfFD1BnEdeNUdflRhU6IyiEoW6fxbjndnVJ4Gh
 ON0n29LpQWgVdcPNMnpxi9Wg9KS76FNm4Bji4yx5MtSfEBR7sN9E1eq9A==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 include/drm/drm_pciids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_pciids.h b/include/drm/drm_pciids.h
index b7e899ce44f0..e91b93d635fa 100644
=2D-- a/include/drm/drm_pciids.h
+++ b/include/drm/drm_pciids.h
@@ -777,7 +777,11 @@
 	{0x1106, 0x3344, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3343, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x3371, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
 	{0x1106, 0x3157, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_PRO_GROUP_A}, \
+	{0x1106, 0x1122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x5122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x7122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
 	{0, 0, 0}

 #define i810_PCI_IDS \
=2D-
2.35.1

