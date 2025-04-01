Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BDA778C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 12:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9768710E551;
	Tue,  1 Apr 2025 10:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.b="NIPG1LGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AAE10E267
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 10:23:31 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1743503010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVQCdjXGU5FONNoMrHgE92TVvqfU4Ncashfmh1tdRCs=;
 b=NIPG1LGpmkf27pacGyKPjcTpm1iVXFR9MLSPebAlb1sXiLvbOZJgE+ayqwX7DJamCjzZkk
 s7bpqManxChYpYeCAC1eyQfaGadYymC8Q52uHvCV1NhGc3ABuj8p0ok40qYROyWrTe0vj6
 HaGr0YrX7VhDeyxZxVAN/kHD/tYqF/4=
To: deller@gmx.de
Cc: arefev@swemel.ru, dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, tzimmermann@suse.de,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
Date: Tue,  1 Apr 2025 13:23:30 +0300
Message-ID: <20250401102330.7759-1-arefev@swemel.ru>
In-Reply-To: <e04f012b-cf10-4a84-8fbe-ece1a06f0f66@gmx.de>
References: <e04f012b-cf10-4a84-8fbe-ece1a06f0f66@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> It's old, but still runs in some configurations and people
> still (although probably not on daily bases) use it.
> Also don't forget about the various old non-x86 hardware machines
> which often used ATI cards too, and those machines are still
> supported by Linux as well.

Hi Helge.
Thanks for the reply.

 Ok. Everyone agrees that there is an error (buffer overflow 
lt_lcd_regs[LCD_MISC_CNTL]).
 Ok. Everyone agrees that this code is still needed.

Then I propose to fix this error.  :)

Unfortunately, I can't do everything by the rules, I didn't save
the chip datasheet. (I didn't think I would ever need it again.). 

Regards Denis.
