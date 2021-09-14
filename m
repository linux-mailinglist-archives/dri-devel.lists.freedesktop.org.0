Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B840B70E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6656E546;
	Tue, 14 Sep 2021 18:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED486E546
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:39:44 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x2so66544ila.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F+vma+/6q1PCLBq1R/pn7+hiAdo2p9TNOImn3v6+f+E=;
 b=Y5lRNVAjSYwSWmKnEik3qpWm/iU4mMYqfkUUEll4nG+hRAlVIuYHtegamdA/04weNL
 icS4WvXXrm3lc4YxAXXc8RBLLVsCKZ9JUDssETyDHfmj3t4cHrKZRDPsAPBiUEDFV87/
 HlR/FVeS1f7Izg2Uv4fZNxKyS2iVszJAByNpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F+vma+/6q1PCLBq1R/pn7+hiAdo2p9TNOImn3v6+f+E=;
 b=3BHIzDtqmbsenyIjoz6CU4WvJJR+eiQmrgwAHG4x04UHHGk73LjeN4S+wCtm+tTho0
 Llfr51o2AycH4Y1VYeK9PuzAzZC9mVm9x4CFJllwSapGG7EzeLzISqW1o9Y3X7AxJ3mE
 QWSuqTlycFKm24kJTj/3z4/ERZEyXMVqRhwm3M3ANzHm+7xabf5kUvwlU1X9jZLwsgJz
 bWcPFBObgSwo6iHY2sr/mFjCaCPpsY3zWodLq+tF23OZfFk7WWhCS28OPWI2EGx8BOhP
 Z4C0fsiUCRvG1EeVuf4sKr13HvV3W24JTrXMIpTk6pqpdBW0fHAleJsTlBcCl/buks5t
 r5Pw==
X-Gm-Message-State: AOAM530a+CEml0chQsBNs6br1ZMS6st3+40j95HA+Pl3FD/+hIUKuLFc
 tft+aUN5pCFBTbOZBeSAknatmW+Sv4kG0g==
X-Google-Smtp-Source: ABdhPJxeuP2hRDsUBe1Z3o0NVbSBRUuFBbzgX6+sCgiF15TXG5aTuJNY/68jKFqPBWnfDViep53sEQ==
X-Received: by 2002:a92:cb07:: with SMTP id s7mr13321601ilo.257.1631644783966; 
 Tue, 14 Sep 2021 11:39:43 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id a5sm7963397ilf.27.2021.09.14.11.39.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 11:39:43 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id a22so18462038iok.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 11:39:43 -0700 (PDT)
X-Received: by 2002:a5d:8458:: with SMTP id w24mr14646554ior.168.1631644283448; 
 Tue, 14 Sep 2021 11:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
 <87ee9r10qw.fsf@intel.com>
In-Reply-To: <87ee9r10qw.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Sep 2021 11:31:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
Message-ID: <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] drm/edid: Use new encoded panel id style for
 quirks matching
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Tue, Sep 14, 2021 at 11:16 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> > In the patch ("drm/edid: Allow the querying/working with the panel ID
> > from the EDID") we introduced a different way of working with the
> > panel ID stored in the EDID. Let's use this new way for the quirks
> > code.
> >
> > Advantages of the new style:
> > * Smaller data structure size. Saves 4 bytes per panel.
> > * Iterate through quirks structure with just "==" instead of strncmp()
> > * In-kernel storage is more similar to what's stored in the EDID
> >   itself making it easier to grok that they are referring to the same
> >   value.
> >
> > The quirk table itself is arguably a bit less readable in the new
> > style but not a ton less and it feels like the above advantages make
> > up for it.
>
> I suppose you could pass vendor as a string to EDID_QUIRK() to retain
> better readability?

I would love to, but I couldn't figure out how to do this and have it
compile! Notably I need the compiler to be able to do math at compile
time to compute the final u32 to store in the init data. I don't think
the compiler can dereference strings (even constant strings) and do
math on the result at compile time.

I _think_ you could make it work with four-character codes (only
specifying 3 characters), AKA single-quoting something like 'AUO' but
I think four-character codes are not dealt with in a standard enough
way between compilers so they're not allowed in Linux.

If you like it better, I could do something like this:

#define ACR_CODE 'A', 'C', 'R'
#define AUO_CODE 'A', 'U', 'O'
...
...

...then I could refer to the #defines...


> Just bikeshedding, really. ;)

I'll take this comment (without any formal tags) as:

* You've seen this patch (and the previous ones) and wouldn't object
to it merging.

* You're not planning on any deeper review / testing, so I shouldn't
wait for more stuff from you before merging. Please yell if this is
not the case. I'm happy to wait but I don't want to wait if no further
review is planned.


In general I'm still planning to give this series at least another
week for comments before merging. ${SUBJECT} patch also is the only
one lacking any type of Review / Ack tags so I'll see if I can find
someone to give it something before merging, too.


-Doug
