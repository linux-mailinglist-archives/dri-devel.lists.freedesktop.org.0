Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F357AF3F3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13510E427;
	Tue, 26 Sep 2023 19:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D418C10E141;
 Tue, 26 Sep 2023 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Z9uKG6zMrZfIyQkxLI80ofshfSy00QOvkblD88IoIt4=; 
 t=1695750184;x=1695840184; 
 b=TsZZgpOUo7sgujaw1qLix0UfzOpPElpoec9T6tLSejWiUZSSUKwpe6TiDJbJABT53dUp4RH0AZ9M7IfJP7zdWVlTnyRGW5t/YhpvUVCn+kmhVjNsI9eutXXldi40n5pC9gWX1BlZXudjS8GOajhMi94EqV2moL3a6tGa12woCJs=;
Received: from [10.12.4.2] (port=42730 helo=smtp29.i.mail.ru)
 by fallback20.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1qlC5O-006ncE-Bg; Tue, 26 Sep 2023 20:43:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=Z9uKG6zMrZfIyQkxLI80ofshfSy00QOvkblD88IoIt4=; t=1695750182; x=1695840182; 
 b=Bhs/myGTEm3J+qMrYWlKp0wx+6ghY3vrDZMs4Q78N40TdhvHVw5Cb50C3v2C6h4kDWMv+xX7Iu2
 bPtZIpYLCvhRpWnkdsS87EWwhyok28JKdTkrhD7ps5udUdtEbUErEVOsdfipKQyLmF/BqGLQgbw9K
 tc71tdX4vrSV5Ra95Ng=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1qlC59-00EHSD-2I; Tue, 26 Sep 2023 20:42:48 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 konrad.dybcio@linaro.org, johan+linaro@kernel.org, andersson@kernel.org
Subject: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Date: Tue, 26 Sep 2023 20:42:43 +0300
Message-Id: <20230926174243.161422-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926174243.161422-1-danila@jiaxyga.com>
References: <20230926174243.161422-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9724621A6593A829DE8CC5FE5C15A6551ED586746534D1F73182A05F538085040FE8B072895BFDE73983094E8AC5AFDC532835674666856ADA2E51A3FFBE5FFBB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B2F1B2566C686A20EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F5B2F26146BDF5648638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C8FB011FA0803ED04E377AD6966A402C117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC5FC25ED3FCEC3375A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735201E561CDFBCA1751F6FD1C55BDD38FC3FD2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EEB28585415E75ADA97AAF5A6EB0CB4C2AD8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE362B3BD3CC35DA588AD7EC71F1DB88427C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637FFC82D8E0B5C598BEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5C1D3F42E873B22914FDDCF9F63C055A59CA7FDC079330CF9F87CCE6106E1FC07E67D4AC08A07B9B0B6FBD635917D924D9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD960616BB8431C520087BEA48F2F8A6A215663BAB114747BCD86E4D398FFBD586DD3C4C1BE61872B498C68607A7C887116AE76226CA5F7402429CDCC97DFCF3509F6894F2AE002664C41F94D744909CE4BCAC77546666B612CC0CD5AA9A1B9887EE09F5AAA95A50543082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojArMfh9+zH8nn4z7Nh13k3Q==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949814CD12929D710BEA1FFDBF3B44CD213E3DF76B9B9158B2F3E643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B42F09C957A29A94C9A7C8380B1CF4C654DF16703FB45F23A8049FFFDB7839CE9E0C19EBD0229312D88935B45718218020CF064CE6805B33B2A89BF3EF00E02782
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdPOFkVkQ4Q/lwMfyMW40D/A==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Approved-At: Tue, 26 Sep 2023 19:13:53 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 danila@jiaxyga.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM7150 has 5 power levels which correspond to 5 speed-bin values: 0,
128, 146, 167, 172. Speed-bin value is calulated as FMAX/4.8MHz round up
to zero decimal places.

Also a618 on SM7150 uses a615 zapfw. Add a squashed version (.mbn).

Add this as machine = "qcom,sm7150", because speed-bin values are
different from atoll (sc7180/sm7125).

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fa527935ffd4..cb2f459cbcc4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -293,6 +293,27 @@ static const struct adreno_info gpulist[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.machine = "qcom,sm7150",
+		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
+		.family = ADRENO_6XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mbn",
+		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 128, 1 },
+			{ 146, 2 },
+			{ 167, 3 },
+			{ 172, 4 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
 		.family = ADRENO_6XX_GEN1,
@@ -507,6 +528,7 @@ MODULE_FIRMWARE("qcom/a530_zap.b00");
 MODULE_FIRMWARE("qcom/a530_zap.b01");
 MODULE_FIRMWARE("qcom/a530_zap.b02");
 MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
+MODULE_FIRMWARE("qcom/a615_zap.mbn");
 MODULE_FIRMWARE("qcom/a619_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
-- 
2.34.1

