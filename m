Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EF43FFAEE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA4D6E84D;
	Fri,  3 Sep 2021 07:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2C76E84D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 07:18:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210903071834euoutp018a9845f4416a95f3d67eb89ba7805b6b~hPrtBSW291419514195euoutp01e
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 07:18:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210903071834euoutp018a9845f4416a95f3d67eb89ba7805b6b~hPrtBSW291419514195euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1630653514;
 bh=jzfva8tySkoBOZr2tYVsxf46AbNPcgeN/pneM9rWZ7M=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YHQT2KhGoOEH+ry4ouVkAW9b7mjzp7NHHnYMhKJyvj5aS8/1nWhoqnQhSZfstHmUh
 eFn7KIm7X0znMMoIRkfT31nu3YD1oE5sHcrcxcfpe8Srv9F0M9+W7mw9s46lEEq6mS
 UUU/r3hPJQoabiDe6YIfg1D7HgekIwgSNFR84GFo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210903071833eucas1p176cb4b6def20e6660e2b3ce075ab5b68~hPrsTJmFf2482524825eucas1p1M;
 Fri,  3 Sep 2021 07:18:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id BA.3B.42068.94CC1316; Fri,  3
 Sep 2021 08:18:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210903071832eucas1p10a7b8a295e68df4d2735110c9ec09cf1~hPrr0SjpP2476624766eucas1p1c;
 Fri,  3 Sep 2021 07:18:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210903071832eusmtrp1ee4a743996cc9c282753936e3c679c16~hPrryLsZp3052030520eusmtrp1y;
 Fri,  3 Sep 2021 07:18:32 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-1c-6131cc49558e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 23.36.20981.84CC1316; Fri,  3
 Sep 2021 08:18:32 +0100 (BST)
Received: from [192.168.0.14] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210903071831eusmtip1b3a77e8d246906c962e97defe4b33642~hPrqixxyX3135731357eusmtip1I;
 Fri,  3 Sep 2021 07:18:31 +0000 (GMT)
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE
 now gets PANEL_SIMPLE_EDP
To: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Linus W <linus.walleij@linaro.org>, Daniel
 Vetter <daniel@ffwll.ch>, DTML <devicetree@vger.kernel.org>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@linux.ie>, DRI mailing list
 <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>, Emil
 Velikov <emil.velikov@collabora.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, Linux ARM Mailing List
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev, "open
 list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <5c3b3c1c-6fc2-123b-b1bc-c6e085996e01@samsung.com>
