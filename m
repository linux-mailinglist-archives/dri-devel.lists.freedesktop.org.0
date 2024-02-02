Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB7F847715
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806C510E154;
	Fri,  2 Feb 2024 18:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="hDWElelD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6301610E154
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 18:07:43 +0000 (UTC)
Message-ID: <cad42648-4add-4820-b40f-3f713ebbb5e4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706897262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytMHC3f1GOpt4JbRweei/YmnhLHZS+eeFsBfpdA2ynU=;
 b=hDWElelDUBe4ueIGOT55ovLgHkbhFclhl7LSpcI94+ZEEZELfa0K7sYSMQB9hp3oQZC8mH
 HThz+oH4qF/2PXNlqbNpGBqwV4Xc8mhkjH4aTbki5m3j6TeQgP3CZ6YBVCz+3mU7+Bl8Tc
 269EEzkFzSUGSRcIVuTPt3PLkGpXvgc=
Date: Sat, 3 Feb 2024 02:07:35 +0800
MIME-Version: 1.0
Subject: Re: [v2,8/8] fbdev/efifb: Remove framebuffer relocation tracking
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-9-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240202120140.3517-9-tzimmermann@suse.de>
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

Nice job, well done!

Because this the fix the problem at the root level, I appreciate this 
solution.


On 2024/2/2 19:58, Thomas Zimmermann wrote:
> If the firmware framebuffer has been reloacted, the sysfb code
> fixes the screen_info state before it creates the framebuffer's
> platform device. Efifb will automatically receive a screen_info
> with updated values. Hence remove the tracking from efifb.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
