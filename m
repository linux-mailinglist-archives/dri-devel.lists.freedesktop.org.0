Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867179C1F3E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE510E9D5;
	Fri,  8 Nov 2024 14:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="RzWyT0Om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953CA10E9DB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:30:06 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1731076204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXU0zqzH64T+oZBcduwWmn4Upe7MVevQ2K4G2VK2A+s=;
 b=RzWyT0OmX20cYiDWD/utFaU9an5SMKNlc3LneUtjhWoQxRHjmNaPJpQJ5FqC6wpPgihgBk
 /XLPL8amsRINXZGDWOn8rhiiIivVkkG2z2bYteFr00U+8lTpoMrhwNyVitsk+Ix0l/jKRM
 NeBe9BsGknLAoDw6+bJy+ctIHXksGy2vhe3e+b53uZupo5ZIpmnns/hvcj61pkr7HUibtz
 kM+t3uAWNvRCBI8qKK0+4gPtWsT1K32UYpUv3BmszszMf4jfTGtlEaPIxcHwryV+yWOMxR
 Z7oXE2gbuIVh8X/QVy/blRlOT5/WL/qps4joY/eI4+AsRZ1lw0URJHpci0teKQ==
Date: Fri, 08 Nov 2024 15:30:03 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
In-Reply-To: <22484879.EfDdHjke4D@diego>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <10558711.nUPlyArG6x@diego> <047164cc6e88dcbc7701cb0e28d564db@manjaro.org>
 <22484879.EfDdHjke4D@diego>
Message-ID: <c27ab238825451f1c3a4722f39a19531@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

On 2024-11-08 15:22, Heiko Stübner wrote:
> Am Freitag, 8. November 2024, 15:13:33 CET schrieb Dragan Simic:
>> On 2024-11-08 15:09, Heiko Stübner wrote:
>> > Am Freitag, 8. November 2024, 15:05:02 CET schrieb Dragan Simic:
>> >> On 2024-11-08 14:56, Heiko Stübner wrote:
>> >> > Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
>> >> >> Perform a few trivial code cleanups, to make one logged message a bit
>> >> >> more
>> >> >> consistent with the other logged messages by capitalizing its first
>> >> >> word, and
>> >> >> to avoid line wrapping by using the 100-column width better.
>> >> >>
>> >> >> No intended functional changes are introduced by these code cleanups.
>> >> >>
>> >> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> >> >> ---
>> >> >>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
>> >> >>  1 file changed, 4 insertions(+), 8 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> >> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> >> index 58a44af0e9ad..f451e70efbdd 100644
>> >> >> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> >> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> >> >> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct
>> >> >> platform_device *pdev)
>> >> >>  	}
>> >> >>
>> >> >>  	if (!dsi->cdata) {
>> >> >> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
>> >> >> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
>> >> >
>> >> > this is all probe-related, why not convert to dev_err_probe?
>> >> >
>> >> > As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
>> >> > So dev_err_probe would be the correct way to go?
>> >>
>> >> Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
>> >> deprecated (which I originally missed, in all honesty) makes me very
>> >> happy. :)  I've never been a huge fan of the format of the messages
>> >> that DRM_DEV_ERROR() produces.
>> >>
>> >> However, perhaps it would be better to keep these patches as-is, as
>> >> some kind of an intermediate, limited-scope cleanup + bugfix combo,
>> >> and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
>> >> conversion to separate patches.  I think it would be better to avoid
>> >> a partial conversion, and I'll be more than happy to put the complete
>> >> conversion on my TODO list. :)
>> >
>> > But your patch-2 really just open-codes, what dev_err_probe is meant
>> > to fix. So with going this way, you're sort of making things worse
>> > first,
>> > until that second step happens.
>> >
>> > Similarly, reflowing lines for things that get removed in a week do not
>> > serve a purpose - those line-breaks have been that way for years
>> > already.
>> 
>> Hmm, it makes sense when described that way.  I'll see to perform the
>> complete conversion in the next few days.
> 
> just a note, as written on IRC earlier, I am sitting on a dev_err_probe
> conversion for dw-dsi-rockchip.
> 
> I was waiting to see if more cleanups turned up, so didn't sent that 
> yet.
> 
> Don't want to steal your spotlight though, so not sure if I should send
> that or wait for your conversion ;-)

I see no reasons why should we duplicate some effort. :)  If you're
already nearing the file-level conversion to its completion, please
feel free to send it, and we can drop this series. :)
