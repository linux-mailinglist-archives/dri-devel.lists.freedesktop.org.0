Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F491B9BC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB26210E1BC;
	Fri, 28 Jun 2024 08:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="TbRQD7/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp44.i.mail.ru (smtp44.i.mail.ru [95.163.41.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755BF10E1B7;
 Fri, 28 Jun 2024 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=LaaUV0VkMf1DANwLhFBP6gjgsIuUX6P9t17fzqjEX+I=; t=1719563037; x=1719653037; 
 b=TbRQD7/9QZGOVKO1FRo50mCSdwGuMfHvJP3pwUtDiFryK16P0/shLT7YF+flHeLCZcBoEmtkrUB
 WeFoVciqe4si7nDMHKHcjoy3vPN93n3CzmMl8ip8rApKwm334b+c5fgX+YgUhnz7Fg91XxCKhkosh
 dFlr4m9tRukcSO+0c/g=;
Received: by exim-smtp-84f7fbf7d8-dklnz with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1sN6ta-00000000a5W-3MSN; Fri, 28 Jun 2024 11:23:51 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 0/1] Document QCOM SM7150 Compatibility for DSI Controller
Date: Fri, 28 Jun 2024 11:23:42 +0300
Message-ID: <20240628082343.28341-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-84f7fbf7d8-dklnz;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F96858D558BB6F8ECDBC1E4CBB32F923D0182A05F5380850407E970E300784EBF73DE06ABAFEAF6705B98F21777A066CAAD4BAB75C247D3C8D22153E7FBF342507
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E9A0F80F179600C6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F91103FA893F53AB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D838025C3A5B9412FF7927E4C5451573B752D1DD4039E1804DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC82D01283D1ACF37BAF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C643FE6A0CAC512C72D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E4A64BF2429643C8BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF27ED053E960B195E1DD303D21008E298D5E8D9A59859A8B636DA1BED736F932875ECD9A6C639B01B78DA827A17800CE70012B0FBE38D23AE731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5B5CFE3E409210B8A5002B1117B3ED69611710AED4E1E549869995D676B7B4CBE823CB91A9FED034534781492E4B8EEAD528DE7AA5F2BD788C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF642EFD2B9E647312A980CF9BD1F21904FA62FE58E6AFF9FA101A404DC1BB4AA0519D809D4148B49644A12D68860EECB74CF54DF889A5E7DAA6FFEC9055B244E7A5741F83D6A553B18100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXgIPg1gB8EuTLd17mbo9BnP
X-Mailru-Sender: 0A26D9779F8DDEABFA5A783B5DB0061BD828DBAB7F771040B951B70A5BD4BD8EDD32FCFE91D9EA90B9A8FEFFB5F7F2D5210985D6C440852E55B4A2144138A88088F510C62CFD139357C462056C5AD9112068022A3E05D37EB4A721A3011E896F
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

This patch updates the DSI controller schema to include the missing
SM7150 compatibility. It should addresses the following warning in the
SM7150 MDSS schema:

qcom,sm7150-mdss.example.dtb:
dsi@ae94000: compatible: 'oneOf' conditional failed, one must be
fixed:
        ['qcom,sm7150-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
        'qcom,sm7150-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl',
'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl',
'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl',
'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl',
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl',
'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl',
'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl',
'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl',
'qcom,sm6125-dsi-ctrl', 'qcom,sm6350-dsi-ctrl',
'qcom,sm6375-dsi-ctrl', 'qcom,sm8150-dsi-ctrl',
'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl',
'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl',
'qcom,sm8650-dsi-ctrl']
        'qcom,sm7150-dsi-ctrl' is not one of
['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
        from schema $id:
http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb:
dsi@ae94000: Unevaluated properties are not allowed ('compatible' was
unexpected)
        from schema $id:
http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

For this reason, the patch should be applied promptly once reviewed.

Link to report:
https://lore.kernel.org/all/CAL_Jsq+vL2fBJBBj13A=qgTQX1rj7tK=ybn+7tXBdpobpRoi6Q@mail.gmail.com/

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (1):
  dt-bindings: display/msm: dsi-controller-main: Add SM7150

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0

