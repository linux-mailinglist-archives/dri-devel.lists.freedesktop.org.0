Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46D88731E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 19:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ACF1126E6;
	Fri, 22 Mar 2024 18:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="p3kx2f52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8C51126E4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 18:30:22 +0000 (UTC)
Message-ID: <839a7448-b958-402e-862a-fc3f7d86e797@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711132217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbmcNXR4M4wRC+ClOsomWLe4oemdmZUUssvEnkGlvp0=;
 b=p3kx2f52xDB3YwKuEFEml3CfCh9PqKqt8ttYlH7lbRq8hf+yWMWgo1bhVAK/ydG1IivSS1
 k+M/YOj2D9rGh0WABb6zWje1+UiyCuC+GCsresFqLllU5YcQcq9JLu1LeuBbYZL/O/mOiD
 nDArjQ46uG6nqO+xEfdhs0nfEqAtj04=
Date: Sat, 23 Mar 2024 02:30:08 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] software node: Implement device_get_match_data fwnode
 callback
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
 <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
 <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
 <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
 <6bf102a4-6419-4083-8918-4f7c76cfa9a1@linux.dev>
 <Zf3IWyrW8IZLTg4x@smile.fi.intel.com>
 <8afe3f27-fc8e-4c20-ba28-74a0a2937e55@linux.dev>
 <Zf3LBvJEJF9xr2fv@smile.fi.intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <Zf3LBvJEJF9xr2fv@smile.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/3/23 02:16, Andy Shevchenko wrote:
> On Sat, Mar 23, 2024 at 02:12:14AM +0800, Sui Jingfeng wrote:
>> On 2024/3/23 02:05, Andy Shevchenko wrote:
>>>    Besides that, the kernel project rule is "we do not add
>>> the dead (unused) code".
>> This rule is good an correct and I admit.
>>
>> But the problem is that it is chicken-and-egg problem,
>> it probably have at least two user now.
> Then show them! Convert in the same series and show that.

I believe that Vladimir has show enough to you. I have read that thread,
I think Vladimit have explained very well.




-- 
Best regards,
Sui

