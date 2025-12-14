Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F331CCBBBE2
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 15:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAB410E4A7;
	Sun, 14 Dec 2025 14:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aClpIfBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7F710E4A5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 14:51:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6EBDB60195;
 Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5EE3C19421;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765723884;
 bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=aClpIfBnQFANU95uHtPXKOl1rZqEzlSUFwLzGEYQ+ntQJdnxtPvfMv9MrGMVNnn2M
 Q4B5NUkVa5ZqbjdflC6Nqzzk/Zedc2fb+eznE4lDSo8wJj+XU0BB8kK0rpssO6I/O8
 FRIDWedLTKcw8qaw/gt44jNgMDee3zUUUMAmF/d3hSLG4QcPBN3B2anIa9RmbA+oy5
 xn4nG1lIkm0raBhJPc1SclLJVxSjfg/KPNSnoSpE2H78l9hrVw+ax+jjqiLr26K3yk
 06xkjpDRT7EWlaDAQPw5mhXfhd2hgX7UJDpCu3u4bj3K5HHD4yFhgxBoaMwKrKhOKw
 4Fx46GyjX/2sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B1BC9D5B16D;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:17 +0100
Subject: [PATCH v7 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-1-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vnt/xXHh7c01EXNWnpunAXvFyH2vLjx4UfYXxFc1+5w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pgp0W/ABUwFwmSK4XBPVArnh4jOPDAljuo
 bCKqZ7IfOKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 cvrWEACZFsRcAcnuwWVSl/j6Y+FDxYSFS7U+eodnFNRMlp3dnCbPUKmKYKznYazg2AdRc3CtaCr
 UFtxmuyxPQIMfViqiIo+U0v9xWrpznYhf9lc5LUHqAV7Ggn3n/XGRgOoA07YQ9oDT27gxIDbAir
 aqTOV3FzSIZsRaBExGiHaE23Eq6K7R+QXr9HS18bAjsGD2LSLZ5yEz1MEIVxbg2u5XxrLyFkpi8
 9fFcEPlHq6aiAJVWyMoKJYQoAGu4QaZtmziIEHYpp4k8gP76ENSaypoOWfRXHMHOMKPUY3otGnG
 M4DuaID3HZLBtat0lRKxz3lIhKWIpAwpIif4JxKrpMS7VEelWVMmxHradOr9ZAwxpFd1hSjvLQO
 OTUv2F9Ztw3LOEQCK0fHTIopllRZGcVDfl9klkpzdwGEXbj9reAXdqeKpKJdm8JUUfNb4eVeS1e
 GBO13/t5BGokzP91ky0NFj1DzSUk6JY1KyjjltSOiDLFkX8+sg9SshqSlqS2KQS3gMJm241pfay
 +jquu8ivUBmF4yAwoc4trMClfEYD1J7GJb7CFFbRB77YU1oiWpn16i0NOIQ+35ON9/qymMM8R0L
 brHI+S+D+ate14e5ka04I68P4QAUFQ9RglYYrBv4J7KICxASmLdkjEaNbM45JDdS4jVGVuEaj6p
 Aphu0fPmsiV9CMQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Document the bindings for the Pixel 3 and 3 XL.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010..760b6633b7a55 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -900,6 +900,8 @@ properties:
 
       - items:
           - enum:
+              - google,blueline
+              - google,crosshatch
               - huawei,planck
               - lenovo,yoga-c630
               - lg,judyln

-- 
2.51.0


