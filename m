Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC99AB880
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FF110E215;
	Tue, 22 Oct 2024 21:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="D3nkxIwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com
 (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6A010E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729632824; bh=JMNlRzCgDYxTAmHWxKRK/+FCIfeMeIE1yrfGOvvhnxA=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=D3nkxIwjRYeL1I4/a7L+GaOM9EZFZK12kvsr8GLpqyj3aUj8UdA4AFfE4WrDM4u4QGPxqqiOWyNSd+mlPURhH0T5BZl6OlxZToUxdX8kqivfkUYCkn4g0aVMuOsonGJTrNyl9GgPhWziq+TGwVQvnH/sY2XxzsLl9Vgbpw4fW2YSWA87GMqk7bnpvG/+RbpvlIO4ckoqyQ6tE6yI/zo1FAQJEoOQI3wi7wwl37IFREtoBC3cUw88YhKczYw25vLKUNOTOzAMDlAltsVlA4yQqLt/YJ3P7nGT0EM2r+2j/6koYqv+Wh68+aeGuJeGd4pX0k+hhj4Mtkbq6f8JON0T8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729632824; bh=wwW5KZEjtKYbQ6bLiwR7SLaE6nNxaJg9mUj9UiXa9si=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=g865l1TPkY5pMW9gIwK0N+RtpmxJqYqks5GF52CCgjRL67/iq+6aSGYYwzRFD3i5FLGfUj+cwyTKox/FA1nMuz6DrJQEjYVpiHK4Ec9tJcv0K2hGzLiV/c0/wnbzjKFKKJzLey5bPQgPaTUHyZGl9/POTFjkBeGaE9s2Ez/FrNyHUrcCnnNMkEW/higGYBA5GpFYcrYCjN7MSRup9apgKIgughQ4HXoeSodac9t6o4b0T7jt9oh4iX7Dp/lJjmMKZB6axm54Y7ftxnVrjKCD8sPf2ChK5IFhSNwMVMFQlF93k5FWwfQzwB50wiekPcNpj12WznpVQiOZiWmrCaiOYg==
X-YMail-OSG: hy3ZTRYVM1mSWALI_hUBZ0zxLJ_.HkO.LqazF0TP1YBbHlhW.rVY3uE9K42xfUX
 2g4kn5e4pXIUl9Ly.EdfHqPWUw5l1GuMnUvpinawkc2wCGDvrkCYYdl8MTw4loyITyjyb0DTWEkH
 YW378V1SL1oh8FXJBaNSVUrZvC5UZz8GXLVQEjteq89K8werRYFlJ_i3SWpPb6eOiOODRMUchNCw
 NTSzMiGRQoph00AQ6OhtuZvleYnTluDu_6y.lCH3IfC4MfSW7YzM3ZgO1zHeq8Fjb20i9Rmrq9TA
 NbMRkYFmkud49Xj4gOWXa7m_rPEa4WJk8F5BPyoEJ62mUcsMBqqQ6j01oB0HgwAd8tFvVEp99JIL
 ngJRqX79s0Dsi5ea5cZs_KH_Ke_Sow2isq8kHIVnEf4ZzGMtpM5JPTP.8wL4egXKfYh3nSdcdtko
 JiqxGCXURCsWE7am5LgjjsZsL6xEe1FnG5hwDBFYifyC6XDp9uxyNer1MTiXqObhZk0RpkSo0VBX
 72XEjjH8u8U16LKishfojSJrR7AubDNzq6YIeVrrIIffuY8Rnm7zcOrs1oqreROrqlJpp_ctg8g.
 4_BNpg7mN6z.pVFsHWI_g0QzbhW3uCFK08PtEaau.tYt7QVCmEf8UXD7peb0iSgJsGBaEsV5.YuR
 _DE860VcFr8uDhTrHbu7f0oU0h4STPYA_BOYhDxuSfB.v2qxPTMmcrgd_EdORpsXvln023Gxmakt
 hvzycT13Fs6YJZCx6TbFJf8O5eG16MNm5ywb8z3l2pRXciM8lmCTST6DKwtnRtEeKptqusLCffvR
 i.xEA36BFASJzxaUzD_TVyKE.85AIPMMud.ZZis.E1AIWS5emOu57iK41ms8sXbjxlWJu_OyCk7d
 Xfz1lb2meno3M62mCgjc0fzgpNd6oPE_2mm1QwCdLfNKBcuiKNukStBNLYHXqmvR8uHWSrJnx_bw
 fCrVbvmjFPP7D22N2LQmNl3_ZEDzwJDv.abcQuG0lLnecqi6sRoR_6722Fg13HM3I0qAy47RfAVn
 6iN9dy19cIjYF.rhIl5utOrRW1noyhpOKpBIBF2LIkhzfCcLqL3yaBT64jAhx1MehY_nAu5iEBhL
 o9dU4Rk2MX9Xtaew2C0I7d0LfuE6ZvsitRHdhXDemlqq6iRiHG3xm6lUoO.QnE49A51lur5QTzLf
 9vhJGTx3c7OJ6meH02Tk0dyOiW8nElJBiGxvjsKLZvkxFHEBh0fQUtRcPS_bteI8KoVZXUiWoaZ5
 _6mszcJit1QVS7P5zKt557ml1T84i.1tGdrCbDopvDy_tkWgAlQKGtVxcjK0rwXtnEc8UzXURECw
 yqD6i_vpLdW699E_KuiFjjXVcT2rn7miZdz23k3B8.peQBKxvLNkpxlsBIQXAZUqyE27u.8qzMGG
 Ed1wo8CjkBhJJvl.9nbLxpT8p9bKHfcEsMtR7goQkKoeE28vCDA0.JN0bXKma5eX2pJvzZTwc1rA
 Ngo5I1f_o60rhdBQ8TkDEDlO_lWDuMGdx1_Zf2wizN8I_xUe4YgOONdeTXn7li_xcutifJBZWhUq
 IeQCy3_SYdAYgfSWR5VS13WGpD5tzeP3dC2f2U_m5Sdw.K9ZDMDnQlWamR87La2sBopZGQxMqRp7
 fmEicC0ULssYMKsIugx5HU6NJuy8K8SppsA3cG9G.nkCrorz.hmSqiGrg2kyjJErBdC09qFL0Ebp
 twlRFk_110_mUDqpEEOLwJAMecsXgm2bsxR_N3b4VXOZ3_j9biH.X5gErMpDpikt8xm41YY2xR9n
 cfswIX4hcNATSGud7fKlp7l4Zzf9L690VKd2OJnxxjacYT4SC63mfMSuLBU1uTYdQO6An4NYdDiB
 9y4W8d3X0faQbM7AkdPSVvUvNUOlyd4pDRR7UNlRuVXWdxbGFbpiJsXjlOMa8Wt2nw.apysPONZX
 B1g1zaqcx_o9fgMnm2mefAimiOVano272X8MvNqliKmwfmoxwbD0vDeu4NmAX5jEiPQzW2lwWjZE
 _p2YYXDdfRzziO69qwi928YpTgDw83n4qr76dw.w2..NR_VpXXyzW1aSAC10Yo3Nyc.OpA6JyvXv
 fGEfTUw63JrtNrIuw1O5X95uhZlM6kV_Hgzogc2CW1A1hCBkNu6iegp20O2Zkj2eV_MszKxNU0Qk
 iiUvJ7bke4YLmQX60W1j7LzQTmbbpC4sEBu7WTEVi1gie3KExmUOyUUtUyESUJgfn0rWkuAUbRZE
 oGxhGolO2TUNLO_DF5575r0R9QabEHvbGQaLsQcdRyq5Sg9ln.nlaLxw4XAMNDPZAP3cwl.sr2aH
 zPik1dVOvujlFSTXPbVBKrAL5VnIn7oHaYbL5zS7wBC4-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: e7b7f317-ac75-45cd-b523-e90f89216074
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 22 Oct 2024 21:33:44 +0000
Received: by hermes--production-ir2-c694d79d9-qjs6q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00a5d0a4af66107c7c1614b6d685cac8; 
 Tue, 22 Oct 2024 21:33:43 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v2 0/5] Add new panel driver Samsung S6E88A0-AMS427AP24
