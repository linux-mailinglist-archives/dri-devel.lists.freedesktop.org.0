Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5AF675DA8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9011010E105;
	Fri, 20 Jan 2023 19:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB86010E105
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 19:08:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6CEAB85203;
 Fri, 20 Jan 2023 20:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674241702;
 bh=Tov0XxaFg4AeMetuCc/FSCGv5o+vmLUFOd1sTFSqNPg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ywwY/7D4zN63SMp1a6K58R7x3l7dmmrIrA+pnKphjQJwnh/wWKx5tblC0cUhyJY/O
 P/WBN7Ijm/McNj4gOqbggxmwa0bx1q51glhcb9dyEAKBi3DVpdX3WqXa7aqdveXZmq
 qFLDFAv+Ju63dl/MNlVNtN0VLYV9tjgZwFhCdUiPAD1Jn+vVef8F26pRwEvqdHCPfG
 baJShQ/af9m1mkGCVD4Y8iOB56r8KhxShgqPg5ZsxQj8LZG1pAMLRgsVkrbihrON4Q
 7519OKrh5MH8yUyNosFobVst1zUx8bCMyXDqgrraikgSQNVRsshRgxFhTAmb30iPrC
 w2ZKRlo2pk2IA==
Message-ID: <c363af34-9f62-b172-47a8-0816afd7be9f@denx.de>
Date: Fri, 20 Jan 2023 20:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
 <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
 <CAMty3ZA6SBA4XAvSTgCTq_WC1Uq6jPXD5oP9MZisj3YdActoYw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZA6SBA4XAvSTgCTq_WC1Uq6jPXD5oP9MZisj3YdActoYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Maxime Ripard <maxime@cerno.tech>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/23 19:54, Jagan Teki wrote:
> On Fri, Jan 20, 2023 at 8:36 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/20/23 15:41, Jagan Teki wrote:
>>> Hi Fabio,
>>
>> Hello all,
>>
>>> On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>>
>>>> Hi Jagan,
>>>>
>>>> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>
>>>>> There are two patch series prior to this need to apply.
>>>>>
>>>>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
>>>>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
>>>>
>>>> Would it make sense to re-submit these two patches as part of your series?
>>>
>>> The previous version's comment was to separate them from the DSIM series.
>>
>> Hmmmmm, seems like those first two patches got stuck. I fixed up the
>> malformed Fixes: line (it was split across two lines and had angular
>> brackets around it) and picked the first series via drm-misc-next .
> 
> Thanks.
> 
> We have another series for Exynos, prior to DSIM
> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> 
>>
>> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
>> macro , since checkpatch --strict complains about it ?
> 
> Okay.
> 
>>
>> For the second series, you likely want a RB from Maxime Ripard and Dave
>> Stevenson first about the probe order handling.
> 
> Do you mean for 01/18 and 02/18 patches?

I mean

https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
