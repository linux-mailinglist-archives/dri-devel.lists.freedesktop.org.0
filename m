Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2A514429
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7462510FB9D;
	Fri, 29 Apr 2022 08:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1B10F672
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:25:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220429082533euoutp025cbc3e5f16447b65527b1a955d88e3aa~qUIIWyl1j0471104711euoutp02i
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:25:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220429082533euoutp025cbc3e5f16447b65527b1a955d88e3aa~qUIIWyl1j0471104711euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651220733;
 bh=zdxvS2BIshaquU/ig1ar1fTBfDoD+OWuHGCl7hcKBC4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=jezH6blQ7xF338XgpAylhwCnOJcxuwB4xHw0nmA0AWjfYMOVRzDtHo/X7bAguJTyo
 W/VOLa0enIxSabqPfoWg2mPO+yoCOpZtHPfRksXC58Vo2Rj7r5Iyav1TcVKTFz6fq5
 e5GfleY71gTT+vgzvoD8kOOIY2CpQ1BDGJKqbuSQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220429082532eucas1p186660faec3b3c146ed6a220ecead2b18~qUIIQjX5c2935129351eucas1p1p;
 Fri, 29 Apr 2022 08:25:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DC.4C.09887.CF0AB626; Fri, 29
 Apr 2022 09:25:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220429082532eucas1p1faad47c3e6435c9770e5e4cdec4c7cc7~qUIH3gMly3239732397eucas1p1t;
 Fri, 29 Apr 2022 08:25:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220429082532eusmtrp12e178e7563b8caf133613e1329377d56~qUIH2sAEK3249032490eusmtrp1E;
 Fri, 29 Apr 2022 08:25:32 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-46-626ba0fccc50
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.FB.09404.CF0AB626; Fri, 29
 Apr 2022 09:25:32 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220429082532eusmtip1c20817d40e1ae553c2e220d43f09453b~qUIHbRWPl3128331283eusmtip1Y;
 Fri, 29 Apr 2022 08:25:31 +0000 (GMT)
Message-ID: <25974882-b154-194c-147a-5b8c1d3ffdbb@samsung.com>
Date: Fri, 29 Apr 2022 10:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] drm: exynos: dsi: Use child panel or bridge find helpers
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220428121417.74guaowmzrh7pc2f@houat>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbVBMYRTHe/berlszm9tW9ozeZhYRWfKSJZrWZOx4mfrCB9PIXl2V3tir
 bBnToiGbspOGbVsqpMSKrVGUkLSyEc0yDaYYMVNNaqdlaqXhul769pv/8z/n/M+Zh8REOtfZ
 ZFLaAUaVpkyREO747faJrsWT5cn00i+9K2W2ryOErKhPh8scZh0hq9K1EDJ9V4tAph+fQpGE
 wmTvc1W8e95FKPryLQJFYX0NUoyZA2Jcd7ivjWdSkjIZ1ZKIXe6Jdz63EftKxOpv7eEalOel
 RSQJ1AqwtcRpkRspoqoRGC6H8OxA0PnBm+cxBMceLeeYs1dbSnEtcv+lVyHoOd4r4E12BM7v
 QRwLqQjQn783g2OcmgdP8/sRr3tCR0k/zrEPRcP5ll6My+BFRYPTsomTMUoMb/rLfrf0pmJA
 U/9KwM3CqAIEeQ3Vv/sQVChoh7UEx25c/mdWnC8OhIZhI8YH7SHhZn0Cz1FgPmFEPHvBoKV+
 Bs9+YD1zCufvkA4/9H92VMProet/2oTDu+dOgrNgVDDU3l3Cy3KwOb4RfKUH9Ax78gE8oOj2
 OYyXhZB3XMS7g8BgufFv5sMX3ZgOSQzTTmKYtrth2iqG/3PLEV6DxEwGm5rAsMvSmINSVpnK
 ZqQlSHenp5rRr09jnbI4GlHVoF3aigQkakVAYhJvoaMpkRYJ45VZ2YwqPU6VkcKwrciXxCVi
 4e6km0oRlaA8wCQzzD5G9fdVQLrN1gjqqJxXJdGSq5s7wmvi1GV7fWOiQujLJ1/DaEVO9q1F
 8scvI1dbf4TISg9fWqW2kW1XFvvZGytrzMU+prEFp01UaGdsTN0jDR1ZWSRNbHbZs79KVbhU
 Gbs6R1obZieyW0vDpG5Zs2r9C+XyANr/k27d0PzRuA1ZPRdeUtqz5/YTVqfPW9e7Tc3+qPiB
 R+6to0VhNFw06HMPTRibPgmTcz1omKcZ2KVbOS6vCya3T9qiAj862Q076GtjFWt3endve2Is
 mGk2WOXtaG5zsRfd0d05ZXoaf3/NHBMKYo+sj56MHEBYbqW6MF6cXLBxrnTL1swRlzvSCPHZ
 kvfGNoUEZxOVoQsxFav8CUoNKkqjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7p/FmQnGVztlbS48vU9m8Wk+xNY
 LL5smsBmsXzCPjaLGef3MVnM+PGP0YHNY+3H+6wed86dZ/O4332cyaNvyypGj8+b5AJYo/Rs
 ivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQydj47wlYw
 U7zi2zHrBsYO4S5GTg4JAROJFcdns4DYQgJLGSVabohCxGUkTk5rYIWwhSX+XOti62LkAqp5
 zyjR23mCCSTBK2AnMWPuXnYQm0VAVeJU9xNGiLigxMmZT8CGigokSbzY9hwsLizgK3Fh83w2
 EJtZQFzi1pP5YHNEBPwkLj64xwSygFmgl1FiUtcxJoht+xglzh05ygxSxSZgKNH1tgusmxPo
 7CtnT7NATDKT6NraxQhhy0tsfzuHeQKj0Cwkh8xCsnAWkpZZSFoWMLKsYhRJLS3OTc8tNtIr
 TswtLs1L10vOz93ECIy1bcd+btnBuPLVR71DjEwcjIcYJTiYlUR4v+zOSBLiTUmsrEotyo8v
 Ks1JLT7EaAoMjYnMUqLJ+cBozyuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C
 6WPi4JRqYFo6Mb/oi4Xh+nkpNu/U9sziWloYWMSrvoB13YwvblW+G+6+qGPVrFbMmX/mqWzp
 yneTc/fsnW5WcWHbPenQGSyWwYce3N2/ZbvoRaaDaedS+B8EzNQ4/+1KN6vYXft/ui/r9v0s
 91yzufnYkjTDJb92JOZtW7j1JudB1cwtu4s3TJPo5eUW+lQRuNmZ80mijEzRtap/C3YvnZoi
 9kzr5Qoz9YVnzK5+kXmfuP1QsxRD9oftGy+vdrexs+nfHld+XTvpiAabt4DSn7y9rwVcpjTe
 7L4bOGP+16/fNLkifj3NqQ93cFOpW/ip86XrCZbp348veBzkva19vt8tkZPyGemzP8hUywQv
 nbtgfad1WeRDJZbijERDLeai4kQAo/5omj4DAAA=
