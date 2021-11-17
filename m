Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB094549EE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64246E4C4;
	Wed, 17 Nov 2021 15:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B002E6E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id AB13F41F28;
 Wed, 17 Nov 2021 15:31:52 +0000 (UTC)
Subject: Re: [PATCH] drm/format-helper: Fix dst computation in
 drm_fb_xrgb8888_to_rgb888_dstclip()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211117142206.197575-1-marcan@marcan.st>
 <926ff1f6-2255-4e94-3a24-4fc78260f27d@suse.de>
From: Hector Martin <marcan@marcan.st>
Message-ID: <a827df6b-94fb-5948-90a1-8da000c132b6@marcan.st>
Date: Thu, 18 Nov 2021 00:31:49 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <926ff1f6-2255-4e94-3a24-4fc78260f27d@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2021 23.56, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.11.21 um 15:22 schrieb Hector Martin:
>> The dst pointer was being advanced by the clip width, not the full line
>> stride, resulting in corruption. The clip offset was also calculated
>> incorrectly.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hector Martin <marcan@marcan.st>
> 
> Thanks for your patch, but you're probably on the wrong branch. We
> rewrote this code recently and fixed the issue in drm-misc-next. [1][2]

Oops. I was on linux-next as of Nov 1. Looks like I missed it by a week!

Sounds like I'm going to have to rebase/rewrite the other series I just 
sent too...

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
