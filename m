Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8637D253CC7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 06:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C656E17B;
	Thu, 27 Aug 2020 04:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA66E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 04:35:23 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200827043520epoutp02881b5d56c82d4568468d25767c2bd657~vBe-XwmY11014510145epoutp02J
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 04:35:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200827043520epoutp02881b5d56c82d4568468d25767c2bd657~vBe-XwmY11014510145epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598502920;
 bh=wynkeJ2gZV5eNhHFGgSioBpWQoDnsmVxk8KLfHGKQ6A=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jCa/eH20KD1XAhu0AFe30qCbuhhLrA7pyq4i5P20d5XF4bvqscpfxRU8W8HniRSOK
 0NXMY/eFsKAFOZZoTDzqUSqcLOiPuCjKmVs6APQmDqFwIOj738fAjRYkuwckagJnaf
 Uwel7EG5PROnxW04HJBZN5AIdMJoZEI0CFZ6liUg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200827043519epcas1p392729327227b17aa7956bcab5699c7bf~vBe_ptMYh3020030200epcas1p3C;
 Thu, 27 Aug 2020 04:35:19 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BcVJj0MhtzMqYkn; Thu, 27 Aug
 2020 04:35:17 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F8.41.19033.408374F5; Thu, 27 Aug 2020 13:35:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200827043516epcas1p4d8e42aa0019711fc3e52079c7548cde0~vBe7ubg4N1941719417epcas1p4p;
 Thu, 27 Aug 2020 04:35:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200827043516epsmtrp2b45aace3bcbd5974e55f1fe0d55475a0~vBe7teMmA2463524635epsmtrp2E;
 Thu, 27 Aug 2020 04:35:16 +0000 (GMT)
X-AuditID: b6c32a36-159ff70000004a59-7a-5f4738047e9a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1C.90.08382.408374F5; Thu, 27 Aug 2020 13:35:16 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200827043516epsmtip1b4add86ac8dacc6ccdf3ed8efd33ca8b~vBe7R5eSV1882518825epsmtip1y;
 Thu, 27 Aug 2020 04:35:16 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/vc4: hdmi: Add pixel bvb clock control
