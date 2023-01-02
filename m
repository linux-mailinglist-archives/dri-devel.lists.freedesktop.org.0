Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9286865B40D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434D10E1B2;
	Mon,  2 Jan 2023 15:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050DB10E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1672672842; bh=tMFKm6S1vYdEhPMSbHlLVghOqqrmdl6HWg/Ar6Ny41A=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=HEcl9avXBPZybBtlbrOD07EfhoBsITX+HBGhDDJPUVH4AVgXH7uufhQ46/fg/5xYi
 svWsZhI5C5zDH9Kfd4zAcJfVTd8IRThxSbRY4LV9sCY0xdFmMCJ7hFpVpr0NkWfLht
 HxSPUMstPNX3YryGhepMQmUQc/Iv4ObCQD75ahmo=
Date: Mon, 2 Jan 2023 16:20:41 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/4] drm: panel: Add Himax HX8394 panel controller
 driver
Message-ID: <20230102152041.7rc2uts7o37fnsen@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Martijn Braam <martijn@brixit.nl>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-3-javierm@redhat.com>
 <20221230154043.7v3zmzqdrnouqzd2@core>
 <7120dfd4-305f-69ac-fee8-123196ed06a9@redhat.com>
 <20230102105915.gbfhletcm4dunrlf@core>
 <eead4707-e73f-f648-edc6-8415bbb25b8b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eead4707-e73f-f648-edc6-8415bbb25b8b@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 02, 2023 at 02:51:42PM +0100, Javier Martinez Canillas wrote:
> Hello Ondřej,
> 
> [...]
>
> My goal was to have some initial support in mainline even if there could be some
> issues. IMO it is better to use upstream as a baseline and attempt to support the
> PPP incrementally.
> 
> But since you are aware of the issues and know what are the available fixes, I'll
> let you continue with the effort and take care of the patches. Hopefully there may
> be things that will be helpful, such as the binding schema patch and the collected
> tags. I can also take care of pushing the DRM bits to the drm-misc-next tree once
> you feel that those are ready to get merged.

Ok. The panel driver itself works fine with some changes in other DRM drivers.
In fact, it will not need any changes, assuming the to be proposed fixes to
dw-mipi-dsi will pass, too. So I don't have many objections against this driver
itself.

I'm not sure I should be giving reviewed-by to driver I co-wrote. :) Anyway,
I checked it again, and only issue I found was that shutdown callback tries
to disable the panel even if it may already be disabled, which will lead to
unbalanced calls to regulator_disable functions, which may produce some needless
warnings on shutdown/reboot.

So if you want to commit this driver now, go ahead. DT will need one more round.

As you say, the overall usable support for Pinephone Pro in mainline is still
way off into the future, so I agree it's not necessary to get hung up on these
issues. I can do a DT revision + add in the other suggested DRM patches, so that
there's at least a searchable public record of the remaining issues.

kind regards,
	o.

> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 
