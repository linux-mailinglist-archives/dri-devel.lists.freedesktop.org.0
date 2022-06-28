Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A0755F0B6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67AA112D63;
	Tue, 28 Jun 2022 21:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299B8112D63
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453370;
 bh=U23eqdwgbh1fWzaBrh+KcikQcadXKAWQE5zohvIeQjs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MKG4kmwcSFWEpNQjLwf7ODBa2jroSUlD4Fxf1E8gMzFWV99DPaBVqnPbQ7UbPT2Kg
 ZpXD4glRQNtRuQ9J8CXmafe/5kG7AYJ5IAg1OiAwwlnIwTBFzh8MDwQFgqKhWQRdtm
 6j4v1GCam37LVhwMFeIiQXuJXfTrmWCQUI+IMqyc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N8ofE-1nc5DK46jO-015nqM; Tue, 28
 Jun 2022 23:56:10 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 29/32] drm/via: Add new VIA Technologies PCI device IDs
 related to graphics
Date: Tue, 28 Jun 2022 16:55:17 -0500
Message-Id: <20220628215520.20674-10-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RzUxnG4tSIxggVgEErreoLEklh0jvU5R0o6Uk0SGk+ifbHEEzuF
 WsKy2qLlrUvuwfynf46VF/6MU7S5mzN9KeTGFtIkSLDR5EPe5TUccQvjna6veZnPTw8bqWe
 UzkNCV37FQZMNg04KmxTItFqh/PGVuB7jwCkpNRqcbh3a11bvG909koVf6udZ+Jt2KzAlVy
 YKWMeGj+xGaBmGFyzlQJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CFOXf9xo64Y=:f7wGL3uB3nWmE91d0KR6Sb
 IQiXoeTSOuxK0bvBqLzTDEq4kAp59kNHxnkinlalv9+gEqUMgF62SxlY5UT8r0ewQkVroy7oW
 lfDiAEUZUa+H+JwvI9Og3FgUgaGkoeVhx3HOjnxasHC8twmFKb5m+BdLY8eN6DwiW6j+ackHo
 qoPbT/yW9hQauhdx4tgivD9/LBaoDdm92B2pJoeQcAUuG7UQF7h6FSWitg5GpRObrUZ/1I2oI
 8vhpSBzmSNWKMUsESbuB0wRKCCkuXt5riSibioiBaNSbxEQBKzx4JNYA3pLhp8dPVr5EIQw8G
 Hm2XMh+Ta8S9Kf0KTYC0jD6aaTohUAjYXkqNg754mpo8yvKVmrdF9DqUzB3Q7FyXdTrKACqJg
 kaI0uoEaMlz8kk/TjhuceKARnCBvh2BXX6Gvbgkqy6f9uKXmpuXHv0q6wGBEnKX85EpBd20XI
 JlT8oUwWePOaIzPSvgSEJNZsP+xgjRgkqiCQAU/Ni0SkCn7hDuu42QW6jaxo3Y+k7751isdWa
 PUVvFZzgctdEr8Yfaf3VgabfL30ZrGafSaip0v6ADB25fatUwoz7Pgm2Ib2EsCG0K1TREhbLk
 XGgtLs2GxNcv/78wF0+J17YJ8CCp57mE6KKas4Byov1e3Ww9JRhQpkV7mIE4I0V/cbqt834/t
 ndhCutgEHgTrDLa9ZGvu3EfJRTJ5mjQaB0dO1AO2Y8zxgOcZXF4NgbGnoB+7nnHWu8yX3615y
 Pvnc57Tyr78m/A56UeF47ohAm7kiKRn4brv1d294Af6RutyMJD1vijE84K+iaWZ5Rjt9NwvBi
 BH/J6pDEQ9fumBQ6rf+NuhWVql0ajRUjxx4EkbTQ+E8HLduZFdQqXhgsmON+/P8pMZGeiE3Sm
 tvCYu5ICtlDXVrDj5aiBuaLeSb35mf2rHWr3Q7ekNGjb7HNUUczLtFjOed5CQgv7l0/RKkd49
 ACvSfIGTT1Uq1xlrf/rTCb3q3NygTLMKi1H4HvobDuAwx4miSA1TpnLh4j8sWzg5u3zTZpHeI
 D74KTCQy+GGHBuVcT0pXiLqH+thIVULULWiZCp9tmKxtgGPNKlHdgGBiOjJjk4hFEWFXyDLew
 6dmpPuhX9/bSHPuSkXnMKMOgpUtWDWCzVdqxgTYlgZLmDPNJSsNcs+njQ==
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
 include/linux/pci_ids.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 0178823ce8c2..809c61a10fe1 100644
