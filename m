Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BCB40068F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 22:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094D46E8DB;
	Fri,  3 Sep 2021 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C266E8D9;
 Fri,  3 Sep 2021 20:24:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q14so350900wrp.3;
 Fri, 03 Sep 2021 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVVpgjo5Cfaza682w5KWsOpwl1uwq/nsCC8e82zI314=;
 b=Rt8geQ7VCeNG5FbQLG/Jq3ZI2ZqvY7V9exoYMOKRRIjM2KDZhdKEHcPgMf+q0F32SY
 HEzLYxPXZ5jXzKdW3iHEE0We7krPXLol/7nM2840OZt4WprWlzUpnJFDayFLt2E0grYV
 0t1GlyOxsxWyhWBCp5CtzuxQMtFUvkr/dB3CyiEgXufg13gSP+h5umq7hPb5GJkD8+Vj
 isowlzyY6TI9BNRMKLGN6sWZVtj/5EpGNK+M1KZBYPPNQFPSksXwYEpYKGY/SVQzyXoO
 Jtb9M/GjLuUwgk4nWh/BZcKG5EvkZT7QXDMWWWQ7jNnIynlFAHoh+nd+6BMVyO3Yhxh2
 0plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVVpgjo5Cfaza682w5KWsOpwl1uwq/nsCC8e82zI314=;
 b=ldeiNNbTTNkWGxgKNb4ztSyhGWEDQnZxWr49cKa3QPulCeazoEvOyCDX14PVOSlXcu
 scO1cegn8sjTPe/I9IiMSP5F8jrF27FFfmOqiwU8bSCvIYIlXqsl7ijXVys8ITxeQ9zZ
 ANi3KUgzdiqyURz6OHBV0RRM+EFNQVWP+Xqlgbr7/iR0QpOAy+oXk87RK9kVZV0Q4k7i
 YA3rSH4GtBeIZm9PwfPpUUCr2Qsttj8jx+3OOcICG4l4GhexYgNDa3978FfWGPiNFFss
 DW4NGNPPt2AP9izjIN/TkSddrm7YT5ULvc3oDduMtH8QIqOOif/wyfeseIT7VorcMy+Z
 /H0Q==
X-Gm-Message-State: AOAM533vEjSNpVME556WzupHI9eW2ltAM15Mq179hvbHf26WaLJn0XFK
 /642H1N0yJBpKFAwc72XFeS6oeuXqk7a5yFIPMg=
X-Google-Smtp-Source: ABdhPJz2LkXMZvkKMZnpMYID0ppLFrezLyfGdDdSTKP3FE3h1lTjyVd7tUbeqw2d6AXKTgLzDhlA/m9dpTloDw2fsdw=
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr800697wrg.151.1630700690229; 
 Fri, 03 Sep 2021 13:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <CALAqxLUkyXK2gqNMBbtJFfh01ZpcG46dZaM7Zq4jG3OngvFREg@mail.gmail.com>
In-Reply-To: <CALAqxLUkyXK2gqNMBbtJFfh01ZpcG46dZaM7Zq4jG3OngvFREg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Sep 2021 13:29:09 -0700
Message-ID: <CAF6AEGsACLcDuszcgmHHs04GghLPiRfei3tGo161yBXsg7Y-YA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: John Stultz <john.stultz@linaro.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 Rob Clark <robdclark@chromium.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, 
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 3, 2021 at 12:39 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Jul 29, 2021 at 1:49 PM Rob Clark <robdclark@gmail.com> wrote:
> > On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> > <caleb.connolly@linaro.org> wrote:
> > > On 29/07/2021 21:24, Rob Clark wrote:
> > > > On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> > > > <caleb.connolly@linaro.org> wrote:
> > > >>
> > > >> Hi Rob,
> > > >>
> > > >> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> > > >> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> > > >> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> > > >
> > > > *ohh*, yeah, ok, that would explain it
> > > >
> > > >> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> > > >> at the higher frequencies.
> > > >>
> > > >> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> > > >> glxgear.
> > > >>
> > > >> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> > > >> at the voltage the hardware needs to be stable.
> > > >>
> > > >> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> > > >> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
> > > >>
> > > >
> > > > tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> > > > on CC and I added sboyd, maybe one of them knows better.
> > > >
> > > > In the short term, removing the higher problematic OPPs from dts might
> > > > be a better option than this patch (which I'm dropping), since there
> > > > is nothing stopping other workloads from hitting higher OPPs.
> > > Oh yeah that sounds like a more sensible workaround than mine .
> > > >
> > > > I'm slightly curious why I didn't have problems at higher OPPs on my
> > > > c630 laptop (sdm850)
> > > Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
> > >
> > > Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
> > > crash where yours doesn't?
> >
> > I've not heard any reports of similar issues from the handful of other
> > folks with c630's on #aarch64-laptops.. but I can't really say if that
> > is luck or not.
> >
> > Maybe just remove it for affected devices?  But I'll defer to Bjorn.
>
> Just as another datapoint, I was just marveling at how suddenly smooth
> the UI was performing on db845c and Caleb pointed me at the "drm/msm:
> Devfreq tuning" patch as the likely cause of the improvement, and
> mid-discussion my board crashed into USB crash mode:
> [  146.157696][    C0] adreno 5000000.gpu: CP | AHB bus error
> [  146.163303][    C0] adreno 5000000.gpu: CP | AHB bus error
> [  146.168837][    C0] adreno 5000000.gpu: RBBM | ATB bus overflow
> [  146.174960][    C0] adreno 5000000.gpu: CP | HW fault | status=0x00000000
> [  146.181917][    C0] adreno 5000000.gpu: CP | AHB bus error
> [  146.187547][    C0] adreno 5000000.gpu: CP illegal instruction error
> [  146.194009][    C0] adreno 5000000.gpu: CP | AHB bus error
> [  146.308909][    T9] Internal error: synchronous external abort:
> 96000010 [#1] PREEMPT SMP
> [  146.317150][    T9] Modules linked in:
> [  146.320941][    T9] CPU: 3 PID: 9 Comm: kworker/u16:1 Tainted: G
>     W         5.14.0-mainline-06795-g42b258c2275c #24
> [  146.331974][    T9] Hardware name: Thundercomm Dragonboar
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.XF.2.0-00371-SDM845LZB-1
> S - IMAGE_VARIANT_STRING=SDM845LA
> S - OEM_IMAGE_VERSION_STRING=TSBJ-FA-PC-02170
>
> So Caleb sent me to this thread. :)
>
> I'm still trying to trip it again, but it does seem like db845c is
> also seeing some stability issues with Linus' HEAD.
>

Caleb's original pastebin seems to have expired (or at least require
some sort of ubuntu login to access).. were the crashes he was seeing
also 'AHB bus error'?

If you have a reliable reproducer, I guess it would be worth seeing if
increasing the min_freq (ie. to limit how far we jump the freq in one
shot) "fixes" it?

I guess I could check downstream kgsl to see if they were doing
something to increase freq in smaller increments.. I don't recall that
they were but it has been a while since I dug thru that code.  And I
suppose downstream it could also be done in their custom tz governor.

BR,
-R
