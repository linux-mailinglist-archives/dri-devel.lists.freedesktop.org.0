Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4C99AD31
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE1710E04B;
	Fri, 11 Oct 2024 19:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="S2mvSDQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-20.consmr.mail.ir2.yahoo.com
 (sonic314-20.consmr.mail.ir2.yahoo.com [77.238.177.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F7F10E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728676691; bh=W60cShMzR1/zWQBkEs/U2DaVpWxIfzQSToVxJLNFJ5M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=S2mvSDQmhZhHQeuNawmXKxErmwYDw7yWru8sZkPfVgYE8I1ihAQz8PU8plfEP71kuRbO/zzt8guvQenSPizpSNltIRp9sJZ0ylXUu47BJlu8j52qgjRNbNRN+pnGuFq1Ma79o/hEoByzqNuIuSpR5/QuSuUEadA+pFIQHn/CW0eewYcffc9halERkqGr4rp0Y/skGcfTkMi+PRN9x97cK8AxsnJBDTPpXHoKDKyQZ0j3rvZ06NFhS6NghBhGssqkg4U8qw69/b0fsN+CdsgXgeyk+UsyPQOgWYo3duAGM1UgFYkrkPv1+1bE7NbyEZcPc8XhP20rQeB/ZzeapXxTQQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728676691; bh=LgKcZvQincNYX2dW5muYRMf6Xldzf2/KGHVeO7K/0sz=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=GAJ7mBBGdmYV3id4h4y9V3b3hUtrCu1dHV8K8oFrFAdyZjyBsmHjscHQ/wMUAwWGwmIZaqVlfg6RNR4OCDN0Kp2oehYJoP2F8ufNeeepOwq4726LL9yrUAdR6wtRYwUVT7EU7o28S6vXCh8Dr8AuE9QbYofuvgQ3FNAZThOIasKOn6plUu/SjUwWRa64lVviazVNK1G2noWPC3Lvzh5tsdzX/8XUGJgssdDtNyVTyWiTfIVwbZ9Kms7QEd1RPS8VTSuIUfDZnfCJj/Q/A+V8dR08+JUcJx3XsgJu65UCuXI5rX+XSM5/unNUqqhALm7qGvPPQT3ZoxqjGocIqcjJUw==
X-YMail-OSG: 65BngOkVM1m5ejVn66vv6kcilrBhaEanG.LIDctCaFnaFYYHqCUiO7OcllRz1kx
 DYXpmQkzDt1gjpLm0GuupFETZLO0BXjtNHQaqVI6QJd166.7RR_JlS_M2Ly7HUN8EGDoc7NMgL9u
 VniAGBvSWR49qZKtIUDhWaMbJuDv2ySdbO3ZGi_zfRt23DRWonY.KWz2anF7Aa5qgfvf8121Tczy
 KKHRsiMV8EiH3wrTIBN98yHF9ppqRz1ElOOFdxeUWQK4R7WtiuB7HUhSMZj73001xlol9XvB_kPJ
 DtekRThTdfVnpRv6XjbOi5AG2QCTxiVhpX3JKCgbSqsZ3ErBDdzpA7far7iy8Z5FSM7JgdyG1YKD
 i8kMGJq31jOIzF_wyEvRoBrzkdnXeypx0JrucC8Xm3KODvZmcYUq7i2jWs.CcyjtbUPhHscEMiX2
 FOMiSul4MXMplS38I.enw1UtUN1_QHJiCeYlP286xry_0TAKq1XsvW1pj74sc34GnyqkGyzThfY5
 MjSy7LWEjqY_f_ZD9Z6zQJtRAJVpgq40vXZXqUTiXXw2tNHqK7i8zfmzfsXO05L4HZMlUl8d6PCE
 Qm7zIerNZuORsteQSyUf0O97cw3jfCL68rklPpaHJOqVHwP4AKNWv7vMxtykN847ixSii8sNZc4q
 E27XfJrLBivAg1FgfboBoGOAHVtBqovaJi4qq_okoPd_xpxV512TgJoZ0jwm53fykws9FkufuNrs
 Qb8wpkNAQY0RUgg3n_oJR4M9kCDbQkaN0c1fMp7lMrMJd.Ks8GynmPcBLkevHxIueKs_EcYoKDgt
 nE0l6pWyzyS6nqSduYWQHDPgSAs0dMaQyWBhubKZpvMSJdhDfTJ4u9pWUlxQQeTV6fDodhqTwZsR
 GfrBKyvBUhJQB5.YNYWnCU2xHhL4wEbLgxIPkP5egF8KUAM6tC_ZM80X.VWrXTBm_FUMrMctzazE
 WiDkPz.8BYh4jrVt5Y4LHZ1os5ibX3zm32bgZ5.5xgslBOicYDdzAEflCI3lK8q370YN0OBe1weF
 umk4Q.rpYMqj8NRY_SfxiQIcuiyYmG0XyDhLua8NTFnI.osqEIJJ5Uvcg.OircG6b2XiJz.RSpQD
 T8cFXhN0LnkQ6Yf5mhsh7pMEn26tCPgZZ7UuZDE4.gqo0Bov0fQxLhtSmOMvc.sXoNjkx37EcX7b
 o7wjXeo.2jZKs9B4ZpzXuxBubmxqS9XtlQdGNOv9s0aI0cTlSw8eV_TR2bnUEA30qQBZbW.vqWg.
 euBnnAGZ2lx2xQrDuLCDvXAghThZ5FBeFADkJQ.Wl2___k2U1HeGTxidR3fU5ZQLdabew1X5CSr.
 yfe_DYE6TzDyZmd1lY0GdQaWzoTInLSdIPSqu9qZaMAg1y11NmcZXkcWSAaln1saIxVuKDXi0Rkn
 ZlmVfsKe3gpOFn.XgK1v9NU9b2akx5DTK3zf6zu0PqRsdbogZOEJmE30rAMYBuM2r_ZCYtVkAFHT
 BIBEQNX1Hc_PWxgoMB7XH3y8Vy3Yh_rg7Ap.4_vtB7e3Ose7j46R24E8BfFL20yuuzINfOuXFv_f
 ltMLjs16j8QfoOfTKy7nWlw7n0wHski9dM9EzJ8xEVktO7ZcWd5vVlTfWpn611hDdXzr5eslbJbw
 mch0qZRHoQTG06vm4AzqREBZxfYTGTJONR2KMYsqDntOBrDJc4DHSvTZlZqYxIymR5WJZohBtsds
 4jMxpAUwCsKQZJUFdJinXOidIcdYv6llTLuXbpnnFr6.iDC3m8am4J6rT3MZzCc_pu7ttfzJQKvU
 8q7moIaBYGirOqswGXIwLuSObo_DTQ4mqDSzo7esT5.DqHIzvXXS7_Iw6FOHYvplD9GvgNnRjdhy
 r4JRKdHN1JDKBBrplYzrQn6P7hDM88UIzWiz7Bc8fernXYcQOjRpKyJLr8Hm6Km_bMkSQKuX5jET
 ui.atkrIhNC29Ke7tvoudIpiP2ny98lFCi4i9qGuNWfpjwamvst5xMz_UYsKjSnIsMdEh42heNko
 qqTeseQwLhbCI7W4nxXdSL2q7LJU5GIKBrqAYXxyk7r39L64s7xCHHhP7pCtFwWSpSVraM.rBuQV
 YUmCblNuhMtE4ZNYxs4L5gjTomw_FzmStuSCRZKuAkqy7exJDNxO18_afcAh8VCOL4hM8mc0ERXI
 RP6rvZUfEJSfLOL1ERx1m2R7kuyzcQDb_gd3IdqQHN6jC_mCokHEAgbxekE6WtXo0UcnBYBgSEqK
 KIRZN3mVLSk28huco6K3roUNOM9tDdljS7RHJMZNVY9q1lzuuAETOQKc3TbpKBhEThjcYCsWap0k
 Za_snsvAYjxaIBh86tox8jS84.U_1qYGx7ciN_YALzphoNsM-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: acf74f57-cbbe-4bb1-b0b7-53f14ebff1c2
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Fri, 11 Oct 2024 19:58:11 +0000
Received: by hermes--production-ir2-6664f499fc-fs9vv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6ba60adc37f62cfbd8f0cfdc1b2d543e; 
 Fri, 11 Oct 2024 19:58:06 +0000 (UTC)
Message-ID: <a3e214fc-43e3-4f95-b73f-5040b733c7a5@rocketmail.com>
Date: Fri, 11 Oct 2024 21:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1728582727.git.jahau@rocketmail.com>
 <70ea852342001779956905ed9002a977d1d95293.1728582727.git.jahau@rocketmail.com>
 <1e23cfa8-66c6-476b-927c-695172e76143@quicinc.com>
Content-Language: en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <1e23cfa8-66c6-476b-927c-695172e76143@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22806
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

Hi Jessica,

On 11.10.24 19:17, Jessica Zhang wrote:
> 
> On 10/10/2024 11:31 AM, Jakob Hauser wrote:
>> The way of implementing a flip option follows the existing
>> panel-samsung-s6e8aa0.c [1][2][3].
>>
>> The value to flip the screen is taken from a downstream kernel file of
>> a similar but older panel [4]. The mipi clock [5] for the new panel
>> samsung-s6e88a0-ams427ap24 matches 461 MHz and a hardware read-out of the
>> 0xcb values corresponds to revision R01 of that older panel [6]. Although
>> for samsung-s6e88a0-ams427ap24 that's in non-flipped state while in this
>> older driver it seems to be the other way around. Further up there is a
> 
> Hi Jakob,
> 
> I'm a bit confused by the wording here. Do you mean that even though the 
> downstream driver comments state the panel is in a non-flipped state by 
> default, your observations suggest that it's actually defaulting to a 
> flipped state?
> 
> Thanks,
> 
> Jessica Zhang
> 
>> hint [7] basically saying for revision R01 to change the first word of 
>> the
>> 0xcb command from 0x06 to 0x0e, which is actually setting BIT(3) of that
>> word. This causes a horizontal flip.
>>
>> [1] 
>> https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L103
>> [2] 
>> https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L207-L211
>> [3] 
>> https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L954-L974
>> [4] 
>> https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c
>> [5] 
>> https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L2027-L2028
>> [6] 
>> https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L137-L151
>> [7] 
>> https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L66-L74

In the commit message I'm referencing another downstream driver for a 
different (similar but older) panel. The commit message is very 
summarized. I'll try to describe the situation more detailed here. Maybe 
this is going too far but I don't know how to dissolve it otherwise.

The panel AMS427AP24 of this patchset is mounted in device 
samsung-serranove "Samsung Galaxy S4 Mini Value Edition". On this device 
the picture by default is the wrong way around (flipped/mirrored). So it 
needs horizontal flip to get it right. In the downstream Android kernel 
this is done in the panel controller. Following links are just for 
reference, no need to study them in deep: "hflip" in dtsi file [a], 
reading "hflip" in mdss_dsi_panel.c [b], and then I'm fully not sure how 
it continues... processing in mdss_mdp_overlay.c [d] or in 
mdss_mdp_rotator.c [e] or in mdss_mdp_pipe.c [f].

I noticed that in another downstream panel driver used by the similar 
but older device samsung-serranolte ("Samsung Galaxy S4 Mini LTE", not 
the "ve" Value Edition) the flip is done directly in the panel driver. 
That driver is labelled "AMS427AP01" [f] but it seems to serve a couple 
of different dimensions [g] and also distinguishes between an original 
revision and a revision "r01". This driver contains a section "#if 
defined(CONFIG_FEATURE_FLIPLR)" [h]. FLIPLR means flip left-right. That 
section holds values for the 0xcb command for different sizes (different 
mipi clocks) and the two different revisions.

When reading out the default values of the 0xcb command on the newer 
device samsung-serranove ("ve" Value Edition") with panel AMS427AP24, 
they match with the values of the older driver AMS427AP01 for mipi clock 
461 MHz revision r01 [i].

However, for the newer device samsung-serranove ("ve" Value Edition") 
with panel AMS427AP24 that's the default value. Now it needs a 
horizontal flip to get the picture right. This can be achieved by 
changing the first value of 0xcb command from 0x06 to 0x0e. That's what 
I implemented in the patch as an option.

For the older device samsung-serranolte (LTE, not "ve" Value Edition) 
with panel AMS427AP01 I can't say much. That's possibly where the 
confusion comes from. In that driver for that older panel the hint on 
value 0x0e is just a comment [j] while the value 0x06 [k] is part of the 
"#if defined(CONFIG_FEATURE_FLIPLR)" section. Therefore I assume that on 
the older panel AMS427AP01 it's the other way around: value 0x0e as 
default and 0x06 as flip option.

I hope this more detailed description is comprehensible. Let me know if 
you have questions. Also feel free to suggest improvements on the commit 
message.

[a] 
https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi#L112
[b] 
https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/mdss_dsi_panel.c#L1290-L1291
[c] 
https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/mdss_mdp_overlay.c#L709-L711
[d] 
https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/mdss_mdp_rotator.c#L590-L591
[e] 
https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/mdss_mdp_pipe.c#L1309-L1310
[f] 
https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L1867
[g] 
https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L1980-L1995
[h] 
https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L65-L246
[i] 
https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L137-L151
[j] 
https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L68
[k] 
https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L139-L140

...

Kind regards,
Jakob

