Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2C22A2C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 01:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C206E220;
	Wed, 22 Jul 2020 23:01:39 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E3E6E220
 for <dri-devel@freedesktop.org>; Wed, 22 Jul 2020 23:01:38 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h1so3021605otq.12
 for <dri-devel@freedesktop.org>; Wed, 22 Jul 2020 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMYtvDBeGfcQxAGCAdsv13lRzxlc7JtBvhHF/yrjphQ=;
 b=LDgxRU0PPlOqe+jIyOjiUKQdehMfoZWAjfvZ25p0KPl8vFDDdOtUj3vbuWcx1d2HiM
 bsCRH9MS1l8LDU98iOSE7GPEolaslu2fkxDb1T3PBTgCR24VzMdTGS6k/iPRG3QEztNe
 Em9GsZq+bVr765qjSjudsYKVBDe/BWvUycBl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMYtvDBeGfcQxAGCAdsv13lRzxlc7JtBvhHF/yrjphQ=;
 b=f1UG7KCZ/LAmhBbcXN2nVoWR85ZSPTFcl/DPuxPYMZwjfXXz15XpRCoN9dBJQmJlUG
 js3CkuA2vJ/k3qKO6IRXbqkYMx4DdXOppF8LvUBRMQcaJkduVN9Z9QsZyrEIhti9M6ex
 E0oWr/5wRRTbwLpH82pG43ntR7uf8cLkKbk/oeRATKayq8vSAhHCg1/F0B9+lXf/XWXQ
 igrUTZQ9CL/l3AHAwaS0SWRp/cMtZrqF59AULEE+54b9BDTUpE+pCLfKuKJsFNWKAZ3H
 Jux80vpdHdGeP9Xxaq1g6isabxScwzg0AlBA8FJ8IjwXtDcy+vsml51dpwEML25z/URN
 ImnQ==
X-Gm-Message-State: AOAM530Krlvk3QK/373pbgqY4fKrxhRH0JlqhGU/NftwMiIS57jZ0l9u
 jagkylIcIahObvKez6r7O0Ry3/kDORADPsKWLrDnBA==
X-Google-Smtp-Source: ABdhPJzMRGNhyEWDrKRLOE3infJnLErmNB6h5FHJQExFCTQdMa95a4Z/n+l6f4RR6YJ3xa3qMPCPWE5qcULyrQPYc4Y=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr2018905oti.281.1595458897417;
 Wed, 22 Jul 2020 16:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
In-Reply-To: <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 23 Jul 2020 01:01:25 +0200
Message-ID: <CAKMK7uF=vhzZSKuy6XV=R7roabxMt104Vg_w8axNmLi4EE6+0g@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To: Rob Clark <robdclark@gmail.com>
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
 saravanak@google.com, Viresh Kumar <viresh.kumar@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 5:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 10:30 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 21-07-20, 07:28, Rob Clark wrote:
> > > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > > tree and merge it via msm-next -> drm-next -> linus
> >
> > I wanted to send it via my tree, but its okay. Pick this patch from
> > linux-next and add my Ack, I will drop it after that.
> >
> > a8351c12c6c7 OPP: Add and export helper to set bandwidth
>
> Thanks, I'll do that
>
> >
> > > Otherwise I can send a second later pull req that adds the final patch
> > > after has rebased to 5.9-rc1 (by which point the opp next tree will
> > > have presumably been merged
> >
> > The PM stuff gets pushed fairly early and so I was asking you to
> > rebase just on my tree, so you could have sent the pull request right
> > after the PM tree landed there instead of waiting for rc1.
>
> I guess I should have explained that my tree gets pulled first into
> drm-next, which then gets pulled by Linus.

Yeah either topic tree or acks for merging in the other branch. No
rebasing in the middle of the merge window, that's rather uncool.
-Daniel

>
> BR,
> -R
>
> > But its fine now.
> >
> > --
> > viresh
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
