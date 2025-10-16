Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F03BE413D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983A10E308;
	Thu, 16 Oct 2025 15:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ErPrdLI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFB910E308
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 15:02:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0532C4365E;
 Thu, 16 Oct 2025 15:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593C5C4CEF1;
 Thu, 16 Oct 2025 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760626940;
 bh=3MjSfBabHCFIL4MA29+pKYeNe3+EeynLYY5TahB4N/U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ErPrdLI2oJ05RaUfi+JG94NUkNTrjhFzYjwB5HNFEIbBnwC8FRmafgMScIUIFZRrj
 ERdL/p/OQJXkTPOeh6Vanil0/l6H9hUlGYHALYNctGKLPsADsuDB3mu3w2QUgx784w
 IyutRJ5RBuYu1OeNIIkjLKWK8SOlBTfgbtY0hZFNrQgemUX/vWJPrISGu+oNrY1gls
 aX6VDDeWW8y4iRQEbzB80phLm5zCqHIjsPBWmNv4+dyxRLmmG0ePsoKyznQ3f9YGGb
 hHzXfj1UpplcfLOX82o9mqpInT5zorAU2EVzki3L/LqSjgFEjJwrgWpzigeUK1bdkF
 tC2dFn+7qu8YA==
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
In-Reply-To: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-Id: <176062693701.525215.15119814964609949547.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 20:32:17 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 25 Sep 2025 17:30:33 +0530, Jyothi Kumar Seerapu wrote:
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: qcom: gpi: Add GPI Block event interrupt support
      commit: 4e8331317e73902e8b2663352c8766227e633901
[2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
      commit: 398035178503bf662281bbffb4bebce1460a4bc5

Best regards,
-- 
~Vinod


