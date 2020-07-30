Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A004923354B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 17:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908D26E916;
	Thu, 30 Jul 2020 15:27:01 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131BD6E915
 for <dri-devel@freedesktop.org>; Thu, 30 Jul 2020 15:27:00 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id l4so28311140ejd.13
 for <dri-devel@freedesktop.org>; Thu, 30 Jul 2020 08:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRBXteCx3iMxzf+5YFGiaHOZbhEeLZMnPLZMpPhN9j0=;
 b=mxpwHgVNXl7Gw3UA+uuDLTz10xKua5fw6rE++7C7vRni0IIjZ6gS+ZeYIhLWXHy3y/
 vPMbGrVFEnb64IJ7Ca3gFuoT/t+e55dj9KYyxPjvaL0dq/2g+9XJh2GnXlC0ov5WrW4r
 Rvqv8Y35vB6EitcbM5ZUZxtNCnPnSsi+YFVcw1HHySKymFPJWeEa6sPbPdpt7WQI5ntw
 79LeYQnXgJfuNWyhCcD0m8x5aI8aNo5PdMzhFVVC72vY5I6n+escxqqLBEbmJDJjhOQO
 3MkVcanyh+4vYCe59GpVScPWSVS9yuFf0SgzR6ow2vry8MEcMN6ZbpjL2kclDSMFNJnZ
 Is8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRBXteCx3iMxzf+5YFGiaHOZbhEeLZMnPLZMpPhN9j0=;
 b=ill+EzGawByP87a1bGL02BN8idYfqcCm1dCT9Y86SgkugJSHzmDum87sZMAIGOOUjg
 ALxvKK+w/Yatp6QC8RaX149fniHeHyRYq95kn8pYRKAfYTtrYBvnqbGznjn6Mep5kd2A
 qqFQWm8DZI3MiraJ/ULrNnqhpQLv4rb7IFjr319fuv5MLf+A4omhN20GbLAA0woAoc7O
 b4DuQO4vMsde8mlNQnvLYbVR/97AP9KIGKGLBg3uZt4rjIZvPpBWf4qtdUKOkwMsaOm1
 EMyydPYodPPHr93ev/IoJw1Fa/PzHLTCZzrCMMAN7PvYQYZZuaF69831u1v5GiBPR8nN
 /wjQ==
X-Gm-Message-State: AOAM530J3nJsjGHehFjhbhTug5ijqGVJHHWERzjNyOD5VAkmF9bRvqqg
 uUYOJvEEgpPkdemTzCWWHy5/gVLeDX3fjZ7sR+E=
X-Google-Smtp-Source: ABdhPJyj/3mUFNZJ5e36idWlRRi684to1k7BBbmv7VGuv0mgty12MhPpHISg9EXy+G3LWVfB29zmAAC02OJYJvXOXxw=
X-Received: by 2002:a17:906:328d:: with SMTP id
 13mr3192634ejw.71.1596122818624; 
 Thu, 30 Jul 2020 08:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
In-Reply-To: <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 30 Jul 2020 08:27:39 -0700
Message-ID: <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 10:10 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 22-07-20, 11:00, Viresh Kumar wrote:
> > On 21-07-20, 07:28, Rob Clark wrote:
> > > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > > tree and merge it via msm-next -> drm-next -> linus
> >
> > I wanted to send it via my tree, but its okay. Pick this patch from
> > linux-next and add my Ack, I will drop it after that.
> >
> > a8351c12c6c7 OPP: Add and export helper to set bandwidth
>
> Oops, sorry for the trouble but this needs to go via my tree only :(
>
> I maintain two different branches, one for OPP and another one for
> cpufreq. There was no dependency within the OPP branch and so I
> dropped it that day and asked you to take it.
>
> But when I tried to send a pull request today I realised that one of
> the qcom patches in the cpufreq branch is dependent on it and I need
> to keep this patch in my tree.

Hmm, I've already sent my pull request to Dave, dropping the patch
would require force-push and sending a new PR.  Which I can do if Dave
prefers.  OTOH I guess it isn't the end of the world if the patch is
merged via two different trees.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
