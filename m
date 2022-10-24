Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E1960A907
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38EE10E615;
	Mon, 24 Oct 2022 13:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6DD10E615;
 Mon, 24 Oct 2022 13:14:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62642612F3;
 Mon, 24 Oct 2022 13:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11F4C433C1;
 Mon, 24 Oct 2022 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666617295;
 bh=3nE0pujKjkKrAG3Zlhw1YeJuPRfB3mFezLZb6lzLCGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMm2+6OBEsQawTDmuHx79XkDRpx8g9QS54i0VAgQtCk02UkomS95/vMkOooCKFRX3
 xxQEe24yv/tDtsQYrTGmzauMv0Jh6zHqana1EL/TBHlmO6GXulViaDuIlAEYGkafKP
 kqE4fIBr817hQoEx/xF9wYtGawey5ywjjoX7MjRMntvcbUYm0BK0RPqRrLUuuXw2Nk
 nhWxKTcWwM9VEt4aM7KgAIT39FftcsQukjfpyyfLMkVVk5XzPzt3H5NCVm2IIV71GR
 WEwDHsAVQ/xfBG0zYbWT3h7jEZyT/78B/fc3OPRLq/euFmv9sbHup10WXUReRUbepL
 1J6fTEisi4WTg==
Received: by pali.im (Postfix)
 id 060EE82F; Mon, 24 Oct 2022 15:14:51 +0200 (CEST)
Date: Mon, 24 Oct 2022 15:14:51 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 00/22] Fallback to native backlight
Message-ID: <20221024131451.lvkesdg3kvyvbi7n@pali>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <746e5cc6-516f-8f69-9d4b-8fe237de8fd6@redhat.com>
 <edec5950-cec8-b647-ccb1-ba48f9b3bbb0@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edec5950-cec8-b647-ccb1-ba48f9b3bbb0@daynix.com>
User-Agent: NeoMutt/20180716
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 24 October 2022 21:58:57 Akihiko Odaki wrote:
> Regarding the second limitation, I don't even understand the difference
> between vendor and native. My guess is that a vendor backlight device uses
> vendor-specific ACPI interface, and a native one directly uses hardware
> registers. If my guess is correct, the difference between vendor and native
> does not imply that both of them are likely to exist at the same time. As
> the conclusion, there is no more motivation to try to de-duplicate the
> vendor/native combination than to try to de-duplicate combination of devices
> with a single type.

Hello! I just want to point one thing. On some Dell laptops there are
3 different ways (= 3 different APIs) how to control display backlight.
There is ACPI driver (uses ACPI), GPU/DRM driver (i915.ko; uses directly
HW) and platform vendor driver (dell-laptop.ko; uses vendor BIOS or
firmware API). Just every driver has different pre-calculated scaling
values. So sometimes user wants to choose different driver just because
it allows to set backlight level with "better" granularity. Registering
all 3 device drivers is bad as user does not want to see 3 display
panels and forcing registration of specific one without runtime option
is also bad (some of those drivers do not have to be suitable or has
worse granularity as other).
