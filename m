Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC6484383
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CA10E2D4;
	Tue,  4 Jan 2022 14:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B097110E2D4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:37:08 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id w24so27213618ply.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ba6Ub/A0lPMMoXtyIIeuHTcGAbNHFYM2vP9dl7sGMEk=;
 b=ygG8Aq1rlaIlTiXCrdFc26v2RvT9Nl7oTAfZ0AZzanbdGWM6Un5f6uG/bJSGn6baUj
 9A6DenkOZ20KRO615Bo3godzyIGVMHGpxb9VbR9mYEujNgaQKUcN/7MWkDnPwNCmvmzH
 5ogH1Wvi1mn18g+CLoIV2FVyWYvVouywDtTM9mxmzqWSYFFuaA+f5gOgdynbfjRZ0XYx
 ENrYMJmjDn9eBZYkLxUmwGZ2JL+xXuMZyIom/JYHTEwEhKItZn9+Z3U48BsexdBETxk9
 Eu9Xvtp48VMZyFhLHiBl6LWT3bHTmHz8LdNPgU2j3EjmJCb0oAHWWuo0jkprLbvP7Z3/
 eOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ba6Ub/A0lPMMoXtyIIeuHTcGAbNHFYM2vP9dl7sGMEk=;
 b=ac3eg65SVbHePoho9OvI+pxEqWWpfEeOErXxFve0l7r3tdVTPi+LSNAPvnt5dXsvda
 D+I5HZAKxO72dzJndn2PFv3oaVr8dQICVMAFR6DbLmyIRIGWOTRv0NLyxT3/3jqP7PsH
 s+fe7uY2M2lLiPFHA71icqCZvTchn0zT5BKnCMSXFhy1z3bq5EvRPbabyjaXjJEtWHwN
 2MA2ZtE0KEbvc11i7OheEy34fhVvO4iwFmwORmQTiWj4LNZVetA/Amsibmc6i2rL4h1p
 fG0VSK9q+JeTUZoIjXrxCu0JK3CLdFao+/zRjepH0QO0cvkV/VQDcDqNeyVJeTTFrXeB
 YVew==
X-Gm-Message-State: AOAM533JtZ/25vRgdVJTbC/Oa0hwVQ7ogaiGKQ+qs7YEEnV15Dm410gz
 QpWi+QABUTwZG7B7kn2hhRx/BuKJAtHgzT7sGhvR8A==
X-Google-Smtp-Source: ABdhPJyxXpQ3SZaGckeNU85xnpDX3fWx3PiYQSh7DZvnd63LlPMNHQ9hKgz5OQgH6t6bwXvXkxZa/kmsDLJs+hz+Kz4=
X-Received: by 2002:a17:90a:a6d:: with SMTP id
 o100mr61866726pjo.179.1641307028333; 
 Tue, 04 Jan 2022 06:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
 <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
 <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
 <CAECvnWLivbpHQc1Qu0NowXFhSHgQModwcwG0=zviqmGPxnjUHg@mail.gmail.com>
In-Reply-To: <CAECvnWLivbpHQc1Qu0NowXFhSHgQModwcwG0=zviqmGPxnjUHg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 15:36:57 +0100
Message-ID: <CAG3jFytx_vzwcLKa8p4RE5dbyjBe7NwMz5ECYwNF2utD7LDBLA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: =?UTF-8?B?SmnFmcOtIFZhbsSbaw==?= <jirivanek1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Zheng Bin <zhengbin13@huawei.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Excellent.

Jiri, can you add your Tested-by tag to this patch?

On Tue, 4 Jan 2022 at 15:29, Ji=C5=99=C3=AD Van=C4=9Bk <jirivanek1@gmail.co=
m> wrote:
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
