Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2016532F66
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 19:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD6210F0D9;
	Tue, 24 May 2022 17:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE54910F0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:07:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 30B225C0048;
 Tue, 24 May 2022 13:07:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 24 May 2022 13:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1653412050; x=
 1653498450; bh=yBU13/O/dwDmfkl/Fn0N6p1Wyp+RzcYRjeN8hm6Con0=; b=j
 3+5jMQdMhy3SoPicB3G4ObLm9CF7hTMokMZy/h9Wcvr+Qocodk2qgwNS/6qm0tlS
 d4oWyjRzRNJ1TXfS6XModGbhxMtBRwOj7pknswA9ygYNcitHTlu8oijhrRlsIHdy
 AWYKuy9clGhqxZDNEMUVkuHcAjliuHdnVaPoqBSD3St2a8ksDTBI0eMLwOEWqRs4
 /4YK1B1N1anaI9Rl0gRN1j/mpndFJe1CKkZDQZNQT052RtlmWurkmefrz4kuKzoV
 Uy2DsHYeKasziVwEuLhd3SkJPhaxdYLRYM1j/iqu5psuJVRhAs0FK1HfdEFWPcrr
 8IgWCAfM48aj+DuyIBgLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653412050; x=
 1653498450; bh=yBU13/O/dwDmfkl/Fn0N6p1Wyp+RzcYRjeN8hm6Con0=; b=A
 ozhPIevaUkOE7sgsKJwymeFAyWHh9FYLIcI81EWRgbR1Ecgt+IQR9xjH0hTHiV6i
 p7KOK0tUUp4SFlgF1Pu8sLWvypPmaBFN5h4gU4ZO2Kz7KiZY7A3rZrKz5Or+gw0c
 aPuk2sF3ClVgpO1NkJ3S/bbBBcFcj0IvGEKAxLfNuacMuiX+KrACIs6QlAxpJunb
 WH3W1A3JjmcfcoF6+ZB8MHGrsSXCT/SfA6nLnK8zj46LcQJ6eYwe/jpTyu4OzThQ
 gr60WD6H/hlAA+E9zJd2913Z42rGS62QaCbHlXFo0HAAGwMlMGaEY9kCjhPp6Q7Y
 i41WUKjlCtvvSkei4ke9g==
X-ME-Sender: <xms:0BCNYsFaunY88350akg8pBVVceL2FDyRNMHaJ76SYFHLpyft5GeVqA>
 <xme:0BCNYlUmxEpS0_ORXKl_v0tnESFKFBtalbaSsfnPFOcjULUHTPVcAo0eF6GlQGdNT
 BEUmmVfIb4_fDEeAg>
X-ME-Received: <xmr:0BCNYmIIsROyy4sg485DDk-XfIzWcf8W-5qMRu5c03SDQ_u53CDt-_bVE6fTJbez_qZSBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeefgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedtvddvudelveeuleegveduiefggeegheffgefhjeduhfeigfei
 vedthfduleegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
 rghnugdrohhrgh
X-ME-Proxy: <xmx:0BCNYuEJJGtoH9hs30FOSgsMjMsWetOfEyoaqw8w01gcUc0NqLVVPA>
 <xmx:0BCNYiUf6HTVMwaDX5o-GPEViQT5NHskm9cT5wp1yMdpW4fueMdtlg>
 <xmx:0BCNYhMd05_tDcRZGWoxEHZ4UqC9-So5cORyi9LelsdzeHveRDSAAw>
 <xmx:0hCNYuRkQ3MDcnuYaa6d5hIH8UBD8LWh9qQaGI8mUcucluDAXu8gFQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 13:07:27 -0400 (EDT)
Subject: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
To: Icenowy Zheng <icenowy@aosc.io>, =?UTF-8?Q?Jernej_=c5=a0krabec?=
 <jernej.skrabec@gmail.com>, mripard@kernel.org, wens@csie.org,
 Genfu Pan <benlypan@gmail.com>
