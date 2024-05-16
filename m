Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E98C7420
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 11:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEA710EC46;
	Thu, 16 May 2024 09:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EVBHi22Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A2A10EC46
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 09:50:30 +0000 (UTC)
X-Envelope-To: markus.elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715853028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6YKA4zorDccEaUD4FxmIdziK3ss8eQh9e6ImT4g2z1M=;
 b=EVBHi22ZdnZhzLJGxJwndqBVFVodvGsm8J1TgD9j2s0a4FlBRG+fqJ498/ggdGpuAnAGbR
 MjzDOcuMU6Lxi7Tiplo7sGvivuZvzHqQwGRL4nt41AxEVELEGIPs5mdCXyLRzqGipszaup
 tVl3zLhxbylFIUIEeRhtrzFMsiXuiDQ=
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: kernel-janitors@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: suijingfeng@loongson.cn
Message-ID: <1de308ad-568f-41da-9dd4-258cd07556f0@linux.dev>
Date: Thu, 16 May 2024 17:50:19 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm/loongson: Refactor lsdc device initialize and the
 output port
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-4-sui.jingfeng@linux.dev>
 <dc34d171-dc47-4817-a6f0-9f23a3afb8e7@web.de>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <dc34d171-dc47-4817-a6f0-9f23a3afb8e7@web.de>
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


On 5/16/24 14:26, Markus Elfring wrote:
> …
>> fullfill the implement under the new framework.
> 
> fulfil the implementation?
> 
> Please improve your change descriptions another bit.

I'll accept you suggestions, with pleasure. Thanks.


> Regards,
> Markus

-- 
Best regards
Sui
