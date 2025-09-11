Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C710AB53E24
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 23:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288BB10EB9B;
	Thu, 11 Sep 2025 21:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="iOjBxLLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D77510E0E1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 16:23:34 +0000 (UTC)
Received: from [100.79.161.103] (unknown [4.194.122.170])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5CE272018E5D;
 Thu, 11 Sep 2025 09:23:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5CE272018E5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757607813;
 bh=arLDBMZWQoXZroeZ9H6nkMPHxADGvPDE1QVRgov0vS0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=iOjBxLLERQ8kHRO+uJZm+wBvlUyBiJv3iQhlxw66sQtZxCxII4MXqytNQQ/LxWowz
 RtCayYSGIQF55cFkcJWKVqYl4m8hseA1opAD//EPAfsgcSPkO3hTFy4v/2Z/n+iU7J
 85Plb5pDvuA0tzwvspAsdCCnOFqCveUM0riYKfg4=
Message-ID: <cb823314-f7e4-45ee-bd10-22fcae300a68@linux.microsoft.com>
Date: Thu, 11 Sep 2025 21:53:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] fbdev: hyperv_fb: Remove hyperv_fb driver
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, arnd@arndb.de,
 soci@c64.rulez.org, gonzalo.silvalde@gmail.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, wei.liu@kernel.org, mhklinux@outlook.com,
 ssengar@linux.microsoft.com, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <E2D7F2119CB4>
 <1757437112-2509-1-git-send-email-ptsm@linux.microsoft.com>
 <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=1.7 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Thu, 11 Sep 2025 21:52:23 +0000
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

Hi Thomas,

On 10-09-2025 15:06, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.09.25 um 18:58 schrieb Prasanna Kumar T S M:
>> The Hyper-V DRM driver is available since kernel version 5.14 and
>> provides full KMS support along with fbdev emulation via the DRM fbdev
>> helpers. This makes the hyperv_fb driver redundant, remove it.
> 
> I'm all for removing obsolete drivers. But hyperv_drm likely first needs 
> to merge the patch at https://lore.kernel.org/dri- 
> devel/20250904145806.430568-5-tzimmermann@suse.de/ It's been tested and 
> works well. If maintainers from Microsoft have a look at the patch 
> first, we could possibly land it fairly soon.
> 

I will test those patches on Hyper-V and share the result.

> Best regards
> Thomas
> 