To: Stefan Wahren <stefan.wahren@i2se.com>, nsaenzjulienne@suse.de,
 eric@anholt.net, maxime@cerno.tech
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <80749dcd-d4b2-68a1-f3ca-c19a120f6f7b@samsung.com>
Date: Thu, 27 Aug 2020 13:35:02 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTZxTG8/be3rZuNZeC8Mq2rt4oBjegpRQvExACwk2QhM2ZBd3sGrhp
 CaUtbVmcLK4YIcAQLaQ6ixSSiVWMw1FEIaJY+RDZYAZkjMH4EhdlUCbhIzDZWi7L+O93Tp7z
 nvOcN4eLCJYwf26GxkjrNQo1gW1BGx8GioNQMlEuvlqzj7xxph0lZyq/Q8mqth422b/gwsjW
 vD5AuuzFGNnUfwMl6ycH2ORfJb+zyb7mSxhp/u0mh/x2eQ2QTx4fIButdoz8fmgaI/Nb2jjk
 2sAP7oKrgxg5YRkFMd7UKVcHRrkG8zmUdfQnjBru6cWoJusIh7o1JKPqa4swavSbThbluPw1
 ld++glKlDbWAcnTnUvP1whT+kcxIFa1Ip/UiWpOmTc/QKKOIpEPyOLksXCwJkkSQewmRRpFF
 RxHxB1OCEjLUbpuE6AuFOsedSlEYDERIdKRem2OkRSqtwRhF0Lp0tS5CF2xQZBlyNMrgNG3W
 BxKxOFTmFn6eqaprWMV0j4THHQPn2CYwBosBjwvxMFhXuMTysAC/A+Bke1Qx2OLmVwCWXLjP
 ZoJFALsmVrBiwF2vaLiSwORbAJxrWsOYYAbA6lc2xPOUNx4HLcsP2B72wVWwZ6WF4xEheAcC
 z1curIswPAgulPyy3puPR8M8xxjwdEDxXfDuWLQnvQ1PhU1TLziMxAt2XXyGepiHR0Ln82Hg
 YQR/F96euYQw7AeHnlWxPL0gXsGDeX+fZjE+46HdOcdh2Bu+7GzYYH84P9uCMWyA/Rdfokyx
 CcCz5ooNkRTerylneYZD8EBY1xzCpHfAptXKjSG2wtmFEjazIT4sLBAwkgD43NTKZvht+PiM
 fWMcCrrKH3LOgR3WTdasm+xYN9mx/t+4GqC1wJfWGbKUtEGiC9382fVg/QL2hN8BZTNzwU7A
 4gIngFyE8OF7PYmTC/jpii9P0HqtXJ+jpg1OIHPv2oz4b0vTuk9IY5RLZKFSqZQMk4TLJBLC
 jz8+JJILcKXCSGfStI7W/1fH4vL8TawK+/7EfuOV3k5ht7C4IOnjZE6EbeXEvXtvpM++09Pz
 olt5Mrb06FGbvjH6o9qET3yTQ5eH/9n+ein3vb3blWVR6sTLq09tbyKBOlZa/SPL+dhby6Oq
 kbFjd3mWgJKq8p27F9/iwp+P5+ZIOR8eNHfNdlv2u3adCpHFnv0qYl+FSdxtl+42V0c7HUXj
 12xT8WpBQNLtP+zZrwtbPpv1sXk3kjPHCnae9i2ajjWlgilHzI+HS1Mb5WapczBDX7MkDFts
 Ez3omGju+LQ315Kt+dOafeFIXvLWpflr45AQ+rUmaL2e3kzsK+id9NZ3GZNifr3+fsx0mW04
 oJaXOUIdPnlgQk6gBpVCsgfRGxT/AoGOmrmKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRiA+XYuO65Wx2n0ZaYwM6lQs+sXhBiSngprkRAaZcsOaulcO9kd
 MsMuc+WlrLm8VVoxs2xbc8uu81JmGtZyZpp2l9ZaZtIVqbkC/z287/Pw/ngpTPQU96FSZNtY
 hUyaKiYFuLFe7BeMo+iEWYMtEFUfbcSRo+Qcjsoa2ghkHXKS6M7+JwA5LyhJZLZW40j3uoNA
 A6oXBHpyvZhE+c9r+Ej9fRig9gdLkFFzgUSXu+wkyr7ZwEfDHVf/Bhc7SfSqsBdEeDFZziaS
 cXZm8xlNbyvJdLc9IhmzpofPXOuax+i0R0imN+cej9FX7GOyG3/izDGDFjD6lj3MoM5PIowX
 LNrEpqZsZxWh4RsEyVcMv0j5fb+d+o48IhP0QSWgKEjPhYbzUUogoER0HYDDz/IwJfD4O/eF
 2lwD4Xa8YH0953bsAJoKXgGX40VHwsLvdwkXe9PJsDi/FHNJGN2EwVbdR8JdfAOwOt82YpF0
 MBxS2XguFtLhcL++D7gu4HQgvNEX7sIJdBw0mxa6DU/YXPQGd7EHvQha3nWP3MXo+bBU/xJz
 sz+sdRT/44mw600ZLw+INKNyzahEMyrRjErKAa4Fk1g5l5aUxoXJw2TsjhBOmsZlyJJCEtPT
 dGDk8zOmm0Ct9nOIBfAoYAGQwsTeQs/2yASRcJN0125WkZ6gyEhlOQuYTOHiicLOrWfWi+gk
 6TZ2C8vKWcX/LY/y8MnkhZQTjr1FsiCHrmTmmiUWrw9DlTXKg6qB/Bz1YsNWQWzJin6dpyRB
 0OBTY9suy7H9FshVqytPSF7fjnmfQZR6P4+8GWyuivx1llk7cEAtuSJxsIFTaxd3D26Mzsqy
 zy41H0tcWTicq4qxz25dEdTTHBNqivgUQLatGuubU+4hO1xQ98OqwKIKQ22TTXH2j7HpPYkn
 C05J/NWX1p2W32r8Oj1oM95//P2cKv7qqG9Pp8WXma2XKwLjw+/ndjvr7i0/M+/l+Kka44IG
 b8MN3/ihKSI6tMq/v6moZZnxd9mCayL7uJ0zk6KxCCU3Zv3X2C/NDze0x1kzU/IeH8paanyr
 DgoQ41yyNGwGpuCkfwBtV1uTaAMAAA==
