Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB87A84E3B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 22:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4111C10E1BD;
	Thu, 10 Apr 2025 20:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="eNrqHXbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6F10E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=nPskVwgV7dIOuOWR2CRzYXy3W//a83XC7JObcBuOeQs=; b=eNrqHXbQHa4jzONqzh9REJsMAN
 uihg7oE8Geel9srCIiStUM4xZh+HbzFMwqBZlSbkib8SFlOh0OE3a3PEvIkz6D8oXGTX9VLWwijIY
 RHwGHIR5/v+pKah4uh84DjpYphlpEle8zPgASS7klEl6MZ+jg2lpzEH2Qd6zun6K7wSuy1xmJqnuC
 jAIUj88uIHMs37nlfYDpz9toHWe5nei++kG9WdwQVIAUq3ugZRussdKsjeMLpUjhXnvp+vdcZqoCJ
 28r9pnsVDx++Ekv64Ltk7osrX/2dnNNk8zlfzP8Phf1GFN3Z7pD6KP08hsIqCp68XD2yqnjWVmli7
 qxGfnkbg==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u2yWU-00000008s10-1aqg; Thu, 10 Apr 2025 20:29:19 +0000
Message-ID: <5cf231e1-0bba-4595-9441-46acc5255512@infradead.org>
Date: Thu, 10 Apr 2025 13:29:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 10 (backlight: ktd2801)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Duje_Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>
References: <20250410151146.6a05dd21@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250410151146.6a05dd21@canb.auug.org.au>
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



On 4/9/25 10:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250409:
> 

on x86_64, when CONFIG_GPIOLIB is not set:

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
  Selected by [m]:
  - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]


-- 
~Randy

