Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5436B3EE94
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 21:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF74910E47B;
	Mon,  1 Sep 2025 19:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eX/2DigA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019D10E47B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 19:46:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 016B544E4B;
 Mon,  1 Sep 2025 19:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D6EC4CEF0;
 Mon,  1 Sep 2025 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756755984;
 bh=xn/VcIgzHE0PmB/v3LOHApTytoYKXknTVhZ//rRTXPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eX/2DigAipoH8LZ1yzPeYdsSTG9icEIzHyLoMY2pMGhuWVPHCgJZ65ckmSe1sMXpZ
 y89byCrXB+rnPDy/nko/utRST3mAqrGrlWyvIT7QeotKTOIaz39XoQ/FnFRvrx/w1U
 dJFrHW7EAqvu9TAJ+NPak6NnCWTU9TqWFVx144Q+abQitQd4GbmbcyddYkgIh2Ivuf
 /SILTe45+M4N4KFCXF6v7PnFD7SNLuZXbfIcjDRk+UgTcUvfxgt6LY7epKfLVzjiaE
 QJZeBcvYSfn600h2ocld8oOIm0CU3OuyqwOPTb8c64fOBGuz2XV/5UFUx/Stjwg5xl
 rsy5eyU7yxFKw==
From: Bjorn Andersson <andersson@kernel.org>
To: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 0/5] Add support for gdsp remoteproc on lemans
Date: Mon,  1 Sep 2025 14:46:05 -0500
Message-ID: <175675595927.1796591.9742902752337762891.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250813030638.1075-1-quic_lxu5@quicinc.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
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


On Wed, 13 Aug 2025 08:36:33 +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. Add fastrpc nodes and task offload
> support for GDSP. Also strict domain IDs for domain.
> Patch [v9]: https://lore.kernel.org/linux-arm-msm/20250716132836.1008119-1-quic_lxu5@quicinc.com/
> 
> Changes in v10:
>   - Rebase patch because the file is renamed to lemans.dtsi.
> Changes in v9:
>   - Change the patches order.
> Changes in v8:
>   - Split patch.
> Changes in v7:
>   - Edit commit message.
> Changes in v6:
>   - Edit commit message.
>   - Remove unused definition.
> Changes in v5:
>   - Edit commit message and add sapce before comment end.
>   - Move domain definitions back to driver.
> Changes in v4:
>   - Split patch and change to common syntax.
> Changes in v3:
>   - Restrict domain IDs to represent a domain.
> Changes in v2:
>   - Add GPDSP labels in dt-bindings.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: lemans: add GDSP fastrpc-compute-cb nodes
      commit: efc28845524843f199e420695eab3841299b05d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
