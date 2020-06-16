Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFB1FB215
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 15:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A26788A56;
	Tue, 16 Jun 2020 13:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFD188A56
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 13:28:20 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B1112098B;
 Tue, 16 Jun 2020 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592314100;
 bh=o16TOGaXPe+mfeD5YOCp9VLSgp7Z61k04+2zqhJahyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmnWwjuC907MuTP3R+2w7BNh+0ddDUn+NqTB5TaBAoT7R2ybKpoEoWwLY0dd+TVCG
 UduXuIMIx8j0qk8c0CJ2LoxjuS+pdutttJszGgZSDYkwQKoDV12+4BnAJuEhWkXpsz
 YGAY/pQsAevEClH4v5C0DdhhMGZOvk8oZRgb+EdU=
Date: Tue, 16 Jun 2020 09:28:19 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
Message-ID: <20200616132819.GP1931@sasha-vm>
References: <20200519163234.226513-1-sashal@kernel.org>
 <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
 <20200616105112.GC1718@bug>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616105112.GC1718@bug>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 tvrtko.ursulin@intel.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 spronovo@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-fbdev@vger.kernel.org, wei.liu@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, iourit@microsoft.com,
 alexander.deucher@amd.com, kys@microsoft.com, Hawking.Zhang@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 12:51:13PM +0200, Pavel Machek wrote:
>Hi!
>
>> > The driver creates the /dev/dxg device, which can be opened by user mode
>> > application and handles their ioctls. The IOCTL interface to the driver
>> > is defined in dxgkmthk.h (Dxgkrnl Graphics Port Driver ioctl
>> > definitions). The interface matches the D3DKMT interface on Windows.
>> > Ioctls are implemented in ioctl.c.
>>
>> Echoing what others said, you're not making a DRM driver. The driver should live outside
>> of the DRM code.
>>
>
>Actually, this sounds to me like "this should not be merged into linux kernel". I mean,
>we already have DRM API on Linux. We don't want another one, do we?

This driver doesn't have any display functionality.

>And at the very least... this misses API docs for /dev/dxg. Code can't really
>be reviewed without that.

The docs live here: https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/d3dkmthk/

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
