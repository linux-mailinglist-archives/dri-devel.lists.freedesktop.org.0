Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502E755E79
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A24010E205;
	Mon, 17 Jul 2023 08:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6969D10E205
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:30:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B384160FBD;
 Mon, 17 Jul 2023 08:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB7AC433C8;
 Mon, 17 Jul 2023 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689582653;
 bh=bLXI4YsRoVmju6aLeiTY+ZcSgCB2BwRERlGvlY5LRAA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=exvqNvdIa66YfoJXjJC3Cxg/YjWPD9xa6oLwST2hs8QS2aKkMUB9xc19GzJn9rm5q
 PMh3vOZigYnxyxBjTOUgq/qPD8UheJwW2C0pGzwdp9887jRgxb7YkDGCDZpdliN7l5
 d16QG3+RYCj5SqoXKpkyFVd5OJAh+M9xjFM/hzoWaMTb3lCXAqX83Cqk71+/Njo0/n
 dffj7HNsfLyweqMdn9zZ7umPihhS3LUYATaLgpWXdmHFLp4B+psxBQC1Tugw9END4i
 aD4XGArYa7z374MTmksqhr+aSh9ZfsCPRrOmDQfX6vhYQr+3jtSwuHbT7z7ZMyDnMK
 dVQ1dyCpBw/RQ==
Message-ID: <ab767e98c5928cc04bb25567293d8e26.mripard@kernel.org>
Date: Mon, 17 Jul 2023 08:30:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 09/17] drm/imagination: Implement power management
In-Reply-To: <20230714142734.112014-1-sarah.walker@imgtec.com>
References: <20230714142734.112014-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, mripard@kernel.org,
 tzimmermann@suse.de, hns@goldelico.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023 15:27:34 +0100, Sarah Walker wrote:
> Add power management to the driver, using runtime pm. The power off
> sequence depends on firmware commands which are not implemented in this
> patch.
> 
> Changes since v3:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
