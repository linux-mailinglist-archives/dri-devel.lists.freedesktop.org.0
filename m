Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404EE55F0B8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66F0112DE6;
	Tue, 28 Jun 2022 21:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89307112D8A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453366;
 bh=Baon/zEAgxoICOMctw2qAfrWR3cher/M6GL6oxC5jV0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=F7ytxCMI3mw3EqbR971j1/RWmJD7TF/1RIHOugG/bucbiAfEHw9+5sUOK6T85RNlv
 iX01Wu2s/c4YAnZFWWEgnexSGzTf0vFql9yuJm8OgMDG4lbRDUIoSv4JALeIZOJ66M
 r4plLZREU1clfNMeyUxVNInTvBqtJxivHu+fYpxs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MuDXz-1nnOpM2RUj-00uYEr; Tue, 28
 Jun 2022 23:56:06 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 28/32] drm/via: Zero out chip type field
Date: Tue, 28 Jun 2022 16:55:16 -0500
Message-Id: <20220628215520.20674-9-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/IcNBj9VpDyF/X1XXJdrfBIqvJCnsjAM9BZE8aDEnSA64TdGY4y
 cw2gxAdYbouSOsDU97D9gcszcBSdoykueIYhkNhFNwZCIUimHn4VfVrdfog/ViWCKKeS2NR
 iC2phNayvvg72Q2WWru4w4UMetBuCewcrVUGmK+EzCie97QQ1G/fZrqM298+imeTm8VRM+a
 wbHT6PiiRVB4G7FZnst1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jvucWZ/gno4=:7RqbC3UAbsXp20Gfeumc0T
 pSQ4Nc4TI7QEtsYUHCsfZ+2D9OOjtGEbQWnmE/tsREgkjjiorvUo87OLLtPOOtw+Ds6KApStr
 B3sYO1en9Vau4ACBgkfYUj0licqT7QL5jjTsxOdGaQjFt7HQWpBjsp5CryiO3qUCceSF5btUX
 3ObAv57zF7Fu2StxQzurWtBizoClmE5sut+bm3Rgy+ANbSHP3iEUB4SbrAzex3Bfrhco4Otlw
 lvDjEg6BqN90wPAAf3JsXiyl9DwwbGazf56PMjOAOB51sWvv4pM78wFuGr7Yqb541QB4mAYrK
 8xyqRO6MYCjeqg5tjbkPdHGwiZKm44JQA2/XuhlCdVcUc6218KjdFuvmRSTnqa7q5DNT+GHYK
 OAeBmiScWsL8ZXrl2llwcSzhk1y1NF0u7/T0qxG6hwcy15/ssGaw8msKAnMBA99RCKnBQgRer
 yoh6eK3lEMy/P9yVVRbrIVFfLLj1HUM+BUveIr2qCRFfO9pGgDrXI43s3vsSeARbZAjGU+2S7
 nOg9TR0lHSJDSytAUAEy0RgGFhd2FwbbmJaICP/Sm3CS2zQ4+Il/53hO0qt1ht87P518NnZMk
 fi/qSRv1ecThyjyYwDBAvIK1bbKLgrAaD+n61QLphG93yBJpwRAaEkHXlKFoTmpg4WvU1KXNq
 HthldZf5fSBV+ZpYhJY4aCzXJNRaetzYk18gPs2w4D1TBPVQk2Sr+kvWc2g0paNBnTZR0BEk5
 oqCQUnHYmxBncKMMu2z5IvrT6ttOqgy4/NHMBhSX7h/X1M0Qly49daJNjWVAIQVL3+V/5I1nE
 Mofpx6wtsSudin5UT7z8cpJGp28JOb3uX47Fn5uEdGG8jiqOUcCoekuPLUu0ecALTNoS2g3Dr
 1rVRGi3r1BQ4pbzRFLc1ar1bkcsAnQ9PZhL5QrzbT0PVsgZyY3ERozzd4FN5rAGFUxV6+zrXX
 AI/L+iCRVY59F8cLuZKe8e0J1/GNG8Nhff/iOb0tiWUEHG0/Z1GpWiR0MGUoTB/yt0UDMiZG3
 XVI6XUMruyugj7pd1tkONW41jDNIjHJgsT31S5vfMWJqCsCJ+x14c47mabuKyXm6fHYEyuNAp
 pKPLwLnxPfjhkzW17RPpSc6nq0+B/ayfQUlqGxkomo+tU4oMGiIQxSZWw==
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
 include/drm/drm_pciids.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_pciids.h b/include/drm/drm_pciids.h
index e91b93d635fa..a4567d2918a9 100644
=2D-- a/include/drm/drm_pciids.h
+++ b/include/drm/drm_pciids.h
@@ -770,18 +770,18 @@

 #define viadrv_PCI_IDS \
 	{0x1106, 0x3022, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
-	{0x1106, 0x3118, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_PRO_GROUP_A}, \
+	{0x1106, 0x3118, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x7205, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3344, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3343, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
-	{0x1106, 0x3230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
-	{0x1106, 0x3371, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
-	{0x1106, 0x3157, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_PRO_GROUP_A}, \
-	{0x1106, 0x1122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
-	{0x1106, 0x5122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
-	{0x1106, 0x7122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x3230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
+	{0x1106, 0x3371, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
+	{0x1106, 0x3157, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
+	{0x1106, 0x1122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
+	{0x1106, 0x5122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
+	{0x1106, 0x7122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0, 0, 0}

 #define i810_PCI_IDS \
=2D-
2.35.1

