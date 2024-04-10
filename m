Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16289F3D6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183D310F28F;
	Wed, 10 Apr 2024 13:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="YojNkfL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B141010E7EE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1712755023; x=1713359823; i=deller@gmx.de;
 bh=msoMYGawkUxm0PT5cSRpGt0x1hnq2850w+pXJFSkP2k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YojNkfL2CtdLHzYdmdAQlyR0m9oA290POvaz1gTFTOwd6yEQclfj/xBQJ4jjCuKi
 7xbvjCP3s479puz/gAiBXEhA2Mxcf+rx2rmykKilLaZmyy29Mp5Zy6oqsTKkpc1bu
 mND6icvExm91RR7Z17DllPwF2QYXgoR1HOYi+DwVbq9nI/6f7gatNdXyXd77g4NXU
 DcE1g0ctCoxiUhhosKVyX3jgd88QDsbuS/L3ngIH3ZUYSClfBRyTYQNE+Mjx6Ohbp
 MWJAIMFgpflwnR7rBkWkl/e7p84AdNQLrRB0S97z+sOJaT7PalGj19TZ9suX8tdxL
 UI494hzKZxNp5pWf2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2WF-1sb4Nk0Q9H-00k4xv; Wed, 10
 Apr 2024 15:17:03 +0200
Message-ID: <5191337e-9ffc-44b7-9700-eb5f1f2fc4cc@gmx.de>
Date: Wed, 10 Apr 2024 15:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/sh7760fb: allow modular build
To: Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240210053938.30558-1-rdunlap@infradead.org>
 <4d01127a9130ce46b7c1d447811c89c1d1503199.camel@physik.fu-berlin.de>
 <c5436115-0b26-4369-8d71-154cc3c95659@infradead.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <c5436115-0b26-4369-8d71-154cc3c95659@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DCTb5Bwx2DoMf62bRu10O/n+mH0FmVf2ekAZyo35laz1flwRAsW
 NlfgNgEZHHlFpXiPF6MmBc6BdyQ1RepF1fS7uEcOTMUOe9izm59EpMldawG184HKsFRj+lR
 1R2Q3aM+60j8gXoBoRfy1kGfpIGU67n568JpoHqJKmY9hgM6SmnSwIrHYBtZNYnK0qZm4XX
 VWRtSkI40Qpcx+sygmznA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DEocJMt9eLI=;4j+JNJUcyI6qicZNmTxw5+OuWWu
 IIZpR6juaRNyc+bb8dTGTlGpPAet4Li6Oa0MW8ae6u52ABXD6OAbtcpd2hc75ZH/1rfHOhfEV
 QZuBLbht+4Z7CcqOUdCYjam4Ut4QkP7l34G7GlOONy2yzTbelan8bDlzWB/018IJTOOXTpHtT
 34Hx2cmkDFTSVMR80KEjJMy3pCKjj+4361vFpfE0RRxpP7VukWxvM+Lgh9r52n0c+NCeeD9AU
 fBmH2HVsirsC9R0DYG7w9uujU0pDoFohiZmKrq+VzwiCdLrkMCeS7Ltc5FM2fjQ7/jBX9HNv3
 S10C1Fw1I09izKpiUx1+73nMTHzNAHlAU0iSDR+cLtqq43hHDm6ChQB/LPEl8WAljZ6Gc8Gjt
 OVZ9dRnIa5dURGqyDDGTeU2FaymQBxJQ2gDe/JVCLKIgmcBDBmd7DldCg5RIU9TeMi3AaGVaW
 S1ob14SAyHKFmfq6vrk+WPIQ9SSptd5iJc3VkhwmcdIypiMSneUuRf9D/ypKWE8Fi+zCC7gqF
 lO5VsTDEJLIB26Rh6KzAPk2JJ+NV1pXQQG+AVySD7gX3bs+12kki5so27itmsPSkh+Jmedyyk
 TMYgZ3yuy5rU3f4JS5o1oINiIBKdwNIY2g0PkRTMlNWxOH0ESN7pLPzhnN8pw4Zip+E6k9oP1
 nqP5Ua8wW3+CZdMt4W9cjcnen3JSgwW2zOVc7eN7HhOFbDh4Mc3rrHrkxaD1Zwwyl27O6MM6U
 5CnRVeNDuHgBa8MLyD2PxQK8DUDObbVRgzyBj7ER5eLG1P/Bt0gk8uhYI0qgv4HWlY3ZFXV86
 DdTn8rPVthR//GAMMidVMZueEl8DxLwh/rG8jb4NN0m2k=
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

On 4/10/24 06:54, Randy Dunlap wrote:
> Hi,
>
> Will someone be merging this patch?

I've just added it to the fbdev git tree.

Thanks!
Helge


>
> thanks.
>
> On 2/10/24 1:31 AM, John Paul Adrian Glaubitz wrote:
>> On Fri, 2024-02-09 at 21:39 -0800, Randy Dunlap wrote:
>>> There is no reason to prohibit sh7760fb from being built as a
>>> loadable module as suggested by Geert, so change the config symbol
>>> from bool to tristate to allow that and change the FB dependency as
>>> needed.
>>>
>>> Fixes: f75f71b2c418 ("fbdev/sh7760fb: Depend on FB=3Dy")
>>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>>> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Helge Deller <deller@gmx.de>
>>> Cc: linux-fbdev@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>>   drivers/video/fbdev/Kconfig |    4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>>> --- a/drivers/video/fbdev/Kconfig
>>> +++ b/drivers/video/fbdev/Kconfig
>>> @@ -1645,8 +1645,8 @@ config FB_COBALT
>>>   	select FB_IOMEM_HELPERS
>>>
>>>   config FB_SH7760
>>> -	bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
>>> -	depends on FB=3Dy && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>>> +	tristate "SH7760/SH7763/SH7720/SH7721 LCDC support"
>>> +	depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>>>   		|| CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>>>   	select FB_IOMEM_HELPERS
>>>   	help
>>
>> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>>
>> Adrian
>>
>

