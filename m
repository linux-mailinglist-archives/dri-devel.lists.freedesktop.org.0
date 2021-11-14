Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C398244F87B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 15:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517C889E86;
	Sun, 14 Nov 2021 14:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288FD89E86
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 14:25:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7C5461027;
 Sun, 14 Nov 2021 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636899949;
 bh=ZV2Hx3+pIL6mKU8se/mh5FSio88H9eOPjUCiqqBfNMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEXnx6VbLq/G2BMMPxLRQ7erP972PFzRoh0VTTIJKNZMRst2e9JgagN4H/KGNaG1F
 O9mxp+qs7h8l1cvr6dgs2wVo2R+uDexa4twqzLBQyg9lDdAIZZNmhyg2JOcy7NqIm2
 +/TAd42dHuaga7bCxwMnOVWjZBTRpDQIGtW4Wh6OI/wNUg3dYxKmDe7BwPbTJxjUzN
 PE84zJNVgFZpigvIy4Qvu7Gd7yUSaYfpWX5aPunG3QkGxYRp668Um3fDSycfg0YFFA
 CHDy81cKJLPRZeg4CrXOBH+IIEaTljLV3Y5vd7sZ5eUj8ysfIs0L3bekdoe1yQ4xkp
 TcoWd7YsZL+Dg==
Date: Sun, 14 Nov 2021 09:25:48 -0500
From: Sasha Levin <sashal@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: AUTOSEL series truncated was -- Re: [PATCH AUTOSEL 5.15 001/146]
 dma-buf: WARN on dmabuf release with pending attachments
Message-ID: <YZEcbEY4HkvZYdOh@sashalap>
References: <20211108174453.1187052-1-sashal@kernel.org>
 <20211109075423.GA16766@amd>
 <3957633e-9596-e329-c79b-b45e9993d139@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3957633e-9596-e329-c79b-b45e9993d139@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Charan Teja Reddy <charante@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 08:05:23AM -0800, Randy Dunlap wrote:
>On 11/8/21 11:54 PM, Pavel Machek wrote:
>>Hi!
>>
>>This series is truncated .. I only got first patches. Similary, 5.10
>>series is truncated, [PATCH AUTOSEL 5.10 035/101] media: s5p-mfc: Add
>>checking to s5p_mfc_probe... is last one I got.
>>
>>I got all the patches before that, so I believe it is not problem on
>>my side, but I'd not mind someone confirming they are seeing the same
>>problem...
>
>Yes, several of the patch series were incomplete for me also...

Odd. I'll keep a closer look next time I send a series out to figure out
what's going on.

Thanks for the heads-up!

-- 
Thanks,
Sasha
