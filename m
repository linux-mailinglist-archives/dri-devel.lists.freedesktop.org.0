Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907A0573BD4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6011A67A;
	Wed, 13 Jul 2022 17:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Wed, 13 Jul 2022 17:15:22 UTC
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979EC11A449;
 Wed, 13 Jul 2022 17:15:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 55B7AC8009B;
 Wed, 13 Jul 2022 19:07:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ztqopn8P4JU9; Wed, 13 Jul 2022 19:07:33 +0200 (CEST)
Received: from [192.168.178.47] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id C1C71C80095;
 Wed, 13 Jul 2022 19:07:31 +0200 (CEST)
Message-ID: <82521ebc-3f14-8d3b-5601-6b4a36ef19af@tuxedocomputers.com>
Date: Wed, 13 Jul 2022 19:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 27/29] ACPI: video: Drop Clevo/TUXEDO NL5xRU and NL5xNU
 acpi_backlight=native quirks
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@vger.kernel.org, Xinhui <Xinhui.Pan@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-28-hdegoede@redhat.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20220712193910.439171-28-hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/12/22 21:39, Hans de Goede wrote:
> acpi_backlight=native is the default for these, but as the comment
> explains the quirk was still necessary because even briefly registering
> the acpi_video0 backlight; and then unregistering it once the native
> driver showed up, was leading to issues.
>
> After the "ACPI: video: Make backlight class device registration
> a separate step" patch from earlier in this patch-series, we no
> longer briefly register the acpi_video0 backlight on systems where
> the native driver should be used.
>
> So this is no longer an issue an the quirks are no longer needed.
>
> Cc: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Tested and can confirm: The quirks are no longer needed with this Patchset.

Tested-by: Werner Sembach <wse@tuxedocomputers.com>

Kind Regards,

Werner Sembach

> ---
>   drivers/acpi/video_detect.c | 75 -------------------------------------
>   1 file changed, 75 deletions(-)
>
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index 2a4d376a703e..4b9395d1bda7 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -599,81 +599,6 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   		DMI_MATCH(DMI_BOARD_NAME, "N250P"),
>   		},
>   	},
> -	/*
> -	 * Clevo NL5xRU and NL5xNU/TUXEDO Aura 15 Gen1 and Gen2 have both a
> -	 * working native and video interface. However the default detection
> -	 * mechanism first registers the video interface before unregistering
> -	 * it again and switching to the native interface during boot. This
> -	 * results in a dangling SBIOS request for backlight change for some
> -	 * reason, causing the backlight to switch to ~2% once per boot on the
> -	 * first power cord connect or disconnect event. Setting the native
> -	 * interface explicitly circumvents this buggy behaviour, by avoiding
> -	 * the unregistering process.
> -	 */
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xRU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -		DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xRU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> -		DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xRU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
> -		DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xRU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -		DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xRU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -		DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xNU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -		DMI_MATCH(DMI_BOARD_NAME, "NL5xNU"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xNU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> -		DMI_MATCH(DMI_BOARD_NAME, "NL5xNU"),
> -		},
> -	},
> -	{
> -	.callback = video_detect_force_native,
> -	.ident = "Clevo NL5xNU",
> -	.matches = {
> -		DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
> -		DMI_MATCH(DMI_BOARD_NAME, "NL5xNU"),
> -		},
> -	},
>   
>   	/*
>   	 * Desktops which falsely report a backlight and which our heuristics
