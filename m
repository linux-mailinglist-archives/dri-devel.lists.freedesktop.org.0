Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69712484F46
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19F10E73C;
	Wed,  5 Jan 2022 08:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823D610E466
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 16:56:15 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id e202so67089934ybf.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 08:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EuUzzCM3nnuYuvtfO1tfNIRyalOFRtKhum93Q0q5wBc=;
 b=UBTRkNLJxtIMDJ6OLdFOIEqb/ecIxV6S0BQzJY53jQvxxPcUz7XAm6UD7zAHZObT9Y
 N2FzhP/NXSo9UTVBOJmehckUybL9rwBWmkUHRhz4umyFSac1qQIQ8zt1ooii4wEqMcD6
 OKZtXEnNBr7oU/4NefOvzFJhV2ezSJDVO5nbLUnGdBv9MpSZbxLPki/0dd8HKntyI5jT
 aT7vfbUmzG8rZmnxnbhYyvKdNfGQziumZBy6jjoi+dc2QHI4FSB2Rt/6JMJomApsxspC
 wTLOwabrDOHfXWPfC4xYSPCdbHwrcBO50HfUMZJejc+tc6nWycD/jCJ4QbdIBrkU1dYn
 7Stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EuUzzCM3nnuYuvtfO1tfNIRyalOFRtKhum93Q0q5wBc=;
 b=TUt7ESSTSUmuHxqE3Qm8mRTh+ok7blbowUbQgWLv1+vFmAxpDCzP4SEH7l8U9svHvn
 WCUdwzCe6reQis3hJbbMIC5SjtfUpB753cnIEm5aFjf2ructQJQe3Xp1a7RB1UMdn9Zd
 wmMC/Ve5Y2N03ebNt6e+U40WBxCWn+J9XGUkGv3g0z87CSiO0futpmK091GpD8ynLUrQ
 h7jbZHSPb7utDnBA8mBdgmsDWNVIV4APbly4CcNCm9TI7jXnxhSd5loyZFRITRwfd15x
 1NhNpTHGS+X3tQI9uy9/GUKT9gOWXR/EZQWrecekv/XhC8Qd8vR0gEh6tPSLAS7nOKQA
 tuGg==
X-Gm-Message-State: AOAM532QzWW9JFxWG4YxtUc44D64hpmjws9IUS1VoK3KWMY1/072I2u/
 4QwQ0nXMIb7PFKVpw5G/8Ca2LLMgWoJwclcwY4xTbV1ilfz9jA==
X-Google-Smtp-Source: ABdhPJzMV/dD3wcr+hjr0asqo1Y9ZhOjb8gtKwkA9wUaT5tf5LYB8SZmWc41tAqREEWoe2XAx4L16ghFmRxejGnT7Ng=
X-Received: by 2002:a25:880d:: with SMTP id c13mr65300907ybl.720.1641315374501; 
 Tue, 04 Jan 2022 08:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
 <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
 <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
In-Reply-To: <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 4 Jan 2022 22:26:03 +0530
Message-ID: <CAGWqDJ6eUqm+NiA5dAR_GNGtjjBiYQom3gyGn49i1PhwxfVGvg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jiri Vanek <jirivanek1@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Zheng Bin <zhengbin13@huawei.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Robert,
What is R-b tag?


On Tue, Jan 4, 2022 at 7:21 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Jiri: Are you able to test this patch?
>
> Vinay: Could you supply a R-b tag, if you feel that it is warranted?
>
> On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N <simhavcs@gmail.com> wrote:
> >
> > Robert,
> > I do not have the hardware to test this feature. Sorry for the late response.
> >
> > On Thu, Nov 18, 2021 at 8:20 PM Robert Foss <robert.foss@linaro.org> wrote:
> >>
> >> + Zhen & Vinay
> >>
> >> This patch looks good in itself, but I would like to see a tested by
> >> tag. At the very least testing for regression in single-link LVDS but
> >> ideally some third party verification of this patch.
> >>
> >> On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com> wrote:
> >> >
> >> > Fixed wrong register shift for single/dual link LVDS output.
> >> >
> >> > Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> >> > index 2272adcc5b4a..1d6ec1baeff2 100644
> >> > --- a/drivers/gpu/drm/bridge/tc358775.c
> >> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> >> > @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
> >> >  }
> >> >
> >> >  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
> >> > -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> >> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
> >> >  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> >> >  {
> >> >         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> >> > --
> >> > 2.30.2
> >> >
> >
> >
> >
> > --
> > regards,
> > vinaysimha



-- 
regards,
vinaysimha
