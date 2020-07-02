Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685AD211CE5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394F6EA56;
	Thu,  2 Jul 2020 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9BF6EA3D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:24:32 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200702012430epoutp036d155d08fb118f4f6812a613f6a1da3a~dywY7tpQB2031720317epoutp03y
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:24:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200702012430epoutp036d155d08fb118f4f6812a613f6a1da3a~dywY7tpQB2031720317epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593653070;
 bh=Zdt1E8Bmc3DE34fUUv3jf+hWWfo2jX/u1CZkjX4C4r0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=roGXvLUv4B1erlQYiUpO7x7uFd2Rf2ud6hZVNAGrpFLa4SsTTPAO6aB2JI2SDQGBd
 1lhbrOtVCinJBrctfpe87BUz3hjQOPcLNr1I8ov1QderqM1Fvw1kM3oIMQYm30NTM/
 z1uQ6/0Rfa3BjRsnmlFwafEKYRi8InoF3O//rZoY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702012430epcas1p1d59fab40eade4851a6b7feae92b14e70~dywYgUkw-2508025080epcas1p1z;
 Thu,  2 Jul 2020 01:24:30 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 49y0kN0n4fzMqYkZ; Thu,  2 Jul
 2020 01:24:28 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.89.29173.8473DFE5; Thu,  2 Jul 2020 10:24:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702012424epcas1p1d83a5cd89539fd382bff7ebf022e21d9~dywSyYOYV2975729757epcas1p1T;
 Thu,  2 Jul 2020 01:24:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702012424epsmtrp251507e8224b7ea158d4176b744a3fd02~dywSxeIN81729917299epsmtrp2g;
 Thu,  2 Jul 2020 01:24:24 +0000 (GMT)
X-AuditID: b6c32a37-f5587a80000071f5-0f-5efd3748cdb8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 97.F6.08382.7473DFE5; Thu,  2 Jul 2020 10:24:24 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702012423epsmtip1d2d4dd440c303ffbe7a317063904119b~dywSPDmPF2459124591epsmtip1N;
 Thu,  2 Jul 2020 01:24:23 +0000 (GMT)
