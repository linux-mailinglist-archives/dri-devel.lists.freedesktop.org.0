Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63A9826AB4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334510E1D9;
	Mon,  8 Jan 2024 09:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DDC10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1704706214; x=1705311014; i=deller@gmx.de;
 bh=riH2FLGAXZ4BKZk1hp+CHpEu0rMj5GictGoJRzwbObo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=gbrWqlQpxfUuKBiazfsnCPqGFG/0CObIih8LEkWQyrL5+8VIYj2XgtJ+4Q91OQGH
 ADR3KFIaRINUQbCG8AC1bbdQf4EReh79eoE2ZVg0/hXaqZAVuE6KWiIoXMv+/Oawl
 rcGazjprLMk062w6h0H0SEhaxT0/GiXM86ApQMDLjg5ofAuTYskLEgbDdMSpZAmzI
 gAGTjsUwJv8UEVD+JCQH7curx1iVn8jobgi7EJktiNeTTz+JfGZ5PTS3NzgqDlkCx
 Q+mUmhluWZ1b6lEI7NMebI2aXuYtX30j7PRiiPR+2mFuAckKHKrDuBATTOZfHNpJL
 bN+x4EYAczjSl84ulQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.148.84]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sHo-1rHqHU3D3y-0054Ot; Mon, 08
 Jan 2024 10:30:14 +0100
Message-ID: <eb69de14-411c-4a45-bcfb-ad7399d874bc@gmx.de>
Date: Mon, 8 Jan 2024 10:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/intelfb: Remove driver
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mbroemme@libmpq.org,
 javierm@redhat.com
References: <20240105091127.23087-1-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240105091127.23087-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yYpzwU4Ir9MkfCqQlzVNvojJhnizMM5QnwIrkgbY47qhrXaE3Vn
 e02gyNLUgF0bQPaH2+ra+/BGHdEFedOOdCUnYZX0yqw52Tj2kyiTMKw4cry2jAk5aUuPjIH
 GV4FQXOxmgL8ot3zRogQ0Noyg9DLY3h418b8LGlVe8r5seR7T/t57AJouy5hGyD4UirBYZm
 Xqfssp68O1MWIWHK+8Bmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pAWxy34nq8s=;li7KXVldx3dG1qXMLj+cIQhcTwr
 CFnLRt68+YQ5P/jVzH+iKJBtwWbcpGaKz2jR5kh+xJ3CWYUGCvbYq7LLifEKsZCQU9gsibCfU
 VixoCo3LSAMQD9JkWNWnX1dFqLNLOB/0teY997Lrk0rRNFuQWIq71hCXloqvxZ4etByCFJpbb
 ThNa9bfUqpNEIuvOZlH7+ayyczDIzNZS3jmsuRGyUDinw6WGmj4J5mevwa8aSziiW814ddbgz
 BWcUvsPJELJzTobu3XAWib5aLAO4du30XI2w6a94zij3cUqtA6SFya6MOs9r3T3orAH1AHHbj
 Qzi/pTvCTpVGWhTpKABinZxuUBh8ffx6/mUnHP2NmGvT5aF9UfoN6SkbFrUN2F3lnHuocsYMa
 XHaI+PPFxWSQnuE6JUIc+xNywjGC4HhzHJ7bxQH7ovxKlgck1SRrKkaYJXDiV29quBjeXtFGd
 /IjVOApuDOR/vS/TipETNCZxxMQpEBM5gzsKPg1xP+kUwPoWj0ZNRTO0zt/uxoNIpoa65yDQO
 UiHDB4kUIdqgjt1YnPtag+FS9G8qTissExDPbn+248ik5fNNmigh01BaYLfB8m/HCkuw0wKzQ
 HlQiphv4QG9up6Vt6bEy9krQtZYE5e1vO2yYYTqHCvvF0iWl6w0zD4WFqxLKU1uaAvw1XsXur
 +RcoQFcRPbkeam7esefOkF2jMinZTyMJIZp4bcJjXiODhtOLtwAWJnPXh3QMjo+IswvjQsGmB
 BqmGPITcVWvZPTP2E5l5T1IoTWgWvfD6Wfervu6B4EUTqiWelTLhSf/re6licghlVlIfiLVEv
 R29pU0pVNAdhClZYcVzXxR9Vwg9CyUspfA8MDBHvcoqQTR1JZhDJrpmL4Dp4euE5/ezpsc7o/
 mnNhigEUiZIJ2Kn9JNYCjnrMRFw2U3lwibkjcSY2DSIcoDnUtKZdX12XuSWew+oAIU/Ok2gUs
 vihsLUw61QVi/qn1CPFBRk9ZJck=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/24 10:10, Thomas Zimmermann wrote:
>  From looking at the PCI IDs, every device supported by intelfb is
> also supported by i915. Anyone still using intelfb should please
> move on to i915, which does everything intelfb does but better.
>
> Removing intelfb is motivated by the driver's excessive use of the
> global screen_info state. The state belongs to architecture and
> firmware code; device drivers should not attempt to access it. But
> fixing intelfb would require a significant change in the driver's
> probing logic. As intelfb has been obsolete for nearly 2 decades,
> it is probably not worth the effort. Let's just remove it. Also
> remove the related documentation.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   Documentation/fb/index.rst                    |    1 -
>   Documentation/fb/intelfb.rst                  |  155 --
>   .../userspace-api/ioctl/ioctl-number.rst      |    1 -
>   MAINTAINERS                                   |    7 -
>   drivers/Makefile                              |    3 +-
>   drivers/video/fbdev/Kconfig                   |   39 -
>   drivers/video/fbdev/intelfb/Makefile          |    8 -
>   drivers/video/fbdev/intelfb/intelfb.h         |  382 ---
>   drivers/video/fbdev/intelfb/intelfb_i2c.c     |  209 --
>   drivers/video/fbdev/intelfb/intelfbdrv.c      | 1680 -------------
>   drivers/video/fbdev/intelfb/intelfbhw.c       | 2115 -----------------
>   drivers/video/fbdev/intelfb/intelfbhw.h       |  609 -----
>   12 files changed, 1 insertion(+), 5208 deletions(-)
>   delete mode 100644 Documentation/fb/intelfb.rst
>   delete mode 100644 drivers/video/fbdev/intelfb/Makefile
>   delete mode 100644 drivers/video/fbdev/intelfb/intelfb.h
>   delete mode 100644 drivers/video/fbdev/intelfb/intelfb_i2c.c
>   delete mode 100644 drivers/video/fbdev/intelfb/intelfbdrv.c
>   delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.c
>   delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.h

applied to fbdev git tree.

Thanks!
Helge

