Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90299403291
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 04:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A8E6E0F2;
	Wed,  8 Sep 2021 02:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574BC6E0F2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 02:20:26 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 y47-20020a4a9832000000b00290fb9f6d3fso281127ooi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 19:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d7N2sG5KH7lGAgEggC9zCBdx01DXAMxZT+wV9lrlBZo=;
 b=d1E5oZrpcIsuWWUnDrUU47njxjPHb/BblH3zYvHGr+MCBfMhW4jULBFqddvrjoGij4
 Esn56yeCeCihAXL3SPlDeop4KwnLgw2Zth1cO7tEg6EEGYPT84FDGoOsdf9wHBXly+xK
 n7z7rJ5rZm8UPwA0Tzz7Z4X84paxUv5bcSBgUKCRUWG6XD+nPkOQ4wUxx6Qg6551i1so
 535pxB4UK+7PUCkjW1dAkhL30cKrtgRPpGi97tbJCwuBw2YfazhVrdRKb0Ebqdx93rPR
 tWy8F7nj55XsSYGCz6R6F1sFVet2HvE4zEBNZbceFbgcsVHvZ84nzucACI8hCFsj98sy
 G5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d7N2sG5KH7lGAgEggC9zCBdx01DXAMxZT+wV9lrlBZo=;
 b=q2JT6EtYL3jSXBTWqfwvubE86zy389TxrsGFcIYvrSlQ0b3gd2WdcmqUx2E+odBoEG
 BH8uzw25rJmtFOKOym0IPX1vmnXLdklcgcu2ES1fDL0JKqlMcDM7MrQhAbQjPkAvnQUI
 s186/fjky8u6IH+R/qwH1orWE9pz0PYL8JPyl70UNAcM39U2pVd4jpiShxbGERQlQ0Bx
 At9DrfdFb4dBB+exMqpvT1Dw01Bm6+do3skG7qeJ9XcJoQJe8BL0ZKO4gpJDb4yt0PCN
 x8w36z61xV4ZtU1rBKPsngkMcxdqR/k6zwaXQ+Y5ZlRCC2/POFDzpPbWS4O9/Arc0vdG
 dBQw==
X-Gm-Message-State: AOAM533s8ipmL//FZxaK8TrqbC08gksUEZV4sjf/EeVYsbrlo2d5jApk
 XzY7e3/ZcK3PVjqcEhHqXP/syg==
X-Google-Smtp-Source: ABdhPJy4e+NyBQqTI3ph3rpEZzw5lV6yuX5+1N+QnhylAh1cGWwXQGa2BONNTDVnj2G+++dfD0QPJg==
X-Received: by 2002:a4a:de90:: with SMTP id v16mr1072428oou.42.1631067624003; 
 Tue, 07 Sep 2021 19:20:24 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d10sm159139ooj.24.2021.09.07.19.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 19:20:23 -0700 (PDT)
Date: Tue, 7 Sep 2021 19:21:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
Message-ID: <YTgeIuwumPoR9ZTE@ripper>
References: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
 <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org>
 <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org>
 <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org>
 <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
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

On Mon 09 Aug 10:26 PDT 2021, Akhil P Oommen wrote:

> On 8/9/2021 9:48 PM, Caleb Connolly wrote:
> > 
> > 
> > On 09/08/2021 17:12, Rob Clark wrote:
> > > On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen
> > > <akhilpo@codeaurora.org> wrote:
[..]
> > > > I am a bit confused. We don't define a power domain for gpu in dt,
> > > > correct? Then what exactly set_opp do here? Do you think this usleep is
> > > > what is helping here somehow to mask the issue?
> > The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
> > the GPU DT. For the sake of simplicity I'll refer to the lowest
> > frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
> > the "min" state, and the highest frequency (710000000) and OPP level
> > (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
> > sdm845.dtsi under the gpu node.
> > 
> > The new devfreq behaviour unmasks what I think is a driver bug, it
> > inadvertently puts much more strain on the GPU regulators than they
> > usually get. With the new behaviour the GPU jumps from it's min state to
> > the max state and back again extremely rapidly under workloads as small
> > as refreshing UI. Where previously the GPU would rarely if ever go above
> > 342MHz when interacting with the device, it now jumps between min and
> > max many times per second.
> > 
> > If my understanding is correct, the current implementation of the GMU
> > set freq is the following:
> >   - Get OPP for frequency to set
> >   - Push the frequency to the GMU - immediately updating the core clock
> >   - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
> > up somewhere in power management code and causes the gx regulator level
> > to be updated
> 
> Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else. We
> were using a different api earlier which got deprecated -
> dev_pm_opp_set_bw().
> 

On the Lenovo Yoga C630 this is reproduced by starting alacritty and if
I'm lucky I managed to hit a few keys before it crashes, so I spent a
few hours looking into this as well...

As you say, the dev_pm_opp_set_opp() will only cast a interconnect vote.
The opp-level is just there for show and isn't used by anything, at
least not on 845.

Further more, I'm missing something in my tree, so the interconnect
doesn't hit sync_state, and as such we're not actually scaling the
buses. So the problem is not that Linux doesn't turn on the buses in
time.

So I suspect that the "AHB bus error" isn't saying that we turned off
the bus, but rather that the GPU becomes unstable or something of that
sort.


Lastly, I reverted 9bc95570175a ("drm/msm: Devfreq tuning") and ran
Aquarium for 20 minutes without a problem. I then switched the gpu
devfreq governor to "userspace" and ran the following:

while true; do
  echo 257000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
  echo 710000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
done

It took 19 iterations of this loop to crash the GPU.

So the problem doesn't seem to be Rob's change, it's just that prior to
it the chance to hitting it is way lower. Question is still what it is
that we're triggering.

Regards,
Bjorn
