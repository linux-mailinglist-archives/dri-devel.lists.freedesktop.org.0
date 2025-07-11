Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CAB02659
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 23:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780810E2E3;
	Fri, 11 Jul 2025 21:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mmgCobXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FEC10E2E3;
 Fri, 11 Jul 2025 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/5TCvZxyJm0mNelQph6qDoiq19mUElNh/nhMyYL3NcM=; b=mmgCobXk62qXUedyHlRaKKHsfu
 dxY/en13Wrp40RNHd5mCdTFS8v83JPZ8xM4Z7d1lETzUCRN7x2Cee4HcM1q/0NckNDbXZHYUI68nh
 haeg6QB3v78EWxvRxwkH/KtqIKAHqKTKMsKhroLkCoYFVSwKUk/bgyk5kZePcxDKK/QtK9TpCv9M1
 trxBUa3nUZcENDLToL16P0p8SwUi20SzBjX7CFYKcXmlP0kP4zIvc7aAHjMge2QZEkvxw+jJmEa/Y
 SuFDt+KdplQB5ihBuuAd2d+Gm2yu6RF49KxjCOEACTihphZFINbm+f0pssmvK3CSbJLiYJczEVzxk
 jCkcj25w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uaLF3-0000000ET0H-3jI1; Fri, 11 Jul 2025 21:25:14 +0000
Message-ID: <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
Date: Fri, 11 Jul 2025 14:25:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 11 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Samuel Zhang <guoqing.zhang@amd.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20250711191014.12a64210@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250711191014.12a64210@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250710:
> 

on x86_64, when
# CONFIG_SUSPEND is not set
# CONFIG_HIBERNATION is not set
# CONFIG_PM is not set

ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

caused by commit
530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hibernation")

Rafael, is a stub appropriate for this case?

-- 
~Randy