Date: Tue, 22 Oct 2024 23:33:34 +0200
Message-Id: <cover.1729630039.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1729630039.git.jahau.ref@rocketmail.com>
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

Changes in v2:
 - Patch 1: New patch to move the bt-bindings properties "flip-horizontal"
   and "flip-vertical" to "panel-common.yaml". File "samsung,s6e8aa0.yaml"
   needs to be changed accordingly.
 - Patch 2: Adapted property "flip-horizontal" to being moved to
   "panel-common.yaml".
 - Patch 3: Removed bool "prepared" from struct s6e88a0_ams427ap24 and instead
   used framework-provided "panel->prepared" in functions
   s6e88a0_ams427ap24_prepare() and s6e88a0_ams427ap24_unprepare(). Mentioned
   this in the commit message.
 - Patch 3: In commit message removed comment "Coulnd't read out RAW EDID..."
   and put it below the '---' line.
 - Patch 4: In the table "s6e88a0_ams427ap24_aid" in comment of the second-last
   line changed the format of "40,00 %" to "40.0%" like all others.

v1: https://lore.kernel.org/dri-devel/cover.1728582727.git.jahau@rocketmail.com/T/#t

Jakob Hauser (5):
  dt-bindings: display: panel: Move flip properties to panel-common
  dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24 bindings
  drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
  drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
  drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

 .../bindings/display/panel/panel-common.yaml  |   8 +
 .../panel/samsung,s6e88a0-ams427ap24.yaml     |  65 ++
 .../display/panel/samsung,s6e8aa0.yaml        |  10 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 771 ++++++++++++++++++
 6 files changed, 857 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

-- 
2.39.5

