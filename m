Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C01B14A24
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 10:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E3410E1DA;
	Tue, 29 Jul 2025 08:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Sf+9n6uc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E1A10E1DA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ny6TTgLU/SMwi1VgsRmQeRrVFh08FienZHwG6QcdxfU=; b=Sf+9n6ucYRkz2uSDSDBZF8BxDS
 guhE72SQVW+BZV1de/8bXrTpgFKrpGF0+y91PVKs/QQXe4hLbl3bCKOdCmjRMSlxtYrRJz/J098xs
 +eHk0Q2Bt5eoH6kSXSE/SVC1/kLm/LIfIiGbjEwnPbw+e+MeMYM15bqOe6YqryxU5CRP2Wx6lWYia
 xyfQM3BhKqlLuKeddSYad4uuUDm9NbjpeoV9nBJfXHzQu/3xYHGn3McXhWJyVyj5xgqQb/ogD6q6R
 S1twO3QfWRK5Mh3D0i/NVD2BtvbtQglFV6h4zwk3dFNKbJ4n2vEBxU+bGdmlxXH8zw0JZ7Z9nczkk
 wltECnBQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ugfks-0000000GGM8-0wb6; Tue, 29 Jul 2025 08:32:14 +0000
Message-ID: <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
Date: Tue, 29 Jul 2025 01:32:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 29 (BACKLIGHT_KTD2801)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-leds@vger.kernel.org
References: <20250729153510.3781ac91@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729153510.3781ac91@canb.auug.org.au>
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



On 7/28/25 10:35 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250728:
> 

on ARCH=um SUBARCH=i386, when
# CONFIG_GPIOLIB is not set

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
  Selected by [y]:
  - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]


so BACKLIGHT_KTD2801 should:
	depends on GPIOLIB

Also, in drivers/leds/Kconfig, does it need duplicate entries for this?
Can't the second entry be removed?
(asking since Duje made both entries)

config LEDS_EXPRESSWIRE
	bool
	depends on GPIOLIB


Thanks.


-- 
~Randy

