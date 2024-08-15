Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12B953B90
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 22:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180910E546;
	Thu, 15 Aug 2024 20:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gtvzzYXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D7B10E546
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 20:41:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92B7761FEE;
 Thu, 15 Aug 2024 20:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE30C4AF12;
 Thu, 15 Aug 2024 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723754462;
 bh=F8oflxuYzG6QdmTBIJevLlwno17ji+vnYLGMIEdxVhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gtvzzYXljiGysfQNrXF6eT54sgX1myIhBlIamCwyn03R4erw/QpDXKc+zfWSs/cLv
 F63p7ZYOY2up+KNcxl4Km8/VfHca6SWsXhYM4F9Elzmtp72lllkk933Glq0Ap4NcGg
 2+LZSkMmsdWBaG02qniyQK+pcBcZcfpXBUcBEn3C/Jc0/zVt9y4z8JsUUu8NgD+8Z4
 bY61USDIfCpXlUv1ncryT3T9b/9QXahbjSUQYSjtQzBxCI1CWYS0YrzNTqU2VWRzJc
 /sMqafXWGgGN8v2fl8Kf83dnn6fl519XGOdufYwLxPcx/X58PkVHH2a7IZKYK6C11n
 KVBD/bz5S8wFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/6] arm64: qcom: sa8775p: enable remoteprocs
 - ADSP, CDSP and GPDSP
Date: Thu, 15 Aug 2024 15:40:21 -0500
Message-ID: <172375444827.1011236.6685787299327190589.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
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


On Mon, 05 Aug 2024 19:08:01 +0200, Bartosz Golaszewski wrote:
> Add DT bindings, relevant DT defines, DTS nodes and driver changes
> required to enable the remoteprocs on sa8775p.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: mailbox: qcom-ipcc: Add GPDSP0 and GPDSP1 clients
      commit: 89817522b1a58970ac1247f65af009b046344fb0
[5/6] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes
      commit: df54dcb34ff2eaabc5f74afbdb2fec104e2263e6
[6/6] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
      commit: 2bec6f6a22815c6a5651d2b9aa4f54baf1ae5e73

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
