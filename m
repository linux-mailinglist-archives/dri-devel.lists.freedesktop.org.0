Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65736A0B36
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F68A10E4D5;
	Thu, 23 Feb 2023 13:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC4810E4D5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:51:46 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AD852E4;
 Thu, 23 Feb 2023 14:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677160304;
 bh=IekzGIFeIjN+4AsEg5LXhutO94Os1zLesiMqLQ/A4GI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y3CcwI99NUv/UTrLCJmWwzXuZpEmbR6BJT1oJag99ny/j/051Le2wC9dExeQvbLkX
 Q31BqBhKYMb8yoMiwSHh2l8/CO2OZBoVGoTLXduXQmUb/DpqSKb3LvzdwzHBB/SJpr
 +FMovKFTC1x3kdai9sCPE6cB7QjUdXnYEDqW9uto=
Message-ID: <8b32b8da-31c4-e3e8-9777-d72f069cf133@ideasonboard.com>
Date: Thu, 23 Feb 2023 15:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] drm: rcar-du: Rename DORCR fields to make them
 0-based
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222234212.5461-2-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222234212.5461-2-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 01:42, Laurent Pinchart wrote:
> The DORCR fields were documented in the R-Car H1 datasheet with 1-based
> named, and then got renamed to 0-based in Gen2. The 0-based names are
> used for Gen3 and Gen4, making H1 an outlier. Rename the field macros to
> make them 0-based, in order to increase readability of the code when
> comparing it with the documentation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_group.c |  8 ++++----
>   drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 26 ++++++++++++-------------
>   2 files changed, 17 insertions(+), 17 deletions(-)

I thought I already did this... And I see I did, but never sent the 
patch as I couldn't figure the part 2 =).

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

