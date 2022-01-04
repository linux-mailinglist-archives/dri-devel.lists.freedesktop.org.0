Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A6484F42
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C504E10E658;
	Wed,  5 Jan 2022 08:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC8310E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 17:04:55 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id o185so82785678ybo.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 09:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IcS3PPWATTCjd9rgDl75lzPA9pkaRohb033QXt048AU=;
 b=MPUA+7Mw2XPPNkGpbBQWoXNHeCYJclhzo9RHOrsZX+fNK+jfX5teehLn+DAdAtGg6s
 8LQk+MOoNBLnrnX2APEWqtfbIB2hwWJpy/wKyMWlwVZLylPRLs7LAYjDe2qUkxoYwzlc
 HSKGtk51kg7hN3wYHGKzVaD+f1+VM77swYybXDv6HS3BdvXYRUt9CzV2srKnBFap9JwV
 qeUisTF2dF4xo+lMP/DZhOl/oBzkQLkckQdTBQPV5XJko8OBWDPFXhT3k084VJmFXXFB
 lMMgF2X2PVb3/PllbcbIYb+K5214+/Ohx4JuJWuJ8hTvseCzMBDsi6GauZo/7iNYOn8D
 9nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IcS3PPWATTCjd9rgDl75lzPA9pkaRohb033QXt048AU=;
 b=QShNh9UozfEzudXlBeWBOA7wL6u+JKVHD1wTckGxlhvczy4l2MFJZNkHUtR8R/QLoy
 68wB97ZLsQytRnPy2CZxgxXAIOEaR/XNzDjQIEWGptcHPbkrqRBZEWXR0HbZO9CkxBRx
 P8WuJY0eS5tUaVNQXRHk3YvfEKNAUCIC8yuZRQemdkJSdNFJijPhbM+E8QR4y2B4IK1t
 mFShQNr87zVROwMXDvU+dMNlkkIDkSG13do66eOVfL5BuGh5PLUmbCjQFuLmQgKRR7H3
 zEWIe77JBTcYpgWnmwqFcF3TDQSkbOgoI7wKORPie/K/QaFDvX43fNb7+YE8oo3oljwq
 dlew==
X-Gm-Message-State: AOAM531Q5n50b9tvUQiA5jJGhSY0RrSKWqKO9nSENU+mQ9g0+feywuGg
 nn8h7DkMNIe5eFPweUDJrg59GmppxzJlE0dIAG2SqBfyIVNA7w==
X-Google-Smtp-Source: ABdhPJyb2yIKt9Su64itydfcDVMQ2aVqenkQam9E49RVmt3cECJt5TdERikTr8JfjK3uG6hk2ayHjUg7dffmaAnVwPs=
X-Received: by 2002:a25:c8c3:: with SMTP id y186mr63651236ybf.20.1641315894859; 
 Tue, 04 Jan 2022 09:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
 <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
 <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
 <CAECvnWLivbpHQc1Qu0NowXFhSHgQModwcwG0=zviqmGPxnjUHg@mail.gmail.com>
In-Reply-To: <CAECvnWLivbpHQc1Qu0NowXFhSHgQModwcwG0=zviqmGPxnjUHg@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 4 Jan 2022 22:34:43 +0530
Message-ID: <CAGWqDJ4WFuvhdW_UiR3xijTKWagbW_3n=SSGVJDgnoaimQqYzg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: =?UTF-8?B?SmnFmcOtIFZhbsSbaw==?= <jirivanek1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 05 Jan 2022 08:24:54 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Zheng Bin <zhengbin13@huawei.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jiri Vanek,

Could you please share the part number or datasheet of the dual-link
LVDS display used.

On Tue, Jan 4, 2022 at 7:59 PM Ji=C5=99=C3=AD Van=C4=9Bk <jirivanek1@gmail.=
com> wrote:
>
> Actually, this patch is based on testing with a real HW with dual-link LV=
DS display (full HD) and it also matches with a datasheet. Without this fix=
 it does not work at all.
>
> =C3=BAt 4. 1. 2022 v 14:51 odes=C3=ADlatel Robert Foss <robert.foss@linar=
o.org> napsal:
>>
>> Jiri: Are you able to test this patch?
>>
>> Vinay: Could you supply a R-b tag, if you feel that it is warranted?
>>
>> On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N <simhavcs@gmail.com> wrote=
:
>> >
>> > Robert,
>> > I do not have the hardware to test this feature. Sorry for the late re=
sponse.
>> >
>> > On Thu, Nov 18, 2021 at 8:20 PM Robert Foss <robert.foss@linaro.org> w=
rote:
>> >>
>> >> + Zhen & Vinay
>> >>
>> >> This patch looks good in itself, but I would like to see a tested by
>> >> tag. At the very least testing for regression in single-link LVDS but
>> >> ideally some third party verification of this patch.
>> >>
>> >> On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com> wrote=
:
>> >> >
>> >> > Fixed wrong register shift for single/dual link LVDS output.
>> >> >
>> >> > Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
>> >> > ---
>> >> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/br=
idge/tc358775.c
>> >> > index 2272adcc5b4a..1d6ec1baeff2 100644
>> >> > --- a/drivers/gpu/drm/bridge/tc358775.c
>> >> > +++ b/drivers/gpu/drm/bridge/tc358775.c
>> >> > @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32=
_t val)
>> >> >  }
>> >> >
>> >> >  #define TC358775_LVCFG_LVDLINK__MASK                         0x000=
00002
>> >> > -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
>> >> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
>> >> >  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
>> >> >  {
>> >> >         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
>> >> > --
>> >> > 2.30.2
>> >> >
>> >
>> >
>> >
>> > --
>> > regards,
>> > vinaysimha



--=20
regards,
vinaysimha
