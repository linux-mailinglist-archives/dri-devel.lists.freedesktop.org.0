Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CDA4C300
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB8610E436;
	Mon,  3 Mar 2025 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZCESRwN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9B810E45B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 14:05:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7469E611E2;
 Mon,  3 Mar 2025 14:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9F3C4CEE6;
 Mon,  3 Mar 2025 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741010753;
 bh=cglLiwllq/Wswh1pEsU+NDxZ2WeFb6SUBQz7cTf3n6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZCESRwN8ClzNBAEpK+3t+/K/OP1fi9QdcdKyld1gS6ZVZq1Qmy1QGXMYtwgI+cDFt
 dSMtm1h0DpNmjQ4Dz5q6Od9y6S/k5q9tLPIYKgb9C+H1xfjuEjN0E0To5dzYKnTAd5
 swUihpJWdj6M3tFx2heNNzc5AJRF1t4c0pjKAuyShfqEP/ZlQavfoDxb2FEZM//FIF
 KOwboj/xojCySNQNEsQPDScUIR37DlZpsihwy0CA4oYQuwLHah60qxLdfC60/Cymmm
 PRO6SwWVYU/sg/tf1ZR5wt0YijzJm0dDF/PQ2GpdDxEFi8ZvcjXOsegGRBaQQwcsii
 RFtX1blzNw8gQ==
Date: Mon, 3 Mar 2025 08:05:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: kernel-dev@igalia.com, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Iago Toral <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Subject: Re: [PATCH 6/6] dt-bindings: gpu: Add V3D driver maintainer as DT
 maintainer
Message-ID: <174101075097.1758007.4807852577942863948.robh@kernel.org>
References: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
 <20250226-v3d-gpu-reset-fixes-v1-6-83a969fdd9c1@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-v3d-gpu-reset-fixes-v1-6-83a969fdd9c1@igalia.com>
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


On Wed, 26 Feb 2025 16:59:04 -0300, Maíra Canal wrote:
> As established in commit 89d04995f76c ("MAINTAINERS: Drop Emma Anholt
> from all M lines."), Emma is no longer active in the Linux kernel and
> dropped the V3D maintainership. Therefore, remove Emma as one of the DT
> maintainers and add the current V3D driver maintainer.
> 
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