X-CMS-MailID: 20220429082532eucas1p1faad47c3e6435c9770e5e4cdec4c7cc7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220428121425eucas1p1eddb5ff91de432907e458f2bb60c7ba8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220428121425eucas1p1eddb5ff91de432907e458f2bb60c7ba8
References: <20220428094808.782938-1-jagan@amarulasolutions.com>
 <CGME20220428121425eucas1p1eddb5ff91de432907e458f2bb60c7ba8@eucas1p1.samsung.com>
 <20220428121417.74guaowmzrh7pc2f@houat>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 28.04.2022 14:14, Maxime Ripard wrote:
> On Thu, Apr 28, 2022 at 03:18:08PM +0530, Jagan Teki wrote:
>> commit <711c7adc4687> ("drm: exynos: dsi: Use drm panel_bridge API")
>> added devm_drm_of_get_bridge for looking up if child node has panel
>> or bridge.
>>
>> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
>> has panel or bridge") has reverted panel or bridge child node lookup
>> from devm_drm_of_get_bridge which eventually failed to find the DSI
>> devices in exynos drm dsi driver.
>>
>> So, use the conventional child panel bridge lookup helpers like it
>> does before.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index f067c86b0b12..ec673223d6b7 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -25,6 +25,7 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_panel.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_simple_kms_helper.h>
>> @@ -1451,9 +1452,18 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>   	struct device *dev = dsi->dev;
>>   	struct drm_encoder *encoder = &dsi->encoder;
>>   	struct drm_device *drm = encoder->dev;
>> +	struct drm_panel *panel;
>>   	int ret;
>>   
>> -	dsi->out_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +	panel = of_drm_find_panel(device->dev.of_node);
>> +	if (!IS_ERR(panel)) {
>> +		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
>> +	} else {
>> +		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
>> +		if (!dsi->out_bridge)
>> +			dsi->out_bridge = ERR_PTR(-EINVAL);
>> +	}
>> +
> We should just revert 711c7adc4687 entirely (and make it very explicit
> in the commit log). The out_bridge lifetime is completely screwed-up in
> that patch now. If there's a panel it will be managed, but it's not if
> there's a bridge.

Nope, this patch does exactly what is needed there.

If there is a panel, it creates a managed panel_bridge() proxy. If there 
is a bridge, it simply gets a pointer to it. There is nothing to manage 
if there is a bridge attached next to DSI. See devm_drm_of_get_bridge() 
function, it does exactly the same things (managed panel_bridge or 
simple pointer to the real next bridge). I agree that this is not very 
obvious at the first sight, but that's how the code is now structured.

Please queue this to drm-misc-next, so the Exynos DSI will be again 
operational after merging the drm-misc-fixes and drm-misc-next.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

