Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6958088C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73FD10F81B;
	Mon, 25 Jul 2022 23:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDD210F7A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793297;
 bh=Baon/zEAgxoICOMctw2qAfrWR3cher/M6GL6oxC5jV0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TnPMYMMxt8fBgde42ubboAp6sxcau2bgZT+8mD6ClmtLtI5FKpodum2LKbmIPFr+i
 GTQPWVzU9UWPD0VzmFeaigvlrlO1tapH6qWt3fU1DF4qnsD3QQYrezc8nhUNRjSTjo
 QiqQueVinqp/WF3SkcG2i6J7W9QQgc3dmMOR0+Sc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1Mg6dy-1nYp8o18V4-00hi2p; Tue, 26 Jul 2022 01:54:57 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 28/32] drm/via: Zero out chip type field
Date: Mon, 25 Jul 2022 16:53:55 -0700
Message-Id: <20220725235359.20516-9-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rQ8WPtU24TnGA+zSf7xCaP5Mr79eDKe3088E6gZYXW5vI/pRBRK
 BAa+65PWRkHZ2tgeeMeXAx9izdkDtJDmHB6SWVVEODaXrnE4g2WJs4TcmUrNSwlKca247rs
 j2j8MCs/9z8gZ0/727JU5gfOuLG0YK+IL76PZD4Cl5MBZ5CTu0EbtLVYd6UPGG/Bb570thm
 SK67gkjm5854Wp23NdEXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n9bjYZJgUlg=:5VJnj0WzaT9MSiBF2frhGd
 g1XdJnazlwsuqOwUUsNh4rW1FsEhJkbyP+9uPH9yoMU4Q6urL4kY0bAc24gfTzryrUQhjfENx
 jUOi6EFpRycP+E+Hqdsu2SRzojMtVsI0r7hnH9TNyZ5x+n+6yNeFE1+X+ag3y0mgyM2r18SMP
 N+EciEHpwIMvyni318Z+pRTm8J/Rv1kBPX/FRdBxCVLAREQ/MHb4EgGZngCcrcobBUkPqF2XM
 DkJ0CVR8MM3fCHc2e19FVTXwmYstBu+TKpPnegHBFEwSippFFEdgN/KhuMJLi9sonJPiA30/0
 4NcGikEYb8azdub4rYaBi/SEYMtX/rSNC+ivPS6hj23IH0GsuX/jn+ugM/8BAMFyAg71uYoxg
 JFhPSwxDmeiMVFjaxFUPJlLaALMVxzrecXbyC9Xm3IFCs6o3d581csv4A9ovrPEmzoRpidzss
 0CNTC84FjfWnM9NXYAMtXhdbup8d1XyhJ5VS85/XuUEXi9+yjq29bEyk7SFJlifUsPmHEV3Jx
 H12hxb6z2IiQuslaVU/Pwd25oMbj6AXaqSgB9tzsAa58ty1j9zC0cQIDTUQydpSnfNre+2GQe
 plOEMwyhrEOHd140W1ewzXw9gwBGs3zA75DsEaQNbEc4XR4KZrtSTlcBudFe9PlnU/w95v+ip
 SyLYFuDZyC3L/4F0sis+AYaVwLnU7/1rKeOVgLzYLWrO2Qe23VN4uVJyFfTERLf3zW48zBwu8
 rPn9mCmuWVJGE7AmvHoz3uwwVk3O7flMojwLeZkaKbIZ9iSh6d8xnLhKpsGbBZt+YSgtHQDhU
 ThHNWqPOQXF9G8rjJpSw2h5CuyA9B04wXC52lzJVqDTpvhHbj7b7OKTrpOpOCELoiX+AbqFob
 XBIyEEbarF4SNDbgPt9pCKbqZuuHISyypDJiy1LiIsbX16vLO162wEEAW+3rEWaGMidDRsYzy
 ZfQN3C5JHJW3mNRmyjL1FeUMJs2ZLGZKKahc7v6S1pVF8im1NgGFUHNwScJWrNbb3h5fd3Dwm
 1iWzZkXtCaHHfhgf23+jKeCUhgfwmNWMrG5wS1Z/qLliLZ2GW/ySeXast1I1KsANoJfrG33QS
 zfCFc00gFz5C5wbXWA4KRe9FX5GROZZwezeL5FWGFRS5z1iDVqX8adZYA==
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

