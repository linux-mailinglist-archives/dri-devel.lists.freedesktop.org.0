Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD28179EC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB3D10E021;
	Mon, 18 Dec 2023 18:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D2710E29D;
 Mon, 18 Dec 2023 18:42:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18AC760C75;
 Sun, 17 Dec 2023 20:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8B7C433BB;
 Sun, 17 Dec 2023 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702844671;
 bh=+DX0N7UdIUqjXqpFVCPOLF099qME+OXVv4kkpQPaS9w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tE8XIjpiaHI1UXKM4RRe8VsYU03DL9s8UV3sNs3LwmPrhwtzOb6o83hzDr2bocAHu
 cX/mSKqrtHPzv0Jgw1Iz26EgZs4o62eGBjRsqeY3+/+1bsvE+kUn2POrrOG9eOKMyw
 WdabEXIbz0CnHSd2/hxhwqqSMmSotRnlHHal9nGkr7Zdtu4lscOKUN+LaxVfe+jazX
 VqdwGckSxuOsJFBtH5nvaAAHwMnUKOGbeT57Ei7yX+H1AlSnZ0rKzAFDo9n5vDX41i
 leiFIl/UCSGqybpds17i1hMOt32cAlJjXoWR9bR968AKmpYyME3pXfTiWjglHRqhRF
 tyUNqR/rslG4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v4 0/6] SDM670 display subsystem support
Date: Sun, 17 Dec 2023 14:24:25 -0600
Message-ID: <170284466197.74678.17866515484062477720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
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


On Mon, 16 Oct 2023 22:18:07 -0400, Richard Acayan wrote:
> Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
>  - move status properties down (review tag retained) (6/6)
>  - accumulate review tag (3/6)
> 
> Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
>  - rebase on series and reference generic sblk definitions (5/6)
>  - add interconnects properties in example (3/6)
>  - remove phy-names properties from dtsi (6/6)
>  - accumulate review tags (4/6, 6/6)
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: sdm670: add display subsystem
      commit: 5f8ba4f28ddb432c8a9720c337f9047e38fa7e36

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
