Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 349814842C6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E98010E281;
	Tue,  4 Jan 2022 13:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1710E281
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:51:09 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so3230187pjp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pl4XAHEQ/8O2Ge142ei3ws2XQwiYzzkkZ4WgI00Q9A4=;
 b=jlYmyfhRBHeHp6eVn6FUzPaLbZ9Xp5/dsF8cd+jeZTgGUF7zk5bWqLqeDyeSqciDPi
 DTMbVXTClm52Cyxapjym+leYK70NB5kb5nc1waQf8KNHrdRsS2P9ATMPoarbzHFlR2Ba
 a0Zd9jlDypWm176VENklhdkJ+G96ilc7MKe/8/ZQFDBIAGafHJBuM/zvQVn9blvw55hR
 7oTBfA4VHlak50Ntn6rO2Xipn8yADehXm+Ydbyt/CvxAjTK/ZiqIFbRbPjHodMtd2jLQ
 YNSf0WfaYNAs8j10/ouO9NV1pG5JCeFPiiqV2u5jNrnj8GRTKDDNFEMeLxqFjMNxZeRE
 FI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pl4XAHEQ/8O2Ge142ei3ws2XQwiYzzkkZ4WgI00Q9A4=;
 b=06Mng1p9KJ2aZIr84q0jJNWuyHtB5c4GuvUp2Efi6ar5wqmcAaAJpTl2d5GWz8LSzH
 FLUi0/a4+58dmboSX/sXEyhLBlLm6x7Pc6fvCekJHx9n8TGmGj3hUasoqINI+mZKZsPE
 UlED5c2e+Drzc19OTLxJkg4CWSMxbk/kJhysvdS8Wb7TAXvXyB7SMPNaw6lXdRMzi7Dg
 XChtBBWAZuiOsKgcVGfX4uTQkdmZ+dqhiAV20G6nQfDN/J8rjgXW6rdVY1yDyh3iuAct
 UcPc40MLfSz8ncNHDffxgZ102eHkXi9kgHQDPcR32eJRfL9OMw9sBgHiUxzdMt7XkFnu
 GgHQ==
X-Gm-Message-State: AOAM532NVADbdfrh8fCj+UkiweZaC5LsldyNdSgda7E4Klae1JwS9WlD
 RStfyYYprT3qibbBxDwvdGXAru/I0lE/wRmKvihAxQ==
X-Google-Smtp-Source: ABdhPJyRNJLYqv9dxj24ku2jZwDQnxxy2JHRkOhHG8QLRhakAedD18kPErE+JMSrY6BI5h8aYq6g9Nc+mhfZNJrfa9k=
X-Received: by 2002:a17:90a:a6d:: with SMTP id
 o100mr61646660pjo.179.1641304268801; 
 Tue, 04 Jan 2022 05:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
 <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
In-Reply-To: <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:50:57 +0100
Message-ID: <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: Vinay Simha B N <simhavcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Jiri: Are you able to test this patch?

Vinay: Could you supply a R-b tag, if you feel that it is warranted?

On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> Robert,
> I do not have the hardware to test this feature. Sorry for the late response.
>
> On Thu, Nov 18, 2021 at 8:20 PM Robert Foss <robert.foss@linaro.org> wrote:
>>
>> + Zhen & Vinay
>>
>> This patch looks good in itself, but I would like to see a tested by
>> tag. At the very least testing for regression in single-link LVDS but
>> ideally some third party verification of this patch.
>>
>> On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com> wrote:
>> >
>> > Fixed wrong register shift for single/dual link LVDS output.
>> >
>> > Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
>> > ---
>> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
>> > index 2272adcc5b4a..1d6ec1baeff2 100644
>> > --- a/drivers/gpu/drm/bridge/tc358775.c
>> > +++ b/drivers/gpu/drm/bridge/tc358775.c
>> > @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
>> >  }
>> >
>> >  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
>> > -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
>> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
>> >  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
>> >  {
>> >         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
>> > --
>> > 2.30.2
>> >
>
>
>
> --
> regards,
> vinaysimha
