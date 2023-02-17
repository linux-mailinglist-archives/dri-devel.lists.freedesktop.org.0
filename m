Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2369AE1B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 15:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A94510F00C;
	Fri, 17 Feb 2023 14:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA95110F00C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 14:33:27 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A24132D8;
 Fri, 17 Feb 2023 15:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1676644406;
 bh=/TcdjEx9LqyR2Jd6TwqHKvqfue+EmTjQKFENC39YQ7A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GF9OxHb8bIFZ+yj/jk8VmOUIk3HddCq/JLCpduYDgbORS0A5kgctHHvjZn45yCQ6C
 Udk7yKU61dGQY6pmjNy3F69dAs1d5QqY9lA5eutALm/ZkGrlbVXDoLTIIxhi6ekmdP
 8rAbpwr4D5TMr56IiXhZ+ApVjZAf4NN2MDjJ5a3g=
Message-ID: <ab472663-efd3-ec73-ec7b-dcaf4d914973@ideasonboard.com>
Date: Fri, 17 Feb 2023 16:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/6] drm/tidss: Remove return values from
 dispc_plane_{setup,enable}()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-6-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230209154107.30680-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 17:41, Thomas Zimmermann wrote:
> Calls to dispc_plane_setup() and dispc_plane_enable() cannot fail.
> Remove the return value.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
>   drivers/gpu/drm/tidss/tidss_dispc.h |  8 ++++----
>   drivers/gpu/drm/tidss/tidss_plane.c | 11 +----------
>   3 files changed, 9 insertions(+), 22 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

