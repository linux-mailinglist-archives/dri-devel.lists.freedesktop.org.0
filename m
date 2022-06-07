Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFF53F323
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 02:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA8A10E1E5;
	Tue,  7 Jun 2022 00:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16D10E1C5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 00:57:10 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id s124so3861251oia.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 17:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IRiFsLC9SeH0FFFGEjlYZ7IOB4E8/s+Bg3paFj+vMwA=;
 b=ClVS6XkDBPjed3XagEC9qLf9ritssqvXY2SQwxGZ9/rhwjNCT620eBGwTyHfDlxvlf
 zRWD+/+BMGgBY8M69TylBpaoaQombhL97qlbPl64nrwS7QqyqONPHqQHUnfvlefI0C7l
 0BFaoOU0dhTKAqqr77uZd3+mtySGARPaCdu6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRiFsLC9SeH0FFFGEjlYZ7IOB4E8/s+Bg3paFj+vMwA=;
 b=f97joa/wHNvBJtDnMFhXut9YoqizkUDmrrdhhHfFwcyRDKyzArMG61rmICixTI4FMo
 Gevdhf/iZIz6Pc3coGz1AeEERs7e6an200jwSFzJ9/+GN0gvWBlClbSbtp0CHfkkKkOq
 9Pz6d4qpc6EtJm1pAMeLv/vnJZus1deOsDc8webk65NbS0ygOTfABWqp9xsCnSZTWhZu
 WVtMyrNEj21aISIQ6aWVl9j1S6y+CC7wZc8vC68taAHCPdeKIXp1sHXKQ2PLFYoh9HjC
 j3g58lH3e7XwQSEevK7Ao7nF77QHV7FBYumUOWHssRdoRWCTyctE/L7o1y7VoTC10LIN
 O3Kw==
X-Gm-Message-State: AOAM531Fydg1o9LQb7AwNkgWgVVVSK5Isnc8ZDiTAa8cL/bjlgMSCJli
 Y5cg2/ChmgxJk+5NcGwvrg73SuAiM1opVA==
X-Google-Smtp-Source: ABdhPJyMWCSVppHGQgjYtr2Ng9wGxI+5S2FdZFreG8gDugtkIk6cZXXzAR9rydD6Zm5JJ11T4CJ9KA==
X-Received: by 2002:aca:c156:0:b0:32b:9b69:5a0e with SMTP id
 r83-20020acac156000000b0032b9b695a0emr15654486oif.136.1654563428299; 
 Mon, 06 Jun 2022 17:57:08 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com.
 [209.85.167.170]) by smtp.gmail.com with ESMTPSA id
 a10-20020a056808128a00b00325cda1ff8dsm9533593oiw.12.2022.06.06.17.57.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 17:57:07 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id p129so17335645oig.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 17:57:06 -0700 (PDT)
X-Received: by 2002:a05:6808:10d1:b0:32b:a63b:fdda with SMTP id
 s17-20020a05680810d100b0032ba63bfddamr31727326ois.257.1654563426487; Mon, 06
 Jun 2022 17:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220228202532.869740-1-briannorris@chromium.org>
 <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
 <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
 <CAOw6vb+myB0gB1kPvwuL+T1Ka10gDN5rGS2hW+UG+-+K2NGz_w@mail.gmail.com>
 <CAD=FV=X1F61nDcoQz4w1pJX_=Zzt6sLH8bcsGrxxTpGs6=yZ4w@mail.gmail.com>
 <CAD=FV=URUUEtLfJprO72s307Op4Y9CQw0Uk3TUPBq8XAokhCsg@mail.gmail.com>
In-Reply-To: <CAD=FV=URUUEtLfJprO72s307Op4Y9CQw0Uk3TUPBq8XAokhCsg@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 6 Jun 2022 17:56:54 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNmSwk_d7Nc_b=2s8LxE8KBeiwic_0w1sOynMfZg8w2wg@mail.gmail.com>
Message-ID: <CA+ASDXNmSwk_d7Nc_b=2s8LxE8KBeiwic_0w1sOynMfZg8w2wg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: analogix_dp: Self-refresh state
 machine fixes
To: Doug Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 6, 2022 at 1:30 PM Doug Anderson <dianders@chromium.org> wrote:
> On Fri, Jun 3, 2022 at 8:17 AM Doug Anderson <dianders@chromium.org> wrote:
> > On Fri, Jun 3, 2022 at 8:11 AM Sean Paul <seanpaul@chromium.org> wrote:
> > > Apologies for the delay. Please in future ping on irc/chat if you're
> > > waiting for review from me, my inbox is often neglected.

OK, I'll try to keep that in mind. I can't help myself with the
semi-relevant XKCD though ;)
https://xkcd.com/1254/

> > > The set still looks good to me,
> > >
> > > Reviewed-by: Sean Paul <seanpaul@chromium.org>

Thanks!

> > Unless someone yells, I'll plan to apply both patches to
> > drm-misc-fixes early next week, possibly Monday. Seems like if someone
> > was going to object to these they've had plenty of time up until now.
>
> As promised, I pushed these to drm-misc-fixes:
>
> e54a4424925a drm/atomic: Force bridge self-refresh-exit on CRTC switch
> ca871659ec16 drm/bridge: analogix_dp: Support PSR-exit to disable transition

And thanks, Doug.

Brian