Date: Fri, 3 Sep 2021 09:18:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTG8957e9uiLdfixis2KmRuw20gSrKXbHHTkHG34ZQtYdNtYsVr
 NVAkvaDsI4MxYcCsCk6FlggkfElMtNRC21mIXaUiX0qhTCapDsYYrjDKZ2Gdo1zM+O85z/md
 9zkneQW4xEgGCY6lpDHKFFlyCOlHNLR4ul57tz1CtrVwXIBUna0Y8ha18FFb8xiBnjYU4qjM
 2slDHdW3SNQzPU6i3wtcJKq7YCSQ1jWHoR//qcFQ/aCDhwqbO/ioYP4KjuymUhJpKs8SSP/n
 GIaKu5oWuSYTifKn1CSyXDADVDGhJ1BufjUP3e2bJFGO2cpHtR49QB7TZeLt9bTdcR+nF+aL
 AK3OUpG0Jus+QRsGKgFtniknaKN6gE/X1+WT9EPHTZJunHnEoy+3xtHOH2wYravMpEd0JYDu
 uZPNo7VjBmxvwH6/Nw8zycdOMMrwHQf9jj445yRTTVRG71/D/CxQKioAQgGkIqHdkccvAH4C
 CVUL4NCQe7mYAtBebCK4YhLAEvNV3rMRzeQwyTVqAKzy3MG4wgXgRPZpzEcFUAy0tdzj+/Ra
 6j140fBkCcKpYiGsGO1fgkgqFHp1D0ifFlE7oK6oB/dpgnoBdo5MEz79HLUPeltNPI5ZA1tL
 hpZ8IRUHf/5teInHqUDYP1SGcXojbHSV4r4wSJn94GyXAeP2joZ9zRcJTgfAUdsNPqelsO38
 6WU/EzprTy0P5wGov27EucYb8GHn/OKmgsWEUHjNFM7ZO6H9tpvw2ZASw19ca7gdxLCo4RLO
 2SKYlyvh6GDo7NAvPxgIq+5Nk+dAiHrFZeoV16hXXKP+P7ccEHUgkElnFXKG3ZbCnAxjZQo2
 PUUelnhcUQ8Wf3fbv7YpA6gZnQizAEwALAAK8JC1IuM7W2US0WHZF18yyuMJyvRkhrWA9QIi
 JFB06MbVBAkll6UxSQyTyiifdTGBMCgLi9M6viqWHtLMJp5flzDAard39wY/37Rqu/elt8Y3
 bXZkfDjnhU+yK+sjRMFqdfxn9rqamLnvbkX5r3p/XfnH0RVNu1xXeg8oE6pybuvgtfaMlzNY
 99n4Ld//dOJkmKq4YdO+usbuAKnpk7I0/QfA3R7lMfj3RkfyreW5sUWWkehLqqCbObtfmd4v
 j9QiL5X07YvUpxv+Xv2He9AMPwprCu3TyPsrDD1RXbO7fz0QEzMzSxl5muHXqTPW6l1HrKvF
 jw5u6371a1w1mFzmVsjlexThVRuv7zFlJjnZnZrUb/ptT7sTY3n10gWz/112w2axOPbxkdSc
 z/cKpQvxZWcenyJEIQR7VBaxBVeysv8AlYUuhUwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsVy+t/xu7oeZwwTDb49VLboPXeSyeLvpGPs
 Fqf3v2Ox+L9tIrPF/CPnWC3OLjvIZnHl63s2i6ddb9ksVk3dyWKx8e0PJospf5YzWWx6fI3V
 YuL+s+wWXb9WMltc3jWHzWL2kn4Wi60v3zFZzDi/D6hu3y42i84vs9gsDk3dy2ix8ONWFou2
 zmWsFqeuf2azaN17hN1ixc+tjBY/d81jcZD2uHztIrPH71+TGD1mNfSyecxuuMjisePuEkaP
 vd8WsHjsnHWX3WPTqk42jzvX9rB5bP/2gNVj3slAj/vdx5k8Ni+p93ixeSajx5UTTaweG9/t
 YAoQjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL
 uDnhPlvBLoGKq2+esTcwzuHtYuTkkBAwkZj9+RlbFyMXh5DAUkaJ+X9/s0EkxCV2z3/LDGEL
 S/y51gVV9JpR4u/CF0wgCWGBVIlrB5cygtgiAl4S03a8ZgIpYhaYxynxefojFoiOqUwSy1//
 YQGpYhPQlPi7+SbYCl4BO4nNk66ArWARUJE49+IrWI2oQKRE04mtUDWCEidnPgGLcwoEShx+
 9AysnlnATGLe5odQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3
 PbfYSK84Mbe4NC9dLzk/dxMjMFltO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMK7080gUYg3JbGy
 KrUoP76oNCe1+BCjKdA/E5mlRJPzgekyryTe0MzA1NDEzNLA1NLMWEmc1+TImnghgfTEktTs
 1NSC1CKYPiYOTqkGph1rbWbMmzXjSG2amHRz3sLLVyasclgV8HE2w44Hp/lOCMYKZ7lZmGou
 XykuZy4oHnLxhAdT+aTOb/rZr5Y8vZTRktTQycCxIuxqQ4zCxIU6scq6GmoztimZNUn3/Xt6
 w9tMtFLiQ/Ct3eXPQhw6T8Qa7IsOf6dl8e6envRB9ikn97ld7+ncv7XgsNebmoTKOm45SY7d
 P4tKShnf7p+uv8T+FsOW+pUtZ4vuF8VI/c6/dSvElVk6+fB8EbEE9+bflwvk3rFFbL3mtMv/
 VphE6IH7RQ93mNk6Tog3irVb2Rt/vu7uRY5Ja9sOhK5akbHm7Dqt04tccuZah7L4HNJSZ503
 Y7vf+wNzkl/uvRXxX4mlOCPRUIu5qDgRAD32K4LfAwAA
X-CMS-MailID: 20210903071832eucas1p10a7b8a295e68df4d2735110c9ec09cf1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210903071832eucas1p10a7b8a295e68df4d2735110c9ec09cf1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210903071832eucas1p10a7b8a295e68df4d2735110c9ec09cf1
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
 <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
 <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
 <CGME20210903071832eucas1p10a7b8a295e68df4d2735110c9ec09cf1@eucas1p1.samsung.com>
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

On 02.09.2021 01:10, Doug Anderson wrote:
> Hi,
> 
> On Wed, Sep 1, 2021 at 2:12 PM Olof Johansson <olof@lixom.net> wrote:
>>
>> On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
>>>
>>> In the patch ("drm/panel-simple-edp: Split eDP panels out of
>>> panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
>>> give everyone who had the old driver enabled the new driver too. If
>>> folks want to opt-out of one or the other they always can later.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>
>> Isn't this a case where the new option should just have had the old
>> option as the default value to avoid this kind of churn and possibly
>> broken platforms?
> 
> I'm happy to go either way. I guess I didn't do that originally
> because logically there's not any reason to link the two drivers going
> forward. Said another way, someone enabling the "simple panel" driver
> for non-eDP panels wouldn't expect that the "simple panel" driver for
> DP panels would also get enabled by default. They really have nothing
> to do with one another. Enabling by default for something like this
> also seems like it would lead to bloat. I could have sworn that
> periodically people get yelled at for marking drivers on by default
> when it doesn't make sense.
> 
> ...that being said, I'm happy to change the default as you suggest.
> Just let me know.

I guess this is just misunderstanding. Symbol names:
	CONFIG_DRM_PANEL_SIMPLE=y
	CONFIG_DRM_PANEL_SIMPLE_EDP=y
suggests that CONFIG_DRM_PANEL_SIMPLE_EDP is an 'suboption' of 
CONFIG_DRM_PANEL_SIMPLE, but these symbols are independent - old symbol 
has been split into two independent new symbols.
So Doug's approach seems correct to me. Maybe one could change names of 
symbols to avoid confusion(?).

One more thing, I suspect previous patch can break platforms with EDP 
panels. Even if this patch fixes it, maybe it would be better to squash 
these patches? Or add temporal solution to save bisecatability.

Regards
Andrzej

> 
> -Doug
> 

