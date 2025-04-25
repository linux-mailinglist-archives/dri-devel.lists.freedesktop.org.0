Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5FA9C902
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 14:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDEE10E964;
	Fri, 25 Apr 2025 12:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HuuAVsCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE7810E964
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+A9u+ebGFXpWrBdzblr4M9bejgEoUFrV8zWN6KJE79M=; b=HuuAVsCOtfijz17vlxhnpOz8Ug
 h5WkyYDKjkoKiqx5Ez3sr7YYZNPzG5khl99k+w38j+ej7QEBG/jSGD70ynE4HZzNpkhKyACAKsDAh
 EDa1fWP7Z2GbIZbr6OFmaJeq2B8NZV8TZWH64l6X0IgqcTMEfv5fYfcKbc6Ow1+cMcX0FFKnX8NWJ
 ViAr+HaMhBn0+jMVL4DkT39BVLRlNFthgfYHRdKPp1MNCq60ODm1xgeEH/Cq1L1Y+suU9Dbd/7NOC
 /B4rQTux5hUgoHsoe9zB27Uh3vja+LF3xzJ6lR3WZbkKAG5HoewDugMRVJmJdB8AlZJzxy/ncgRj/
 nZWfhVYw==;
Received: from [77.26.4.178] (helo=[192.168.50.63])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u8IGN-008KA0-Ve; Fri, 25 Apr 2025 14:34:39 +0200
Message-ID: <f8ffe67d-5267-4e97-9e36-359d39eadb71@igalia.com>
Date: Fri, 25 Apr 2025 14:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: fix client obtained from axi_ids on V3D 4.1
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emma Anholt <emma@anholt.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250409155504.1093400-2-jmcasanova@igalia.com>
 <ee5cbc11-b909-4754-ab62-de9581d9785e@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Content-Language: en-US
Organization: Igalia
In-Reply-To: <ee5cbc11-b909-4754-ab62-de9581d9785e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

El 10/4/25 a las 14:31, Maíra Canal escribió:
> Hi Chema,
>
> On 09/04/25 12:55, Jose Maria Casanova Crespo wrote:
>> The client that causes an MMU error is expected to be reported.
>> But in the case of MMU TFU errors, a non existing client
>
> "In the case of MMU errors caused by the TFU unit, [...]"

Message updated.

>
>> was being reported. This happened because because the client
>
> There are two "because" in the sentence. Could you add an example of the
> a MMU error with a non-existing client in the commit message?
>
Example added.

[...]
>>           }
>>             dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 
>> 0x%llx%s%s%s\n",
>
> As we are declaring `begin` and `end` as hexadecimal numbers in the
> code, could we display AXI ID as a hexadecimal as well? Just to ease
> future debugging. You would need to change "(%d)".
>
Change done.
>
> Please, don't forget to mention this change in the commit message of v2.
>
Already included in v2.

Thanks for your review Maíra.

Kind regards.
Chema Casanova

