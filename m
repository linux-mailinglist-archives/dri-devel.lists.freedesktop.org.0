Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771F6DBF3D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 10:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E731210E0D5;
	Sun,  9 Apr 2023 08:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B1C10E0D5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 08:21:32 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id CE4F3240159
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 10:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1681028489; bh=GCmo/FQZEbl3ShLJvIwU3fxDcrVQZl3kl6EFP8KaIFc=;
 h=Date:From:To:Cc:Subject:From;
 b=Caf1SSvgMuXeYpAY5NXoJcSW/DiduWlRF7Bm5M8X3AE3VK+hU3Ib3EZYWatrGRd9d
 hU0/cOD7ET8SMU2+DLk17dFFzv1hrUfgy0Bax1G+hqhb9tCYqW0Pbpj/3ALnAZEtBq
 B1V0jf2KyKj1suPHOS1nmHTyGFys4XOZB6L6oAqouycgkMElq1TeRmuFRiVd/sWHsP
 x0JVTTDepAAX2XyI0JMlZ6fsVIFC1hh0O2lw9e/P6nV9KUNC3NpEBZ85PtaXqPU1nr
 rx+KvREciQJ3SSOD5AoBMnPsDx4f1p1ajoU5JpiE1wRXhTtiT87pqoAJrNpnl0DsQU
 sqQQk9gm7S7rw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4PvQ6k2vpXz6tvw;
 Sun,  9 Apr 2023 10:21:18 +0200 (CEST)
Date: Sun,  9 Apr 2023 08:21:17 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 12/68] hwmon: corsair: constify pointers to
 hwmon_channel_info
Message-ID: <20230409102117.6fcdc42f@posteo.net>
In-Reply-To: <20230406203103.3011503-13-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
 <20230406203103.3011503-13-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 09 Apr 2023 08:53:20 +0000
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Eric Tremblay <etremblay@distech-controls.com>, Tom Rix <trix@redhat.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Clemens Ladisch <clemens@ladisch.de>,
 dri-devel@lists.freedesktop.org, Tali Perry <tali.perry1@gmail.com>,
 Rudolf Marek <r.marek@assembler.cz>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Luka Perkov <luka.perkov@sartura.hr>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-doc@vger.kernel.org,
 Jonas Malaco <jonas@protocubo.io>,
 Derek John Clark <derekjohn.clark@gmail.com>, UNGLinuxDriver@microchip.com,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Aleksa Savic <savicaleksa83@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, openbmc@lists.ozlabs.org,
 Robert Marko <robert.marko@sartura.hr>,
 =?ISO-8859-1?Q?Joaqu=EDn?= Ignacio =?ISO-8859-1?Q?Aramend=EDa?=
 <samsagax@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Agathe Porte <agathe.porte@nokia.com>, linux-rpi-kernel@lists.infradead.org,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Oded Gabbay <ogabbay@kernel.org>, Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-kernel@vger.kernel.org, Jack Doan <me@jackdoan.com>,
 Michael Walle <michael@walle.cc>, Marius Zachmann <mail@mariuszachmann.de>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, patches@opensource.cirrus.com,
 Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  6 Apr 2023 22:30:07 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 2210aa62e3d0..dc24c566d08b 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -571,7 +571,7 @@ static const struct hwmon_ops corsairpsu_hwmon_ops = {
>  	.read_string	= corsairpsu_hwmon_ops_read_string,
>  };
>  
> -static const struct hwmon_channel_info *corsairpsu_info[] = {
> +static const struct hwmon_channel_info * const corsairpsu_info[] = {
>  	HWMON_CHANNEL_INFO(chip,
>  			   HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp,

Wait a minute. Can you at least match it to the coding style of the driver?
A lot of work went into it to keep it consistent.

greetings,
Will
