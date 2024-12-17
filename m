Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F19F4AC6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EAC10E226;
	Tue, 17 Dec 2024 12:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hDaf9b2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15A910E226
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:14:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47CE6A40ACB;
 Tue, 17 Dec 2024 12:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35442C4CED4;
 Tue, 17 Dec 2024 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734437650;
 bh=Me423sa5I67z9UM4znPFMq2P7Rm7CICtNtEVzRss7kY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=hDaf9b2bvvMJ1/Jkx+IK+tRESOpOWyyDu3Ef0Wg+UyqQW+2w7YYT+os++DM6MeQQu
 hYIe61BEhARPSwGkRXUhM7+gc332hwepEBZrO9thhLqX74LMITzQuWo7SgpP4mBaFJ
 hNpNyKV/tEEQvmDF60/uxKGYhYGmwJoxHQ1Jpa1tVWCSkE9P2Jcmc7QJPeHbW0Yvc3
 gUXHnn36/Wp99YAMBMG7dlB6AZ2ZDMwT2F8gfQzXgHDxDie9eLMB+S7iMQT3glOAZx
 qeCH5longT0/T3MGvfzjJagC9GiNIEWDQCzZLzPzptdS8lb9kgmbGGbPoMQVeSOcU1
 BaizcBBk9JY1w==
Message-ID: <4fa319f13b4d57580a3a9e38021882a4@kernel.org>
Date: Tue, 17 Dec 2024 12:14:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 04/25] drm/tests: Add test for
 drm_atomic_helper_check_modeset()
In-Reply-To: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com,
 DavidAirlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 JessicaZhang <quic_jesszhan@quicinc.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@chromium.org>, "Rob
 Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

On Mon, 16 Dec 2024 16:43:15 -0800, Jessica Zhang wrote:
> Add a test for drm_atomic_check_modeset() specifically to validate
> drm_atomic_check_valid_clones() helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
