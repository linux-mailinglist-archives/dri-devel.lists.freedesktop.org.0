Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125649393C2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC5410E271;
	Mon, 22 Jul 2024 18:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="OulH9o9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp41.i.mail.ru (smtp41.i.mail.ru [95.163.41.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976310E272;
 Mon, 22 Jul 2024 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=ckiLPsfgWLYtV8eCRiqxvPazj8pD6PAqaY0xnFqMvHg=; t=1721673802; x=1721763802; 
 b=OulH9o9CkxJ4FHUK8SPSpcZSbP0nTNu4OM3EQ8rTSrZf9hM/GIWqZpcVZIa/6UWHZdddkxHRkv/
 fY/5X8eOY2DfquDjh3zhSQ8Z8XFUpU5lym0kom+yHfIBZ4pVRvByuyxsRvJZTK+5dq/uUVzfsfj27
 odKGbNcoYxgAu/nuusU=;
Received: by exim-smtp-65fb4546d8-68565 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1sVy0F-0000000068S-1vIq; Mon, 22 Jul 2024 21:43:20 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robdclark@gmail.com,
 sean@poorly.run, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 fekz115@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, cros-qcom-dts-watchers@chromium.org,
 Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/2] drivers: drm/msm/a6xx_catalog: Add A642L speedbin (0x81)
Date: Mon, 22 Jul 2024 21:43:13 +0300
Message-ID: <20240722184314.36510-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722184314.36510-1-danila@jiaxyga.com>
References: <20240722184314.36510-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-65fb4546d8-68565;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD909E26770D4D56B7CCCBDD1BE5E962567A5A873F5605CE152182A05F538085040F0F80B61667D01C13DE06ABAFEAF67055FDBE47B3E6A5E4F48430ABBF7BBE8AF242CE91CCB49B96E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F50D2638D9B46FE5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370CE92FB8C11ED3D88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81E94834882A825BBEEA9110145ECC81A22F05A9B085546DACC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8AD74539164518AE5F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CE6BDB36F057AC83C9735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C35A87C19D41235D19BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE7A5E9F351D2B6D545731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5479AB7759459A11B5002B1117B3ED6968B666F38A997E59B47A99E6294EE8661823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3F14167CFCFE6708BCFB0934B948D7C73ED3C2987A6945510D753EB2493F531DA0D894938C2B729C16E58414F0424C7233402F1660DCF847172AF92A66CE5F5B66389DE01A966B978100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiOw1HgDt1ryww==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981436F3F81E16DA28E504BCEC120683F15BD7E8EA988E412437F8BE30599730E962C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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

From: Eugene Lepshy <fekz115@gmail.com>

According to downstream, A642L's speedbin is 129 and uses 4 as index

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506e..99f0ee1a2edea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -869,6 +869,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 117, 0 },
+			{ 129, 4 },
 			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
 			{ 190, 1 },
 		),
-- 
2.45.2

