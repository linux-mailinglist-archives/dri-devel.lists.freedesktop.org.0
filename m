Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840EDAC62C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198910E0B7;
	Wed, 28 May 2025 07:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Rm31BU1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3269.qiye.163.com (mail-m3269.qiye.163.com
 [220.197.32.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E122010E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:17:20 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 16ad4c5b7;
 Wed, 28 May 2025 15:17:14 +0800 (GMT+08:00)
Message-ID: <64499337-fc61-42b0-8c50-7749b2036c54@rock-chips.com>
Date: Wed, 28 May 2025 15:17:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250528134245.13dc84aa@canb.auug.org.au>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250528134245.13dc84aa@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0aGlZNGB1DHx1KQk8aSBhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 xVSktLVUpCS0tZBg++
X-HM-Tid: 0a9715c09ca103a3kunmf43b205c7c0117
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NUk6PTo5DzE3HElCMUgLPwko
 DBQaCxNVSlVKTE9DT0pNTUhOS0JPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ09JNwY+
DKIM-Signature: a=rsa-sha256;
 b=Rm31BU1IBANLdwjKdweGRV23FdVzgx6FBf6ic/48VtsB/DskqVdw9vmZGiAvRMfS/Abti7vA2c4j9h2XdHRm+C6GaBFYuXUiORvNf0iEJ1ivgG2mt02/J1EkmfnT3ZULWyshmZTIUJUt/cMbsbdqMtDY35AsR6IHgccScvRVwUc=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=1y9XPtE/Gokh+W8CqyQCHL4aO+4NRxKNs2KqCpdAynE=;
 h=date:mime-version:subject:message-id:from;
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

Hi Stephen,

On 2025/5/28 11:42, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function 'analogix_dp_probe':
> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label 'err_disable_clk' used but not defined
>   1589 |                 goto err_disable_clk;
>        |                 ^~~~
> 
> Caused by commit
> 
>    6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
> 
> I have used the drm-misc tree from next-20250527 for today.
> 

Oh, I have found the same compile error after rebasing.

I have removed the 'err_disable_clk' flag and made it return 
ERR_PTR(ret) in:
https://lore.kernel.org/all/20250310104114.2608063-7-damon.ding@rock-chips.com/

Likely a small merge conflict bug. Will patch it later. ;-)

Best regards,
Damon

