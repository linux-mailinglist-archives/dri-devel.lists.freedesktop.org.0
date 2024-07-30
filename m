Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B1941EFA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 19:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2661510E07C;
	Tue, 30 Jul 2024 17:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Q1r4uMXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E1310E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 17:46:48 +0000 (UTC)
Message-ID: <7b34fb4c-abde-47e8-984b-3ea55d4475a7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722361606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1PkLT7Wa1W5BhecQMpMGwCc4qguu8cW9tK12igjtDs=;
 b=Q1r4uMXcLcLpHMCejh7/3AzUWmCg7wLrpVz2oRWHPiNbeU8KyE+NPBYmCu84FnWjsFZTBo
 pDt9FOiKbHnox38QpWbXF/F3tre3DF6dX5oHzBYA+IDbSMloAuTNyaJLeDvBUbgmMx2Pa1
 WBDSZ9LxYWGoIg7ywOdmOdevoYYdI40=
Date: Wed, 31 Jul 2024 01:46:36 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/2] drm/loongson: Introduce component framework support
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-2-sui.jingfeng@linux.dev>
 <6dbe975a-59eb-4d4b-9fea-b930fa44e4ec@web.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <6dbe975a-59eb-4d4b-9fea-b930fa44e4ec@web.de>
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


On 2024/7/29 14:40, Markus Elfring wrote:
> …
>> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
>> @@ -0,0 +1,108 @@
> …
>> +#ifndef __LOONGSON_DRV_H__
>> +#define __LOONGSON_DRV_H__
> …
>
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+define+a+reserved+identifier


I suggest add this rules to the checkpatch.pl script,

It's more safe to follow *after* your suggestion is accepted.

After all, the checkpatch.pl is de-facto standard.

checkpatch.pl is happy about my patch for now.


> Regards,
> Markus

-- 
Best regards,
Sui

