Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290ABDF236
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1630B10E2AD;
	Wed, 15 Oct 2025 14:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RnSAVYbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2105810E2AD;
 Wed, 15 Oct 2025 14:43:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8744B40510;
 Wed, 15 Oct 2025 14:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AFDC4CEF8;
 Wed, 15 Oct 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760539431;
 bh=BdVewfzADni3rA+uLXMhw0FIoVYxSlv8WO8HdhDGEeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RnSAVYbX0pa/TbdwnqgAHLNi46jSc10fCqckm8meRRNlXCmzpes/MSgltOMJe09Ug
 JxdyInJGKhLHxSlIgFJYP5d1DMa/AN+TmOb6ZU2mngBuBTa4kiL0a7IlbiS/i8S+En
 /g4iXr3ZZjsFXgBInBqjDkI8vQ+S34EDoT113jIB013olFZ4zSjfvHAcPKJhj9WFs4
 m4yFWLccda0qiXQeUmNJq6scITEXvAsc57cu+xGApgTtwsq6T+ZXd60XHE0JrriWE+
 DDvL41D7J1pPoPbzucyHLUzWqhosGqSBeUrK2nvYQ0B3z5PDNtoU2YzTocZjSKawIk
 hvNZK+1DARCAA==
Date: Wed, 15 Oct 2025 09:43:49 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <20251015144349.GA3302193-robh@kernel.org>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
 <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
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

On Mon, Oct 13, 2025 at 03:37:47PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> > Add edp reference clock for sa8775p edp phy.
> 
> eDP, PHY.
> 
> I'd probably ask to squash both DT binding patches together, but this
> might cause cross-subsystem merge issues. I'll leave this to DT
> maintainers discretion, whether to require a non-warning-adding patch or
> two patches with warnings in the middle of the series.

One patch.

Rob

