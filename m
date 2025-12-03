Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCEC9F902
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 16:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D08910E0B5;
	Wed,  3 Dec 2025 15:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D5PqznJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2870110E0B5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7jFXEtGd28LIbJvowwbgrPDlPAxDDWwADDdp4ofsmeY=; b=D5PqznJH2INij4h3q/6h9MWuvt
 06hzki6WBmqn7UouHLOdZRURzjY5jg72ZUeQX+5DRKr7uEXK7qrmvoOY/DWPonqBjrPSn6t4DMTC2
 rk68raCACYC40ma89dpruHuG37ao5551gvoev2+4ZtuLua8mY/pv6RwD8RCepFHvqgkifQ8k0dwa1
 eKra7XPeV47/G8ZB6RJ9PxoTrz2WQA3bguSknnT22vJIpzotPKnjGmWrLzUD2RqzgG5NmdykbZiHH
 M9zUgGWOU+tld7rvFHH55bIklh0ojAHON/DWG4FS8f3udffLvjMEMEvkkLRX3mPTt8ihLv1LiIYfV
 nzo9G+/g==;
Received: from [186.208.73.94] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQoz9-008Jeq-RN; Wed, 03 Dec 2025 16:41:44 +0100
Message-ID: <c0f6df66-2c0c-43c7-815f-602beccf3931@igalia.com>
Date: Wed, 3 Dec 2025 12:41:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] FI fbcon fixes
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org
References: <20251203093948.54296-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20251203093948.54296-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 03/12/2025 06:39, Tvrtko Ursulin wrote:
> Two generic fixes split out for easy review, one refactoring as requested, and
> then the last patch is the panel/mode quirk to allow for corruption free fbcon
> with simpledrmfb and efidrmfb on the Valve Steam Deck.
This series is:

Tested-by: Melissa Wen <mwen@igalia.com>

on LCD and OLED Steam Deck device.

In both devices, the issue is present and fixed by this series.

BR,

Melissa
>
> v2:
>   * s/unsigned/unsigned int/
>   * s/pitch/linelength/
>   * Removed comment explaining the Steam Deck quirk.
>   * Added patch to refactor quirk application via callbacks.
>
>   v3
>   * Added forgotten __initconst.
>   * Use separate callback for the fixup quirk.
>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: linux-efi@vger.kernel.org
>
> Tvrtko Ursulin (4):
>    efi: sysfb_efi: Replace open coded swap with the macro
>    efi: sysfb_efi: Fix lfb_linelength calculation when applying quirks
>    efi: sysfb_efi: Convert swap width and height quirk to a callback
>    efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve Steam Deck
>
>   drivers/firmware/efi/sysfb_efi.c | 72 ++++++++++++++++++++++++++++----
>   1 file changed, 64 insertions(+), 8 deletions(-)
>

