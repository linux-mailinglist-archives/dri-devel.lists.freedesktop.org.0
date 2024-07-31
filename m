Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994129435C3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 20:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F910E652;
	Wed, 31 Jul 2024 18:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="x9JvpaD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp38.i.mail.ru (smtp38.i.mail.ru [95.163.41.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1433C10E64F;
 Wed, 31 Jul 2024 18:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=f+lHgijBViiog2wbs80C4DR3drBALkeguE83lnYNhzc=; t=1722451566; x=1722541566; 
 b=x9JvpaD9CqwX5k2DU2vvd2TychQ34FXFLaMF1NHBnv0SHkaAe10hc9YLKvMsDQMTjCaa1Al96K3
 ezyE8bOpDe6bbf8OnPxdO5b1lgrXsKQNP99e3scDyYfbNx8r0S8CnEOrRadINaEkKXUN+NdE85AsY
 aa9P8pdzuGkZlC8gw8Y=;
Received: by exim-smtp-5c6c85c787-dzmgd with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1sZEKm-00000000AEA-2sHn; Wed, 31 Jul 2024 21:46:01 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robdclark@gmail.com,
 sean@poorly.run, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 fekz115@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, cros-qcom-dts-watchers@chromium.org,
 linux@mainlining.org, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 0/2] Add Qualcomm Adreno 642L speedbin and update SC7280
 OPPs
Date: Wed, 31 Jul 2024 21:45:48 +0300
Message-ID: <20240731184550.34411-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-5c6c85c787-dzmgd;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9C7DD05013CA63362BF18B36FD939231F182A05F5380850406DD657F80B0BAC3F3DE06ABAFEAF67050B69D64FCD6D39210FD0310B1A6FC1CEE5BD31BE838A11F7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE757F64E7FD849EB4FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374E88016F1B7D8D248638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83B8852E31B8106584E40561C81143144BDADDF5849C030ACCC7F00164DA146DAFE8445B8C89999728AA50765F790063793270F7220657A0A389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC87BD21ED50D08CA4DF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CB2DECCBDF547A30576E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B120C23C05AEC2B18EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE76631511D42670FFE2EB15956EA79C166176DF2183F8FC7C04E672349037D5FA5725E5C173C3A84C361DD96311B40C2D435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5C18F2A3FACA200B75002B1117B3ED696EDE7E9A5CBF811DC54BB1175C6E7DD94823CB91A9FED034534781492E4B8EEAD619183A7BD6BC6F1F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D54AF47762AB4810619
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34980A6B448CFD1B8AC54EE019682A910FDF1150C1D50AA9285A25826F80F6501AF4CAA1C3482256DB1D7E09C32AA3244C81D539AEE2879AD077DD89D51EBB7742C9BD42142E7FF225EA455F16B58544A219BDBC76D41736405DA084F8E80FEBD322CFFF16B4474ECB4573B60270F1EB7C214C2BC1176D5C25
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3sHc+HdFS244w==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A5B90ABC46C0EF5F4825860F061DF2142FDDA702506AA14E88DB4CD5F07DFD962C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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

Updated: The first version of the submitted patches can be found at the
following link:
https://lore.kernel.org/all/20240729201843.142918-1-danila@jiaxyga.com/

Changes in v2:
- Add Konrad's R-b tag to patches no. 1 and 2 (Konrad)
- Fix subject prefix for patch no. 1 (Bjorn)
- Link to v1:
https://lore.kernel.org/all/20240722184314.36510-1-danila@jiaxyga.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
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
Cc: linux@mainlining.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Eugene Lepshy (2):
  drm/msm/a6xx: Add A642L speedbin (0x81)
  arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280.dtsi      | 8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.45.2

