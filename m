Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3FC201AC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BF510E261;
	Thu, 30 Oct 2025 12:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dDRPXxFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257E410E261
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:54:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5803C0DAB4;
 Thu, 30 Oct 2025 12:54:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2276068C;
 Thu, 30 Oct 2025 12:54:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C64011808A35; Thu, 30 Oct 2025 13:54:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761828875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Aj9GZ008QzUzXkooekBjbFcppgAMbSxcHVyDcsJ/Xj0=;
 b=dDRPXxFqLQfdPMh32gGnTc2/SmpBp6YBxCrNHSWhaPl/FhC3ncwmGD5dFpF/1QOViBjWtv
 k71/ZyjEkgcNW6vJW356l+c70qnktSysYC3P0KmCcKQKck0yMPlalzfqZjvajjUDSfWXX4
 dG/x++236sSrVFzu0gCmNSZjF4iVYwBtwBQbeHFFxn+lkMjTlykbCXp9Bl+A4pj/qT7F3s
 ufiR6vTnHU0b1UL3TVi7R4/+PMq88hdRVPCPyVIx6k03jvuiP3HsgwlxOgwtYsbLbPEKcJ
 s/QTKSbaC3JA6btc18m24FwyN5L2ktKVmcNrSgXMGfkMIA0ksgTXjZeE+qIU/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 13:54:29 +0100
Message-Id: <DDVO7L4Q3GC0.1B3RH5DEQ20HV@bootlin.com>
Cc: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "tomi.valkeinen@ti.com"
 <tomi.valkeinen@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "tony@atomide.com" <tony@atomide.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "deller@gmx.de" <deller@gmx.de>, "jjhiblot@ti.com" <jjhiblot@ti.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "saravanak@google.com" <saravanak@google.com>, "herve.codina@bootlin.com"
 <herve.codina@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "alexander.sverdlin@gmail.com"
 <alexander.sverdlin@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "daniel.thompson@linaro.org"
 <daniel.thompson@linaro.org>
Subject: Re: [PATCH v6] backlight: led-backlight: add devlink to supplier LEDs
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Daniel Thompson" <danielt@kernel.org>, "Sverdlin, Alexander"
 <alexander.sverdlin@siemens.com>
X-Mailer: aerc 0.20.1
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
 <6e6039c815c7125e35b43ca2f8d32a0fa3103fea.camel@siemens.com>
 <aQJSqJOrtETMKt8x@aspen.lan>
In-Reply-To: <aQJSqJOrtETMKt8x@aspen.lan>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

On Wed Oct 29, 2025 at 6:45 PM CET, Daniel Thompson wrote:
> On Thu, Oct 23, 2025 at 12:41:30PM +0000, Sverdlin, Alexander wrote:
>> Hi Lee, Daniel, Jingoo,
>>
>> On Mon, 2025-05-19 at 22:19 +0200, Luca Ceresoli wrote:
>> > led-backlight is a consumer of one or multiple LED class devices, but
>> > devlink is currently unable to create correct supplier-producer links =
when
>> > the supplier is a class device. It creates instead a link where the
>> > supplier is the parent of the expected device.
>> > <snip>
>> > Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
>> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>>
>> I've noticed that the patch in archived in the patchwork [1] but I wasn'=
t
>> able to find it in any branch of the backlight tree [2].
>>
>> Could it be that the patch somehow slipped through?
>> It does solve a real-world crash, could you please consider to apply it?
>
> Sorry folks. I overlooked this in my backlog and never posted the R-b
> (which helps Lee figure out what to hoover up).
>
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

Thanks Alexander for pinging and Daniel for reviewing!

I double checked right now and can confirm:

 * the bug is still present on v6.18-rc3
 * the patch applies cleanly on v6.18-rc3
 * the patch is still fixing the bug

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
