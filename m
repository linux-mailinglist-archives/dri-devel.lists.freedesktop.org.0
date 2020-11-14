Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6162B2FF7
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D363D6E942;
	Sat, 14 Nov 2020 19:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B853A6E942
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 19:07:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 44FE0804C8;
 Sat, 14 Nov 2020 20:07:46 +0100 (CET)
Date: Sat, 14 Nov 2020 20:07:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: output: Do not put OF node twice
Message-ID: <20201114190744.GA3797389@ravnborg.org>
References: <20201113204157.1942919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113204157.1942919-1-thierry.reding@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8 a=7gkXJVJtAAAA:8
 a=Zjm92R7IybE10ZX_adIA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,
On Fri, Nov 13, 2020 at 09:41:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The original patch for commit 3d2e7aec7013 ("drm/tegra: output: Don't
> leak OF node on error") contained this hunk, but it was accidentally
> dropped during conflict resolution. This causes use-after-free errors
> on devices that use an I2C controller for HDMI DDC/CI on Tegra210 and
> later.
> 
> Fixes: 3d2e7aec7013 ("drm/tegra: output: Don't leak OF node on error")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
Two times of_node_put() of the same pointer looks bad.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
