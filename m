Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF5887C17
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 10:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21E610E042;
	Sun, 24 Mar 2024 09:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dyxV2Pmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EEE410E042
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 09:22:46 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id oK2irMGMsawLVoK2jrwkZQ; Sun, 24 Mar 2024 10:21:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1711272099;
 bh=URa/scX9JJ6Z40dL8WhIkmALLQ5X37NM9gkybLRw27I=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=dyxV2PmfdDK4SdMqDlTsqv99dIOXj8UvQ5ME5HH4EtxbgGSf4TnhnkCGwm4s4G5QI
 tvGWZ//51EwFtkGLbv4M4Ue9oEAXee1J7uAg46dOYYP8hXPnYViBgLx/RWoxKp7RWz
 8LmeYJio7eISxEVIBB9onYHxN7t3orzI8cXYOclXyY4tQeVSH/7zTv+k18w+BziPFG
 pYK8qLUlBndwVIScyE+yX3yFtc7h0eGM7bhZBZchjrveNwHQ5Zamq5YkTumszsnINk
 kkjHjc9+pcfIq4OG2Ei6Fsl2EytJV36zDiA9RFlGhioo0yef7vG+RnvUseBasPXaSj
 bcgE0WjFPp23Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 24 Mar 2024 10:21:39 +0100
X-ME-IP: 86.243.17.157
Message-ID: <69264f8a-a113-4d49-b8a6-fb9e858584e4@wanadoo.fr>
Date: Sun, 24 Mar 2024 10:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org, arnd@arndb.de,
 bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch, davem@davemloft.net,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, gaurav.jain@nxp.com, gregory.clement@bootlin.com,
 hdegoede@redhat.com, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 james.clark@arm.com, james@equiv.tech, jdelvare@suse.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linus.walleij@linaro.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, maarten.lankhorst@linux.intel.com,
 mazziesaccount@gmail.com, mripard@kernel.org, naresh.solanki@9elements.com,
 neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
 patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
 tzimmermann@suse.de
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
 <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
 <20240323222506.4ffbdd71@thinkpad>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240323222506.4ffbdd71@thinkpad>
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

Le 23/03/2024 à 22:25, Marek Behún a écrit :
> On Sat, 23 Mar 2024 22:10:40 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 

...

>>>    static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>>>    {
>>> -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
>>> +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
>>> +	if (IS_ERR(pvt->dbgfs_dir))
>>> +		return PTR_ERR(pvt->dbgfs_dir);
>>
>> Not sure if the test and error handling should be added here.
>> *If I'm correct*, functions related to debugfs already handle this case
>> and just do nothing. And failure in debugfs related code is not
>> considered as something that need to be reported and abort a probe function.
>>
>> Maybe the same other (already existing) tests in this patch should be
>> removed as well, in a separated patch.
> 
> Functions related to debugfs maybe do, but devm_ resource management
> functions may fail to allocate release structure, and those errors need
> to be handled, AFAIK.

I would say no.
If this memory allocation fails, then debugfs_create_dir() will not be 
called, but that's not a really big deal if the driver itself can still 
run normally without it.

Up to you to leave it as-is or remove what I think is a useless error 
handling.
At least, maybe it could be said in the commit log, so that maintainers 
can comment on it, if they don't spot the error handling you introduce.

CJ

> 
> Marek
> 

