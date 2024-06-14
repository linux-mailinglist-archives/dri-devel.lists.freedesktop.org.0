Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E89083B7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 08:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B5910E1EA;
	Fri, 14 Jun 2024 06:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bTusOOPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA7A10E1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 06:38:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB38361DDB;
 Fri, 14 Jun 2024 06:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DF8C32786;
 Fri, 14 Jun 2024 06:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718347131;
 bh=4i3sQn/SJjShuJbeDRXU6rgcmtPkIdqhkiu0lHKawIg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bTusOOPINlW7US6HEPCVWLp4xJ+yYE4m7M80P/trAHNIqz4Srfv3al6srIj+Iopyc
 4CWn6HvFCBad9R8Rj9QK16r7kWxskKDEOLcM0YAWxPmN652SKE3J7I6Q+XEm5/8ec0
 w08x2SXB/LyRDwuTTe/JK+JmdzmZFgo2E02b6nSrroqOsQr82TDgB+HlT3W6zv5bgG
 aMsEY1WvNJtVjl4eUB31+GE8aTUx8c1AE2s/NPbFyRewMPzmeU/S+eYY2MrLaQZdSa
 Ee6G5oqxYQaa65cENs9n1PBds5fJob0CoAjdaDaxKDFdjUaXUkYFEJfp2FWqFhQoS2
 M82xubkmYXHFA==
Message-ID: <b91045384631984195a0f05214e0fa94@kernel.org>
Date: Fri, 14 Jun 2024 06:38:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, "Conor
 Dooley" <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Jeffrey
 Hugo" <quic_jhugo@quicinc.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 14 Jun 2024 03:02:19 +0300, Dmitry Baryshkov wrote:
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
