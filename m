Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBE135FD5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0E96E95B;
	Thu,  9 Jan 2020 17:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430C36E433
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 17:27:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r21so6348622edq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 09:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFFo4lYAoR+ztQi+bc+shgpxvHEpz1hycdVXq2pda/E=;
 b=Bq+zDCp8utnqC9vMcJB/9oXqT1bWMXHa9K3cjrXkVmVYBP/ZIdLLfGDxDgPktAJpPc
 uDYgQR6bCFp8fdwsIvv0sWXgr9FBuzJqreq7T9hmyWCwHAr2vcfVPJCCEUp2NECox+fi
 zmyZQ2zO+D8GV6q5/rDZdUGfjWEu3R7OzVs5gFMShCfE5zEHEqMcqaJCnCEFXBNLW0+i
 NjJvOr1EXZymyaujysT4RdeA6n0A+SRdv2jVrVR4+eqCNYkrSNwMW8weozYmXO+uiFCL
 8IomC0iUekQ+Rr41GSxJd9EGJcJ7cgy3qRopzDCAknRfsyjo1/pb+Cj7/h5dOiOqQAbp
 EfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFFo4lYAoR+ztQi+bc+shgpxvHEpz1hycdVXq2pda/E=;
 b=jdEjwpsujbEPavDVDKehIlHj0La9Ea1y0EESNf33DRuzST+/nYDnjD535e5r3UfX7P
 7wWJN/jtOSDrgPb38IJSBPB879flGkJ3F0O7zFmpijzGS5+dWJeYVEUm1CUmmGirOWEr
 sBNM3+F5WDQ8uWRiC2PUYDrrBYj/QhTN+SAj//iaKIrM+LcP2ri6PmIfKnAxSF7P7mp0
 QAsvw7Afe1B11vT6lEal3Jul4OfE+RXd2tTaamftrkluisA8d7mBNZvqBiJWDt6KR7zp
 Ky96JOR86bMx+HNeaT1FWENIGgxquuQZ5ss0z6om8Cmfn2+MDM3UfLqJIazCjsOi/Orl
 M/fA==
X-Gm-Message-State: APjAAAV1HUwmom27eXApndqNlThvkNGPjnkgrODp5bTD/npkeroixZxB
 hY22GBR5XBTAD4Hn4qhZBLb9MpFPEHjfiXrOFv0=
X-Google-Smtp-Source: APXvYqxns+YYQrgWQriAT/C78R+M4y26/fH9IfQcErryWfYvFhFx6Chl+31zO8yU40ApwcokfeGqoyXjdVewMru6CFg=
X-Received: by 2002:a50:fb96:: with SMTP id e22mr12240111edq.18.1578590841789; 
 Thu, 09 Jan 2020 09:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
 <2ceffe46-57a8-79a8-2c41-d04b227d3792@arm.com>
In-Reply-To: <2ceffe46-57a8-79a8-2c41-d04b227d3792@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Jan 2020 18:27:11 +0100
Message-ID: <CAFBinCD7o-q-i66zZhOro1DanKAfG-8obQtzxxD==xOwsy_d6A@mail.gmail.com>
Subject: Re: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator
 for control again
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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

On Thu, Jan 9, 2020 at 12:31 PM Steven Price <steven.price@arm.com> wrote:
>
> On 07/01/2020 23:06, Martin Blumenstingl wrote:
> > dev_pm_opp_set_rate() needs a reference to the regulator which should be
> > updated when updating the GPU frequency. The name of the regulator has
> > to be passed at initialization-time using dev_pm_opp_set_regulators().
> > Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
> > will update the GPU regulator when updating the frequency (just like
> > we did this manually before when we open-coded dev_pm_opp_set_rate()).
>
> This patch causes a warning from debugfs on my firefly (RK3288) board:
>
> debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
> present!
>
> So it looks like the regulator is being added twice - but I haven't
> investigated further.
I *think* it's because the regulator is already fetched by the
panfrost driver itself to enable it
(the devfreq code currently does not support enabling the regulator,
it can only control the voltage)

I'm not sure what to do about this though

[...]
> >       ret = dev_pm_opp_of_add_table(dev);
> > -     if (ret)
> > +     if (ret) {
> > +             dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
>
> If we don't have a regulator then regulators_opp_table will be NULL and
> sadly dev_pm_opp_put_regulators() doesn't handle a NULL argument. The
> same applies to the two below calls obviously.
good catch, thank you!
are you happy with the general approach here or do you think that
dev_pm_opp_set_regulators is the wrong way to go (for whatever
reason)?


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
