Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D766BA81
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 10:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DA210E2A5;
	Mon, 16 Jan 2023 09:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EC210E2A5;
 Mon, 16 Jan 2023 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673861767; bh=wnOHpBayjdNSjw+eUV3MCoIeItj+WtT29KKObbgNH18=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NSfx8Dl/wEgIyRrR0lcjIoZ2+gQioo4GdYXZkaOt2SZ3INu5zv6Y/9o8PVdWYeZqR
 QNGn2DEv3OmXbsz/w3tvJWMHONjbZHsP3G8pjogqQPAqlgq+LZCqqIyhJAN9vQxYi/
 TTf1oXWyOJJg5Jtw4O/rysQc1v+GF13XVONMtp3Nua6R3avP0Qg5toxTZAmfmdXaX3
 waz1MU7k/3oAEm4Y4i8lS0UfTcafirk3DTeS2iuo2/WnWwb79WkUFzb/ZBwtOosEZj
 xMtgyLwB0YXxPfnekHlZ3Z9Kf8dhuyG2VjP2OCin+PHLchWkLTvLasF8ABFw4kX0g2
 QEt3dzz2Bvlbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.151.61] ([109.43.179.224]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1odhjS1vbV-014QUC; Mon, 16
 Jan 2023 10:36:07 +0100
Message-ID: <7c2d45e5-8f16-83b2-93ce-87b456c53b52@gmx.de>
Date: Mon, 16 Jan 2023 10:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: manual merge of the fbdev tree with the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20230116115440.3f1909cd@canb.auug.org.au>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230116115440.3f1909cd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xA0svzfJeflX86rbfoatcczhHIIJk14fm6BDqRMBweC4tHBj+xI
 rguCwLMLkg/Dti7PO2lt61M72WAmQkS1veipCs2sT2tXF50/j71RCda0GLxqM4RqNmq4rwt
 onxH1WflPzvJkQm/GcvynAN21l0DPhdIo3ssqh+IzHHFPXoNyx3w3I2MjIJT/qeguil2NEz
 hb1ToK3uFt5czFm5P26rw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k89X/3EyuLs=;g1bkkxWspCpYG57AuM4VeRimN4z
 ezB7wSI6jDg08BcB6gbCb7IFTL/5VQXLsoEc52FXl1CUtYylgCgQG6h0/fsgDaU+Mk7x6hvAM
 h+hoKyfY5r9xDqV0vHXyrH5hvZppQ0e1W/1R11DNZivpMIutj+C1SRh/8Ck22cDutidkA4f4v
 BU4QZIFVtgwBQ6OfEyernNiIJk1DZ3tbRpnHy7b9n9lZXB+L9CICCX9NWCOGraTxe5rl1Mnzu
 LThv7ToYMMG1Pdft3L1FbsidYy12beDqw6tsZ/OYz1q+IZY2A9rhBIT8EJlCsgno1hKto/ICy
 63TAZfGVlcRbQ3dcZfKJfeU0vxY6dMXc5M8tMRGMCjB5sjtz/lkfJUSColVdLB8mG+mTouieH
 6NQpK2/OEmPJRYDJHihgtreIs/U6YUyyjyw3PahEJbAFhqAGWl8BZqF5EhqTMUn/7aac/7yMB
 zgykOQegOPMj8zmB4Bkmz0hqMxjUkRN+IsVIR3Ug4HafcJILz0QAPcd5zJwn7SGAwMYTUgMBz
 RG2W7pcLSak1Qx0NeoY9n4vmxc304QoQYzfn2PIK4QNRSa98lwzdIpJ3OOt8NUGtSqy5PBMIj
 +PHeMimDGxhjtTeBkxWOX/9/TXbhuWJmn8SrxOP9IkdMDgTv05Ie02knvAvsCDjedtOwts6/C
 LToJ99CyQqrBquHVmCrtoARUSopVrvNjgGuTbCzNIuXpLZFLDniRmSOXzaMpmBv0T3A46Ybkm
 tHJBzjo9kuZW5HvAh88dct0WI22xmvo8yBp2Uf/yWuB9TbJ7Q3/yhwO87Ry3sjc+sNB9IPdcj
 ICnUeNi9avC718Vb2cFp/1DCSiEn2eYLi/ACaBvJoRZneYM8/zUKKDGzzuTAt2k3wAwifQbtQ
 WWDCuQ3S7Rnm/4y6lpQzevW1lrjM5O3iHtGstwg6vQwQvW1q9MBMpWSd3r6gbthn0+uQClPaf
 bZBnczip6/lgZQog2ZUJZdFL7mA=
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
Cc: Kees Cook <keescook@chromium.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/23 01:54, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the fbdev tree got a conflict in:
>
>    include/linux/fb.h
>
> between commit:
>
>    5b6373de4351 ("drm/fbdev: Remove aperture handling and FBINFO_MISC_FI=
RMWARE")
>
> from the drm-misc tree and commit:
>
>    72ac3535c2c5 ("fbdev: fb.h: Replace 0-length array with flexible arra=
y")
>
> from the fbdev tree.

I've dropped the offending patch from the fbdev git tree, so it should
be resolved now.

Thanks!
Helge

