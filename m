Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ADD7F63F1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 17:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2110E76E;
	Thu, 23 Nov 2023 16:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637C810E76E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 16:29:57 +0000 (UTC)
Message-ID: <d3a6e1df-cb2c-4d8c-a4ad-c9df6f68dd6e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700756995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvZq7up+PPvAW4sGoG6+g/5iaMGk3fIhaBZ9sHchUQc=;
 b=Q6vOvRswfZc7dJeYZkIP0jS8oUTNG3/pt6Sq/97jrBqjIVRqHFSUZqptOfPyzwIi5cc9Dc
 tClFVBPLfMQ+YV1hZdb9+vpSwfE5nqjGezk5hJaDJMIZDsWv5oxMMrGMrn9x/9JLthu0M/
 FbXZQRTGhgNX7mtSjcAtZsBc4HeyXpw=
Date: Fri, 24 Nov 2023 00:29:49 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
 <963d7722-738f-4e46-bfb7-131027ca5341@linux.dev>
 <CAA8EJpoTWoSYjyZL7ARQiAeWabcXymy6f-tAzPM3YO=C_GOOZw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpoTWoSYjyZL7ARQiAeWabcXymy6f-tAzPM3YO=C_GOOZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/11/24 00:06, Dmitry Baryshkov wrote:
> On Thu, 23 Nov 2023 at 17:41, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> Hi,
>>
>>
>> On 2023/11/23 16:08, Dmitry Baryshkov wrote:
>>>> The semantics of DRM_BRIDGE_ATTACH_NO_CONNECTOR flag are implement-defined,
>>> No, they are not. Semantics are pretty simple: do not create the
>>> drm_connector instance. Pass the flag to the next bridge in the chain.
>>
>> Then, my problem is that do we allow create a drm_connector instance in drm bridge
>> driver nowadays?
> Yes, if there is no DRM_BRIDGE_ATTACH_NO_CONNECTOR. But that's deprecated IMO.

Then can you read the code in bridge/ti-tfp410.c please?
The tfp410_attach() function will create drm_connector instance manually
if the conditional (flags == 0) is true.

