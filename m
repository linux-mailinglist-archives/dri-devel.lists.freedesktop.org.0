Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01B941F1B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 19:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9A510E570;
	Tue, 30 Jul 2024 17:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rls7Fzj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CC110E570
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 17:57:38 +0000 (UTC)
Message-ID: <ce860f0b-2a05-451f-a2e5-90c00070370b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722362257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6SSLdV1+BEQ9lFafavy7nOb236w9iKR5PJPw85QXo0=;
 b=rls7Fzj2PTwK6fD9FijmG7QTS/ngjrL9NKRq1MR92jYRs0P4PwfXKqIWjhFPXhi2H2cH0e
 w5SW1WO8lrKChWkPwC6PlKBq9M/zOKVUAhmOoeFRU4zqSTYoG9zgKqfRtt6+MH8sq8aT3D
 V5SiWqKynkavDIv9gtQ0EqFj/ec5/0g=
Date: Wed, 31 Jul 2024 01:57:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/2] drm/loongson: Add dummy gpu driver as a
 subcomponent
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-3-sui.jingfeng@linux.dev>
 <139afaab-343e-4cb4-83b7-2695129d27b1@web.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <139afaab-343e-4cb4-83b7-2695129d27b1@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2024/7/29 15:15, Markus Elfring wrote:
> …
>> the driver is loaded, drm/loongson driver still need to wait all of
>                                                    needs to wait on …?
>
>
> …
>> design. Therefore, add a dummy driver for the GPU, …
> Is there a need to reconsider the categorisation and usability descriptions
> another bit for such a software component?


For honoring the framework and testing the framework purpose.


The GPU can possibly be the master of the all sub-components, this 
definitely need some extra

consideration and negotiation with the DC and the fake master device. 
Depend on  configuration

and user space expectation. The problem should be solved earlier.


> Regards,
> Markus

-- 
Best regards,
Sui

