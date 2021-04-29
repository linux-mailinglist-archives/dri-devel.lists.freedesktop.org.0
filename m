Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B836F102
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 22:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6276F4B3;
	Thu, 29 Apr 2021 20:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF016F4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 20:27:30 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id v23so16540132qkj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJAed2YO1H2xLAJa2u/q4gvEcUMt+Fsnzg19rquZ0v4=;
 b=UvoKhxS9VHGC7coP+guOYOOgI/mbe2AD6xR50f8frzpEkglvQV74jMfQ5aY3p6idf+
 fMMM9jG0R3scNY69GVp/WzqytzFay86ZyMP9umI5IwWr5Cv8/27lqrueMPKvI4AO9VEk
 XqQPt58na7jf6uobRhfrfCiZbdfNcjStBFJRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJAed2YO1H2xLAJa2u/q4gvEcUMt+Fsnzg19rquZ0v4=;
 b=bu87rkUZPzRGSpAwU9RbU22PNXY6nFGIhyj34xKYmnZKE9GO2cXFFsvtI0/BUfDnWq
 +Kt11fJUGbE21N+xjxIjw7CzTo8snD7J3Wi8OHAUP3Sx5Vio/Zg2ah2DiOv8Bp7HpkMf
 8Hkh0Bw6ghtkB/0buWB1pY63mViy2SgTk0K/XA3We4KSox+7zWSkhSdkwuP/+i9ht7Pb
 oOgWUNhIodazroeiYaLXUq9oMNjfL+tZLE+ChxlBYjpjuRfNGhNexPFZ+jb/pYabuwHB
 sBEfaBQUMIQ+dh43Fphwvm/IC0hdNZS1tVc2I4Bpf6Cor/lb3stpsDfMboSWG3r6qT+E
 /CTA==
X-Gm-Message-State: AOAM533b+nD+jSxs4upaoUi0XKiz+0vWAgIzRzEPP5Z5+qmVpZVSbf1g
 Ksasxy8PX7f5zd2t6W1OpeHLNUXqjnFF4g==
X-Google-Smtp-Source: ABdhPJzcG2bo5gwcnf9jVrIdb4tCeNrmIxt+qq8//xia9dN7lrZldJ9X140p92cuFbqkARl8D2b2Xw==
X-Received: by 2002:a37:508:: with SMTP id 8mr1605723qkf.13.1619728048910;
 Thu, 29 Apr 2021 13:27:28 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id a22sm704815qtp.80.2021.04.29.13.27.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 13:27:28 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p126so26576143yba.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:27:28 -0700 (PDT)
X-Received: by 2002:a25:58d5:: with SMTP id m204mr2202753ybb.32.1619728048052; 
 Thu, 29 Apr 2021 13:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210405234713.3190693-1-linus.walleij@linaro.org>
 <CACRpkdZVDN2tGLiVT2sZKAT7PKYi-Opk2Gzop3DAj5Lm0OVdzw@mail.gmail.com>
In-Reply-To: <CACRpkdZVDN2tGLiVT2sZKAT7PKYi-Opk2Gzop3DAj5Lm0OVdzw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Apr 2021 13:27:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wwmv5qk6oeW63eoaPvj6KfYVS0_vvP7AFkqify0mPTbg@mail.gmail.com>
Message-ID: <CAD=FV=Wwmv5qk6oeW63eoaPvj6KfYVS0_vvP7AFkqify0mPTbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Samsung LMS397KF04
To: Linus Walleij <linus.walleij@linaro.org>
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
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 7:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Apr 6, 2021 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > This adds device tree bindings for the Samsung LMS397KF04
> > RGB DPI display panel.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Someone on DRM misc up to review and/or apply these two
> patches?
>
> Doug? I bet you have some patch(es) you can toss back at me to
> review in return.

I know next to nothing about MIPI panels, but I gave it my best shot.
Please take my comments with a grain of salt since I'm still a bit
noobie.

I think I already probably owed you a review anyway for previous
reviews you did for me. I do have my big 20-part series out there and
I certainly won't object to more review but most of the patches are
close to having enough review at the moment. For some of the simple
(dare I say "trivial"?) patches Bjorn was nice enough to provide
review. For the panel patches I got an extra review from Sean Paul. I
think there are only one or two patches in the series that have no
review at the moment because I had to spin them for Bjorn's feedback
and he hasn't gotten back to it yet.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
