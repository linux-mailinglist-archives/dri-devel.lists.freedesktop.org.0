Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B463F970
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 21:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7010E15F;
	Thu,  1 Dec 2022 20:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9A610E15F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 20:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iw4M20rqbNVbmQFKPo6bE6N49hfuMUJ9mnmSv6HBv9U=; b=dG/fKXvoDMLcx0VcxBIANH6SDH
 SQEytzRP2PqabDUPlBfd5Bc8gf5Jwa3aMrEV+2crFMDG25RkaZNN0gBtZQvSVVHQuHf8//Ir55mLm
 EhTa0Mqj6dZdp01/DbhQmXxgscLH0vqXbR889zdWMTEqcUi8eKLImN2Ng3fn3me5F5kxPUI3VaGJw
 zjOskKZ4og8y+9nUjX3tkkc5p1poEVphZ9mjPmcKHYQAtCyEBorg3JtH0Kr5yRnF15G3iPs4x7p8u
 5hr+B0oZJrPQfYWlcIQeaHR2m/W0Hu5hwpB+hYiRyCq1EndGViptnsG/Xh0FyGphgkC0QrEVlTGzf
 CvMdaY8w==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=53059)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p0qXX-0002sW-NP; Thu, 01 Dec 2022 21:52:15 +0100
Message-ID: <568aa7a3-2b23-a2d9-5be2-859227be02a7@tronnes.org>
Date: Thu, 1 Dec 2022 21:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221201141642.uvonbrny4rhuacl5@meerkat.local>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.12.2022 15.16, skrev Konstantin Ryabitsev:
> On Thu, Dec 01, 2022 at 02:34:41PM +0100, Javier Martinez Canillas wrote:
>>>> Konstantin,
>>>>
>>>> Can you add a rule in b4 to exclude stable@vger.kernel.org
>>>> (stable@kernel.org as well?) from getting the whole patchset?
>>>
>>> stable@kernel.org is a pipe to /dev/null so that's not needed to be
>>> messed with.
>>>
>>> As for this needing special casing in b4, it's rare that you send out a
>>> patch series and only want 1 or 2 of them in stable, right?
>>>
>>
>> Not really, it's very common for a patch-series to contain fixes (that could
>> go to stable if applicable) and change that are not suitable for stable. The
>> problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
>> individual patches to different recipients, and everyone get the whole set.
>>
>> So either b4 needs to have this support, exclude stable@vger.kernel.org when
>> sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.
> 
> I think what I can do is a special logic for Cc: trailers:
> 
> - Any Cc: trailers we find in the cover letter receive the entire series
> - Any Cc: trailers in individual patches only receive these individual patches
> 

That should cover my use cases. I can now do 'b4 prep --auto-to-cc' and
then trim down the cc list in the cover letter if necessary.

> Thank you for being patient -- we'll get this right, I promise.
> 

Thanks for getting it right. b4 can replace parts of my own tooling and
do it smoother so I think I'll continue to use it.

Noralf.
