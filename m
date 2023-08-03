Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E676FAEB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FBB10E689;
	Fri,  4 Aug 2023 07:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1222 seconds by postgrey-1.36 at gabe;
 Thu, 03 Aug 2023 20:08:12 UTC
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8DC10E0E8;
 Thu,  3 Aug 2023 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=iTra02Ediikpqje5A6Bp6qJxv4AcXgJrNuCR+ibsPzA=; 
 t=1691093292;x=1691183292; 
 b=BoNxVkws6GwQbB9Mr9J8dEpUPOlLd+HAW2erOwAxN7VAWMBQTg7RHdHE75QGoaCyFmyDFrKXVTZz9kNHLFL2c4vw9ELKycisletX/Yj3PJSUJeNDJm2AJrf5qT+boMcK64EFm9+9weHlUpqrvJeULfaVgP+PBP/DTMyPQb2OCf4=;
Received: from [10.12.4.30] (port=43586 helo=smtp55.i.mail.ru)
 by fallback23.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1qReIW-001rTu-AY; Thu, 03 Aug 2023 22:47:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=iTra02Ediikpqje5A6Bp6qJxv4AcXgJrNuCR+ibsPzA=; t=1691092068; x=1691182068; 
 b=LtJ1Zwfzp1O0mmZNPC/2GtDgssRfheh+seNTqcmSQP4DCM3xmp8TsYzp3D1ijLJVWjRK3SNTNxV
 ogfABAUYvg72couU/PhlBD6oJfI1DlZYOcTE1/twqaXCBiy7YIfjWZzX8FaI1SSQM5cMiSh5l5kho
 +keuEiPYfFOAuhDy8dg=;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1qReIF-000Y8b-1D; Thu, 03 Aug 2023 22:47:32 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 konrad.dybcio@linaro.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 andersson@kernel.org, quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com,
 quic_rmccann@quicinc.com, quic_jesszhan@quicinc.com, liushixin2@huawei.com
Subject: [PATCH 0/2] drm/msm/dpu: Add support for SM7150
Date: Thu,  3 Aug 2023 22:47:22 +0300
Message-ID: <20230803194724.154591-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD969E04B5EED670DC804E38A5F9341E5D89B81E0241E25E490182A05F5380850404956DBABBA104F5FC0371154B7EC49AB4725CEA1E008296B39AA2D5375D91353
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063702DFA59B3C994360EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBAFE95369BFF9F28ACBE51E9D3B700B82ACC7F00164DA146DAFE8445B8C89999728AA50765F790063741F7343E26298569389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B4B51A2BAB7FBE05117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF09122B91796FF21F76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8BC493A577044FAF45D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3E478A468B35FE767089D37D7C0E48F6C8AA50765F79006378869069EDD29A933EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A559534B36F856F636C6B9CF6467323EFF3FE6D546EE1A1C12F87CCE6106E1FC07E67D4AC08A07B9B02A336C65186350919C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1C9BDDA6ADD3F3559C0B754327D96BA611C6B588A75B544C32CBB7507AF2458966401EE05C14F77D8553022043D0BC9A573643C06B71491413B3302F2BCC8771D8EBEDE01CE1B1DA4C41F94D744909CE4BCAC77546666B612CC0CD5AA9A1B9887EE09F5AAA95A50543082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXjcAvAxsrA9Nc61Ffb2ik/x
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B7B6FBA8BC574666C2C88AB10BE24B30A02093AA449391CF643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4C2CC63398298511D1E4750FD930E01DF28F9632845AEBDC5049FFFDB7839CE9E588CC25E272B312A963AD72AB2970178919A6105FB5EA3FE856E214AADB1F5AE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFd3RriuhA+6EbCfILZkkgHmg==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:40 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 davidwronek@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, danila@jiaxyga.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds DPU support for Qualcomm SM7150 SoC.

Danila Tikhonov (2):
  dt-bindings: display/msm: document DPU on SM7150
  drm/msm/dpu: Add SM7150 support

 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 116 ++++++++
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 277 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

--
2.41.0

