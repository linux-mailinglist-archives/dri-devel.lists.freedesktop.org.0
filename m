Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12985B389D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDB910ED34;
	Fri,  9 Sep 2022 13:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BCD10ED34
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 13:08:50 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2903FDD;
 Fri,  9 Sep 2022 15:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662728929;
 bh=95i6pSYo5KId5a16NEEkx8bNHa3xBU953QjVyHVJZlg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=vj3bjLgSQDSA6XAAW28orIxzoaLcPXGmeJ6gVGILFxPoqRQMcI66x+BNQrs8h7QNi
 /vuQ003qmMkuMoce/GqyRmFjQt90uHHBNLThoxVTkrztazJGRRi/1kcImrYM3fGYld
 HSyITzcVp7igtmm/gpJTvFlKaGkZi4dQTNHMMXEY=
Message-ID: <49fba94f-c3b3-d131-2c53-5563675400be@ideasonboard.com>
Date: Fri, 9 Sep 2022 16:08:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm: omapdrm: Improve check for contiguous buffers
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220825162609.14076-1-afd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220825162609.14076-1-afd@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2022 19:26, Andrew Davis wrote:
> While a scatter-gather table having only 1 entry does imply it is
> contiguous, it is a logic error to assume the inverse. Tables can have
> more than 1 entry and still be contiguous. Use a proper check here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Changes from v1:
>   - Sent correct version of patch :)

Looks fine to me. But where do you need this? Are contiguous buffers 
with multiple sgt entries handled correctly elsewhere in the driver, 
i.e. do they work? =)

  Tomi
