Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FEB563211
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D2311AC58;
	Fri,  1 Jul 2022 11:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C4911AC58
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 11:00:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 520E78443A;
 Fri,  1 Jul 2022 13:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656673202;
 bh=M1EhgAyXvbVicOWMZ9YHHs7MmwJjF/gKwPVVxzJfPxg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=izMZ2u+dmRghwxZKSE6j0FX8RqJMXSzWIkXqz0GdWBcGX0JjP/vmhhkpu79m4Tz1T
 0NT7UNvMO37lsIHpibwUL1bdYv6VVzyxVIaSU24VH+QsMKOLFmyBSO+s1SZA1sM1kt
 lhdf8Hb7RCatVGPVWDBLVefe+2cg8lDsFWo9y0UvW0+j4z+Q7Jayf1elmt8uJxGeS0
 zkM2EXu3pF+VYgw73xXYzBuGaVIYNLOiWLLcZhVtULeKxT9oq/7fmMNznXRRhpxboy
 9ZqXCksbUSHp07LMsmJNd4ChMrG/q2n13D64+Ew6XcYE1v2DOTde+O1AFIHRP1C7Fi
 /LWC6zILHXQLA==
Message-ID: <66b6ed2f-a2db-e02d-503f-5bc736c4ee57@denx.de>
Date: Fri, 1 Jul 2022 10:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] drm/bridge: fsl-ldb: Drop DE signal polarity inversion
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220701065634.4027537-1-victor.liu@nxp.com>
 <20220701065634.4027537-4-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220701065634.4027537-4-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/1/22 08:56, Liu Ying wrote:
> It's unnecessary to invert input data enable signal polarity
> according to the output one. Let's drop the inversion.
> Since ->atomic_check() does nothing more than the inversion,
> it can be dropped entirely as well.
> 
> Without this patch, 'koe,tx26d202vm0bwa' LVDS panel connected
> with i.MX8MP EVK board does not show any data on screen.

I send exactly the same change yesterday:
[PATCH] drm: bridge: ldb: Drop DE flip from Freescale i.MX8MP LDB bridge

So either can be applied.

Reviewed-by: Marek Vasut <marex@denx.de>
