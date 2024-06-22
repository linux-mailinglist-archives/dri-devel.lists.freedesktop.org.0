Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7A9132A0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 09:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E7510E044;
	Sat, 22 Jun 2024 07:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Ro/i8Mik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30E410E044
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1719042854; x=1719647654; i=deller@gmx.de;
 bh=K1RBLojDabEhnbj0us/zxlBeoNaITVfFIU0Qe0YFMx8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Ro/i8Mik95o4vc1p6evD2vZGVh4BjOkMd+PMpvlG7S+bT1xzkb4uSnwvF9tYPx3b
 DPZsfrVsDjQ53Guz3Y3vBOylfwzDxkjSVSr28hNVAvbKnYvIEmRx5kf77KPdxqlaE
 N4/bxfsZlnmeYuXNorJIrRYfW8CKDZZ5p6F+S7NuFFAdhF1EOod9+sjkwEsE8Dgth
 MKcjNbsvbNi1j2wmQZo28LxFxIxvT7ku6ovowFuEnZW9gMTPTSt2c6oVlUh00x9Af
 reP3vzTEpJXB8xTu4Q1JpjwdK0PuYsRlFQA9mcvFHVbjJH8nnlSIlHanwXf3LnyBf
 sUQne6+uLs1n4jYgpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.133]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1smbsZ1cwH-00ffvD; Sat, 22
 Jun 2024 09:54:14 +0200
Message-ID: <e3639dd9-0a94-41a0-b9d2-93fc1c7b610e@gmx.de>
Date: Sat, 22 Jun 2024 09:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: vt: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240621-md-i386-drivers-video-console-v1-1-e533652b7ebb@quicinc.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240621-md-i386-drivers-video-console-v1-1-e533652b7ebb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZgeHwQZeM2qB/3xMG/pvhOJpWqFsZQjLJhG2Bz364/V30+M937C
 49sDWXEdWryFyvIqjdVL3sqRHvKuI4az5BqV0wjR7LJCNrp3aD0F/ZLPOiijVFAdciJiJQF
 CPQJ1wQYoG3GFk1QEUgvdkfCvm9szrNX1WJS7M0rJY57bejWLPvSgZnjdmSTP8KQ81WAtQp
 3nA4fdUlI7X11I0MTcv+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AW2mNykeSow=;3n1zN481VMjh7+6wUWBt9KM3pYF
 2LorQ8W/iwXASvWy9GgThda2uBZwmZx7WQtzNCym/4MIazd1DfcMQ/l+cG1MQCuQYAVrdFJxq
 kUvzP85ULx/L+gnI0dRD6WMToDE7nmTiZ9HWBnegQBjE5YJtdaLinGgpXDut29V+/RND4pJyw
 IV0dm2PfBEsx7TeEFMNKmpHGZyaMItvUgcL8NvLDehY0/bBsfgNCrxO15BgxipUC9wuBXIvba
 q9PE52KxegZkKKCmX8pHd0yiT4kLPHjjLo2ZMUPOCUb2NjIMpIbd5z/74oStfOT2l/sLn1UcZ
 OjlHtGXB9lvSvtqTGGFDK2TC8V2TcAiRTSZlUxlbuDQprfDImaLDGlgsdlpEKXsQ0PBUeRN1b
 gtLNLTHAGdkBvfkm0DZTtdBob5pUGwo+qXL5FmqhlxyWboSwdE0oUIbLwE1MH3w2NUPAM0dfc
 7zpF9SJ7P5JFz9GBJmCIPq5QL+sGp2njUpuYLdGNOheTDg4SQyF7YPjuwxxzpwAE048wISwla
 fyL5b4ZDCB1Kgiu+tO+b9fPMVUnV1hoWgj7mH+5je+Bs9EJSWDOHP6ssu1pyXZe85stVxJhBL
 ZM3OU6QxSwbA92nyhzSIae7RhYAlnYuohycIA0p1u2Gts+L4vDDLxvOdsrfxJe2gzxXSNZLp3
 t2XuQ7nGY7R3V9Dvr7Gxt1iTAbs1INAvzhPBUUgYx6/dJouM+SSDkU/Y+YIbJh+wAM7pk8eCi
 b6AoD3TbWRlaE9/EwCj1hcmeW7kLag3w67pgP5whEB9EQeHmcvBZ5d/s/P8umoXkapTZX97mW
 tbPkJZLvLiQoh6qFE75r/vmH2WsMb8akeewOW00CPXCiw=
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

On 6/22/24 08:07, Jeff Johnson wrote:
> With ARCH=3Di386, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/console/=
mdacon.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes three other files which, although they did not produce a
> warning with the i386 allmodconfig configuration, may cause this
> warning with other configurations.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch title adjusted to:
  video: console: add missing MODULE_DESCRIPTION() macros

and applied to the fbdev git tree.

Thanks,
Helge

> ---
>   drivers/video/console/mdacon.c      | 1 +
>   drivers/video/console/newport_con.c | 1 +
>   drivers/video/console/sticon.c      | 1 +
>   drivers/video/console/vgacon.c      | 1 +
>   4 files changed, 4 insertions(+)
>
> diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdac=
on.c
> index c0e1f4554a44..d52cd99cd18b 100644
> --- a/drivers/video/console/mdacon.c
> +++ b/drivers/video/console/mdacon.c
> @@ -561,5 +561,6 @@ static void __exit mda_console_exit(void)
>   module_init(mda_console_init);
>   module_exit(mda_console_exit);
>
> +MODULE_DESCRIPTION("MDA based console driver");
>   MODULE_LICENSE("GPL");
>
> diff --git a/drivers/video/console/newport_con.c b/drivers/video/console=
/newport_con.c
> index a51cfc1d560e..242415366074 100644
> --- a/drivers/video/console/newport_con.c
> +++ b/drivers/video/console/newport_con.c
> @@ -744,4 +744,5 @@ static struct gio_driver newport_driver =3D {
>   };
>   module_driver(newport_driver, gio_register_driver, gio_unregister_driv=
er);
>
> +MODULE_DESCRIPTION("SGI Newport console driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/video/console/sticon.c b/drivers/video/console/stic=
on.c
> index 4c7b4959a1aa..f1f3ee8e5e8a 100644
> --- a/drivers/video/console/sticon.c
> +++ b/drivers/video/console/sticon.c
> @@ -391,4 +391,5 @@ static int __init sticonsole_init(void)
>   }
>
>   module_init(sticonsole_init);
> +MODULE_DESCRIPTION("HP STI console driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgac=
on.c
> index 7597f04b0dc7..37bd18730fe0 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -1222,4 +1222,5 @@ void vgacon_register_screen(struct screen_info *si=
)
>   	vga_si =3D si;
>   }
>
> +MODULE_DESCRIPTION("VGA based console driver");
>   MODULE_LICENSE("GPL");
>
> ---
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> change-id: 20240621-md-i386-drivers-video-console-ae292c09bb67
>

