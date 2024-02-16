Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB18589DB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 00:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F244710E021;
	Fri, 16 Feb 2024 23:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kKH5BHyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1F10E021
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 23:11:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63FDA620F1;
 Fri, 16 Feb 2024 23:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51347C433C7;
 Fri, 16 Feb 2024 23:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708125057;
 bh=kFscJpd4PtsMos7FcDnb8F7Hy9BzwMNBGQNhfikpbx4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kKH5BHyDT91jVZ0ealppnCoK5yciKRR/2GfTUnStw5YLAhlMAU7Nf+6Y5PfI3oiIr
 fx75y2ZDjTmVJM20qdggTyrWgROO+SnUeG4KJpK7Q9/2S8faBcHWoyLSEWGU8wWrin
 nuMlHQa4HnWrHijWy26LWRQITPhROVZb31Nxz1xqk+1fFyoJEQK2cyuheTToQtN2Vb
 +dHUxN/04NmCqS37iF1SYkULVu/MWKvHCQ4ManwU1h/JhbDH8XRUqJqwafr+AcAB89
 6k2q303xGWixAxDx6L9t1lyT8y/LTzntZynZ0w4szl+XFPovg0Yp+NiS3l7H6cFIsw
 aGGiIuB6kZadQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] Add display support for Fairphone 4
Date: Fri, 16 Feb 2024 17:10:40 -0600
Message-ID: <170812504021.18043.10678302937679130651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
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


On Fri, 16 Feb 2024 11:10:47 +0100, Luca Weiss wrote:
> Introduce the bindings and panel driver for the LCD panel with the model
> number 9A-3R063-1102B from DJN which is using the HX83112A driver IC. It
> is used on the Fairphone 4 smartphone.
> 
> Then we can add the panel to the device dts and also enable the GPU.
> 
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sm6350: Remove "disabled" state of GMU
      commit: 2abe4a310cc742332038aed5f9f4a15e65a0bcc1
[4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU
      commit: 891af1aa1ea42514b9a7f42caaa1fa0c32f8e232

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
