Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640525FC0B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410206E463;
	Mon,  7 Sep 2020 14:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2161B6E447
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599483438; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jv34PMyafvqRYOIcsfEyVpPHXi6oXDIBS9cXlCM12DI=;
 b=dNxrjvgiCGZ2gDpsrGny8IkriyroogU0LN2ugAdia9D6rBT75fSeRrRQ6h8ILkRXy5WZ9L
 k1TgVslPkWd81T72BVzX8znnxX6jHaNq+HJci+CHW1hpeel+glfSE/SUPR3/NVLZiTwoK2
 Udm00u02wXwIkL8d/OO+MAbT0oyoI+A=
Date: Mon, 07 Sep 2020 14:57:05 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: =?UTF-8?B?562U5aSNOg==?= [PATCH v2 6/6] drm/panel: Add Ilitek
 ILI9341 DBI panel driver
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <5BHAGQ.KGFJ0K3OLEAO3@crapouillou.net>
In-Reply-To: <20200830202822.GA950472@ravnborg.org>
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-7-paul@crapouillou.net>
 <edf38d68214247f486db3cc1f81ec404@shmbx04.spreadtrum.com>
 <COYVFQ.2IA7KFB6BF4C3@crapouillou.net>
 <20200830191133.GB6043@pendragon.ideasonboard.com>
 <20200830202822.GA950472@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 =?UTF-8?b?5L2V5bCP6b6Z?= <Leon.He@unisoc.com>, od@zcrc.me,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le dim. 30 ao=FBt 2020 =E0 22:28, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> Hi Laurent.
> =

>>  >
>>  > Please read the cover letter, it explains why it's done this way. =

>> The
>>  > whole point of this patchset is to merge DSI and DBI frameworks =

>> in a
>>  > way that can be maintained.
>> =

>>  I think this proves the point that the proposed naming is =

>> confusing. At
>>  least a rename would be required.
> =

> Do you have any inputs on the amount of rename we are looking into.
> Is this a simple s/struct mipi_dsi_device/struct mipi_dxi_device/
> or something more?
> =

> We should script the rename as it will tocuh a lot of files,
> and without a script we would chase this. But once it is scripted
> it would be trivial to perform.
> =

> I did not look at this enough, but I had an idea that we
> would have do to a s/dsi/dxi/ in a lot of places.
> =

> (dxi is my best proposal at the moment for something covering both dsi
> and dbi).

dcs?

Since DBI and DSI panels generally all use DCS commands.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
