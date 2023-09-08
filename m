Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CC7982F9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 09:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1809010E87E;
	Fri,  8 Sep 2023 07:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527610E875;
 Fri,  8 Sep 2023 07:00:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 011C561454;
 Fri,  8 Sep 2023 06:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426CC433CA;
 Fri,  8 Sep 2023 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694156398;
 bh=zbZ1I7JzmzE453M4flL7FQ8fpJujMB0sIcmHWS3u5BY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=VRuzso6N4nYp1eIKoN5VPAJpbswVbGZQ3MUYebMdiLjN6ffhy3tU0Upzx4BQtmyrT
 oBbGNHqehmxMsgqLOEX6nNoxV0cdnIprz2KrumXBW5GGUE/HRoO3HOA57UM2/xcoqS
 hC1U5Bb2UDITRrJV2ak/6h3PEbZq530Okjvk/+6MR+M4yimBq68prS1XSZ7ST9GB/h
 MF6JvpXepgVeknPkrPig7JPm51BAd+0qQNI5tuYh/ylB9LQFVSpi9rGzQorF+HURRP
 5vDruVJpxHDzppNCpn83Lmt2FmcYoZXLg4E1ivqMI8VKDNRC0/FQXO/1EirHNselER
 GgC+fIjRKBWSg==
Message-ID: <79decdf3b3d30c90467b6048a5928cf7.mripard@kernel.org>
Date: Fri, 08 Sep 2023 06:59:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/5] drm/msm: cleanup private obj handling
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, Maxime
 Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Sep 2023 06:05:16 +0300, Dmitry Baryshkov wrote:
> While debugging one of the features in DRM/MSM I noticed that MSM
> subdrivers still wrap private object access with manual modeset locking.
> Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
> private objects") this is no longer required, as the DRM framework
> handles private objects internally. Drop these custom locks, while also
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