X-CMS-MailID: 20200827043516epcas1p4d8e42aa0019711fc3e52079c7548cde0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d@epcas1p3.samsung.com>
 <20200821071045.24501-4-hoegeun.kwon@samsung.com>
 <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com,
 dave.stevenson@raspberrypi.com, sboyd@kernel.org, mturquette@baylibre.com,
 kdasu.kdev@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

Thank you for your review.


On 8/26/20 7:04 PM, Stefan Wahren wrote:
> Hi Hoeguen,
>
> Am 21.08.20 um 09:10 schrieb Hoegeun Kwon:
>> There is a problem that the output does not work at a resolution
>> exceeding FHD. To solve this, we need to adjust the bvb clock at a
>> resolution exceeding FHD.
> this patch introduces a mandatory clock, please update
> brcm,bcm2835-hdmi.yaml first.
>
> Is this clock physically available on BCM283x or only on BCM2711?

As far as I know, BCM2711 raspberry pi 4 supports 4k,

don't supported on pi 3 and pi 3+.

Since 4k is not supported in versions prior to Raspberry Pi 4,

I don't think we need to modify the bvb clock.


So I think it is better to update 'brcm,bcm2711-hdmi.yaml'

instead of 'brcm,bcm2835-hdmi.yaml'.

Please comment, what do you think?

>
> I'm a little bit afraid, this change could break with older firmware
> versions on BCM283x.

Tested it several times with libdrm modetest.

I expect there will be no problem.


Best regards,

Hoegeun

>
> Best regards
> Stefan
>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> index 95ec5eedea39..eb3192d1fd86 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -80,6 +80,7 @@
>>   # define VC4_HD_M_ENABLE			BIT(0)
>>   
>>   #define CEC_CLOCK_FREQ 40000
>> +#define VC4_HSM_MID_CLOCK 149985000
>>   
>>   static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>>   {
>> @@ -380,6 +381,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
>>   	HDMI_WRITE(HDMI_VID_CTL,
>>   		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>>   
>> +	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>>   	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>>   	clk_disable_unprepare(vc4_hdmi->pixel_clock);
>>   
>> @@ -638,6 +640,23 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
>>   		return;
>>   	}
>>   
>> +	ret = clk_set_rate(vc4_hdmi->pixel_bvb_clock,
>> +			(hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
>> +	if (ret) {
>> +		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
>> +		clk_disable_unprepare(vc4_hdmi->hsm_clock);
>> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
>> +		return;
>> +	}
>> +
>> +	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
>> +		clk_disable_unprepare(vc4_hdmi->hsm_clock);
>> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
>> +		return;
>> +	}
>> +
>>   	if (vc4_hdmi->variant->reset)
>>   		vc4_hdmi->variant->reset(vc4_hdmi);
>>   
>> @@ -1593,6 +1612,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>>   		return PTR_ERR(vc4_hdmi->audio_clock);
>>   	}
>>   
>> +	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
>> +	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
>> +		DRM_ERROR("Failed to get pixel bvb clock\n");
>> +		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
>> +	}
>> +
>>   	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
>>   	if (IS_ERR(vc4_hdmi->reset)) {
>>   		DRM_ERROR("Failed to get HDMI reset line\n");
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
>> index 0806c6d9f24e..63c6f8bddf1d 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
>> @@ -147,6 +147,7 @@ struct vc4_hdmi {
>>   	struct clk *pixel_clock;
>>   	struct clk *hsm_clock;
>>   	struct clk *audio_clock;
>> +	struct clk *pixel_bvb_clock;
>>   
>>   	struct reset_control *reset;
>>   
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
