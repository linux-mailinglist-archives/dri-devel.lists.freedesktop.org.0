Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2613BAEC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC356E897;
	Wed, 15 Jan 2020 08:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAFB6E462
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 20:21:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e10so13188494edv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 12:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTYOdAjqpPQyd/dKUd7t4m1y6m6buUvTbOTtmO8r2xg=;
 b=uPnlPYExpuZKHXBq0k1aDFQypwDgNSHN+5V84q3ieCd874DrCu8HeEwMpj5bzRFH+P
 F1QXEi8rne5kzXiaawvx7TbGhZwwQR+x3dVDWFlXR/Sc1lLsa8eIVcEv+YyC2/NwDMIy
 pJvXxofQ1Xj7CuoHioC8CVqOX+C6PwyQK43bhK2g/wxMUW9PeRKGwvVBGi1yRgOJx1EH
 3SoHWKXB2QHnuzpGffvxygQR1x1L9Id36rfosShZB3jm6tCQR3W8Pky/sS2jaRWP4FgF
 Zhx9TOCGmzN4LHksxWRKSzE91ZH8b6LOCoqNMjE1VBfHBLCVNWqVZkP5b85iiKkTGoQe
 vcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTYOdAjqpPQyd/dKUd7t4m1y6m6buUvTbOTtmO8r2xg=;
 b=eFXrQ3lz5Yr3NuJcamtkdNAOhSy1R+8QCkgAeTu+Bgd6f/Tez3NtDNMFbatnB59NTr
 iGmAirYLW4FM8GbgNF+BaIffdtwmoQQ3SK5YsRfvMNckcvVooNt42ZJJPY4cLSucX7ce
 80B0xBpNUoB2yWmCBsHCOjyaT+6Wrvl2b0qmV5famnhiIcomCUJQzxAHklEXbnkjoTUW
 tcp+ugIJrOTDsEbF3DcKu85dxmJhArh3fJZQbBl9caNkvqIBJ0SfJj3OVcFrGvQfC4LU
 B1Zu8Zs+zsED9+w93qZi+HuCXkhhFmKi7XzZISIm8+YBzEMNZFlrlCRXPuQbocI6g1xX
 XKTw==
X-Gm-Message-State: APjAAAUEcv059uDTqbvcgSQUUH2cv01hGO1KZgqVUBS0p+00JbFGpOZc
 2Lru63t7xPcqqp4jVSdCEA/Sb5mRQcH+lf4A9qM=
X-Google-Smtp-Source: APXvYqwUGwwmpnBLO0b5hpgDEXjku/e8Ri4iad2bNMoLATaQhP7Vu24eJWlvCK7tUZvc70ovkb7JVC8NryjWKrbam2A=
X-Received: by 2002:aa7:d94d:: with SMTP id l13mr23832761eds.328.1579033295846; 
 Tue, 14 Jan 2020 12:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
 <2ceffe46-57a8-79a8-2c41-d04b227d3792@arm.com>
 <CAFBinCD7o-q-i66zZhOro1DanKAfG-8obQtzxxD==xOwsy_d6A@mail.gmail.com>
 <21d0730b-8299-8bfd-4321-746ccb3772d0@arm.com>
In-Reply-To: <21d0730b-8299-8bfd-4321-746ccb3772d0@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Jan 2020 21:21:24 +0100
Message-ID: <CAFBinCC4LttRsWDpMDEsYFa-ccRcErOuhpwa41O54f9Cmn4v0A@mail.gmail.com>
Subject: Re: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator
 for control again
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com, alyssa@rosenzweig.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On Mon, Jan 13, 2020 at 6:10 PM Steven Price <steven.price@arm.com> wrote:
>
> On 09/01/2020 17:27, Martin Blumenstingl wrote:
> > On Thu, Jan 9, 2020 at 12:31 PM Steven Price <steven.price@arm.com> wrote:
> >>
> >> On 07/01/2020 23:06, Martin Blumenstingl wrote:
> >>> dev_pm_opp_set_rate() needs a reference to the regulator which should be
> >>> updated when updating the GPU frequency. The name of the regulator has
> >>> to be passed at initialization-time using dev_pm_opp_set_regulators().
> >>> Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
> >>> will update the GPU regulator when updating the frequency (just like
> >>> we did this manually before when we open-coded dev_pm_opp_set_rate()).
> >>
> >> This patch causes a warning from debugfs on my firefly (RK3288) board:
> >>
> >> debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
> >> present!
> >>
> >> So it looks like the regulator is being added twice - but I haven't
> >> investigated further.
> > I *think* it's because the regulator is already fetched by the
> > panfrost driver itself to enable it
> > (the devfreq code currently does not support enabling the regulator,
> > it can only control the voltage)
> >
> > I'm not sure what to do about this though
>
> Having a little play around with this, I think you can simply remove the
> panfrost_regulator_init() call. This at least works for me - the call to
> dev_pm_opp_set_regulators() seems to set everything up. However I
> suspect you need to do this unconditionally even if there are no
> operating points defined.
I'm not sure if I can safely remove panfrost_regulator_init() because
it calls regulator_enable()
but there's no regulator_enable() equivalent in devfreq or OPP

I'm not sure how this is supposed to work
if someone has an idea: please let me know

> > [...]
> >>>       ret = dev_pm_opp_of_add_table(dev);
> >>> -     if (ret)
> >>> +     if (ret) {
> >>> +             dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
> >>
> >> If we don't have a regulator then regulators_opp_table will be NULL and
> >> sadly dev_pm_opp_put_regulators() doesn't handle a NULL argument. The
> >> same applies to the two below calls obviously.
> > good catch, thank you!
> > are you happy with the general approach here or do you think that
> > dev_pm_opp_set_regulators is the wrong way to go (for whatever
> > reason)?
>
> To be honest this is an area I still don't fully understand. There's a
> lot of magic helper functions and very little in the way of helpful
> documentation to work out which are the right ones to call. It seems
> reasonable to me, hopefully someone more in the know will chime in it
> there's something fundamentally wrong!
OK, if you know anybody who could help then please Cc them


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
