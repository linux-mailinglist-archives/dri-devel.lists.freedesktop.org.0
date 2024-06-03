Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0B8D7E4B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ED410E348;
	Mon,  3 Jun 2024 09:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qVpWKd15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199C110E348;
 Mon,  3 Jun 2024 09:16:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A39BCE0B4C;
 Mon,  3 Jun 2024 09:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366A1C2BD10;
 Mon,  3 Jun 2024 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717406212;
 bh=LJ9efKAjlle/ASgHhE9n496pzE0x+atFZsOdxkhWE2Q=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=qVpWKd15/8K825BYt209VbBq9HpEtJ+PpZlw0ToIwYly6E74eiZcT5u0u7JvmJOcG
 6drQ+s9CuUpmAMzqOCcKsv9y4BcAwC7AaMv/Bl/KmTUZf1ZXnwFB/rJ0oHykzy9sia
 eXpmwjBvTdZ2gjOUHppeqKRvqoTGHUIcqaUnYkcI3V5qv08x9PUELVthOMuQPwLZWH
 VqP0z4pWkudn5YSpDCYFTxZJ0MyTKZDYnzcWM+714w0fCBPesib5lNCmmFSxFkBPf7
 7f/X0X/CsiiD3jTs9l4JTypbDzgbgYVvRM49uyXdwiAkihmvsWvoSliCl48DkOVgkh
 92uPKuNrIB88g==
Message-ID: <ca6dc1a130fb1c427831a6f52064d256@kernel.org>
Date: Mon, 03 Jun 2024 09:16:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 6/9] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
In-Reply-To: <20240531-bridge-hdmi-connector-v4-6-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-6-5110f7943622@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>,
 "Robert Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 31 May 2024 23:07:29 +0300, Dmitry Baryshkov wrote:
> Setup the HDMI connector on the MSM HDMI outputs. Make use of
> atomic_check hook and of the provided Infoframe infrastructure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
