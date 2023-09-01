Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822BB7903C6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 00:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C4F10E202;
	Fri,  1 Sep 2023 22:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842EF10E202
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 22:51:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so42279391fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 15:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693608685; x=1694213485;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+imYCqEpQGQYJF9z3Zred9fi662pg+dZPyYtyzKuds0=;
 b=cz7gO1S9t0q2K16WS3UI4x4yE5lnSSHlg0YjDbDJm5lKu873wToCG1UPSWcwLdEfhl
 qMQRA+SUIXsMNEXH0YfgHu5bIqwkW3E5ek6WAQj8Z5AoL/ghUeVjZ6fZZJJy98KdBl1F
 DKQBIZPA5q5ZNhcCAw1Arqzf1vJ0FcQGEqXuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693608685; x=1694213485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+imYCqEpQGQYJF9z3Zred9fi662pg+dZPyYtyzKuds0=;
 b=Rh9AUsihqzSeMVck/uZ1rjjL4bZdm79n4FUyEHeIWI3AtxCEF0DLY2au6yMU5J7US0
 Y6SDRiWoOt0Wc9c1BFy29nqothcUa5gOobKJbxekUahm+iTO1d4DcqtsdSX67hOnIOCy
 WPcKIPjJNtFGhYb0J/b322a5iejCZTh5PDmsEs7/Os060klNz2Yqn+Ei5m16UNNcB8js
 EUWzqzUCf/jvX+/S1WvXdJrNbC1zD7Xd3WuFJ1lhONMl32BagS72niIwQKgYwnxfbI/8
 bS/t4spOMyvr27oqjiJ0AKRudOrOxvDVJHtCsI5b79BAVaIwSbW+5ZSn4HeJkPoVfR9b
 3wOw==
X-Gm-Message-State: AOJu0YzXk8iG92KrYNktpBb1977rl0SKxImBGO0kiooil9niVuaq3tTc
 fGseln8/1HLcZSNn5Nb2+mANL8kqdC34SuRTpbGUDg==
X-Google-Smtp-Source: AGHT+IHZVhh8nONbxjFRGwOWOC8nTFjU/wJw+509miskR/7gNkjplZe4JmTrOVGQvlIAusGXspz4Wz+/dzdPRb+onfo=
X-Received: by 2002:a2e:701a:0:b0:2bc:d5f1:b9cf with SMTP id
 l26-20020a2e701a000000b002bcd5f1b9cfmr2606495ljc.27.1693608685358; Fri, 01
 Sep 2023 15:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230824205335.500163-1-gildekel@chromium.org>
 <20230824205335.500163-2-gildekel@chromium.org> <ZPI0BX6KyIIKMaKP@intel.com>
In-Reply-To: <ZPI0BX6KyIIKMaKP@intel.com>
From: Gil Dekel <gildekel@chromium.org>
Date: Fri, 1 Sep 2023 18:51:14 -0400
Message-ID: <CAOD+-Q42-LwUb1X8z_TP2=Q+zpbg7O0x4r5RXShQaCaLcsajgw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 1/6] drm/i915/dp_link_training: Add a final
 failing state to link training fallback
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 1, 2023 at 2:57=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
>
> On Thu, Aug 24, 2023 at 04:50:16PM -0400, Gil Dekel wrote:
> > Instead of silently giving up when all link-training fallback values ar=
e
> > exhausted, this patch modifies the fallback's failure branch to reduces
> > both max_link_lane_count and max_link_rate to zero (0) and continues to
> > emit uevents until userspace stops attempting to modeset.
> >
> > By doing so, we ensure the failing connector, which is in
> > link-status=3DBad, has all its modes pruned (due to effectively having =
a
> > bandwidth of 0Gbps).
> >
> > It is then the userspace's responsibility to ignore connectors with no
> > modes, even if they are marked as connected.
> >
> > Signed-off-by: Gil Dekel <gildekel@chromium.org>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 7067ee3a4bd3..2152ddbab557 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -276,8 +276,12 @@ static int intel_dp_common_len_rate_limit(const st=
ruct intel_dp *intel_dp,
> >
> >  static int intel_dp_common_rate(struct intel_dp *intel_dp, int index)
> >  {
> > +     /* This occurs when max link rate drops to 0 via link training fa=
llback*/
> > +     if (index < 0)
> > +             return 0;
>
> I'm not comfortable with handling negative input as normal here
> and no warning or msg.
> Maybe I'm missing the cases in which this will get to negative and
> it would be acceptable? In this case probably better to improve the
> commit message.
>
If we set the max_link_rate to 0, as I am suggesting in this approach,
it will eventually reach:
int intel_dp_rate_limit_len(intel_dp_rate_limit_len(const int *rates,
int len, int max_rate)

and since max_rate is =3D=3D 0, the returned value will be 0.

The common use case of
int intel_dp_common_rate(struct intel_dp *intel_dp, int index) is:
intel_dp_common_rate(intel_dp, len - 1);

where len is the position of the last link rate value that was attempted
in the connector's array of bit rates.

When len =3D=3D 0, you hit the case where the index becomes -1, which
indicates we ran out of possible bitrates in:
intel_dp->num_common_rates
so we return the bit rate 0Gbps for all invalid cases (index < 0).

If this is acceptable, I'll gladly add some details to the commit
message.

An alternative approach is to introduce 0 link rate at the front of:
intel_dp->num_common_rates, which will ensure all connectors
have 0 as a last option, and then we can use the normal fallback
code path with no special cases here.

I hope this makes sense...
> > +
> >       if (drm_WARN_ON(&dp_to_i915(intel_dp)->drm,
> > -                     index < 0 || index >=3D intel_dp->num_common_rate=
s))
> > +                     index >=3D intel_dp->num_common_rates))
> >               return 162000;
> >
> >       return intel_dp->common_rates[index];
> > @@ -318,6 +322,9 @@ static int intel_dp_max_common_lane_count(struct in=
tel_dp *intel_dp)
> >  int intel_dp_max_lane_count(struct intel_dp *intel_dp)
> >  {
> >       switch (intel_dp->max_link_lane_count) {
> > +     /* This occurs when max link lane count drops to 0 via link train=
ing fallback*/
> > +     case 0:
> > +             return 0;
> >       case 1:
> >       case 2:
> >       case 4:
> > @@ -672,7 +679,14 @@ int intel_dp_get_link_train_fallback_values(struct=
 intel_dp *intel_dp,
> >               intel_dp->max_link_lane_count =3D lane_count >> 1;
> >       } else {
> >               drm_err(&i915->drm, "Link Training Unsuccessful\n");
> > -             return -1;
> > +             /*
> > +              * Ensure all of the connector's modes are pruned in the =
next
> > +              * probe by effectively reducing its bandwidth to 0 so us=
erspace
> > +              * can ignore it within the next modeset attempt.
> > +              */
> > +             intel_dp->max_link_rate =3D 0;
> > +             intel_dp->max_link_lane_count =3D 0;
> > +             return 0;
> >       }
> >
> >       return 0;
> > --
> > Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

Thanks for your reviews and comments!

--
Best,
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
