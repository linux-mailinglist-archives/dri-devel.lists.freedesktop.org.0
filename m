Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC62422C1A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BF16EB87;
	Tue,  5 Oct 2021 15:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FE46EB87
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 15:14:02 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p80so24690248iod.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sh8VNE4FCLdSm5VCdPfycmMPvw4PtVqb68V0H1ZpEUk=;
 b=HtcGpyyh2UUVNrAb5Igdog262j6GdlcgBCBggIlt8jnaHyk4jpyGysSyBfHZba0mdm
 pDC1Acu7d9xqLvWCmW3TynL/Iw1DjKCWed9Iw2sJZ/8HJ8dhcrJzRSHOsg1v8+xashTp
 skKhyltA89Q0HPRLVE510wa50TQNxyIKcppPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sh8VNE4FCLdSm5VCdPfycmMPvw4PtVqb68V0H1ZpEUk=;
 b=FkJtIGvePSYmoOqPlUxZfUB5TjNQYAayhkNApCYG/Ze12D2sjYHj9L7nNPgNY2JynP
 COeEBvbpc9dnNW9z4gOB+wtXbGF8SWQREugJmy9zTX/M+9MLdcQKS5Bp0CQamDUaG19/
 8Mv9iPTyZBzMJqcDsxT6CNwLvhvhwaK08qqO9gpAfdhvp2IHihzXVnsj8ZUrc+lhqXGe
 yc2/zVumKF4pKHTBYijNh4+5rJgMPhq/BfcSkX0WtyT1L59yh2Ozx6aVAgqmbdR6Tr1l
 GUVZbx5FiETWZGVAngRcrmg7vjbmgtlwNpqtXMI7oCR8DB3ElL8wzSE4iI1wL7Bil1HT
 YumA==
X-Gm-Message-State: AOAM530yolRiW2YDIrWGbC3OcXDwPSD11VoaBYSC99RsyN0LZIbcfpB7
 Vwo1U+8LooGDewDcSJykKO6vBt1U1Z7cQA==
X-Google-Smtp-Source: ABdhPJx7prNpRcFgELbpKXmmHVlwZZVSTA+P/ZNoLGjF9HuqpDi/DlyCviUx7cNq9ijcKFNu9Fffyw==
X-Received: by 2002:a02:3407:: with SMTP id x7mr3123680jae.18.1633446841699;
 Tue, 05 Oct 2021 08:14:01 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id g3sm20232ile.61.2021.10.05.08.13.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 08:14:00 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id y17so13890222ilb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 08:13:59 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr3420583ilv.180.1633446839293; 
 Tue, 05 Oct 2021 08:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <YVtZstInQxXfPmsZ@intel.com>
 <DM6PR12MB49127B8B63079E6533197EA6E5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB49127B8B63079E6533197EA6E5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Oct 2021 08:13:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VvKsrB9RZKdB6vQJ-38BZEYLnuENxb1+1v-PahcdBtiQ@mail.gmail.com>
Message-ID: <CAD=FV=VvKsrB9RZKdB6vQJ-38BZEYLnuENxb1+1v-PahcdBtiQ@mail.gmail.com>
Subject: Re: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid: Fix
 crash with zero/invalid EDID)
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "oliver.sang@intel.com" <oliver.sang@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, 
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>
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

On Tue, Oct 5, 2021 at 6:33 AM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
>
> > BTW I believe connector_bad_edid() itself is broken since commit
> > e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid corruption
> > test"). Before we've even allocated the memory for the extension blocks
> > that code now assumes edid[0x7e] is to be 100% trusted and goes and
> > calculates the checksum on a block based on that. So that's likely going to be
> > pointing somewhere beyond the base block into memory we've not even
> > allocated. So anyone who wanted could craft a bogus EDID and maybe get
> > something interesting to happen.
> >
> > Would be good if someone could fix that while at it. Or just revert the
> > offending commit if there is no simple solution immediately in sight.
> >
> > The fact that we're parsing entirely untrustworthy crap in the kernel always
> > worries me. Either we need super careful review of all relevant code, and/or
> > we need to think about moving the parser out of the kernel.
> > I was considering playing around with the usermode helper stuff. IIRC there
> > is a way to embed the userspace binary into the kernel and just fire it up
> > when needed. But so far it's been the usual -ENOTIME for me...
> >
> [AMD Official Use Only]
>
> Hi Ville:
>
>      Yhea, it is pretty old change from two years ago, and it is no long valid anymore. Please simply drop it.
>
> Regards,
> Jerry

I've cut out other bits from this email and changed the subject line
since I think this is an issue unrelated to the one my original patch
was fixing.

I don't actually know a ton about DP compliance testing, but I
attempted to try to be helpful and revert commit e11f5bd8228f ("drm:
Add support for DP 1.4 Compliance edid corruption test"). It wasn't
too hard to deal with the conflicts in the revert itself, but then
things didn't compile because there are two places that use
`real_edid_checksum` and that goes away if I revert the patch.

I've made an attempt to fix the problem by just adding a bounds check.
Perhaps you can see if that looks good to you:

https://lore.kernel.org/r/20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid

-Doug
