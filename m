Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D29ACAAFF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88E810E4C8;
	Mon,  2 Jun 2025 09:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HWW0vzFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347C010E4C8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 09:00:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D2276111C;
 Mon,  2 Jun 2025 09:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44CEC4CEEB;
 Mon,  2 Jun 2025 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748854812;
 bh=mR7WQZqIAy0dtBgED8On5JHRNCsxwQ5Sf5Md6sldvVs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=HWW0vzFWfcvmZVYj+WhxFAU+kcMXCRf6AF88k/kPOI0zJ9nkhpm0xbq0c19+XFJkX
 0x5cTpJx012nnKqjwrPxyYCXex7tZNfED9MU36paQxrkOHSBts2ePMT5nPCboOvnrU
 xOAIMEuZxOynsLnFyWebQG7B5V3SEORXyLyYTYvPhGC2H//tKsv6c20qiVDMnNe7j3
 zvDMBj2lULgeKTAYK24v0gB4eU6VGfMh/yu9BO6PZuPJnwyDCRELHpo106U5HIlI5W
 9XoxDbu5aJu0u4VBTN2Oz4ysKG0ozH8rsEOG9JaDvVPq2bD0RRwBZ0HNkrlmml+5J9
 E1pWQfbHAFRiw==
Message-ID: <3e9e8c1aca41aacda7ae12408712094b@kernel.org>
Date: Mon, 02 Jun 2025 09:00:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 01/19] drm/connector: hdmi: Evaluate limited range
 after computing format
In-Reply-To: <20250527-hdmi-conn-yuv-v5-1-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-1-74c9c4a8ac0c@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 27 May 2025 15:11:09 +0300, Cristian Ciocaltea wrote:
> Evaluating the requirement to use a limited RGB quantization range
> involves a verification of the output format, among others, but this is
> currently performed before actually computing the format, hence relying
> on the old connector state.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
