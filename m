Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B8B2EBA8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCAC10E859;
	Thu, 21 Aug 2025 03:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="MQWMeOsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1FA10E382;
 Thu, 21 Aug 2025 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=tIDAFgFXP+KfCHaBZYFy17v8lTqJ/ZVxo+olFKcoIuY=; b=MQWMeOsc+RDyD8Tr1/R8PmI0OQ
 iu1epjTKc78mfsv7VX1uKwZfZ8nTGPaOrPpF7e1+Xjsv6Od3IIwmNjTmuMNz3rPNeGdKtSuG3Y5uk
 tn9sQcda55euFysdFxBzGWMfXp5kMfNTiDVkN/V/b4qsLj2t1Wq6Sz9VMtCnkEswt1H4ZaS1G/JJy
 KMTPF50GwCSFjdDhJmDeNE7U+GwBpxKYy0Jfels2bQyjBesPWsUUsL9xih/z4o4sYWkv4T+WHASMI
 ktdoospC+Y45wsC/cOKnxhRi8HsIXdwE2lvpVo9Wfnn7HLAgUiCMN7D1cU7PymKMMeKWI3TSKIAUJ
 EH6NzA4Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uovdS-0000000Fb0r-3xFG; Thu, 21 Aug 2025 03:06:42 +0000
Message-ID: <0f11100e-ca60-44a8-9826-03c80675446f@infradead.org>
Date: Wed, 20 Aug 2025 20:06:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] docs: gpu: Fix spelling in gpu documentation
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com,
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
 <20250821025957.22546-3-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250821025957.22546-3-rakuram.e96@gmail.com>
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



On 8/20/25 7:59 PM, Rakuram Eswaran wrote:
> Fixed following typos reported by Codespell
> 
> 1. complection ==> completion
>    implementions ==> implementations
> In Documentation/gpu/todo.rst
> 
> 2. unpriviledged ==> unprivileged
> In Documentation/gpu/drm-uapi.rst
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/gpu/drm-uapi.rst | 2 +-
>  Documentation/gpu/todo.rst     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)


-- 
~Randy
