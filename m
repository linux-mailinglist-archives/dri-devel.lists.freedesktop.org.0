Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C659C6C05B7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 22:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C6410E1A7;
	Sun, 19 Mar 2023 21:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488A10E1A7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1679262105; i=deller@gmx.de;
 bh=/w73ZFCv1Qm1Ts7RFrt74S83t9SlJMyPOGfs6s5w6vA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=tye27jpqsnJEQ5r1aPRWUdOel0H0Qq18wodWOSgRW2UGJMI0OWIKRoZay6CPYhS07
 SjX9tFAEh+mFBbeBnx0IPJsoan/zTpEmbLrTqgrZEEnFg6AwH+fbJhCs9PoVJR0D+m
 OtWpFcvTSIqeJh9ri2123YEQAk0rEueQ4FIBwfAb93CW+Hcggp2qWZmBFnsZEgA6vz
 hcRtEHaq5HTYQbFhFnn13Thv85Boqf1g1MXexMJG98FW1qWozzIfJKgyOIcT6OpRcL
 CY96oXEvHOHpeMvVsFeKuNanEugd6kBmYqQkbh3t/FnxOh1lZvYb8jh3sfQRCQTeoh
 +7ht4ObM92auA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.189]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1pr1M93om1-00MKnb; Sun, 19
 Mar 2023 22:41:45 +0100
Message-ID: <d4e1a2ff-6c01-4268-0874-5c3fecb74d89@gmx.de>
Date: Sun, 19 Mar 2023 22:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
 <20230319210808.apsba7oj32kt7ree@pengutronix.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230319210808.apsba7oj32kt7ree@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xwAGQRhydUJn6LP7AgZcAr5scedxzicgjKoLbjwAcTNGaDnp+/z
 X/f8IJhruTRzlrsBt0ZC2L5dIbISHZ+hED1MX8JD70H7Hkv7HdoaObXrwmlQj4ZWyWTO2LM
 5+qTlW59Ypi/saa8hZ1BbN/Oijdnie0uRdl7imP3UU9GfmjnrDWQB/x5UI1hnXMIoqrIGj3
 MynjfG8fllx3mD8aaD/Yw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1Tu6xu/NmPA=;+Otc//YaDs9ii4mcEMCpkmMkYfh
 LG/Sb1kOuUGuYsbm4jQn7qd2NHbEAfU3B6zOh9ubIRUH9yA78KDaRXs1kI4We2Jk1T+y7IWPz
 2AzCjvJdZ+AcTcDF7Wj3nPslBCXvWhwZSGB8AmcfABm2T8+2tbC/+tCX8oVzETEhTn/PwKgI5
 D4COPEQ/gnN01lBBsj1HgtYjeYeIkXPiY9lzRnGaWbvZ7k2ftn5KcHKl1T868bfezLcVO0155
 CgQdF6HgoGdGwYzYCulnFZ3AP0gsTnoJr+PS1JzgYYnT5ekxhm0GqDDSsOXQ0r8ZB+E6cAUfr
 QXnGiq7pOjai2UnvtctRleqiDr9+DFDSbzLIxenRwdi7IDERMQgtRaV67BhEebPE0M56MFOaP
 Hc8jw+ModhfNKqVO7oiCuxHewgPw9MdLBbXioEL6HDTEjqoe3+Ix58s7ZKD17/77GcWzmpaSA
 0jD3bE7lamumRNWDYjaeV7JZ2GKW7BMajVrt4CGb58XhgPyZ7n6FOpceVmOvfmWQ1/SsVec5+
 Qhw62+3ob8WJ5RnCVJwRQY1CHtaQ+V0Hz6Ic2Tzm9CrpczqOQrlYmVWdtlWDvJ2PXXFCjpRBI
 IWZfp8p5nhMxs2/tQ2Mz8w/XNj60RWMeShvm56h2+QuezyomYzY+XIG7cqpLZYbt5vSWfrQS4
 RyiE2ZNYSaLCK3CqhhW9rM4Z0depojewzmE0DrTa2nmBF7r1ZZTZDA17JYjgE/S2pwLtqsioN
 h32pBS6RSt646pXvTRL7NGTGJWoIgXsiKvSJAA17IrQnwhe+W50fbc670uqGleaD5C3GPHKq6
 QUVcMX+fkzK1ckRRVk0jlJ/IPGUZoi26Z962uF2xtsPoboaL0cn82qol0ER0VtWtdVsc3yg1j
 R3Bx0nWSo4hG9BJ/jZYMODN/jWArr92ba1958yK94+5/QPNvB7krwRpYkoMR0elJjQjqsJ4nD
 faSnYl5aOUUha83TpbX3y38rP3o=
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
 linux-nvidia@lists.surfsouth.com, Robert Jarzmik <robert.jarzmik@free.fr>,
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
 Zhang Qilong <zhangqilong3@huawei.com>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/19/23 22:08, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> [Dropped Bartlomiej Zolnierkiewicz and Michal Januszewski from Cc, their
> email addresses bounced]
>
> On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
>> Hello Uwe,
>>
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
>>
>> Regarding the new "remove_new" struct member I'd prefer a better name b=
ut don't
>> have any idea yet...
>
> Ideally we won't have to life with it for long. The eventual plan is to
> switch back to "remove" once all drivers are converted. So I didn't
> think intensively about a better name.

Ok.

> Did you know that struct i2c_driver has a "temporary" .probe_new()
> callback since 2016?
No, I didn't knew.  Nice :-)

Helge
