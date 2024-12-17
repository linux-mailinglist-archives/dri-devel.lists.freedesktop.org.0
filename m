Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82009F524F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1B310EA29;
	Tue, 17 Dec 2024 17:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yizxq0fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96110EA29;
 Tue, 17 Dec 2024 17:17:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9B577A41E98;
 Tue, 17 Dec 2024 17:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CD8C4CED7;
 Tue, 17 Dec 2024 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734455865;
 bh=Cmwm3m/rW7SiHNy9IHnh01I5x+FOBVJH8AyaTu6Ie7g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Yizxq0fyZcbV143u6z50pim2sGhxdlOmHURR0Uejxw8VRWCRAkaDoikW071P+oykV
 /OIB2xoEWoQouNKEEprR7DxvX8jWigtVsUqRGA+AaRgZcT81zDUzgAGkfpuN3HXqEi
 X522E4feKZFJkMTtWZh0D8Du5Z0/rJ2YhvuZKBmKLM1V4kTX4BEDZxFt1PRGHNDRB2
 bIo3i0MWb28RUjkhSPsDL/fzMQPx3LgYnDIl8bminr645owO7+KOxJIbRrfCHlGwwk
 SIJiw2IXyNtELlD98xXiAs/FURfzHfgmWFjxXPMEQxOKPdjr+GnGEx+RYseYhe5xNS
 Ft6ZzIukQBEaQ==
Message-ID: <76a2c89359a5a2177cddf8e1449016d9@kernel.org>
Date: Tue, 17 Dec 2024 17:17:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 03/25] drm: Add valid clones check
In-Reply-To: <20241216-concurrent-wb-v4-3-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-3-fe220297a7f0@quicinc.com>
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

On Mon, 16 Dec 2024 16:43:14 -0800, Jessica Zhang wrote:
> Check that all encoders attached to a given CRTC are valid
> possible_clones of each other.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
