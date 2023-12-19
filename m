Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F59D818807
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 13:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A8510E17B;
	Tue, 19 Dec 2023 12:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4D810E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:53:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43558B8171B;
 Tue, 19 Dec 2023 12:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23465C433C8;
 Tue, 19 Dec 2023 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702990401;
 bh=3NmhXJQ7QHQFh1L8RP2t/8EnsXilOSZx6z+ReJD3+rI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=hpTVy1/D131MtaaFE+GY1w04ZsqoqjHu8jgip+p4cL7c8+/o7kHbLNs7b7zlyIpdc
 kigUFKqHBqXHqCYF7MOUCifznyNrUepmsXA34Ba2j/RhXw1dRFs99x/Jr+IliMj099
 qClhCBEeXhQRHFTTUjE/gkN1fkSUukhMyMRcPyQlmVPE9uHvUUzfTQR7I39eIiEDTk
 Yy8MxYt32McjvJDMq7eafgE8BYjUsNER95xcoH6KRi5NyIR3vA+O6GKi7MEcLxkrdd
 trMBdQROYJ9zn0rYfTNSktdSaD+5jHA24KMYvusMkRC9+XEbN/SYQMFZYYOaeG/jLg
 FptQR80wxdWQQ==
Message-ID: <473e996c20451aa5bb700d30fdf0f16b@kernel.org>
Date: Tue, 19 Dec 2023 12:53:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Johan Jonker" <jbx6244@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/rockchip: rk3066_hdmi: remove unused drm
 device pointer
In-Reply-To: <745f84db-dc9b-81b2-6171-4d8d86a96966@gmail.com>
References: <745f84db-dc9b-81b2-6171-4d8d86a96966@gmail.com>
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
Cc: tzimmermann@suse.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Maxime
 Ripard <mripard@kernel.org>, andy.yan@rock-chips.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023 16:48:40 +0100, Johan Jonker wrote:
> The drm_dev field in the rk3066_hdmi struct stores a pointer to the DRM
> device but is never used anywhere in the driver. Let's remove it.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
