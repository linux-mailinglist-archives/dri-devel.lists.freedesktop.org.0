Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FE4A6CEC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9722A10E61D;
	Wed,  2 Feb 2022 08:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A53D10E61D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:30:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DC5CB8387F;
 Wed,  2 Feb 2022 09:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643790639;
 bh=Zj1JtM0c+7QfW7HPKMNSn23DdOqtd9tf76hcikKWx1Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dypd7HwKzqxBGY3MeKs3FLLni7CKKmNwxhHdv2pxMYEuM1lhSMfa0dMMOHGGznVi8
 Y8309eKRaoeZ83Ux6ZLEvtCYAYfRcRA5YjDZkJEAcNteEpwmBmM3oznJthaTVmpOtR
 jarRu6/srAue1Bbj2vcEsodHLJ1BeWBeaM0Wqkea6H9Zx5hDg7WoLKtx7oIM1jM6Md
 4+sHIMjANbft5m9uvyJ3SBs7HWOk8Yn9XyX7zHEatwC5nxFso4NdO9S13xSjS5Ovee
 xxS5ZAHcbA4iUjFsQjRCioWh7SV50AkYRopgHBbsLVQMR8yTTqdoCTK8XfMnpwGnbD
 PNRfnTv4miFTQ==
Message-ID: <61ec1e37-d1a2-6561-493a-06bf37cd71d6@denx.de>
Date: Wed, 2 Feb 2022 09:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] drm: mxsfb: Fix NULL pointer dereference
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-3-alexander.stein@ew.tq-group.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220202081755.145716-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 09:17, Alexander Stein wrote:
> mxsfb should not never dereference the NULL pointer which

... not ever ... but that's really a nitpick.

> drm_atomic_get_new_bridge_state is allowed to return.
> Assume a fixed format instead.
> 
> Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

It's perfect otherwise, thanks !
