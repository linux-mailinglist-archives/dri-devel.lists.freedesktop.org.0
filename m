Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3B6710521
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 07:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B641A10E945;
	Thu, 25 May 2023 05:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334210E945
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 05:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1684990983; x=1685595783; i=markus.elfring@web.de;
 bh=44jzQKbb7MjR3uCsx2BXVqGpBTh6Yhma67xUVGqxG2c=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=q5Y9zulOj7dtV3EZ+zF/41XY/Gnk7cg2CVVYNVRMqCLf4+r/H7wWDmBIwFLfjJbBoMnp7rY
 oKcD1IIegJkxjo8kOQRJPubpap5F7KR8vrPqZxuaEVWaaGpmTFw8K7xb8EVrLdAYwuxxhXzBi
 XmJ8p6nemc6hQP9XLcL6Romq87xFBucpjdb57TC99KEZdvC0AbN73/gQLXZSLF0uMggwJoUXL
 D56AoUo3qSOFg92ggBCIM3HiWrLwxaIfry9QqSTjIpDX7bGhcY8AfdAzdY+RUR/WmQ3X6iWAA
 rojNFJE09O9g/wTjzNa0Fx61/uE7m1FS7w7zaDEuA+5Mj5Y2Rp5g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQxs3-1pnQI43NXL-00O1P4; Thu, 25
 May 2023 07:03:03 +0200
Message-ID: <be1a89af-1aea-ca3c-6101-a0f61f4dc245@web.de>
Date: Thu, 25 May 2023 07:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] fbdev: Move two variable assignments in
 fb_alloc_cmap_gfp()
To: Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <8f0bcb48-7677-340d-282e-27f6fe063c6b@web.de>
 <341b4af7-5c6c-cbd2-6fe3-c0e4e58f3c7d@web.de>
 <35bb7db7-bf14-20ba-3bff-80d05c42e28b@gmx.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <35bb7db7-bf14-20ba-3bff-80d05c42e28b@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iHotWRiwCKBzkAh507XuLUh2eyxN0hk8k+e73gOLfODGFt1C9h2
 vre4kFb/CS7BHA7MPJnEcq5nNwRQ3lImOgVF/nrmwEr1/DEY+DqZyZykcoYlai7K2b4+XO5
 tJdyNMNIXkgJkOgafecqVLy9O6t1JMd3ZN1hqwwvoTzMKeaL+6FN+H6kYbVxQbCvmwyDWii
 sOTZkUJ46HbYdyxco0WnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xH9KWPuDi0E=;pIYqpnRj2kFfLz61TRFfuSY0Jx+
 s8ismkxD9WSU5ZJaR+uU+rZ5EQn5dukr/AKtrd5fPxv/BxuqfcnepGU979Hd/PSTAhOXbIoo1
 Ujh88b8VbnGHkDyOZgFXxn2+OMv1P7aHkPtITR102W0iuZjnRt1NayIbKNTeMVbWWmtFjcdFx
 q7xlrz6WewkuXV2ciS7W3XcRzxMXNei99Q+TnxfM5GzWQI9z79x89YWF3FpFKcsL3VOXeLCgd
 2wzaLNPneBWfttI8ghmEAsKJjFLbkgxdB0rTs9zSKQyQMjs+EUUYrR/7v5puZoSp8LJayEPr8
 ZEyp+Sl6YOlOubNiLtUg5dA+NtrD/qbq6RCIgC8HsYRNwr/c5u24WoxOPO+Iphy3yBpZSXyfk
 NQMlnw/gWD1T8LPLY0ItUUh2fcIOqK7DTYrjmbP9VPnBMrMWmB2CrLu261xMHCBkpvg24pMAO
 ZdRyk8kstrbPAO3Fi69Ljr/4zs7s7qYPzoo9Dmuqki+NikfntdZXCIcCMBJR/YuUv3KK2see4
 PE1XnhxzIXfvhF9OkLwwSf5+Hol85yAU7IJRMCmqMCBNb0cREk7SRT1q2q6ac/Mn48ceKrfza
 0h2V5yELnbLS+W3ycb+rLmptkjsog44HKDnBkIye09cdcaRCrvnJDZJvOn2D1KM2emzcWXFwU
 OYYyYggS2mxnPS6HKCZ2DuREO3wLxg6WUvZzzaFk7ReKbem26HgbnaWCu1FVLtorr9a167Uki
 rBQnBXf8s2At1F1iUfACLCbofhUElllqP0AfzJhru4+UfxCNlX6/NODObGBAwEp3+WuXUrSJ1
 NSbyCk5WnBEyyYiSnvue7YeEFeuzmKhGUGw2m0UO6aa/1BcYiyMNgrjt3PDZGLc1Ay7+vZoPm
 ctZ46vzyUavU6EjizUtF169DykbmHMfoe4dNgx8Up++nZk2m8WRvnYZp17anjgzz4TvCpHKyR
 ed/YQQ==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> Move the assignment for the local variables =E2=80=9Csize=E2=80=9D and =
=E2=80=9Cflags=E2=80=9D
>> because the computed values were only used in a single if branch.
>
> Please do not move such variables without real need.

Is there a need to explain desirable effects better?


> It makes backporting (of this and maybe follow-up patches) much more com=
plicated

I suggest to reconsider such development concerns a bit more.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/dri=
vers/video/fbdev/core/fbcmap.c?h=3Dv6.4-rc3


> and the compiler will optimize it anyway.

How much do expectations fit to supported and documented software optimisa=
tions?

Regards,
Markus
