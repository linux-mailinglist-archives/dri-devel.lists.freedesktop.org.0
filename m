Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A927EF703
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04B910E073;
	Fri, 17 Nov 2023 17:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E84D10E073
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:36:08 +0000 (UTC)
Message-ID: <954e2f85-7ed8-4768-97c4-970315afeec1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700242565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vWjfYPNGTMvPQmWqPhQYpJv3Ri6BeWVhxBfWZZgUXg=;
 b=baZIDETogy3HPFLmzPPEvP+7Z7rf3XKfKcDs8ueMQdbzIbxthuwI2sJATP245CyZiV9grr
 3NuEfR/r0nJvTnzPQkPme2O5OUYg/it4JBQlUs/64v8uXtGk5dHZqYyD1pMJ3F/5WCdOC5
 tCnAItfZhFH62ftjaGzE8P9WpdfO+4E=
Date: Sat, 18 Nov 2023 01:35:56 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
 <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
 <CAA8EJprm6FL9_ZOr5uBXNXLBt=scs=FY2o6ZEv5r576iEM5KRw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJprm6FL9_ZOr5uBXNXLBt=scs=FY2o6ZEv5r576iEM5KRw@mail.gmail.com>
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


On 2023/11/17 17:03, Dmitry Baryshkov wrote:
> On Fri, 17 Nov 2023 at 06:24, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> Hi,
>>
>> On 2023/11/16 23:23, Dmitry Baryshkov wrote:
>>>>>> Then you will need some way (fwnode?) to
>>>>>> discover the bridge chain. And at the last point you will get into the
>>>>>> device data and/or properties business.
>>>>>>
>>>>> No, leave that chance to a more better programmer and forgive me please,
>>>>> too difficult, I'm afraid of not able to solve. Thanks a lot for the
>>>>> trust!
>>>   From my point of view: no.
>>
>> I respect the fact that the community prefer generic mechanisms.
>> If our approach is not what the community want, can I switch back
>> to my previous solution? I can reduce the duplication of our
>> localized it66121 driver to a minimal, rewrite it until it meets
>> the community's requirement. I know our device looks weird and
>> our approach is not elegant. But at the very least, we could not
>> mess the community's design up by localize. Otherwise, I don't know
>> what is the better approach to solve such a problem.
>>
>> Can I switch back or any other ideas?
> I keep on repeating: create the i2c device from your root device
> driver, which parses BIOS data.


You didn't focus on solve the problem, You are focus on solving me.
How does the method that parsing BIOS data can be generic and applied
universally?


