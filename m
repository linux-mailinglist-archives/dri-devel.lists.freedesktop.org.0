Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3CC1F510D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 11:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25036E4AA;
	Wed, 10 Jun 2020 09:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 74284 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jun 2020 09:24:38 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCFE6E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 09:24:38 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E886329E;
 Wed, 10 Jun 2020 11:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591781076;
 bh=d7/Z3a/cNXkRgco/e+DWGswAhTOHqw7Q8TykDvLriX8=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LMAKZMUapn0fLuAWidUbhBH38o8aScAIFM4BG6euiZ8or5w/1QY1TP0uo+Wc2O8yY
 EWvalSfx2HB+GpIFSASFCpM/gIg7hzL/He47JjlZ6o3h98fOeU6+9NN9L+Dy71g85k
 3KQKaX/4TVxBytCf6iiw1LaFAmyQts+Z+LCHBTvE=
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
To: Qian Cai <cai@lca.pw>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200608031622.GQ22208@pendragon.ideasonboard.com>
 <1DA4E5B7-BB3A-476B-B09A-24EC89583C3D@lca.pw>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ed5d28ac-3168-b331-bb9e-63fd8c043ae2@ideasonboard.com>
Date: Wed, 10 Jun 2020 10:24:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1DA4E5B7-BB3A-476B-B09A-24EC89583C3D@lca.pw>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: airlied@linux.ie, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qian, Laurent,

On 08/06/2020 05:30, Qian Cai wrote:
> 
> 
>> On Jun 7, 2020, at 11:16 PM, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>>
>> I forgot to mention, I think the subject line should be
>>
>> drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
>>
>> Could you please let me know if you're OK with these two small changes ?
> 
> Yes, I am fine with those.
> 

With the fixups,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
