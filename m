Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB9AA3BF0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9244010E0CA;
	Tue, 29 Apr 2025 23:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="icC5TCMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F6310E09B;
 Tue, 29 Apr 2025 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Zdw5sEyqpxaObOxyn99wwjf95ztYB6hERorXY44QetY=; b=icC5TCMlM1zR4wBE/pqMPoTOKR
 nOxfidUdlKfWIlO3AuZhvdFjXs/uuK5Z7GNnzR5AEqmUsT4xTwTlr5uk5Z5+gqqfyS5Bs4x8UboZs
 9H0qf9qjjTTLxAwfEKRzQjBpQG1a9vbuWftLWMfEWTq8Ospwsd7coOvRg2K77ozamK5W5LSQL94Vz
 mcAXV9Ce7KXtGKFSwdo+WH80UlsEVFi6jwQVT7WR0ab22BNigIDKiiikaJ3Q/6K9+CYR++M/9kbC6
 Jvn8tvVZI8y+1z0FcxFQZ+YxcwZLUlanruIW9+K/8vrZPviZRaM5MN/fcVIpxs8nTtXcUxWrcgZ5Z
 WwDc2qtw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1u9u4X-00000007qMN-2tia; Tue, 29 Apr 2025 23:09:06 +0000
Message-ID: <da98aa13-fc14-4bb5-9292-d784ad832a6e@infradead.org>
Date: Tue, 29 Apr 2025 16:09:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 29 (drivers/gpu/drm/xe/xe_devcoredump.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250429190259.1cc2d649@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250429190259.1cc2d649@canb.auug.org.au>
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



On 4/29/25 2:02 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250428:
> 

on i386:

ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

due to
+       memcpy(buffer, ss->read.buffer +
+              (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);

in commit c4a2e5f865b7 ("drm/xe: Add devcoredump chunking").

-- 
~Randy

