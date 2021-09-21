Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831DA41354F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332D76E9A2;
	Tue, 21 Sep 2021 14:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0F6E9A2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:28:40 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5F822BA;
 Tue, 21 Sep 2021 16:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632234517;
 bh=YfXp04HKBXQlKS++vdq6OqS5xUMWCLP0iVA5zAB44l0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sZ3N0Va3F24EunkXY8ddYihjHAvGLO/ufcGs0jj/Z3UBisS8rGPyel3jgcZEmcIi5
 MId3ngPGpJvb+B1Vk7z6pzX15HGL1yUEXz0HttWoRc1MQsLJytvKW+Engh/sPTRg5L
 etStZ/csenlkKM3HNY/PiAYRcuTCViI+59USemj8=
Subject: Re: [PATCH 0/3] drm/omap: add crtc properties
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210921141654.66550-1-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <44ecbd74-b125-6f96-316f-c79dfc052af2@ideasonboard.com>
Date: Tue, 21 Sep 2021 17:28:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921141654.66550-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Neil,

On 21/09/2021 17:16, Neil Armstrong wrote:
> This patchset adds the following CRTC properties:
> - background color
> - transparency keying property
> - alpha blender on DSS3
> 
> Tomi Valkeinen (3):
>    drm/omap: add crtc background property
>    drm/omap: add crtc transparency key property
>    drm/omap: add alpha blender property

Nack, these don't comply with DRM uAPI rules. That's why I never sent 
them upstream.

https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements

  Tomi
