Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886ECB07C3
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 17:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5D10E1FA;
	Tue,  9 Dec 2025 16:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="m5bcWrlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD5C10E1FA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765296075;
 bh=+nIjrCZLH9H7mY4tgHGhhjDTB7lzbE5Ym9Qf3cRlkz0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=m5bcWrltUtzDuJEZfhstcuTg6h+FHIvyU9ToPE26PuDxC3WLq5YoD/9pabksdaqjB
 5CiDSLiy2+tLoHvgc81MCtuFVIYQM6EzwrqTpy73zeYYm0lUq+a8oARPu43WSN7cz2
 s9ayXacXH84hp8beHhwnYJcc3QGG1T+eCWB4sWXxGDeuynAK4x0IC9ssqEBBEE+SRe
 lOZF84dqx1vYbZMFY1h0SEQ+uETzli/SyIi2cDqyzX+zdTJmgW1kLXyOvsvS9gubKA
 We1MDuDxTthopJ7BociBEOZrmpL+r1ofCHvrHTlsg+Hlw4hcJReQtqpxCWEP9xVIO1
 n9kGueK0XwuWw==
Message-ID: <e9a8f838-0721-4ba4-bc07-022193b53646@lankhorst.se>
Date: Tue, 9 Dec 2025 17:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/Kconfig: cleanups
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1762251845.git.jani.nikula@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <cover.1762251845.git.jani.nikula@intel.com>
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

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

Den 2025-11-04 kl. 11:25, skrev Jani Nikula:
> Clean up drm/Kconfig a bit.
>
> Jani Nikula (4):
>   drm/hyperv: move Kconfig under driver directory
>   drm/vgem: move Kconfig under driver directory
>   drm/Kconfig: move generic Kconfig options above drivers
>   drm/Kconfig: sort driver Kconfig source list
>
>  drivers/gpu/drm/Kconfig        | 199 ++++++++++-----------------------
>  drivers/gpu/drm/hyperv/Kconfig |  14 +++
>  drivers/gpu/drm/vgem/Kconfig   |   9 ++
>  3 files changed, 82 insertions(+), 140 deletions(-)
>  create mode 100644 drivers/gpu/drm/hyperv/Kconfig
>  create mode 100644 drivers/gpu/drm/vgem/Kconfig
>

