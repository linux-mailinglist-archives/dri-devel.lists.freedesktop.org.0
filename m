Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8579393CB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7A610E279;
	Mon, 22 Jul 2024 18:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="u/ofT6VM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp37.i.mail.ru (smtp37.i.mail.ru [95.163.41.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8666110E081;
 Mon, 22 Jul 2024 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=OPm/EdnXheNgF7FGrsEGZgL6qdviqwNABtAR18c6H0Y=; t=1721673802; x=1721763802; 
 b=u/ofT6VMO/QE4BhoYP9QDjLHZTE6D/pMbOEtCKmYYwfvkDzijBYvp+ABxMXSZtM/YTxS/jL0xJJ
 o0a7T3J5/qN8F75i3h7uaaJ8VlMNKTYb1vJzd6wmIyP92Kq6wQwJeaSmB3D0PsAyFS9vNl7rmDR4q
 5PhIqkwCh6MIsVLTa3Y=;
Received: by exim-smtp-65fb4546d8-68565 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1sVy0D-0000000068S-0LmM; Mon, 22 Jul 2024 21:43:18 +0300
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
Subject: [PATCH 0/2] Add Qualcomm Adreno 642L speedbin and update SC7280 OPPs
Date: Mon, 22 Jul 2024 21:43:12 +0300
Message-ID: <20240722184314.36510-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-65fb4546d8-68565;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD909E26770D4D56B7CE050A5E50D666DD0D1FDA9CE13C33044182A05F538085040A2FFBD098F5F787B3DE06ABAFEAF6705BEBB65AA4D12FC2F48430ABBF7BBE8AF7F64C579677A1242
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7904AD829351C4442EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D99F96657F58F1038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D7F4317D09BF9B40EEA9110145ECC81A5B4CF0192991BA58CC7F00164DA146DAFE8445B8C89999728AA50765F790063735D2385A5E2B3AC3389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8E753FA5741D1AD02F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CABB3490C75E892806136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C30EC065BD0AE56831BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF7EF884183F8E4D671DD303D21008E298D5E8D9A59859A8B65FF0BFC5AEE34BE675ECD9A6C639B01B78DA827A17800CE7A5E9F351D2B6D545731C566533BA786AA5CC5B56E945C8DA
X-B7AD71C0: F8D540627A99B4FB7DB86BB5CA128351461DD7A0A9FF8BE1E8F7B195E1C97831E896A1E74BEF4DCA99D32A3E8D98C3BE
X-C1DE0DAB: 0D63561A33F958A57738EB63184333AE5002B1117B3ED696B4A40075F92D44171BDDAE3D1EA49BEA823CB91A9FED034534781492E4B8EEADEF0AF71940E62277C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD75DCE07D45A7499577DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF0A3ABCA45B3627C90D12FA681051EA9C84AFD540A386D13DD03F8F74A4750CD924DE828755D94EE916E58414F0424C726D9B744909E6DAE7172AF92A66CE5F5B5DF44ADC15825ED48100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXha/rcnMLv+KTLU88joHekl
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981436F3F81E16DA28EF33F69C7E48EA1FBA7A408BA37DB7622AA1143A990D0E1402C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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

This patch series adds support for the A642L GPU speedbin (0x81) to the
Adreno driver and updates the device tree for the SC7280 platform to
include this new speedbin. The A642L is used in the Qualcomm Snapdragon
SM7325 SoCs family, which is identical to the SC7280, just as the SM7125 is
identical to the SC7180. Therefore, the SM7325 will use the SC7280 device
tree. Patches for the SM7325 will be sent later, but in the meantime, you
can find them at the following link:
https://github.com/mainlining/linux/commits/danila/spacewar-upstream

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Eugene Lepshy <fekz115@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: cros-qcom-dts-watchers@chromium.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Eugene Lepshy (2):
  drivers: drm/msm/a6xx_catalog: Add A642L speedbin (0x81)
  arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280.dtsi      | 8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.45.2

