Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79064B5045D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A8B10E329;
	Tue,  9 Sep 2025 17:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fD6dKDZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B023210E329
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 17:22:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8EC836022D;
 Tue,  9 Sep 2025 17:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1624BC4CEF4;
 Tue,  9 Sep 2025 17:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757438566;
 bh=KPoGmbgwfHdajiS3bTffjxX/R3oDVN1hzDCGybFXOhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fD6dKDZHLlhdLyUOqC+FvDJx99o7FaY9qjkfHQM6/kxXML6ocWFgR8vCkbmfEYgC4
 fHaMOSidi0o5drt/EfgIe3f0bXDqmYbbzdzPC+LQRpUq8cgCi94MDiwfETdMDPJCOw
 1Jh12/qzWzX0zWR1018mgIvBDg7MNcUcjyYqr94KJ7cVzdu6K9vB65+bqaLpX2ETHK
 d3I0KXl0Z++/IDvuxjX+SSEr+nrsV+sZ86KMqHNZwdoYg/+ycqcZp6p6fRn9rgtcjc
 8WWigibb4pN5i0RCqPB4lefi13yWGlJDxinKTOrrO1VGCEV3q+NG5D3ONYV7gFn6vw
 HVXeufikDBKXA==
Date: Tue, 9 Sep 2025 12:22:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] dt-bindings: dp-connector: describe separate DP and AUX
 lines
Message-ID: <175743856267.3386260.18336332502383778879.robh@kernel.org>
References: <20250907-dp-conenctor-sbu-v1-1-de79c0fcd64d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-dp-conenctor-sbu-v1-1-de79c0fcd64d@oss.qualcomm.com>
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


On Sun, 07 Sep 2025 00:48:52 +0300, Dmitry Baryshkov wrote:
> In some cases it's reasonable to describe DP lanes and AUX signal lines
> separately in the DT. One of the typical reasons is if the source of DP
> signals can support either USB-C or DP connections. In such a case the
> transmitter of DP signals have separate ports: one for SS lanes and
> another one for SBU / AUX signals.
> 
> Instead of leaving AUX signals from the controller unconnected, add an
> option to the DT schema to AUX signal lines separately from the main
> link lanes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/connector/dp-connector.yaml   | 52 +++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 

Applied, thanks!