References: <20220521133443.1114749-1-benlypan@gmail.com>
 <3173956.44csPzL39Z@jernej-laptop>
 <70b43ac2910ce9b3e3776d31eda7a791fbae5454.camel@aosc.io>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <86a208c1-9277-32de-3f8f-8976eab15524@sholland.org>
Date: Tue, 24 May 2022 12:07:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <70b43ac2910ce9b3e3776d31eda7a791fbae5454.camel@aosc.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/23/22 8:14 AM, Icenowy Zheng wrote:
> 在 2022-05-22星期日的 10:36 +0200，Jernej Škrabec写道：
>> Hi!
>>
>> Dne sobota, 21. maj 2022 ob 15:34:43 CEST je Genfu Pan napisal(a):
>>> Accrording the SDK from Allwinner, the scanline value of yuv and
>>> rgb for
>>> V3s are both 1024.
>>
>> s/scanline value/scanline length/
>>
>> Which SDK? All SDKs that I have or found on internet don't mention
>> YUV nor RGB 
>> scanline limit. That doesn't mean there is none, I'm just unable to
>> verify 
>> your claim. Did you test this by yourself? Also, please make YUV
>> scanline 
>> change separate patch with fixes tag.
> 
> BTW I think chip manuals all say that the chip supports NxN resolution
> in DE2 chapter, e.g. the V3 datasheet says DE2 "Output size up to
> 1024x1024".
> 
> However there's no information about D1's second mixer.

My information comes from the BSP driver[0]:

static const int sun8iw20_de_scale_line_buffer[] = {
        /* DISP0 */
        2048,
        /* DISP1 */
        1024,
};

It looks like the value returned from de_feat_get_scale_linebuf() may be used
for RGB as well, if scaling is enabled. This appears to be the "format == 3"
case in de_rtmx_get_coarse_fac[1]. On the other hand, the code for V3 has
specific code for the RGB limit[2].

Is there some test I can do on D1 to see what the right value for RGB is?

Regards,
Samuel

[0]:
https://github.com/Tina-Linux/tina-d1x-linux-5.4/blob/master/drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_feat.c#L182
[1]:
https://github.com/Tina-Linux/tina-d1x-linux-5.4/blob/master/drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_rtmx.c#L1588
[2]:
https://github.com/Tina-Linux/tina-d1x-linux-5.4/blob/master/drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_rtmx.c#L1211

