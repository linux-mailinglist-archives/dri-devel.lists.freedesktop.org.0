Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E849393CF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7557A10E288;
	Mon, 22 Jul 2024 18:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="yazUsez6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp50.i.mail.ru (smtp50.i.mail.ru [95.163.41.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8C910E081;
 Mon, 22 Jul 2024 18:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=+rkemg4A/7YwG9uixpwH+cXIdDvzHAfGIk4cdPqNJ1A=; t=1721673804; x=1721763804; 
 b=yazUsez6CszAJIZ+E4Q7o4kRogjCj48Ga0f+hR0njq2Q8Fql6YxABITsYboctbyf/6Eos3qMmBR
 KVqfwPD63UkdhDh8R/OYOzt4HDzPYE6DUdUfkau+PUnERcYyJr/e4xDWyh7oUgro0qAclgy7hU+Zp
 vNiEHjjeViTBwgtMB9k=;
Received: by exim-smtp-65fb4546d8-68565 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1sVy0H-0000000068S-1YVm; Mon, 22 Jul 2024 21:43:21 +0300
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
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin
Date: Mon, 22 Jul 2024 21:43:14 +0300
Message-ID: <20240722184314.36510-3-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD909E26770D4D56B7CCCBDD1BE5E962567A5A873F5605CE152182A05F5380850404F74340FE5EB5FB63DE06ABAFEAF670570ABBE4B8A48E91748430ABBF7BBE8AF3B17CAB2765D6A15
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B5C098D64B45D087EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CAA352D56883AEE98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84296535BD6A867DAEEA9110145ECC81AEC2AEBB8524169D2CC7F00164DA146DAFE8445B8C89999728AA50765F790063707A1F3761B83B09E389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC84B6F6234D9065C97F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C24F796C710B8583C6E0066C2D8992A164AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C38C9B7DB6C49B7CEFBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF27ED053E960B195E1DD303D21008E298D5E8D9A59859A8B652D31B9D28593E5175ECD9A6C639B01B78DA827A17800CE7A5E9F351D2B6D545731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5A2CEBC461A29A66A5002B1117B3ED696009739211D129F5F33EE06AFCD964888823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC6A5837F83B32382378E6EA4E9CDEE76016F6ECE555F0D5390D73A0EBEA1578D80C7DAD1783D929B16E58414F0424C7288818CEE0E697134172AF92A66CE5F5B4D3A5DFDAF9DE2198100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiOIKEewabljvQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981436F3F81E16DA28EF7A6B01B8567BB20E91A1BC8F7CB7EFEFE0723CD85807B622C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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

A642L (speedbin 0x81) uses index 4, so this commit
sets the fourth bit for A642L supported opps.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402f..91cc5e74d8f5a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2834,14 +2834,14 @@ opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <1804000>;
-					opp-supported-hw = <0x07>;
+					opp-supported-hw = <0x17>;
 				};
 
 				opp-450000000 {
 					opp-hz = /bits/ 64 <450000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <4068000>;
-					opp-supported-hw = <0x07>;
+					opp-supported-hw = <0x17>;
 				};
 
 				/* Only applicable for SKUs which has 550Mhz as Fmax */
@@ -2856,14 +2856,14 @@ opp-550000000-1 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <6832000>;
-					opp-supported-hw = <0x06>;
+					opp-supported-hw = <0x16>;
 				};
 
 				opp-608000000 {
 					opp-hz = /bits/ 64 <608000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <8368000>;
-					opp-supported-hw = <0x06>;
+					opp-supported-hw = <0x16>;
 				};
 
 				opp-700000000 {
-- 
2.45.2

