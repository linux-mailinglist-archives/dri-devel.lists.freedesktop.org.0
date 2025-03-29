Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E06A7567E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 14:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6110E202;
	Sat, 29 Mar 2025 13:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wCH8gELH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DBE10E202
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 13:46:01 +0000 (UTC)
Message-ID: <3fb4b232-a0c2-4abe-a85e-2e4d938a22c7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743255959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpsKaScSHv7GrRRXDH8nchWWCagrc+J7SdH8scHXBkA=;
 b=wCH8gELHNGI3n2ux8QZYZAEchSEmxsdpuGiY4IBYA5VtNGhE2QbILw6yGJKQ5GesWesJFA
 3Sv3qMmqyY28js7QLFRhkehoR6a6ulwTlMSK7chAVTi5R+Jt/gn+0AIIF2OCT80lCCaM5l
 2Bgxd8H5BXzZ64ovRNFj4aCOYnQcb5o=
Date: Sat, 29 Mar 2025 19:15:09 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "j-choudhary@ti.com" <j-choudhary@ti.com>,
 "u-kumar1@ti.com" <u-kumar1@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "devarsht@ti.com" <devarsht@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "praneeth@ti.com" <praneeth@ti.com>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
 <8366a3d736f9937667aab024895a59e5947dd4a5.camel@siemens.com>
 <2c0b49a2-7cf3-4432-bab0-1eb110e8e8c2@linux.dev>
 <86d5d285a8467b3fcdadd3cf37ac0e4cbc874626.camel@siemens.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <86d5d285a8467b3fcdadd3cf37ac0e4cbc874626.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi Alexander,

On 26/03/25 00:27, Sverdlin, Alexander wrote:
> Hi Aradhya!
> 
> On Thu, 2025-03-20 at 18:54 +0530, Aradhya Bhatia wrote:
>>> I've tried to test the patchset with necessary pre-requisites and DT additions
>>> with a single channel LVDS pannel and while I'm not successful yet, I've also noticed
>>> the following warning:
>>>
>>> tidss 30200000.dss: vp0: Clock rate 24285714 differs over 5% from requested 37000000
> 
> ...
> 
>> While you have mentioned that you did add the prerequisites, could you
>> confirm that you applied the (now older) dependency patch mentioned in
>> the v4 cover-letter[1]?
>> Ideally, you should not observe these concerns if [1] were successfully
>> applied.
>>
>> More importantly, if you are already on latest linux-next, I would
>> request you to use v6 of this OLDI series[2], along with the latest
>> dependency patches[0], as the older dependency patch is simply not
>> applicable on latest kernel anymore! =)
> 
> Thanks for all the hints and links! I can confirm that with linux-next and this
> time all the necessary dependencies applied, I don't see the above warning.
> 

I am glad it worked! Thank you for taking the time out, and testing the
patches!  =)

-- 
Regards
Aradhya

