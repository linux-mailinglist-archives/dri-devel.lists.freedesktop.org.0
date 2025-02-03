Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C27A26302
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285CF10E54C;
	Mon,  3 Feb 2025 18:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="UIiUeAeB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="U9tlos31";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wsgCZ7of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C67810E10A;
 Mon,  3 Feb 2025 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=hNUlaSjLD2fieTGT0/gRn2hj/MiYDIt/2ol4Mx0bwrs=; 
 t=1738608625;x=1738698625; 
 b=UIiUeAeBx6DuIaBMXG69Wz5CubgLnbyXt8YkTrp+fdAnvB3OIVa/FjCGmIt9YpXGAyu9/jUYiBtAUgL4iqTGjWx9hgODOgWuL1nkYJdwo4aKZzwYzi1KOsHRdELoR81bt7aSVqG8AW2E9wE2yf6em2D9TNIh6AV4svSWENE310w=;
Received: from [10.113.13.55] (port=35852 helo=send288.i.mail.ru)
 by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tf0yX-007znP-5y; Mon, 03 Feb 2025 21:15:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=hNUlaSjLD2fieTGT0/gRn2hj/MiYDIt/2ol4Mx0bwrs=; t=1738606513; x=1738696513; 
 b=U9tlos31HzNzhBGj7ySc00VuA7XUCuzJlxCM+xYgpWdmDTROFHf7HFdevrlQKDkRXtToNS9RwuD
 Sdsk27zmwG5u8xHCRAYf9XrhT7cBTZI4jNj+H5z4IuPASjVb6L3vXoAMb4hkdJ+H1hjJwTnhZa+YP
 8AkOrmI+9v0uAZ5aMsU=;
Received: from [10.113.108.225] (port=51976 helo=send264.i.mail.ru)
 by exim-fallback-5fbdbdcb77-kfcqj with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yU-00000000LVi-3q8h; Mon, 03 Feb 2025 21:15:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=hNUlaSjLD2fieTGT0/gRn2hj/MiYDIt/2ol4Mx0bwrs=; t=1738606510; x=1738696510; 
 b=wsgCZ7ofrZwNc7aarvFKvqKm1Kux/Va6nICY4Se4o4j8fQUPeNE25sDBA7ntWZzh545r11BJR94
 xcnUriY1MY6RXx4CfJQSDns3KzHLeoT6+qcPysyGw0PWQR9GFQgONuSIP83rYMf01BlHiST4Yhrpo
 tpwtmgfenhtKVyueXwE=;
Received: by exim-smtp-6d97ff8cf4-crh4d with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yN-00000000H1P-2ADK; Mon, 03 Feb 2025 21:15:03 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Date: Mon,  3 Feb 2025 21:14:26 +0300
Message-ID: <20250203181436.87785-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203181436.87785-1-danila@jiaxyga.com>
References: <20250203181436.87785-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF2193CC243B11556D4B3C007C06E5751BCD62213F67905E7AE1F780C93E56FA9FBDA1AADECFE04B8565CC196C3175128C65DCCD7B30B55D1D08D917D6130B1AFB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE710FC7AC39A8009ECEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637188F5654332B449D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B0EF9D3E8EEFB2DAA51576F636F323C9E2CFD7CDDC172CDACC7F00164DA146DAFE8445B8C89999728AA50765F7900637028599BB38096F4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC82A336C6518635091F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CE3786DD2C77EBDAA302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3C684FCBE50122300BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE702706FBA10211704731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5BF779EE9C618DDF85002B1117B3ED696B3B47762849A712CAD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADD0953842B444AAC3C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6FE39054988326B55D2D4141BD8046492A61992E18A1F3B4394A5AF4B4E5F767F93E7F6CC6F26229C56FE0738BD31C0487767918E68E070E139AD299E36D96928A9D6FB80EC15D6C354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL0wwTINMkprWQ==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FF5005910AAC18673965EDF11CFD47EC7AE5D3F7D347CF81EF76D2938448D34C12C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C11582D74B19986F8F049FFFDB7839CE9E725523CC1EE150EB7E6FF731A84735F07BF684E5825296F65BE45CAF51F9F3CC0450AC7B8AF98805
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqf+jS9K0O6j3vnsmttD4RG
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E725523CC1EE150EB7AD2D96309B4E434535F7DB67FB21C7452B14559BDAAB44D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqf+jS9K0O6j9yqHyU9iLcO
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

From: Eugene Lepshy <fekz115@gmail.com>

DRM DSC helper has parameters for various bpc values ​​other than 8:
(8/10/12/14/16).

Remove this guard.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fda..d182af7bbb81 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return -EINVAL;
 	}
 
-	if (dsc->bits_per_component != 8) {
-		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
-		return -EOPNOTSUPP;
-	}
-
 	dsc->simple_422 = 0;
 	dsc->convert_rgb = 1;
 	dsc->vbr_enable = 0;
@@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 	drm_dsc_set_const_params(dsc);
 	drm_dsc_set_rc_buf_thresh(dsc);
 
-	/* handle only bpp = bpc = 8, pre-SCR panels */
+	/* handle only pre-SCR panels */
 	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
 	if (ret) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
-- 
2.48.1

