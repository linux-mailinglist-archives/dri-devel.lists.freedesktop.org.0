Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACBE4A6D74
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F91410E704;
	Wed,  2 Feb 2022 09:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAF210E704
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:03:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 627FE8388D;
 Wed,  2 Feb 2022 10:03:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643792618;
 bh=bjTKbC6HxhU4ViFbqZSDBg7xvYw9XKMELLx27c1dNkA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c0IqNhCGUO9vp8ubSTIBmtyzHAEvWWjf16i6y7JlFMgpAaphRfe9skw1TkzZR/x1m
 t8vTlLNcbGp2mqWLKXDeqjNDLLQvfa8DbZ8hJ6OZGKZ4HuTgHEF84/eSw3+3F4usSq
 4PROy9wVcOL1ShCGmo0jgCw08nAFoF/Nlq1vH1/HmGWhElXG3Msh4c9h7QPX6t+qQO
 JOpX1mxsmzvBTrS3KlRkVcpNLAVVuE89BYrJG7UisniK5AWke1ooJ+FCugz2tpJJ22
 y3+SmUlqvthE5p8pxiO+gcUW+lQO8P45Vpvru8OVcXdKVP9Ql6GzoHUnvYUJ1QeEle
 QGDjjvBa/wqsg==
Message-ID: <fe130a61-a93d-ab30-f7e8-dab69a289d46@denx.de>
Date: Wed, 2 Feb 2022 10:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: (EXT) Re: [PATCH v2 1/2] drm: mxsfb: Use dev_err_probe() helper
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-2-alexander.stein@ew.tq-group.com>
 <af6895d0-8514-f151-2675-2454cd15deeb@denx.de> <2756789.mvXUDI8C0e@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2756789.mvXUDI8C0e@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 09:58, Alexander Stein wrote:
> Am Mittwoch, 2. Februar 2022, 09:29:20 CET schrieb Marek Vasut:
>> On 2/2/22 09:17, Alexander Stein wrote:
>>> Use the dev_err_probe() helper, instead of open-coding the same
>>> operation. This also adds a nice hint in
>>> /sys/kernel/debug/devices_deferred.
>>>
>>> Reviewed-by: Marek Vasut <marex@denx.de>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>
>>>    drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> V2: ... what changed ... ?
>>
>> (probably nothing, since the patch still looks fine)
> 
> I put the changelog into cover letter (0/2). Content hasn't changed, I just
> added your Reviewed-by.

I missed it in the cover letter, got it.
