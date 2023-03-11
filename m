Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666176B6034
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 20:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4DF10E2F4;
	Sat, 11 Mar 2023 19:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback19.i.mail.ru (fallback19.i.mail.ru [79.137.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CFD10E2F4;
 Sat, 11 Mar 2023 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BZHrmXHooBHBzJ7xzaKmftZSZW/lc1mfFtx72Q0OxZw=; 
 t=1678562869;x=1678652869; 
 b=wktyu0hT8Nr9O+SAHBPdqCF3v4OMG/LpUUOVDWI4/xdOCG804QkkCdpAeuJeFOVZqKn1+bDTcyHe3N3zkmgv5eDs0mF4a6y2UjdwmoO8UpetMGCjV7SkJzc/EOtfr0CFJ7ZkAqEBFa8arJx8NdNojlqf67hZAV9CIGqTJ3hhofUh0MIgctecHlu6fT3HDwBZx5XMqD5t4T5vP5dsobzBWhE9EQhX6CH3WOHHwLJcvU293OFYAvsufsIJ4p8T6JsaSwds0ol3T4Lsiw/3QDim3Ym5CyaI1AfS0sHNO3E4WXh5UvlZWjCTRpf/DI0c3AuB0Vlpz0KA9r9hPlV5Q2trZQ==;
Received: from [10.12.4.17] (port=50264 helo=smtp46.i.mail.ru)
 by fallback19.i.mail.ru with esmtp (envelope-from <listdansp@mail.ru>)
 id 1pb4sc-002TbO-TL; Sat, 11 Mar 2023 22:27:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BZHrmXHooBHBzJ7xzaKmftZSZW/lc1mfFtx72Q0OxZw=; 
 t=1678562866;x=1678652866; 
 b=iMOQxDLbpDQ53AObWdSef/3cIEUVfGDsdwWN+QgL+yNrsGKf55NwCX54t3yXnNtVmlFhaAfHj/YpALs+X/qwQgEMa4UoGFQRRElf0X7wnweVc1qdhwjlb4p5LYEBAwEHpt7mk4PC9xJWBWEv+Ruo/HPlAQCI8N0Df4ecsnEPESjB5lCPW3qIcZoWQgqE9RhvF86CwP4FbtyNncbprs48e1dnjspTArUvlxjEKZkgKm5u/V+2NxZGLAWXSHZCv5RUTDF3lPxeU6Alkrp811OGl51olR3B4knP2cI7pZoX1QZh3yKs8A/u+S47JBAZySj5OrKGZonOszPuQ4jAdnykEQ==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from <listdansp@mail.ru>)
 id 1pb4sW-009MrY-5w; Sat, 11 Mar 2023 22:27:40 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: 
Date: Sat, 11 Mar 2023 19:24:56 +0000
Message-Id: <20230311192456.5049-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD8357B8315801F980F14B9D42377418D05A81182A05F538085040C7D51BE8E8538A11F9E60AECF469F930C6D0CB8F7F63F90305125E322ED0A613
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE758E3775C3D7FDEE4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B3D52627AD81B52CEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CE1CA6374C6F582DCBEB4C20B56EC30D1D20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07D67B4EF99483F558941B15DA834481FA18204E546F3947C0A8848C216C621A1F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063720B98183C2705A48389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063771C096C7811E1B4ED81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7EF6CAB536A63D322EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C35D1D84EF68E022EA35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5D0AF7D534C1A9FD82EBA5D7C35C38010FA3082BA5DC876D94EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50566C7E17B4235FBC
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349FD10E01B3CDC9E2A16A07FAC450D13EED25CFDFD77B8BA11AD2B169EFFF46362BE2CB9F62CBD2BF1D7E09C32AA3244CBB316D4ED7A8B47BFB5CD07E6AE9EB47E8FBBEFAE1C4874C27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEg2t1XEOuWEsDdLCEgOjsA==
X-Mailru-Sender: 4CE1109FD677D2770147F6A9E21DCA7B6C381540EA0D600016D1779D33C86BFE3528923D21CCA4FC7E3C9C7AF06D9E7B78274A4A9E9E44FD3C3897ABF9FF211DE8284E426C7B2D9A5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BD2EB812D5A6E5F7D3C1BE093F4DBF3E2C2E764F14C8543A049FFFDB7839CE9E5B90EA4D390E2144871C238F45AD43F1B9F7470FE21DD05D121B01A618E02894
X-7FA49CB5: 0D63561A33F958A51E5AA1C6686256F931978ACE5E64601A19F791A520B682B0CACD7DF95DA8FC8BD5E8D9A59859A8B6580BCED469A045A2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdAc2jUOxWGfyFCbo9Cu7zKQ==
X-Mailru-MI: 800
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danila Chernetsov <listdansp@mail.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Sat, 11 Mar 2023 19:00:03 +0000
Subject: [PATCH 5.10 1/1] drm/amdgpu: add error handling for drm_fb_helper_initial_config

The type of return value of drm_fb_helper_initial_config is int, which may return wrong result, so we add error handling for it to reclaim memory resource,
and return when an error occurs.                               

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d38ceaf99ed0 (drm/amdgpu: add core driver (v4))
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 43f29ee0e3b0..e445a2c9f569 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -348,8 +348,17 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 	if (!amdgpu_device_has_dc_support(adev))
 		drm_helper_disable_unused_functions(adev_to_drm(adev));
 
-	drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
-	return 0;
+	ret = drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
+	if (ret)
+		goto fini;
+
+	return 0;
+
+fini:
+	drm_fb_helper_fini(&rfbdev->helper);
+
+	kfree(rfbdev);
+	return ret;
 }
 
 void amdgpu_fbdev_fini(struct amdgpu_device *adev)
-- 
2.25.1

