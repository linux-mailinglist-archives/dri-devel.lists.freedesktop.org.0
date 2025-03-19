Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97DEA682ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 02:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E32110E21E;
	Wed, 19 Mar 2025 01:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mail.ru header.i=@mail.ru header.b="kVcs3TF8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="IiJ4pCXg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="dAmc6D+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1340 seconds by postgrey-1.36 at gabe;
 Wed, 19 Mar 2025 01:52:53 UTC
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAC210E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 01:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DQCFAM9lCL+U28DYM924W7SaElrNdTyrSLOhjmGNXSk=; 
 t=1742349173;x=1742439173; 
 b=kVcs3TF8EY898+bW/NDLDZfjbdhGFWx3cLgo8xbklfpG5nfbX5yRHaU5zUCC57t1o8olJQeGJxN79VRGNertG2wiZVaZv+7ui7yupc3guYnQhwsGa4jJ1guHpJnoX+THgzI2wAh4s7pMr866zEsZtxDn91HweUMg9mQBu5IeKshxYPrc7zFIzWqyKA/yVqxQtK63L7m0MyXCjFrqw20j2/T1JtNGpprFX1uCTZu/rO+ysK7q5HgPcpUZPiiqu8aFBDKlPHxdgS9dIz4v+he/I46RwqT2e1UgDK6OGah3KoTXe4lePIZ+76TAlKr6bHhKzZxVckqpgl8HtwQLt24hgw==;
Received: from [10.113.102.152] (port=43438 helo=send193.i.mail.ru)
 by fallback1.i.mail.ru with esmtp (envelope-from <listdansp@mail.ru>)
 id 1tuiGM-005xDX-3L; Wed, 19 Mar 2025 04:30:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=DQCFAM9lCL+U28DYM924W7SaElrNdTyrSLOhjmGNXSk=; t=1742347830; x=1742437830; 
 b=IiJ4pCXg4AfEOOGTwMobsqtIzT0ze0t+E0lw6ay1LidxqsyUAiW2Z1i/HIgmjCUh5fypMIhdesC
 /DalNdCIVJymo+USqb8/IN+/n/x/1JVAgPYw8UGeM+WYrKI5I3ky3bRG5K8gXE1d0L+VeC6MCFDgH
 PwQ0+PIuhOOXYwSousjIJBARHrazuHhus4YjAUYOYZYj+nLK02XPbUswYthLBAXlkJBDGLiN8q7UG
 I1Iu4GVRMuUSy0iM29IzWjCC6uY/3mqPagDH7GRAoke7DidnV9Sd6lrzi3AXCLsJcQEBJ+1MWtrgq
 l+UX+yqpNMwaHh85EyxKGnXqP8cCCKPhOggw==;
Received: from [10.113.30.196] (port=59898 helo=send128.i.mail.ru)
 by exim-fallback-6464776d59-78sbf with esmtp (envelope-from
 <listdansp@mail.ru>)
 id 1tuiGD-00000000JSQ-4BSE; Wed, 19 Mar 2025 04:30:22 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=DQCFAM9lCL+U28DYM924W7SaElrNdTyrSLOhjmGNXSk=; t=1742347821; x=1742437821; 
 b=dAmc6D+4TlCdXdtgHF7mIBdat0H2EjMflLvdsMZI2HQHDawPXZ1CVbzbIpcOor3yAoil5FC8XmV
 iEFmH4aUDkj826hkbrKzW129zhMou2a2BlQ02QGu185NzSk0Q0PVfnSSZHLAA4EIdoxbhv0mxk1vs
 /5tyZT/3X/aSkMIQxY3RMyAAJtUXlg6Y9iuXwXu4KyAOyKmWqf2sCD96rM0Q7K1o7ERgu2YYEIezh
 FSGFCxC/NuBqkGqv1nzoeRQaRN8lYD+XrS5jTGRZI4kpLAMncxe9u5Gyno0ti5Yaua7kzlNqDIL55
 8Ji7zaoJLqHgvKZR9UM1K1tvWcPt427TfoPA==;
