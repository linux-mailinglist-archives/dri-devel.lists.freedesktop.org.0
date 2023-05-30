Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C217168F5
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 18:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886A10E180;
	Tue, 30 May 2023 16:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4210E180
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685463140; i=deller@gmx.de;
 bh=rF0T2SlfmaNOFE5TtSeATbyrpJF607QsdHymKDcZe6w=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=Ofr1y6INZLK2Lq55e/CkySJxvH7vwZAPKdvq4xk2Vx5+4YWoAhB+YTaVH4trzwxPP
 vcumSSEASDINXACtNCS2oQ3dLXOw4c2UMlYv24HrKUWgUbxHv8aBoJTTG790nomccC
 4S3vsdpRVJPK8Sh5Kc+bVjtP12LypiN8f0MYjYAwdvgsqaK5J4OhQ5I1f3YtoaHoWP
 ZSSlUB0xc/314WQ2qoJrJRJnYvvHBm8l+C1bbz1zAiaF9nOVyVXLjD0rClb9eabEML
 Ohkv+sEbFWJUUG99l4FS4uJ4DfE5o6MYvsTMuEd5HBpKLeNl/zBie6AINla9ord6Rb
 KA7S1cnX0W8kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.122]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1pmmBh22cL-00Hvo6; Tue, 30
 May 2023 18:12:20 +0200
Message-ID: <3010bce3-cc66-4ad6-50b1-7bc66bd532d4@gmx.de>
Date: Tue, 30 May 2023 18:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
 <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
In-Reply-To: <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZvZTPkbNvOksiJGgd4YpFec+cdJOC5Jo0ZP9OE45DFbFKd82/fu
 SWHmWpeJd8pXruTGDp6oEutnPqDX94T9vh8mLYiYiRsB5jMmNmy3kx595OIdUBP6ZGVJvNU
 x2ryzwcpOABdT+2OGsVQ8R9291TuriLeCt7Gu5NnyHU9VteCo9hSeXB1I41u0pWP50TJXJJ
 Jq4IWEgWR0VhAYXKKpwGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:m0U2H1UF0ds=;OMxT2hGQ08PswwOdvigdBNqadDh
 ZOItP1jUeQkEBiUHqKNF8cp8Ov8kCca5s8G0pYJVSOUGoANIrhqdxfzJVqumoXrZhlaup9rdD
 b9Ff15jdWFpK2w2mxxB4Mtt0H3c/q0h6qPgS8IjiyIKo5H7MTSTZreZ7vBWLYZT6RObylfQYm
 KhzsDbdHHlb1Rk3aI6Ol2WmLU2lsofI+OLXh1KZwB1k7P541W3aDolE6nWPtM+S4jAdKHuI64
 903PsIm5O4Ly/CBHaw1vAWtnxs7QAGuu7k/gTLbtAVnT0XGp3homd1KOi7yyr5XMQ8oRaNQnk
 vrouZaQVm4FpW/G9AMZlK38pXrbddXZorRjMVOKJaUuSFLNECFTJb6/HhujY2t4LnEXcWI+g9
 yc+8sEKL9NPfVKtRkeuwYGX3E4jybQUf7f5UQHhfIvdjE/yBOa2HVZ5QCjfQEV4lC68rNMMRT
 wGzMcu1e7+xtikoqcz/GImnx4T7gjPhpUKJJGXxbLH94jjm2Jvw3CddmTwlKU/ZkdBa5HVbFU
 XclhcPF4E67URgoO8JIu5yArpGWS29nxSvPM1DXdfko2mrflK2TmBjI+LP2JO4WQujgQpHeyd
 8AeNCJWfC0/fqxnZ4hNpfVb2xjqAtDXvE7+MzcnzVJmjBYcdBuVwVdWUi0bXqDfQ2UYbZVyEj
 wGsOdoZx4St/XiAcGQT0pmb+LteqLJmO54j10goLkCwrW5KfZzub/FwdpGGCEmR/ucMB3cS6/
 gFlwNvviVfuvZrt3BswRj55HXyfaDzR5soeSXlgo5o7wcJrKwq+XYdidTKNxfiC1+Ekv1b2/8
 06Wess1Yig8d9b7qqKxAcoTdK/MDFdfBOXSrBFWPBzsKFJN1Gy9wqgmz5gbp994LOUQ4g6ldJ
 NxhZ/gJdgkNxvGaopw4h0TaTKmNKHow1M3fBUEyZzAYrpZgviMG+0RQ+NKUQ4NPqvFHj2EMim
 OXxqPBc8OOEbZML5P8ecUwbFhQw=
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Kitt <steve@sk2.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Wang Qing <wangqing@vivo.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Jones <pjones@redhat.com>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Xu Panda <xu.panda@zte.com.cn>, Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Yang Yingliang <yangyingliang@huawei.com>,
 kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Yu Zhe <yuzhe@nfschina.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Zeng Heng <zengheng4@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Hyunwoo Kim <imv4bel@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yihao Han <hanyihao@vivo.com>,
 Timur Tabi <timur@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Zhang Qilong <zhangqilong3@huawei.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On 5/30/23 16:02, Uwe Kleine-K=C3=B6nig wrote:
> On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
>> On 3/19/23 00:53, Uwe Kleine-K=C3=B6nig wrote:
>>> this series adapts the platform drivers below drivers/video/fbdev to u=
se the
>>> .remove_new() callback. Compared to the traditional .remove() callback
>>> .remove_new() returns no value. This is a good thing because the drive=
r core
>>> doesn't (and cannot) cope for errors during remove. The only effect of=
 a
>>> non-zero return value in .remove() is that the driver core emits a war=
ning. The
>>> device is removed anyhow and an early return from .remove() usually yi=
elds a
>>> resource leak.
>>>
>>> By changing the remove callback to return void driver authors cannot
>>> reasonably assume any more that there is some kind of cleanup later.
>>>
>>> The first patch simplifies the remove callback of one driver to obviou=
sly
>>> always return zero. After that all drivers are converted trivially to
>>> .remove_new().
>>
>> Thanks for that patch series. It's a nice cleanup.
>> I've applied it to the fbdev "for-next" git tree for now to get some co=
mpile testing.
>> I hope that's ok for you.
>
> I found patches #7 up to #51 in next, but the first 6 patches are
> missing. I guess this wasn't' done on purpose?

Strange. I don't know why I didn't applied those.

Anyway, I've just added them now:

Applying: video: fbdev: au1100fb: Drop if with an always false condition
Applying: video: fbdev: arcfb: Convert to platform remove callback returni=
ng void
Applying: video: fbdev: au1100fb: Convert to platform remove callback retu=
rning void
Applying: video: fbdev: au1200fb: Convert to platform remove callback retu=
rning void
Applying: video: fbdev: broadsheetfb: Convert to platform remove callback =
returning void
Applying: video: fbdev: bw2: Convert to platform remove callback returning=
 void

Thanks!
Helge

Btw... I cleaned up some minor whitespace issues in patch 3 (au1100fb).
