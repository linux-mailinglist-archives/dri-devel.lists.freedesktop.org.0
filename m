Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABFF9B2169
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 00:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B010E07E;
	Sun, 27 Oct 2024 23:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="bzCEpCEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-19.consmr.mail.ir2.yahoo.com
 (sonic308-19.consmr.mail.ir2.yahoo.com [77.238.178.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C210E07E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 23:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1730072542; bh=yJCYqSm7LwGTlChhrqvuB+UmCXNmg0OaNKeo8NprQus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=bzCEpCErinkSNWETUhJ5/WGDjfapcpuYTXSVRQc4RVt2nqLkCjPyl+R9QmKo3f6Gnzf3qaVPOnQgXpbY9XmsF37Q8pZTQ6qs2ymR3p0s5FIQt0DwFBjG2s1Nl5nznoP99wq2Ih72NSoZ7R5FCuVdZWJOHiYJYyR/w/jSIl6NaLHfIyxzJPxzVHtO/vmexuikAcnXLZccOnl2y8DAzcNWChSLTIfMoBi7evww+6/1Ds3PZc61nxzDIlDxpSsLQCweyUqy5k/9qik+YzrvdnOWUgRoIEii0UJbv/Z7tpupKCYIFA8L4JUP2JLi4UYiTnLTHKWt8JV5q3G6bdYKmjzdBQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1730072542; bh=IBYGhJHX4HlTDBPjxrly13aeSxR4qWh/ZgKkIhQ3jhj=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=PkI3T0Qe7SzL7jppPbcpI7lMbEQzhm3xMQCdzwq3IE8KoecsK+sAKLPQZgXCV2U7Lyl8jgQGSgWNj9G1SS8I7pmQ6f545sQe+7Ly/T4+lTeAtz4LgF0bmSPEkHNp0lvlC+4z9kCbQvLkmB+Pk5DSvMnxXoC1YBZkTckY0M4mAcecmBreAjkk84J78qUmP9JpsR/1pSjwXU+bmzpxNWL5l4MbGgyZBAT+OxXdDMacT93ktLhgMTJQROYY2dSpcihXVcFt3uQaXiMSgLJm2PWkWs4yajQtZVAObXG1BGd0FhnN7yZn7IE3HrZdDyHN4X1RPzzsIyHSViNnlPjg8eESkw==
X-YMail-OSG: ZAQA2a0VM1mO_2Ijeb9OPsOsm3XQOlBXBgD2M0FE_IzEdVONseo7P54X2EflOqV
 e9b42AUE4JBfw2_47039yk7cN2uf7ukCyWrgzQH4GyvjvgLKGGcMvZAlf0SE4ZfXjpzwtTjhGfkG
 9WsbF8L5t4swNCffwjQXvhnvjDShlKQOu7J7R3rapAU7C67ZALYI3z7dMK9naM1K8j1TgDmnnVVH
 Ay5Nm1ryWo2lAD.zV9vsD.PYIPENyY2CdS3SFIBJ3ykztSrsk9VkAW8HdS0_DqG92kQYRKRYkeSs
 Pos8XdMRdm5iSrUVweNt7W7CJrdeQ1zJAtuHEEnrLniQu1vSTag5OuiOJ7haFHE.QUAO.cMXOW88
 0Utwv71eNmy8UKgoKjzlBusnDwOQdrsJ0Q9mA3_fJnfIMJlXgMpks51D4Otre3gf4ldAm6RXfvxz
 LfatJHdKKTOHsygvWnJZNYTVges.pewpN8v_SzowY_VTDmcBuF_v3pWcCBwzwCRLWVbfO3AChkYV
 umomggGgHuR5kiItihmNZcZ_4dQN_Isp3F8tJINuf4UiQdj09FZnr_XqIeKsS5.Jt15HCyZ6OuLH
 1IiE9e7LGdiZAEoz67VDXq.ezuy_sZ1mAQ1OwTsuHqOf3hMEmvmJ6EiLdLM3W42rVMt7SzMzY7tt
 fqi.RsnAtw6aQTsBKZt9HUWg6G9LD5UIMDo4910wHOP8TflB48pHOP7MdlU_r4wZmdfHQfb8TDZZ
 ZCO8Q32HUTaLwcegKhVqWNpWBo2AjQ6XyqOa2w28VuaZfJzz0wxWkOnmUnoMLPIukJN8FoxFwi64
 Dx7J5XGCILpNA1xWbcYbmDlFyafN2Fw5Tf95KwIki2NRLQAeHVpp7AWLyy9ZiXEK9GeID2_97wPT
 pkkeOOX1BMqzZ3gz_C_y9jVbnMgu3gxXcCwhjZXCFDcIp2n6_iYQjag20Y9DpTw3TbvnZuapSDJL
 Yz5gGaw472Pcv8xbVGJtxqhKdGR_mc09Wzbui3A75vDpTeaxavETfMyYJzM8Lc29B4KnAMDsZ1jC
 jVKBOB_5l1w7Tnm1OulOdr217VHGCrOjUU9ffV4PDcLEOd6scuzB0PMBO2Le7WOZB6X6hPVQrwVM
 y8wDvgJiJTp.6QtdclaCJoMOd8z78ko35nTFf4XsPN4VNNtDcRB7tuZd0woXbETF1j2A2C7xktnt
 yHiucJDgb9nlM8x0dfUaaExK780Saj_Dqf8H7_OElQPIhhbWmAfvd_QfCG63h_G1AUzoC6mkCDoS
 NQPtemXtySRkYtxtA6LNB5zmci1i4m4rUWp.djg180iaPotwTHQSSpQv7w6WXkQYRmkqLZfMkvtj
 nceLD28R.T6Kl823Vjw4r.oK1MgkO1vtNmJqPS5I3ZlGSWOXnFnD3WflyQ7x3OQ3F30hzqO90Vq3
 AY94IMPcTZUbpJOu7YVdLSZjjasLVgoyRkRrsVCPo5DwGuH9lo.NucGw8t_1ff5M2SIChCrzTwh2
 pIQOi0PoTPVGcL3NYOwHYT9Lpbo8tck0iqnJBFfpUVrU3wko.8VPycybG1vyy8MTV4zm5zFagG33
 rP9m_ew5SIs4ILIWDO0AKKqlz8AcX0FMjIm4CttFHVgjr0SlD_H8LymhZt4QsSDAnWYibUhqyU98
 DCa2V6Zfgr4J2.g4wUDWNHj1Ud3LbuKiBtGk0TasAejoa1RgG9wGw5aG27KRRDTky4naDHvalyX.
 NLRIPxagy4M2T351GHxw_gABG19YZ9INdfupGFAL0xN_w3ucbKkHyoP93OPCTM18d_aQAIQ.vHDb
 c.R72a4in3bTyKEaa.YXm7Tb4p1NxiuZJsW1dXh73IPuzjbUam3CGK9SmOm4of1ZXmiT9MIgyub7
 QElqH8pM5RY_QdtnBbiygUqxaRJu4EW.G0rcqn6Vzxp.SpBCCGPWeLmYLCLbBfkLZIon1updpeTG
 1aP6MN9Qs5dA1Q191tJug1ZNTUW_GHQKopY1_hjU_XY2uSUENNT9lEjoNLmuPULXiabz8KZbR6Bx
 pM.sz9mCG8laX1XMAdO8wQIQI55XHPk7m9zhqmr5Zmya9wE0.xoR9F0v.WBCeDS_SIW7PXBBZrTx
 jqt_tmmOmc7r9wZgke0qlwY8yG4byUW_y0nti1wRQbZ19gMgHLgPfEffRCYZzhMTHDqEgTYfvDFv
 9hxDRAMgEhT35P7t2qP2P2R4jQbz.7YzY9QsPuqzH4MNsdcrMBNBOPqaoUFcFLGYR.zp5N2ASuSN
 WQoKuOWqo4sOpFaPKAebRvlZhga7VjpjVGmTIr91sz6jQOCINXm56zWW.Z3gVmr4n47XPPo91vEX
 cgHjLAFFvrrLEd9KWCxDIjiR7LHyimRzt5HYFi7zDxg--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: d810178a-fc4f-4e58-9cf5-ea8200886f27
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sun, 27 Oct 2024 23:42:22 +0000
Received: by hermes--production-ir2-c694d79d9-qzm27 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fc681596c483b48011d8a98a0d7203e6; 
 Sun, 27 Oct 2024 23:42:17 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v4 0/5] Add new panel driver Samsung S6E88A0-AMS427AP24
Date: Mon, 28 Oct 2024 00:42:01 +0100
Message-Id: <cover.1730070570.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1730070570.git.jahau@rocketmail.com>
References: <cover.1730070570.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The discussion in v3 was not finished. I send v4 nonetheless as a new base to
continue the discussion. I hope that's ok.

Changes in v4:

 Patch 3
 - Removed include <linux/of.h>, it's not needed.
 - Added comments to the mipi_dsi_dcs_write_seq_multi() lines in function
   s6e88a0_ams427ap24_on().

 Patch 4
 - New defines for payload data length, thereof a fixed and a variable part.
 - In the array s6e88a0_ams427ap24_br_to_cd[] made the comment about the
   columns more clear and added an additional column "brightness from".
 - Array s6e88a0_ams427ap24_aid[] reduced from five to two columns and
   s6e88a0_ams427ap24_elvss[] from two to one column. Now they hold the
   variable data only. I kept s6e88a0_ams427ap24_elvss[] as a two-dimensional
   array to allow using the same memcopy procedure for all three buffers aid,
   elvss and gamma in function s6e88a0_ams427ap24_set_brightness().
 - In function s6e88a0_ams427ap24_set_brightness() initialized prototype
   payload array for b2 and b6 commands. And in the memcpy commands below
   used the new defines for the fixed and variable data length.

 Patch 5
 - Added a comment to the mipi_dsi_dcs_write_seq_multi() line, according to the
   other lines before and after.

v1: https://lore.kernel.org/dri-devel/cover.1728582727.git.jahau@rocketmail.com/T/#t
v2: https://lore.kernel.org/dri-devel/cover.1729630039.git.jahau@rocketmail.com/T/#t
v3: https://lore.kernel.org/dri-devel/cover.1729738189.git.jahau@rocketmail.com/T/#t

Jakob Hauser (5):
  dt-bindings: display: panel: Move flip properties to panel-common
  dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24
  drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
  drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
  drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

 .../bindings/display/panel/panel-common.yaml  |   8 +
 .../panel/samsung,s6e88a0-ams427ap24.yaml     |  65 ++
 .../display/panel/samsung,s6e8aa0.yaml        |  10 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 766 ++++++++++++++++++
 6 files changed, 852 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

-- 
2.39.5

