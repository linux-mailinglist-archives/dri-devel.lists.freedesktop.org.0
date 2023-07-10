Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D833474CBA6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 07:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626D10E0CF;
	Mon, 10 Jul 2023 05:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D1710E0CF;
 Mon, 10 Jul 2023 05:05:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD86460DF7;
 Mon, 10 Jul 2023 05:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FB5C433C9;
 Mon, 10 Jul 2023 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688965501;
 bh=YFjhvatW0hePg8+5hNpwF77bjV3DIDQRM2rj8LszAm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BjK9vKsICxkBzHxVV9KtYyBijYI6tgdX9QYtoOWg6L7+/JDlKnDhbxtK/9FahkIl0
 zUTbWmrMvS6Pxv3h9q252yotY3DmxSkxPQCr5KW+RFSOEsQauzoi0nvgEa00mNlQjF
 I9fbiUlmlNckU9Siw3tXNCbxGAtNn0rgR0sJziArV8BCAwwAlUDZkQFFqQg5kWBI+R
 Oq1hNzx1EMtssEgR36aX3JrPwLfzpsPVdsV0aHltTOxiMd97KQo/495SQarz/ZVcjd
 e1SzxOf+DeBtecRcFR0PUEjYDiksO0wEx4XAhHTnFb+/AxxBxStNgj8YTRKycDL3MM
 6ycnuKZCaZGew==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>
Subject: Re: (subset) [PATCH v3 0/7] Display support for MSM8226
Date: Sun,  9 Jul 2023 22:07:38 -0700
Message-ID: <168896565945.1376307.16565002896351645834.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 01 Jun 2023 19:00:07 +0200, Luca Weiss wrote:
> This series adds the required configs for MDP5 and DSI blocks that are
> needed for MDSS on MSM8226. Finally we can add the new nodes into the
> dts.
> 
> Tested on apq8026-lg-lenok and msm8926-htc-memul.
> 
> 
> [...]

Applied, thanks!

[7/7] ARM: dts: qcom: msm8226: Add mdss nodes
      commit: d5fb01ad5eb449ccfd950e946a882639cad168b3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