>>> The is also the same for mixer 1 of D1. Currently the
>>> scanline value of rgb is hardcoded to 2048 for all SOCs.
>>>
>>> Change the scanline_yuv property of V3s to 1024. > Add the
>>> scanline_rgb
>>> property to the mixer config and replace the hardcoded value with
>>> it before
>>> scaling.
>>
>> I guess RGB scanline patch would also need fixes tag, since it fixes
>> existing 
>> bug.
>>
>>>
>>> Signed-off-by: Genfu Pan <benlypan@gmail.com>
>>> ---
>>>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 13 ++++++++++++-
>>>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 +
>>>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  3 +--
>>>  3 files changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>>> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index 875a1156c..e64e08207
>>> 100644
>>> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>>> @@ -567,6 +567,7 @@ static const struct sun8i_mixer_cfg
>>> sun8i_a83t_mixer0_cfg = { .ccsc         = CCSC_MIXER0_LAYOUT,
>>>         .scaler_mask    = 0xf,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 3,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -575,6 +576,7 @@ static const struct sun8i_mixer_cfg
>>> sun8i_a83t_mixer1_cfg = { .ccsc         = CCSC_MIXER1_LAYOUT,
>>>         .scaler_mask    = 0x3,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 1,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -584,6 +586,7 @@ static const struct sun8i_mixer_cfg
>>> sun8i_h3_mixer0_cfg
>>> = { .mod_rate   = 432000000,
>>>         .scaler_mask    = 0xf,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 3,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -593,6 +596,7 @@ static const struct sun8i_mixer_cfg
>>> sun8i_r40_mixer0_cfg
>>> = { .mod_rate   = 297000000,
>>>         .scaler_mask    = 0xf,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 3,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -602,6 +606,7 @@ static const struct sun8i_mixer_cfg
>>> sun8i_r40_mixer1_cfg
>>> = { .mod_rate   = 297000000,
>>>         .scaler_mask    = 0x3,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 1,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -610,7 +615,8 @@ static const struct sun8i_mixer_cfg
>>> sun8i_v3s_mixer_cfg
>>> = { .vi_num = 2,
>>>         .ui_num = 1,
>>>         .scaler_mask = 0x3,
>>> -       .scanline_yuv = 2048,
>>> +       .scanline_yuv = 1024,
>>> +       .scanline_rgb = 1024,
>>>         .ccsc = CCSC_MIXER0_LAYOUT,
>>>         .mod_rate = 150000000,
>>>  };
>>> @@ -620,6 +626,7 @@ static const struct sun8i_mixer_cfg
>>> sun20i_d1_mixer0_cfg
>>> = { .mod_rate   = 297000000,
>>>         .scaler_mask    = 0x3,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 1,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -629,6 +636,7 @@ static const struct sun8i_mixer_cfg
>>> sun20i_d1_mixer1_cfg
>>> = { .mod_rate   = 297000000,
>>>         .scaler_mask    = 0x1,
>>>         .scanline_yuv   = 1024,
>>> +       .scanline_rgb   = 1024,
>>>         .ui_num         = 0,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -638,6 +646,7 @@ static const struct sun8i_mixer_cfg
>>> sun50i_a64_mixer0_cfg = { .mod_rate     = 297000000,
>>>         .scaler_mask    = 0xf,
>>>         .scanline_yuv   = 4096,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 3,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -647,6 +656,7 @@ static const struct sun8i_mixer_cfg
>>> sun50i_a64_mixer1_cfg = { .mod_rate     = 297000000,
>>>         .scaler_mask    = 0x3,
>>>         .scanline_yuv   = 2048,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 1,
>>>         .vi_num         = 1,
>>>  };
>>> @@ -657,6 +667,7 @@ static const struct sun8i_mixer_cfg
>>> sun50i_h6_mixer0_cfg
>>> = { .mod_rate   = 600000000,
>>>         .scaler_mask    = 0xf,
>>>         .scanline_yuv   = 4096,
>>> +       .scanline_rgb   = 2048,
>>>         .ui_num         = 3,
>>>         .vi_num         = 1,
>>>  };
>>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
>>> b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 85c94884f..c01b3e9d6
>>> 100644
>>> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
>>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
>>> @@ -172,6 +172,7 @@ struct sun8i_mixer_cfg {
>>>         unsigned long   mod_rate;
>>>         unsigned int    is_de3 : 1;
>>>         unsigned int    scanline_yuv;
>>> +       unsigned int    scanline_rgb;
>>
>> This quirk needs to be documented above in the comment.
>>
>> Best regards,
>> Jernej
>>
>>>  };
>>>
>>>  struct sun8i_mixer {
>>> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
>>> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index f7d0b082d..30e6bde92
>>> 100644
>>> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
>>> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
>>> @@ -188,8 +188,7 @@ static int sun8i_vi_layer_update_coord(struct
>>> sun8i_mixer *mixer, int channel, src_h = vn;
>>>                 }
>>>
>>> -               /* it seems that every RGB scaler has buffer for
>>> 2048 
>> pixels */
>>> -               scanline = subsampled ? mixer->cfg->scanline_yuv : 
>> 2048;
>>> +               scanline = subsampled ? mixer->cfg->scanline_yuv :
>>> mixer->cfg->scanline_rgb;
>>>
>>>                 if (src_w > scanline) {
>>>                         DRM_DEBUG_DRIVER("Using horizontal coarse 
>> scaling\n");
>>
>>
>>
>>
>>
> 
> 

