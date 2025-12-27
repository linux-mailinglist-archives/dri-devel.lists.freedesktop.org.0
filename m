Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B7CDF89F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 12:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62E10E5D7;
	Sat, 27 Dec 2025 11:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kgEROTIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E825B10E549;
 Sat, 27 Dec 2025 11:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2260A6000A;
 Sat, 27 Dec 2025 11:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BE4C4CEF1;
 Sat, 27 Dec 2025 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766833996;
 bh=/MjssVrvX9CHLhuDFc+A3P/Ke3FSefMxQfbPdX0ryF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kgEROTIV5EPkII/T4M0ZmNq/tGPPe9Sa77Ycy84xKYddUqBUzfC0zcW5HjEwePCet
 rwyWq6du85hxrrlZiZdtLZyfADgN+mqveqS0XM4wutX0bKsfCKnIBLCHrmTo0jCIUM
 sJXVnq9KJxDnpbQ0RpNWt5+m4CpCcUhN90g4kvlERpQmChFIMKSyInxTm6kUmTJN5g
 l1JAcaKg0EiOdM2DTpc5NSYCvzyiJ5tH/EvU+OlD3l2KZNB1lVXM855soYDNNT2ZQB
 6WC8Yr2DJkFY9a7dvM58PIlYkmgOUYs5neFBpODCnvVH7Qk8MUJj445HKi8RyKlJ7+
 sgUsIFP5WBqzA==
Date: Sat, 27 Dec 2025 12:13:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <20251227-doberman-of-radical-variation-d30aaf@quoll>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-2-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251225152134.2577701-2-quic_amakhija@quicinc.com>
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

On Thu, Dec 25, 2025 at 08:51:30PM +0530, Ayushi Makhija wrote:
> The QCS8300 MDSS DSI PHY is the same 5nm PHY IP as on SA8775P, with
> identical register layout and programming model. Model this by using
> a QCS8300 specific compatible with a qcom,sa8775p-dsi-phy-5nm fallback,
> and update the schema to require this two entry form for QCS8300 while
> keeping existing single compatible users valid.

Last sentence is redundant. I asked to explain the hardware, not to tell
us how Devicetree works. Write concise and informative commit msgs which
tell non-obvious things. Not what you did. I alreaded asked this - do
not state the obvious, do not copy the subject.

The only useful part of your commit msg is first sentence - two lines,
so 33%. Remaining four lines, so 66%, is obvious.

Best regards,
Krzysztof