=2D-- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -1423,8 +1423,11 @@
 #define PCI_DEVICE_ID_VIA_VT3324	0x0324
 #define PCI_DEVICE_ID_VIA_VT3336	0x0336
 #define PCI_DEVICE_ID_VIA_VT3351	0x0351
+#define PCI_DEVICE_ID_VIA_VT3353	0x0353
 #define PCI_DEVICE_ID_VIA_VT3364	0x0364
 #define PCI_DEVICE_ID_VIA_8371_0	0x0391
+#define PCI_DEVICE_ID_VIA_VT3409	0x0409
+#define PCI_DEVICE_ID_VIA_VT3410	0x0410
 #define PCI_DEVICE_ID_VIA_6415		0x0415
 #define PCI_DEVICE_ID_VIA_8501_0	0x0501
 #define PCI_DEVICE_ID_VIA_82C561	0x0561
@@ -1438,6 +1441,7 @@
 #define PCI_DEVICE_ID_VIA_8605_0	0x0605
 #define PCI_DEVICE_ID_VIA_82C686	0x0686
 #define PCI_DEVICE_ID_VIA_82C691_0	0x0691
+#define PCI_DEVICE_ID_VIA_VT1122	0x1122
 #define PCI_DEVICE_ID_VIA_82C576_1	0x1571
 #define PCI_DEVICE_ID_VIA_82C586_2	0x3038
 #define PCI_DEVICE_ID_VIA_82C586_3	0x3040
@@ -1452,16 +1456,20 @@
 #define PCI_DEVICE_ID_VIA_8653_0	0x3101
 #define PCI_DEVICE_ID_VIA_8622		0x3102
 #define PCI_DEVICE_ID_VIA_8235_USB_2	0x3104
+#define PCI_DEVICE_ID_VIA_K8M800	0x3108
 #define PCI_DEVICE_ID_VIA_8233C_0	0x3109
 #define PCI_DEVICE_ID_VIA_8361		0x3112
 #define PCI_DEVICE_ID_VIA_XM266		0x3116
+#define PCI_DEVICE_ID_VIA_PM800 	0x3118
 #define PCI_DEVICE_ID_VIA_612X		0x3119
+#define PCI_DEVICE_ID_VIA_CLE266	0x3122
 #define PCI_DEVICE_ID_VIA_862X_0	0x3123
 #define PCI_DEVICE_ID_VIA_8753_0	0x3128
 #define PCI_DEVICE_ID_VIA_8233A		0x3147
 #define PCI_DEVICE_ID_VIA_8703_51_0	0x3148
 #define PCI_DEVICE_ID_VIA_8237_SATA	0x3149
 #define PCI_DEVICE_ID_VIA_XN266		0x3156
+#define PCI_DEVICE_ID_VIA_VT3157	0x3157
 #define PCI_DEVICE_ID_VIA_6410		0x3164
 #define PCI_DEVICE_ID_VIA_8754C_0	0x3168
 #define PCI_DEVICE_ID_VIA_8235		0x3177
@@ -1470,11 +1478,18 @@
 #define PCI_DEVICE_ID_VIA_8378_0	0x3205
 #define PCI_DEVICE_ID_VIA_8783_0	0x3208
 #define PCI_DEVICE_ID_VIA_8237		0x3227
+#define PCI_DEVICE_ID_VIA_K8M890	0x3230
 #define PCI_DEVICE_ID_VIA_8251		0x3287
+#define PCI_DEVICE_ID_VIA_VT3343	0x3343
+#define PCI_DEVICE_ID_VIA_CN700 	0x3344
+#define PCI_DEVICE_ID_VIA_P4M900	0x3371
 #define PCI_DEVICE_ID_VIA_8261		0x3402
 #define PCI_DEVICE_ID_VIA_8237A		0x3337
 #define PCI_DEVICE_ID_VIA_8237S		0x3372
+#define PCI_DEVICE_ID_VIA_VX875 	0x5122
 #define PCI_DEVICE_ID_VIA_SATA_EIDE	0x5324
+#define PCI_DEVICE_ID_VIA_VX900_VGA	0x7122
+#define PCI_DEVICE_ID_VIA_KM400 	0x7205
 #define PCI_DEVICE_ID_VIA_8231		0x8231
 #define PCI_DEVICE_ID_VIA_8231_4	0x8235
 #define PCI_DEVICE_ID_VIA_8365_1	0x8305
=2D-
2.35.1