Subject: Re: [PATCH v4 10/37] PM / devfreq: tegra20: Silence deferred probe
 error
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
Organization: Samsung Electronics
Message-ID: <03db5226-e063-78d5-2607-01ca9bbaabf5@samsung.com>
Date: Thu, 2 Jul 2020 10:35:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <14271aed-5fb6-14e1-3fe9-ef8d0c5013c4@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbVRz29HFbtnReXu5AdMAdIRnIo+sKhwn4WNmumSTMzUnU0BW4oYS+
 7C1Otqgdr9F2DAdzasNjGQ6FSggM2cBWMmQjFcEpj0ywwhzEbQFantHxmC2XRf77vnO+73z5
 fuccPttnAgvk56h0lFYlUxDYNk77j3uiIsm4tfSY768EofGaYoBm56e4qLZngIssc/cBGlpy
 YuhzWyuGisxXOKi/YJqHBjurMLRQ1gOQYdGMoV9/SkZjZ77BUEXTZwAV23p4aH2khYP+7azh
 vOJNOu8W88gOs4NH/jawyiZbGw0Y+ceIFSPHTb0ssqxwFiPPtzUCcqF1V6rXO7kJckqWRWmD
 KVWmOitHlZ1IHD4qPSAVx8YII4XxKI4IVsmUVCIheSM18mCOwt2FCP5ApshzL6XKaJqITkrQ
 qvN0VLBcTesSCUqTpdDEa6JomZLOU2VHZaqV+4UxMXvFbuGJXPnQXwaupmHHh/YuA08Pbm83
 Ai8+xPfB6rkOthFs4/vgNwAcNq1sknkAf1hY4jJkGcBbLf3cpxZr78XNDRuANouVxRAngAVP
 vsY8Kl/8KLzQr2d5MIaHw64HdzGPyA/vYUOLoRd4CBsfBLC/ZHHD8SweAof/uQ88WIAnQdd8
 BceDOXgoXFmv2TjJHz8O7e1FmxpvaP9yckPjhb8Mp8xMMhvfCUcna1kMDoLXZ6o2GkG80Ate
 1k8CpoQEtpc3sxjsCx/1tvEYHAgXZm0Yg0/DBnsPxphLAWzrurM5ARHsulrpNvPdCXtgc2c0
 sxwCO1aqARO8A84uneN6JBAXwNISH0ayGw5OODZjA2DdWQP2KSDMW+qYt1Qwb6lg/j/sMuA0
 gucoDa3MpmihRrT1wlvBxlMPj7sBLs24oroBiw+6AeSzCT9BX8zjdB9Bliz/FKVVS7V5Coru
 BmL3gC+wA/0z1e6/otJJheK9IpEI7RPGioVCYqcgZf+ddB88W6ajcilKQ2mf+lh8r0A96+Lz
 pk6XS9JUv7JkUV6a6QsIdJ3KH+g7S3cVHBGNCMcfNhhPmDmfnI84zXkt5VGJ/LZgXJdWOxxW
 qXgRT5vf3l8oPyQoqWeHZ5zESpebXfGN+lXJkePfLZfVTVtPBjxz1Xnt75/tY85R0+B01eN3
 h7tfVas6hssPh2d0OiaK+m6uJVn1Xxy499EL15O/+oXKeCstzPhE8K0x/lDO+6+PmdCtgbmm
 4rr1anO6S+AdunrNEQF8D/LXLSk36/M/juCWW6xvThWEpBx7gHS5Fe/x1+yp0f4vDdmCTMdC
 ncEtfsa1gsVYSYZCtOthQpG0KNkRFrVKVp4R/LlbPvJ2RB8c/f0ewaHlMmE4W0vL/gMErmmC
 cwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsWy7bCSnK6H+d84g4urmSzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZVx51shas5Ks4ub+TvYHxGHcX
 IyeHhICJxJ7jU1i7GLk4hAR2M0o8/vGWGSIhKTHt4lEgmwPIFpY4fLgYouYto8TFtsdMIDXC
 AsESE882gNlsAloS+1/cYAMpEhE4xiyx6fRpJhCHWeAyo8SOzq9sEO2vGSU+HlsN1sIvoChx
 9cdjRhCbV8BO4sOnSSwgNouAisTvf/PAakQFwiR2LoFYxysgKHFy5hOwGk4Be4mns5azgdjM
 AuoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPwLCTts5C0zELSMgtJywJGllWMkqkFxbnpucWG
 BYZ5qeV6xYm5xaV56XrJ+bmbGMHRraW5g3H7qg96hxiZOBgPMUpwMCuJ8J42+BUnxJuSWFmV
 WpQfX1Sak1p8iFGag0VJnPdG4cI4IYH0xJLU7NTUgtQimCwTB6dUAxP79+DDOawiKg5i72/Z
 5Pue5wm+xzLl/3qdqE/zVJKPHGC4Ua3Mafn8udrDXk+zD3/Mk+Qj563VdTFgyLlzql5Db3o2
 q6GOXdjayHuL0vsVpt2flcjy591ZzvkV5rN/a+rZWmrWTnvvyZi/6+npdzxxfOun/3rSqs90
 SyVy9Y4NGQ6NfJfeRPwIiPl3wL82s4BtpdukM0sXyvWbBS9d9YLfZU2byIEq6WpJ70MlcxOE
 VfKLN3TI5VQc3v5G78pEs97Fl6MeGYZxm576yuRTHbaMd6n2he7p5m3pB3Y+aNu3tDOP+0l+
 WublicYep1O7WM6sydaZezfKYM4O/T8vbgU1MrLzGx/cbfKpo6y5TImlOCPRUIu5qDgRAFTu
 xpddAwAA
X-CMS-MailID: 20200702012424epcas1p1d83a5cd89539fd382bff7ebf022e21d9
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131843epcas1p352d1dfcbca81988d3363036d762dd47f
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p352d1dfcbca81988d3363036d762dd47f@epcas1p3.samsung.com>
 <20200609131404.17523-11-digetx@gmail.com>
 <14271aed-5fb6-14e1-3fe9-ef8d0c5013c4@samsung.com>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/2/20 9:56 AM, Chanwoo Choi wrote:
> Hi Dmitry,
> 
> On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
>> Tegra EMC driver was turned into a regular kernel driver, it also could
>> be compiled as a loadable kernel module now. Hence EMC clock isn't
> 
> Looks good to me. But, you better to add the commit information
> about Tegra EMC driver with commit-id ("patch title") format
> into patch descritpion.
> 
>> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
>> there is no good reason to spam KMSG with a error about missing EMC clock
>> in this case, so let's silence the deferred probe error.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra20-devfreq.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
>> index ff82bac9ee4e..6469dc69c5e0 100644
>> --- a/drivers/devfreq/tegra20-devfreq.c
>> +++ b/drivers/devfreq/tegra20-devfreq.c
>> @@ -141,9 +141,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  
>>  	/* EMC is a system-critical clock that is always enabled */
>>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
>> -	if (IS_ERR(tegra->emc_clock)) {
>> -		err = PTR_ERR(tegra->emc_clock);
>> -		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
>> +	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
>> +	if (err) {
>> +		if (err != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev, "failed to get emc clock: %d\n",
>> +				err);
>>  		return err;
>>  	}
>>  
>>
> 
> 

The Tegra EMC drive is included in this patchset.
So, don't need to mention the commit info. 

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
