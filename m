Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F59995AE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56A010E149;
	Thu, 10 Oct 2024 23:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="PmBP6Dax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-54.consmr.mail.ir2.yahoo.com
 (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5482810E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728585121; bh=n/tvy3eaa7hpQdsikDBcjlcovlL5UeT2icM5mxukvR4=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=PmBP6DaxlomiIopxgdoVYqzEPWjWjN09QInv+nAmSSm8q3j1/fl+Bs3K3bHPif2n+dgu5cM5KJ3+jnSLBV91zNOMWl+yz7k04ILKowGk+WE9TJKDM8OAACNiTCJ/VI/onIeZD3urZqTLH2MMzQxUlkxP0kECgZQu3hgrF9ug/zvowZ3MU6/mfRt7my2rkO8QL/jOC8S1rfdaqrjj1GmyMEW2F0PepFZflFAtosovq6gjm5vtDOOwhVjaTBHQPvebs+Q/YzDwnPulqOlHXWpUh5aci8PqxSU/uZ7YLDN7WuR5TCGtkKaFssihBeKwnKqOuPBLQ18BdKaik47QOnTFXg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728585121; bh=mvJLWMSQ3vPnPP23qBo19cvqp1kOsYrzy/9MKdSHmVq=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=i9FN1sv7eEXeSYPYovJlxYXv26GqY+FQ9VpF7noiYyb2n8lCcdVB9WxahIUiiZpZNwK7szdDA2tHkGm5KMERn5w/Z99T0+f/njxnhDp8oX4RKN4S0vCelQUh4LU/e5cMUivygjezpnfDB3wKW3UH8fc4NC62oj5Ervgzh9fpV+Lvh9dQ0bzIU2BxY334qqmIoYro9ReHsvO3qO6pKnDn9jHxzLvmAdZImbfhO8L8O96lhjcOvqFnAyjCl2ESDdf2D152iZPGhMS9qE7P5fLGJOtWmtVxPdJQol+DwIUnobAkDVa6ovd14YcbyiTc621mR0C9gJP6Otqc11rHWJninQ==
X-YMail-OSG: kbn3XXQVM1kZmoWwUXLc6s6dTfr2Ycpjmwb4ohJ.lDBaRpcGEnnh3RZo9rKbBBL
 sUVxjqV5DQsL_8m2pDvN0kfTVxVbydYjEktLGapkSfLX7ytXWVDmF.LmQTloivSLzI1VC9lkN96p
 qlqgiKHoodhQ2xhJ1OyJGEsLeXVhXgTOJbkp9kG4XhDaUZamh78gvavzfQDPK8BSGem95UcwXfY.
 Gb_007RcpnMIDDzYHzF5UsKSvvqIlDaaLu14juNCol8uYllHpKlZ2nOCwQOaxK6NsCMCcWsCj_7x
 sXfaOjyu.uxF9ORtrl_ONdvqBElimvWS1TBGlPgByht_S1QTDe.5kDyrdHrBBYPgAvAtcGpVrilU
 sHdxXYJzjAWl58P79mU2rJeMEzD2LO.GvsVFTHlySUPG2p.M3CDymAHtIcxkoGxN5oux1KGhNcjS
 wo_wkHgtDeEzSEtauIR9DEWa0WT3HnqdyCX9kX08eOw72s1giKdb_cDBJtUjQ6caJggxyjAsunxz
 GfPPC5hqldFQstiGM718isSOa2H7jtPzA_tfvipbnd3_Bgbh8cboKzyUxQQ53LPhfX8KD6mmFNL.
 v2Au6Wk7fsZXOe2RRO5zAEHTXyX6I3sZ9TcJlZidg6KnOlhf6Pcr6IJAG3aSNAU0C474IA3b3cmX
 sBISkLNcEKShge1P6Llftxwm_o0ZGVXPPS89e6HLRMAO4NskvzGbRHHdwatf0v1sAU4i5W4_n5lq
 4d1ipZjG9Jryq8lU8cG9CfrRO66Ht3BATL9z_e5KyfPkCayRTD3hcP6zGFTQrv2DmdW_Htz27ID1
 HIp9SVrAiRbrsi3Ah2xCKvhOtWNQpwMfr_2hfgEmINpzsNKn_xg3bgBaXHwMpx7Pihl3KSivHtWM
 pvoVRNT6uMnL6q9K_KhWBqqcASoXuwpR7iJGXjN3G8woEFqHKQAwVrylsW3u0Upo6sOx_vrXTJ3u
 tvpO4wU8i0cz8qyoJdNH0Vk4v5kV1mQsibhQZ5ElL6keqw0R85s6ndomGaFoSYDr2f6IDRwMPGdK
 hrPELe1.b0qG47SRolj0s6VLtZwlj1PlWFvt3zqtMXtI5S5LSUjlfoEORTshNOZujc9iVO9XbjJr
 AlEkubvUCQ0517d26hRwKXi8forVSMsmc5Cv2NJye0i1VwSrGnzIq2_yt3SbI9.VlaEi2bheU7ry
 pB0hmUKRH7LbzMcAxBA5mPbUhKZsU5JVpUBMdEFy9r.Yq2nHMdc649.aESCGmpdlp9GjkAu8niSA
 qHxRCucTsyoAdO0StNbkSIisMA59tTq2_U4DAQtY7Wp9V8iJ8kKtj7ukEm.1jtnrh6asovUQ_MhC
 W5Jj5Y5C.LJzgIoPaAcOyg734XghsX6bdTycF0rwSCVax6OApg_85qa5m8OhZCXbGPE0Vv_fNmp2
 ikAuT99LuzNKKW0nz.hG1NA0jjEy9cb9xIGHscdhq6UaC4gtx1XIuu.m_1dcN_HWe68nF_Ptm_uk
 K_6qnuQv3d4h_4yWUoWbliVyuamEgYOEJalj0dbT4zjjJLJa4PYkduKr_Uhstb1SpYHTELlOwnCE
 163NVZI7Nj.iBdHLFtB95gJ5okP0KFT.TLXXsgfetS06K8_bnRLynx0pp5lbGh1oFDD64EUwOXD4
 z1kwDkSy5XJe2Iay.TzeHsek.Qw2zpweD3Xi79aawSz0LqGVqCdgZN20gv8rtOZZNmItkNuffO2G
 JvCVNji9QxYaOIwqaSnI4jutu8SRYrpybTuyfEeIRIv_W6dK0bnf7XpyxjujNHUL6coIWcFd6qc.
 uG1mMfXlHHdGImMiy0KF9FoAqwayJ0g_WhO_H6SQz7dsqhA5QskOPDewsWWxTYgtppIfmCzv2mpk
 fH.RGO.fEj3vcmYpi5PDmC_G.sRA.ptbTnqjoUce.9WcD9g5sR2I3HgfcqL8Ul2KjWkHqHpL50i6
 9SPhgtPSpzycbkQ_H_V8QzSkKmuKL5KtX_PJXXeAyIIr.VXQD2jYMhiniQlRpiqxid0r4Fd.s7my
 YyM_chA30jj._RsaTIOgeIckK_90msvL02ei47ZRG_cYV34Y3myl4ctOgRZCRncYI2Yrr7u23BfG
 whGQfLoat5pMFvsRQaws.1o7q6MK5U6K6DDfVf_4ROZe2_xGXd8cmztCTud2b2y3wLOa8CE4dh4V
 UY0NP_QHtmwTGjYlhyBd2vGJW9Ab7O6h_HCDY.9cHmmiuoEHhZLJreSFGACPUyKZFEWMtN.P1y3.
 CyMo6fg77JLxd6VpunJ7mTkItaRKmiepj.cuVWdXpM_Tal42QfhdDFkDuYHJN0B_xK1DF38tOfhs
 uXkGRb.hzy8G28w4u25jlHdhdfz7w_aqNi_yOAZcJaqxx65tdKg--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 4380967a-7ae5-4b12-9cc6-3e60d744e2bb
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 10 Oct 2024 18:32:01 +0000
Received: by hermes--production-ir2-6664f499fc-97g4x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7a7b462d09211a1a6528a42ebeb90f61; 
 Thu, 10 Oct 2024 18:31:56 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH 0/4] Add new panel driver Samsung S6E88A0-AMS427AP24
Date: Thu, 10 Oct 2024 20:31:47 +0200
Message-Id: <cover.1728582727.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1728582727.git.jahau.ref@rocketmail.com>
X-Mailman-Approved-At: Thu, 10 Oct 2024 23:20:22 +0000
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

The patchset adds a new driver for Samsung AMS427AP24 panel with S6E88A0
controller. Patches are based on current branch drm-misc-next.

Jakob Hauser (4):
  dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24 bindings
  drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
  drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
  drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

 .../panel/samsung,s6e88a0-ams427ap24.yaml     |  68 ++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 772 ++++++++++++++++++
 4 files changed, 851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

-- 
2.39.5

