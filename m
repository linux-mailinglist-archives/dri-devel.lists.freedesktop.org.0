Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1517A305B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 14:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DB110E096;
	Sat, 16 Sep 2023 12:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Sat, 16 Sep 2023 12:56:28 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482D210E096
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 12:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1694868625; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=o5MOFDs3o3UEwlFDwmjNztUBwR9RUtixGxBfVoenquODhIcNgNf3Kuo29PDoxO2mD8
 vc2dRVOZEuzj0uq6u9PmItU3Upb7ACtwISNFNrCLfEKFoVgdCQmj4he4igwgI/a9HwiE
 Bhp79hwQcEC0AU9o5hznLQLcasDvRiWF/4LewUV90BTFAkGn2P4I/h2CD0Tg6NWS+hc6
 /j0PD+ajS9nAEtQdCo669yNIM4QIiScOFFpp4/phWrewQfcQvhlPOHH2xPL1ygQDah5R
 B6qTUg1+W9OV3Vkg6ARwyFXEOuQbI4AKBBcbG096ux56G1+IvdqoYhXYiLoRf0pRtzpw
 3ucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1694868625;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/AAXy58L/sWU6ITVYngidAH9QYdMsJXYQ4py7+FutQ4=;
 b=MV5z5cdfGY1OQZ9BKAr8LDEwCZvocCHZEh/WbQGM8g2HHVMgi+0+PAKk1ml11EQVcB
 NeLMCLXxUBF+4/qMo3TiGo/jmHiUXwBD9eXGj3eQEg39Ztjs5+nOCD00pJNdhyFygBRh
 wKhs5v6yk7G/kYi7wpv92Ldg/66PzkphF3//OtItvHqDt9Y1ZMoAkcoplfBBV7vOxdvS
 xhLKqB5+ocFlRGBT5uMctf6M9t3P7KOBDXJVFydz98QBkZKx4DGGSGzshT9HGfw5icH6
 0XtR5F+lFeWTYyBt2HhQzobP166FpdQ326v9E21Ruk6jLESFaX3cNE40jiLU1edMusA1
 nDrg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1694868625;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/AAXy58L/sWU6ITVYngidAH9QYdMsJXYQ4py7+FutQ4=;
 b=mTP2O5O0jB3ZGYjSXJ9iHc+qpk1PW6BvmQ9+xL/u/2A+KHmQ+Zrqa5PgA/2Du8l2yf
 /4eArdmsyYO/BJYrqdb8Binyz7nQDG5HjS6fr2aMkAjI6Cp1Lz8W+RupdggV+jRtKKlB
 0fib3CQfWMO5CBUAowXjrym9HNeYrx6dIRGl0eHpntoQpMrq3r+nu3tasWX9nP62MMzJ
 s1LC9K8p5Q347GUpJ6FFOPJwPp9oF2QpxeBxSBX3JC/CHPg4O0OngIQRNOXTyMZ6peRJ
 uojR8OOr7UBX9q/piuWWqr168tOZ85MJIIOtXTVCQOx0HPV3bFBecNJuUSwI2yHueHM9
 SRFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1694868625;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/AAXy58L/sWU6ITVYngidAH9QYdMsJXYQ4py7+FutQ4=;
 b=cVOyXAlTBnidaQht9zOf1LPiq+rbQ9mZOQhLD4DgmquK28rbDDqKHU1O3LwNsdjfH5
 AtP8Bk5+gUBjpNCMBwAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZiDY="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
 with ESMTPSA id Y04dd7z8GCoOWOm
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sat, 16 Sep 2023 14:50:24 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: [PATCH] drm/omap: dsi: Fix deferred probe warnings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9daacd2f-0dbf-dddc-9403-b802447896a2@ideasonboard.com>
Date: Sat, 16 Sep 2023 14:50:24 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB436C46-413A-4469-BA07-F3ED1CECF02F@goldelico.com>
References: <20230412073954.20601-1-tony@atomide.com>
 <9daacd2f-0dbf-dddc-9403-b802447896a2@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Tony,

> Am 13.09.2023 um 13:59 schrieb Tomi Valkeinen =
<tomi.valkeinen@ideasonboard.com>:
>=20
> On 12/04/2023 10:39, Tony Lindgren wrote:
>> We may not have dsi->dsidev initialized during probe, and that can
>> lead into various dsi related warnings as omap_dsi_host_detach() gets
>> called with dsi->dsidev set to NULL.
>> The warnings can be "Fixed dependency cycle(s)" followed by a
>> WARNING: CPU: 0 PID: 787 at drivers/gpu/drm/omapdrm/dss/dsi.c:4414.
>> Let's fix the warnings by checking for a valid dsi->dsidev.
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c =
b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct =
mipi_dsi_host *host,
>>  {
>>  	struct dsi_data *dsi =3D host_to_omap(host);
>>  -	if (WARN_ON(dsi->dsidev !=3D client))
>> +	if (dsi->dsidev && WARN_ON(dsi->dsidev !=3D client))
>>  		return -EINVAL;
>>    	cancel_delayed_work_sync(&dsi->dsi_disable_work);
>=20
> Shouldn't this rather be
>=20
> if (!dsi->dsidev)
> 	return 0;
>=20
> before the if (WARN_ON(dsi->dsidev !=3D client)) line?

Yes you are right. We have a different variant in our Pyra kernel:

What we currently have in our Pyra tree is: =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommitdiff;h=3D5bf7bd6=
4eec1eb924e794e8d6600919f0dae8c5a;hp=3D27a0cd6263194d1465e9c53293d35f8c8c9=
88f9d

        struct dsi_data *dsi =3D host_to_omap(host);
=20
-       if (WARN_ON(dsi->dsidev !=3D client))
+printk("%s\n", __func__);
+
+       if (!dsi->dsidev || WARN_ON(dsi->dsidev !=3D client))
                return -EINVAL;
=20
        cancel_delayed_work_sync(&dsi->dsi_disable_work);

>=20
> If dsi->dsidev is NULL, then attach hasn't been called, and we =
shouldn't do anything in the detach callback either.
>=20
> With your change we'll end up doing all the work in the detach =
callback, without ever doing their counterpart in the attach side.

If useful, I can post above mentioned patch (without printk).

BR and thanks,
Nikolaus

