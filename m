Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC176C870A3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6D010E0A3;
	Tue, 25 Nov 2025 20:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DJt3K7vt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5F10E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 67F174444F;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B3E7C116D0;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764102580;
 bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=DJt3K7vtRHVni0LTuwpZoShwfF/dltrBf7bdA+Xlb7FLN5gWAemYKXFVFteQn753m
 hNEpp/gebDqu3DD3Kk4dkK4/86fH7uIutJEEPR2IOa/DJlvRcNdoTe7HwWcvH4XE8v
 0DYvcGhuRwW9HXZl+yppO/WL5ltzJbLFXQ2BYOjj3fxl6durUaYk2Rb/8S0ShpHt1a
 Myja75zUH2JYdTi3j/0w147MVRgh+IOrEiacYTOKUMFIIHZ4rDFfVPbdUEo+6peSI9
 rJW8ehh02oi1IRvwRi0Rt1h8PFdZwBcW/R0Q/rIeh0/1O7fdj6nFzNapYSKFUvX5Dt
 ZEgFWw77MFgRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1B203D0EE1C;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:36 +0100
Subject: [PATCH v4 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-1-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vnt/xXHh7c01EXNWnpunAXvFyH2vLjx4UfYXxFc1+5w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGxIifGirp9T6Vi0DAyXs9lMbhdTd35xqlUn
 8qk+HAK3iuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsQAKCRBgAj/E00kg
 cmSAD/42LNDykpTI8CUnBYJaoFIPJ7gr61SFUWX/wcGFaT6C2JmQl0ufk9mk4SJQf2+9+kQxajf
 zK6BKujBbQA5EB7w8XgHhtEcnptt28L68Lf+yhrVEroUc64+/QWg7xuOZ14uZLVZNkKt44xQSSY
 6Y8X5CmuyZdwIrIfPVAdRGxkdiVPqaR/Ezgu5m6997GfQfCXPQgRlOLGi8wbqIJlAsigon+1KZ3
 1rIhiZxBlPFllYSco5fi40JVVze0WjDgVTEghHS8cmOE75rMtwPGT9pnbGZJJBBLoZfBCkIBY96
 XJhHwb9pmqhVPW1a1i85npc9JOUtwLxf9vps0VZEdaJnMbiyZBYC0jj2FJJT/TApY0zYthispwp
 9cppO17ulPjPja9axlm7LuZrG3AXCzTlfQcvGO+iDWcSMs+y3pAjrfa0rOB8ZxBZmwt+6F1uuwd
 CvP9Rx16JKJbes/F1ICQCvV/CUo2+qqK+GRGHonjgHuOP5Gv13Wn2hu4KxubFARWqG2IcSaR4yt
 8WChH/9IlvmT2A7jQJGjAbYW9TiNd9qMD1kmlYVkx5nD5wIgmbb7BNt8Fr+hcT70TorQpeidVF1
 e0U9kwoVWhVOTGzLqZVb1PNyCYWaFGwBQlaQ2eeeFDvqyrgLtvZu1QN/C4skK/8hvYi6vNn+pxL
 ZgWZGycOSfdsf0Q==
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


