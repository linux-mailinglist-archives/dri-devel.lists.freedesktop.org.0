Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006F4C2D9A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 14:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483010E72B;
	Thu, 24 Feb 2022 13:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DD410E72B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bfNCUtyvzb9CJRk61bVa7pFaZEmsOl3CIux9dInFBqU=; b=QrHLjxpliNG1yNdJxrpxHJfnai
 vkjq1h8v5zbVUoriN9OnB59IJdg1VeISPV6u7/Mdw00c06PxR6AsI3aktAcFVegTtAaIqbK54DDkG
 GGQO/iIOI9cHvX2YD4xxxzLKZQpDQiFR/Ezzpu2Fgx1CbrW2zNAFDUGd95mzg2tHv+1inPZ94g41o
 7gQX/uJbK/vTO37j/QRzRVoBJV/BOkYYWGgAgU6iMfVQLNECr8zG3MqL9H2VkcOv+53FSMv91kCpn
 r3rMDspPRksfC7vRYjQsNHWE1DTr64QSZeEA+plJ9sIx4k5G/TSpE2Kx8FGNjQVe+2/rGZCFEPQok
 GfOJPcCA==;
Received: from [189.79.213.38] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nNEYW-0005bx-4U; Thu, 24 Feb 2022 14:53:16 +0100
Message-ID: <34259fd5-6c04-015d-d7cd-8954399a63d1@igalia.com>
Date: Thu, 24 Feb 2022 10:53:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/todo: Update panic handling todo
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
 <20220224132425.3463791-1-daniel.vetter@ffwll.ch>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220224132425.3463791-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/02/2022 10:24, Daniel Vetter wrote:
> Some things changed, and add two useful links.
> 
> v2: Also include a link to the QR encoding work. Plus review from
> Javier.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: gpiccoli@igalia.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---

Hi Daniel, thanks for the improvement - much appreciated!

Below a comment inline; other than that, feel free to add my:
Reviewed-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Cheers,


Guilherme

> [...]
>  
> -* There's also proposal for a simplied DRM console instead of the full-blown
> -  fbcon and DRM fbdev emulation. Any kind of panic handling tricks should
> -  obviously work for both console, in case we ever get kmslog merged.
> +* Encoding the actual oops and preceeding dmesg in a QR might help with the

Email client complains about "preceeding" word - misspelled maybe?

> +  dread "important stuff scrolled away" problem. See `[RFC][PATCH] Oops messages
> +  transfer using QR codes
> +  <https://lore.kernel.org/lkml/1446217392-11981-1-git-send-email-alexandru.murtaza@intel.com/>`_
> +  for some example code that could be reused.
>  
>  Contact: Daniel Vetter
>  
