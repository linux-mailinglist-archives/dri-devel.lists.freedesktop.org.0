Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A7CABA1F
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 22:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319810E36D;
	Sun,  7 Dec 2025 21:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="orrmjAla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5810E36D
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765143533;
 bh=imzAolqIJKjIbBRAXPxzblwltEq5JIsw4/FvhKhP6ww=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=orrmjAlagW6XDsR1fClEviYK79zgQeGISPlh1h59zn79/Dub36W76X9kawI0jnq7L
 l5neOqdpbF/L+JnzQzThej9fgzAZmHBda0jF24uHuf0HRuWgAnpP9xjgUsmgzlRA/F
 mOcUBUKE0N9F4gwtjeJYobHj2EuN74B9BvYJaJE3ThuPzs3PDqOQUcuxmz+1TkRCAc
 2iWi+g8AGWI7qj+LuB+fE4loES3o9RhFY3GQQI7sY8M6zU95Eqq3aCqsj+eIi89zDi
 iNA8GUzGzwbNHBF2bsm7Xnp4VXtPgIjyO8GxFu0rUbMdTZ3LTcFyfWdMHrEsOPWggF
 G0uM8DjE+iIAQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3345B17E1017;
 Sun,  7 Dec 2025 22:38:53 +0100 (CET)
Message-ID: <ab0eee09-56bf-4a8e-8feb-f0bc355d476b@collabora.com>
Date: Sun, 7 Dec 2025 23:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
To: Maud Spierings <maud_spierings@murena.io>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
 <4ec78537-5184-4e6b-9ada-ff268fbe9c3e@murena.io>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4ec78537-5184-4e6b-9ada-ff268fbe9c3e@murena.io>
Content-Type: text/plain; charset=UTF-8
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

On 12/7/25 3:16 PM, Maud Spierings wrote:
> Awesome work! I've been waiting for this feature!
> 
> I can now actually get 1440p100 on my display and 4k60 on my tv over HDMI.
> 
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Thanks,
Cristian

