Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EDC78B707
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 20:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D8510E324;
	Mon, 28 Aug 2023 18:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com
 [203.205.221.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9710E324
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693246209;
 bh=3nVTOKxn2v+c71PUzivCsIb3z1modIsrex9BbYGMMl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=xVekH0BEP4meM6vQ4VRVo2Ik5CvNR8/17bPZ8iqBDZXHLd57IDt0dS9JlZXVkD8sv
 h7fU3HBCQQaAh6TDmktUjKZH6AgWS6LH+k5HFYtUdcDVzkLpsXYKpNQYrtAc7YJdGx
 UJunk42YrcIQCDDvbFzO2yYdPCRb1yGo4hXEMhfg=
Received: from localhost.localdomain ([122.14.229.192])
 by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
 id 59B64FA; Tue, 29 Aug 2023 02:01:25 +0800
X-QQ-mid: xmsmtpt1693245685t2z0nsx4d
Message-ID: <tencent_2E893742B5115B5260081E410A34A89E1208@qq.com>
X-QQ-XMAILINFO: OXimaFo5SPf+AS8BFVa5JFDdiCIPCP6Hem7rxSpfyMGR6VE9/jmxPEJvgITgbC
 c1PPzMO7Z86dXcLh/SiWvqxnEZFTW4Me7vEpiW3aYfvhlidbEF7XTV+rfnyZyK2vVDgJvB4cT1Qt
 ZGmZlihtOgYomx7hhMMsFSuf+cVjxYZf0V9hSFVG4S1amigyVO1U93ANQBP1la8/UMApXxNEu42V
 W7+Nx8n36125VcXMQw8FMoy5s8gut7pmL7HfAw2z8d9Q6HRo28dGQcE3Skw7cKRAXrWjIcj3gJy7
 7C+YyN17h9HV4D+QyYo0vaFJuK/BE9sc0ulf6QWxJp+GL3zjOw8dWx5nUAgPaVvXlDNMJXGTVkXr
 bM3YLMHYXTJt/Ip0BReWOefprfI44VRLthwrjAwbJqqo/ZPl9Y4GkitrQjSe7uoTJtoges59Pbhk
 OA9sWNbg87ZKb+TfT7LHniuf8Ho9CA+KvcG+PQYYze3dZUY91As2GxTC24jIrOBW3cHz9n5JScCD
 8pCmQ+wzvEhEBG+4FTgrwThCXvlEfC7FHko1tVglY+OiWGeuhN/VBoDUE13+ZN5x6gIC371vTc7u
 Jps7kIqOQba8zL088HoGRf5eARHO0lVRqXjzJZ3wLgADGEeJSjJUtYyfY3Ng8xgQVMPxli61/NPU
 6xdFn5TJR3rrbDV9Fkk+je42ic8R7nG2rs4yCEctk9g4I5wPmNeC570YUgPFZXfjxe62sYR4ivXW
 mK29m3yIPDBpB7YGuhl65pzMQuZYh0CWhzGBxlyOquepwS0Vl6IN08EnbNqGEh5pcsw4kRm5XcJG
 s+tYpdl/Y/kX4yoiWlqgPLehGTYZF6yB8/O/DZZSHl5R+3xI5wZhcgWAI3eYFdgOFuIKl0UW0SYt
 ANbF+CTRYdguRksRCo3bMTxWlXKQbkiWYcEfZCUfHuCmcW+zMPSoP8kYVdWE3LJoK7E6fh0eKJeA
 zMioiQkavKk9+ZgNo1Ic7QtPhf8IivET4pDTD7wn2Yfo/i72pNlC/qIj/ShJl+ZSBQqY0XEvPyBJ
 hMnYOIKxbfxMvrIHTCYF1K0h+V0kpQ015XVdjT17uEuTdGAjfH
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: imx: fix potential NULL pointer dereference in
 imx8qxp_ldb_parse_dt_companion()
Date: Tue, 29 Aug 2023 02:01:25 +0800
X-OQ-MSGID: <8281992.T7Z3S40VBb@localhost.localdomain>
In-Reply-To: <20230828172822.GE14596@pendragon.ideasonboard.com>
References: <tencent_026E4B04ACDCE341411EF54862F8C6AB1605@qq.com>
 <20230828172822.GE14596@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, andrzej.hajda@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E5=9C=A8 2023=E5=B9=B48=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C CST=
 =E4=B8=8A=E5=8D=881:28:22=EF=BC=8CLaurent Pinchart =E5=86=99=E9=81=93=EF=
=BC=9A
> Hi Zhang,
>=20
> Thank you for the patch.
>=20
> On Tue, Aug 29, 2023 at 12:55:01AM +0800, Zhang Shurong wrote:
> > of_match_device() may fail and returns a NULL pointer.
>=20
> How can it return a NULL pointer here ?
>=20
> > Fix this by checking the return value of of_match_device().
> >=20
> > Fixes: 3818715f62b4 ("drm/bridge: imx: Add LDB support for i.MX8qxp")
> > Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> > ---
> >=20
> >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c index
> > 7984da9c0a35..d272f35c8eac 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > @@ -488,6 +488,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct
> > imx8qxp_ldb *imx8qxp_ldb)>=20
> >  	 * string.
> >  	 */
> >  =09
> >  	match =3D of_match_device(dev->driver->of_match_table, dev);
> >=20
> > +	if (!match)
> > +		return -ENODEV;
> >=20
> >  	if (!of_device_is_compatible(companion, match->compatible)) {
> >  =09
> >  		DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
> >  		ret =3D -ENXIO;
I think we can make it happen by designing the platform device in a way tha=
t=20
its name aligns with that of the driver. In such a scenario, when the drive=
r=20
is probed, the of_match_device function will return null. You can verify th=
is=20
functionality by reviewing the following function:

static int platform_match(struct device *dev, struct device_driver *drv)



