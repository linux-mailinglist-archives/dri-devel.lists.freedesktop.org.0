Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D339959047
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 00:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B1910E121;
	Tue, 20 Aug 2024 22:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RLgU1H7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EECA10E121
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 22:12:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A68AF60EEB;
 Tue, 20 Aug 2024 22:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A127C4AF0B;
 Tue, 20 Aug 2024 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724191933;
 bh=TzKsLBDdEU6d0Kd346qtlGqwFuT28InRvFRbMnitnVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RLgU1H7PsO41ImQ+YvqiX2vvvzM2mB1um6vV8r06hG0l2lNYJVOfytShNjchPz+9v
 VUdueqTpCcFrzITeziKXnBCW4WFpk1c/pqzd8kQsb6Uxc+gAwtZUiln58rn8EfpkYG
 oE2SoZfrAlg02eH8d4mBjp5ajigbI9uM0L2E/rkfZlxbCVd5EynfMjNyDo5XdXt14r
 LoG9aNOWS72NR8hktt7sJpIv6FoK75sD5pppwn1YYNlX3nXXXOgfNhe1xqoW8SjHAz
 Ax+gd/AQAFEtKHqeh1tWSEWHJENXH7xJ4agbygPJNhjngUDfdwzHoeKCQu8mWjsUY7
 +jRIB+o5HInxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: misc: qcom,
 fastrpc: document new domain ID
Date: Tue, 20 Aug 2024 17:12:07 -0500
Message-ID: <172419187794.1319438.12108857589542156264.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240816102345.16481-1-brgl@bgdev.pl>
References: <20240816102345.16481-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Fri, 16 Aug 2024 12:23:44 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add "cdsp1" as the new supported label for the CDSP1 fastrpc domain.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sa8775p: fix the fastrpc label
      commit: b45af698d5114f9b666c7d8b58a9111d0526d7f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