Received: by exim-smtp-75f69ddc6c-pnrtw with esmtpa (envelope-from
 <listdansp@mail.ru>)
 id 1tuiG5-00000000PPN-1cvv; Wed, 19 Mar 2025 04:30:13 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Helge Deller <deller@gmx.de>
Cc: Danila Chernetsov <listdansp@mail.ru>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] video: fbdev: sm501fb: Add some geometry checks. 
Date: Wed, 19 Mar 2025 01:30:11 +0000
Message-Id: <20250319013011.467530-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92A53477891B5879391903109A9D0D29A31D748B7FE4207A8182A05F53808504056B3C179AB07C38A3DE06ABAFEAF670551F34B6FD8CE1313B054EFE8F857472B88175C04187C9AB8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EED5D2FAB4CEB1EDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756669110E977E60A390DDE063079C7DE9B6DEE8FCC7DBC698C3DEF0B7FC4421BA488EEF46B7454FC60B9742502CCDD46D0D2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22494854413538E1713FCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0A3E989B1926288338941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0B83D551921E9B07C7B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050FB28585415E75ADA9BDB03A3F2A65D472B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B879FEEE447AE6B9675ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A59B4B4E856118068C5002B1117B3ED696B1788331E2055B08CA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD6804EF05EF4ADF2AF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D547F664E23DCAEEEE3
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAA126473E47BC90F9C6CF5E6E1B85290E5B076F4D704DCF67CB3ED72FC25F9F7963129249CAA680A2701A83583C3480B58FD69F3FFFF50478030E653C82BB9E2C27DA63A30B97F9E77C8E16086367389913E6812662D5F2AF72BBD4AC8FF0C4E5649C4772AD793FE964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtHIdr0D9enK3PyRtIJglXQA==
X-Mailru-Sender: F244DC1430FACE5461D0E33575193BA2C4A9CBBD4259EA5BB951B70A5BD4BD8EB565BE4243F571A0A2696B57CA31463DC53BD13D3F6EEB2F3DDE9B364B0DF289C95E31D8FCF52BE1594FB4C9F0DBF4120D4ABDE8C577C2ED
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4C75C13076030B6608AF98B5E2C9340AB81EE9F95CB2F6EC0049FFFDB7839CE9E3337106F1C21E3612C85ED3F52C7A0D5DEBDABFEB967CF78CEDD8BB06B10C9A99CFE24E88BC8310B
X-7FA49CB5: 0D63561A33F958A59BFE1A69477604485002B1117B3ED696ED6F8F2DAD88A98C8DB33178460FA33B02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2KA+lO824+/glJpyBuU9Lw==
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4C75C13076030B6608AF98B5E2C9340ABBE3F2237FD3B192B049FFFDB7839CE9E3337106F1C21E36151BEDB2FC6C166BC9D4385133651DFB020C9366BFFC891F4
X-7FA49CB5: 0D63561A33F958A5219909E4E00B2E1C09332E22BD679B91C2A9E6853C58F549CACD7DF95DA8FC8BD5E8D9A59859A8B6DAB914CAD2FD2DD5
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2KA+lO824++T8dyEyUqE0A==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
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

Added checks for xoffset, yoffset settings. 
Incorrect settings of these parameters can lead to errors 
in sm501fb_pan_ functions.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 5fc404e47bdf ("[PATCH] fb: SM501 framebuffer driver")
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 drivers/video/fbdev/sm501fb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index 7734377b2d87..ed6f4f43e2d5 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -327,6 +327,13 @@ static int sm501fb_check_var(struct fb_var_screeninfo *var,
 	if (var->xres_virtual > 4096 || var->yres_virtual > 2048)
 		return -EINVAL;
 
+	/* geometry sanity checks */
+	if (var->xres + var->xoffset > var->xres_virtual)
+		return -EINVAL;
+
+	if (var->yres + var->yoffset > var->yres_virtual)
+		return -EINVAL;
+
 	/* can cope with 8,16 or 32bpp */
 
 	if (var->bits_per_pixel <= 8)
-- 
2.25.1

