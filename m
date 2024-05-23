Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041388CD929
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 19:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FB110EF95;
	Thu, 23 May 2024 17:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="OZEMrSjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042AF10EF95;
 Thu, 23 May 2024 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1716485453; x=1717090253; i=w_armin@gmx.de;
 bh=ml1OIk1ADGSN0Bv7BhxFFCfB6DaSzESeZqgOlINQEik=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OZEMrSjpRCpZNHtDzlmr0mM8Z76qBOA47wRnpJmk2+GZMBHSY6dP+E6IS3bEoTr2
 cs+oUuQy6G/5SvY5rTw8Y4m4iXXGV6BByaWCGWeZc1RDfIyYW60ml8hUXkBJuuWbR
 2eN02l2UPaMHeIxBNBZdsLPCIBXuqaDAa44rc9aHt1ZvsYQQ+BwwG3DCLd9GCm5Pm
 /uxmdfHru1oAYwc2U0wyv1Ncu0C9Ob3cogxQe9ivAHrnSuP1JrV4+STZBeD5jkpdm
 Z9fIYxGnB6mkMUrCADchMsYPBnFJG/ZcZeXjzw5ZT1cphv1sTax4iraSdQLg3pNO+
 /nzBoUi8mnC8osS14w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MMXQF-1rqbKE2jRP-00Jbrc; Thu, 23 May 2024 19:30:53 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 gregkh@linuxfoundation.org, sashal@kernel.org
Cc: stable@vger.kernel.org, bkauler@gmail.com, yifan1.zhang@amd.com,
 Prike.Liang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device init"
Date: Thu, 23 May 2024 19:30:31 +0200
Message-Id: <20240523173031.4212-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0V9lwu73H77PqAdjA+YQOQLM2+3KzTTl9zrsb6I30uhUOPxiA1p
 JLJxYqkyMKgStNVIay7ID6KI216ZNz3ubM8XYpSGnu66EzUxT8sXLASfudxjjdwKULpb7VC
 +Y+O7sbY7kIa+IPrB1Bw1Am+litWkoWWTdhMITaXxEbvfBMPo2yyoGSwkhR1eikF9FRkxYj
 COK97gWxEtIP+rgPugzrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MEiYmEz3rHs=;s9mwmp1yHhBowpawx+LtT7SZ6Xc
 Ns4RuJiZEs1nwVj7+WoUd9e+kWZr+Q0o40l2gyQyVx+Pl2AhW7RyQm/C0NZkNySFBi16uJnV/
 BemqPt4r78N5j8CraYadRR6IObRjM6HL2dE8/YKrMW+CklnchL769R8NeiXfL2iXv+rCx2r+Y
 XTVhHXx8okDrATK3JQ3OC3H/roKRKle+RiTf1okUL6bVDnpHel803nNn1ICSfmdIWhT321T0B
 XA2ml4Ju8vSBABVVh1Gwglv9bKYenJQO8bJmG5ysh25OG7bHVeAEdrrYSVEjESKfjZhs7Nq1n
 sPlYgVJva9HRzdjlHxWUWpOjdoqBIYq8KiWPznMcS3Ter+lVQZxW6kUBL9lTbcilBF1R/f/J4
 HCv6Ju9Kxt2jADK6R6SiBLGaN2H2oKuSWJLDdG0nSrWRuNt6eiJKETz9CANksjBxd9FFeXNA/
 PodgJ2iVj4FG6GPNapewroNC/tnPTe/aMOVQ9w+eol7juR8TRHXQpkUl9bQ8hgdoIJdUGa58v
 9mOxJkLta5cIil4bx4+1UcJn7ECpCDU8yes3PgS77R+aCbyOdD2cJjBMEdf7tJuDstRUkcmz5
 Uodv4dP8MOVzqailVNOE/Ho92XCj8tq6f3szvD0/vl29vB55RvqEiONdDAE1DOMpCZNKgoUq8
 zjqbjpkAoU8KZSpZgVJrT4a09iftR3uezi6AZwgO3s5I7lpelCfl8MQ4mjS+h30cN0kT7P+8P
 dNTWt0CfmaiIJX0Kf7BbjwEGtAD5/cYSl1pE2k7K+m0VJe5ofQkupObwyW33SuVq3VqdJVIhe
 eX3Ipoz8hnS2ekmUIwv8izc9Jv9clbiX5TyCloDiFll7g=
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

This reverts commit 56b522f4668167096a50c39446d6263c96219f5f.

A user reported that this commit breaks the integrated gpu of his
notebook, causing a black screen. He was able to bisect the problematic
commit and verified that by reverting it the notebook works again.
He also confirmed that kernel 6.8.1 also works on his device, so the
upstream commit itself seems to be ok.

An amdgpu developer (Alex Deucher) confirmed that this patch should
have never been ported to 5.15 in the first place, so revert this
commit from the 5.15 stable series.

Reported-by: Barry Kauler <bkauler@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_device.c
index 222a1d9ecf16..5f6c32ec674d 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2487,6 +2487,10 @@ static int amdgpu_device_ip_init(struct amdgpu_devi=
ce *adev)
 	if (r)
 		goto init_failed;

+	r =3D amdgpu_amdkfd_resume_iommu(adev);
+	if (r)
+		goto init_failed;
+
 	r =3D amdgpu_device_ip_hw_init_phase1(adev);
 	if (r)
 		goto init_failed;
@@ -2525,10 +2529,6 @@ static int amdgpu_device_ip_init(struct amdgpu_devi=
ce *adev)
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);

-	r =3D amdgpu_amdkfd_resume_iommu(adev);
-	if (r)
-		goto init_failed;
-
 	amdgpu_fru_get_product_info(adev);

 init_failed:
=2D-
2.39.2

