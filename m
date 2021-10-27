Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DC443C54A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD876E5A1;
	Wed, 27 Oct 2021 08:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3496E5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 08:35:26 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C20C596;
 Wed, 27 Oct 2021 10:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635323724;
 bh=PHqL24TPiqhLyMpdtDuXEIKdxWSbGMXdpe3rK+VcaNA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XTSQndbk/yHNJ55gENbsQTXHHVqsYl9jmrDWL/w/ZIpJdq1liXB7woTOqoy+vLfu6
 Llaemg6BhqF3it1mYfbmnMc6k+TqkT+D8NylM4+PIb2V41MFhm7agCBouYo0fGyzbN
 46+jhG7hF7s0Op4EnBtsyt8RXaYwbMU79OnubRNk=
Subject: Re: [PATCH v6 3/9] drm/omap: Add ovl checking funcs to dispc_ops
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-4-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <aecc7b00-3b12-f419-07a9-db4e471b2408@ideasonboard.com>
Date: Wed, 27 Oct 2021 11:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-4-narmstrong@baylibre.com>
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

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> In order to be able to dynamically assign overlays to planes we need to
> be able to asses the overlay capabilities.
> 
> Add a helper function to be able to retrieve the supported capabilities
> of an overlay.
> 
> And export the function to check if a fourcc is supported on a given
> overlay.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++++++--
>   drivers/gpu/drm/omapdrm/dss/dss.h   | 3 +++
>   2 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

