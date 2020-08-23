Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A524F2D2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7856EC6D;
	Mon, 24 Aug 2020 06:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8621E6E029
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 16:43:20 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id 4so6297500ion.13
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72AGIyZ7/chrx66NON3xoDnq09zkWUqUGGzNHoZVAyo=;
 b=tpiYIcuK5fYZPl3R0jfV567+ZZwhWr0FSMVdo1+AVUdoyUmir0NcpghkWjorKhX+JS
 q1T/rA6tQd1gqvkjOoc4pZR9sCBkTCeYrfoxFjiRipYr3Gbdqj+MlL52PFaEqXGsACb8
 nZiCVXUTy5Bc+y44qidgcV2gaer3fUL43d95Tv4a57nqaO/SoLPLvRpFoP+WeP0oTJnk
 xDJn2ZwyVyPQ8HzphmX3PPntC1gzdvqkB9m2tgh6gF8s9Srh+Dfypa+183SYJF8rDvJa
 SFfJpu6A7iyxlPJ0xOpXBFT9oYGm0GO81prDMw3YfOc82KoGtvrSxIRXR7lUeT6aFO3y
 ulTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72AGIyZ7/chrx66NON3xoDnq09zkWUqUGGzNHoZVAyo=;
 b=Pu+jgfpwUNXxkzIH+wMlTp8fDpt3As0ROYfhTJs41AZtuLPib2Ldz7nPCHP1U0LzAT
 Xjq2APssrMBiVjDjpuh+thqCtxNPQY3gUl1hV9DXwD9t6NdVGMyuP5hECKgxIrCzJ7y7
 WQy9jIBtRkLIhXtlQDjMhm8TapjIERH2BgL0Z+eUUw+NxynMiLKDUJHb1/VT+BbNYiLz
 QUrKg1D5kjc2YjzcvTgwsJBqEvROv4+cuhH4qDwqAsbXAYRypeKxgkGuLJJ4g58GFyhQ
 9TE7hFXx+5j3tpqG4dtXS2SIEzaWurEAo6hn+1AyG12cEj4NCRADbsSl9U1wbhQJFRmv
 9lyg==
X-Gm-Message-State: AOAM530tTVNjUnDQq0rkd9fWeNcw24tQG6n2bZ7uat+qZbZW/LIY83al
 9gyStpiD82l2pAMW/U2gZimQ2UgJXqKbnkqeONY=
X-Google-Smtp-Source: ABdhPJw9XW73Ks1Mk+SxJLl501UzmDyDGidOcFbVjWrKBsIzfALOsE7OQnp6iM6Z8bQvSq5pqlDi2W3eZtL4fNGsHtc=
X-Received: by 2002:a5e:8e0c:: with SMTP id a12mr1583460ion.147.1598200999791; 
 Sun, 23 Aug 2020 09:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <1597557042-5154-1-git-send-email-simhavcs@gmail.com>
 <20200823150522.GA1047718@ravnborg.org>
In-Reply-To: <20200823150522.GA1047718@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Sun, 23 Aug 2020 22:13:07 +0530
Message-ID: <CAGWqDJ4-iBRmdDAdHj+0dwpMiXdW=p_SDySjdeU6PR7VOuGs_g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for PTR_ERR
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Sam.

On Sun, Aug 23, 2020 at 8:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sun, Aug 16, 2020 at 11:20:41AM +0530, Vinay Simha BN wrote:
> > passing zero to 'PTR_ERR'
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>
> Applied to drm-misc-next - thanks.
>
>         Sam
>
> > ---
> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> > index 7da15cd..d951cdc 100644
> > --- a/drivers/gpu/drm/bridge/tc358775.c
> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > @@ -684,7 +684,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >
> >       tc->vdd = devm_regulator_get(dev, "vdd-supply");
> >       if (IS_ERR(tc->vdd)) {
> > -             ret = PTR_ERR(tc->vddio);
> > +             ret = PTR_ERR(tc->vdd);
> >               dev_err(dev, "vdd-supply not found\n");
> >               return ret;
> >       }
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
