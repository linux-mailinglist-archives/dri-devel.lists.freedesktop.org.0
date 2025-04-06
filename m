Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCEA7D08A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 22:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D518A10E0F4;
	Sun,  6 Apr 2025 20:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="SG3AWJGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A6010E0E0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1743972926; bh=jWdQxL4tiW+qSHnkQphZb/Zp5cQSwhzY2xtPrVC3GWE=;
 h=From:Subject:Date:To:Cc;
 b=SG3AWJGl4UCZj5poyNEUtGVzmPjS8Z1uAjvISmrjipNFyRUrxiheXaZS2YBGXywek
 fDwAi242mk0UGaCCJzO5I3kDNd1Wkt7V6AI47kLUdZwQY6Ptnq0vzKCTEkFaq9z35f
 LfPSFol1Nj0SUTyV5Y6xiqWDMwqJ/U3Zr2D0zybQ=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Sun, 06 Apr 2025 22:55:02 +0200
Message-Id: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbq8mcC/x3Myw5AMBBG4VeRWWsyrsGriAX1l1kY0opIxLtrL
 L/FOQ8FeEGgLnnI45Igu0ZkaUJ2HXWBkTmacs4rLrk2W9iatiqM6Alvd1XY08Bxxi0ah2mimB4
 eTu5/2w/v+wGr+7Q9ZgAAAA==
X-Change-ID: 20250406-msm8953-interconnect-ef0109e8febb
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=jWdQxL4tiW+qSHnkQphZb/Zp5cQSwhzY2xtPrVC3GWE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8uoq9h70vV5OPX88cyIjjjTYTKq8XihZFUn/x
 YI2zhndcQ6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/LqKgAKCRBy2EO4nU3X
 Vv9sD/kBgKhGOAV/rOtwBE55cyyss3AFX+12gXgk/vGNsEBtS56Nj9aZF2q7+WOcTC/wEGJZWRE
 2d57t6D1RLgwAbxGncXLLp/xU0yRsNqJ80DrIuygHN/EkTnNwPUz6LDwN2WlQfJ69o5uGm9doxh
 Jgrtyd2c+IzQLi5WqM+pWxvxPnvbt4Qyko6fU9UO4+HloUmReNUgYBb6ET2kQZ4JfRZsTWqLBxA
 O7AP5Hu6W7rqe1eEbg0nQ72OilBBDdLo+gNmFXHLAZTaAoSoccyYZ+pKSYzc8/myWCsk6+qWQCi
 DOAogTHNxphbWAuMjFIn8OZ+W5y97Jq9Ool1/ByGn8obrO3pzPaNovyU5Ne06aYSyIvQRJescZg
 oemCGCAkxTPRwQqrh0u0KZ+5qHiP8nMsXkXxDXyy9gttlKd6/XbJx8Eqq8yKym63m9kCnmYO9fY
 RBV+hz3xe8+M69oPITMOvgMpaZknp3lvTEVpHdBPASYBr1TmpXIfdDpI1hueoyrvC3mvUyLwstw
 vNVkWNrTwVUMAvQPJyiE2AIKoLbfwL7hVVKXj1qu+0QMtaZqmY1XEcAwmvYhfpNpWfcoHOwl1Eh
 3px23JBHzKVnIRUA46sZfMiNoQ72yspWOEWr/NR6vB0pht7+T2q7QCTq7IKaNiwZTeDXrnrKmAB
 Szpw2uC+nQ17smQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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

Since the interconnect driver for msm8953 is already upstream, let's add
the nodes which are required for it to enable interconnect on MSM8953.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (1):
      dt-bindings: msm: qcom,mdss: Document interconnect paths

Vladimir Lypak (1):
      arm64: dts: qcom: msm8953: Add interconnects

 .../devicetree/bindings/display/msm/qcom,mdss.yaml | 12 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 96 ++++++++++++++++++++++
 2 files changed, 108 insertions(+)
---
base-commit: 3bcfefea9711deb32db207977d531d720d32a0a5
change-id: 20250406-msm8953-interconnect-ef0109e8febb

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>

