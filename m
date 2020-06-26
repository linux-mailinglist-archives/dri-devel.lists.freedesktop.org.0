Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FDE20AA2A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 03:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36C16EC2E;
	Fri, 26 Jun 2020 01:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99B06EC2E;
 Fri, 26 Jun 2020 01:37:07 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id o18so3355061eje.7;
 Thu, 25 Jun 2020 18:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ev8M954A2xAvQp4C5xD3yd44XzdMUFOw91HonO88xA=;
 b=Dfu74YI321ajM0uHt4btGm4qgMfszKub3H+eD4wnoO9tYLmm9lG0owVlSRR5SS5vyB
 Zebj9SISLSi+sHh5WGuTA7bifEugKuLBa+N0r8GE1MVecg9ac10DhBIybaXsD/1vrRox
 p3brGUNGSdddNze4SqO72A9BhZZWbqy13cAqU/uBMdBodIA0RLg/Bf7ewvVpnE6fU/nA
 aoPXTwNrlbo6wr+Mv1neRFZr3jYcvtpGDRa8y5u3bIdGpRXeJ2q6wBKBnFsqzn9x3hFP
 hVzT6el58aaMHReQqSH8tnnvzMM06TGtfHvGcG4qpAlYtnT+mE/W3jmiAajawqwCImCx
 09bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ev8M954A2xAvQp4C5xD3yd44XzdMUFOw91HonO88xA=;
 b=U4airCXR3v2XiLGMxDNnz+if4ABFXv3s1qiGRH8FkqszH3RoG0KVBedy4wYpGtEXSU
 thwOHC6GPYIRwOndHlfF6QXbW6wpltaozIWbVCMf0rNmUBhkoPIshn2yGUMfyWytgaHF
 P2gqlVBQjxWZ64hRVVyRJhvclXOROpWA6z/Ag5VWFvIHVepQsFmibSfBFSGzl3gVca2P
 D9SVVF7KPaeSyzhp+L46RCn/Ff2qAH5tJBkgjamNl13a1jIWdOhSVH3QBYh9ogwHsYbq
 9XOWUBHJgdpXdoB1Fes8Tjc5wEy38kS/5SuhtZqDjWBB6tHKBZxJ+yLFrlhEE94EaZCu
 Ymcg==
X-Gm-Message-State: AOAM532FzOAle22n9qhXvznh8dE6KsME3Aa1coSvBXJyAJi9iksJBSVw
 RRNqRoGNypdwCFJeFGIqx2qJli+gLjCr/nRGzUJDs1vM
X-Google-Smtp-Source: ABdhPJwp3euX5uQuwJtmqtKGT8+DqTU92juS7Tkino47iTQVCEVxIrKUiNAnM9ZNXS1HFXi5Y9bGT3tmQaAaF72hB2g=
X-Received: by 2002:a17:906:da0f:: with SMTP id
 fi15mr503485ejb.237.1593135426176; 
 Thu, 25 Jun 2020 18:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
 <874kqzndxj.fsf@intel.com>
In-Reply-To: <874kqzndxj.fsf@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jun 2020 11:36:54 +1000
Message-ID: <CAPM=9twpNDqS=HDANHOiqy0JeqkqfpiA3bBsZn3vB4QVGJLGGQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, venkata.s.dhanalakota@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jun 2020 at 05:27, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 26 Jun 2020, Dave Airlie <airlied@gmail.com> wrote:
> > WTUF?
> >
> > How did this ever land in my tree, there is no ACK on this from anyone
> > in core dma-buf,
> >
> > Intel team, clean your house up here, I'm going to have to ask you to
> > stop Chris merging stuff without oversight, if this sort of thing
> > happens, this is totally unacceptable.
>
> There's no argument, an ack is required.
>
> In fairness to the i915 maintainers, though, this particular commit was
> merged via drm-misc-next [1].
>
> As a side note, there seem to be extra checks in place for acks when
> applying non-i915 patches to drm-intel; there are no such checks for
> drm-misc.

Sorry Jani, thanks for chasing that down.

drm-misc we need to oversight a bit more, I don't think we should be
landing things that affect core code with single company acks.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
