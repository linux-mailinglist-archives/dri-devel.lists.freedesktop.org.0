Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264241EE15
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 15:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2CE6ECE5;
	Fri,  1 Oct 2021 13:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB2D6ECE5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y+YA5LwBpSTOL3MOpd5F/tWaBfpQEM9e70XN2H43+OQ=; b=ZKwiqvIRyMrCa1keFiFXdy9LlD
 ApTws9V2Bd3BwRenbWO0cK5wVHAUeVq9LCRLgEc88LDPYnZ2omihjq1IHBCe532sf1F11fQhltsVK
 6qLuIjqS+Kk4FobdOesQrY6vdXeOUIdbmPGR2QaGaP2Wt/GtfQgjMsLskL7FUsFANE6z6mEOFgcXh
 dajQH3KCXy9GqPL1lGmGnYCCZ2e2K17SVbiwmN4/T/NpWfbmRC1sGIc9E5z1jF2AKGo/SQXe+iy9C
 4xPwz+loI4Uq1LUco5CDkAlxtmjXqQ5LOBmMFzq6FpVNe2dxP9g9vP/mbcM0D55B2+JYR8ceJ2cPI
 5xk18eqA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52966
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mWIBL-0002XU-4h; Fri, 01 Oct 2021 15:02:31 +0200
Subject: Re: [PATCH v3 0/6] drm/gud: Add some more pixel formats
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: peter@stuge.se
References: <20210929191201.34456-1-noralf@tronnes.org>
 <84f5f16b-91c3-2e82-b7f2-9e9c49983d3c@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8cc6b3fa-0bd3-a869-7840-c9026f5f1fb0@tronnes.org>
Date: Fri, 1 Oct 2021 15:02:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <84f5f16b-91c3-2e82-b7f2-9e9c49983d3c@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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



Den 30.09.2021 11.10, skrev Thomas Zimmermann:
> Hi
> 
> Am 29.09.21 um 21:11 schrieb Noralf Trønnes:
>> Hi,
>>
>> I'd appreciate if someone could review the 3 small driver patches.
> 
> Series is
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Many thanks Thomas!

Noralf.

> Best regards
> Thomas
> 
>>
>> Changes since version 2:
>> - Drop the patch adding module parameter 'xrgb8888'. Both Daniel and
>> Thomas had some comments that eventually led me to to drop this for now.
>>
>> Noralf.
>>
>>
>> Noralf Trønnes (6):
>>    drm/fourcc: Add R8 to drm_format_info
>>    drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
>>    drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
>>    drm/gud: Add GUD_PIXEL_FORMAT_R8
>>    drm/gud: Add GUD_PIXEL_FORMAT_RGB332
>>    drm/gud: Add GUD_PIXEL_FORMAT_RGB888
>>
>>   drivers/gpu/drm/drm_format_helper.c | 88 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_fourcc.c        |  1 +
>>   drivers/gpu/drm/gud/gud_drv.c       |  6 ++
>>   drivers/gpu/drm/gud/gud_internal.h  | 12 ++++
>>   drivers/gpu/drm/gud/gud_pipe.c      |  6 ++
>>   include/drm/drm_format_helper.h     |  4 ++
>>   include/drm/gud.h                   |  6 +-
>>   7 files changed, 121 insertions(+), 2 deletions(-)
>>
> 
