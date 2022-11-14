Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E8628BCA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 23:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4883010E32C;
	Mon, 14 Nov 2022 22:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7C310E10F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:08:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id 13so31846665ejn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vpQRZasD08S0MdHsPNjjNIlKX5TcZpvFCg+B+5S/zTc=;
 b=hKwvXDDp7+qNTTZhoSLroEZ5voP47JmP6mDVejeUFiGATDc6RyTNyeTF+5tpYKn6nV
 FPVy3w+FLGGGqf8DJjbpBpP7f+EwoHZBuktWk5SqyaAE1LCB7iPDhoYWlJy5OZ07OJuS
 pA2g8vpJwF1OijAbAiaFHYvqme8FWe2NQBhDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vpQRZasD08S0MdHsPNjjNIlKX5TcZpvFCg+B+5S/zTc=;
 b=t2h8zx84Aq0ZQ89nELlxwV76AhHusRwlC4Ag24wXwcn7AWs2ORImGkr1ebk7K1OpDG
 fZhGUUfivkSx7u1mZrqgiAqQeB8xqh8OwD1lxr29Zz8m8+IZVp4D18m/QaPqf56LVUng
 0dvJEq78MsMDSU/XmupExCrgYdNhqsuBPm8u4gt0si8M/aPDeSLCIM5DqJeXEn8Pa9k+
 3ypDDU1Xf12lvmNzYL/LQ17pRJ44unQEVCs4lsEcSltC6uwqdVddLhpsajxKRFSH5gZa
 FTYtAykdebZIyb1yN3OUD7Fyc7XoqguTMBvWLz3Ey9oD47wLGCRuDIUvSzlw5/8xHQEO
 kfUg==
X-Gm-Message-State: ANoB5pm/dBCloVdv+FbbOKlxYG1ragb8o5hkS4MoJ6QwjeNfksdwXaZM
 OJl9GACiUh7lB9sUaE2S8YJMBzq/YFp7NzTY
X-Google-Smtp-Source: AA0mqf6Z8g86mA2jFRn2cABXIGAu7uVAHY6669UaOa2kwhKHoVLx3UapKX26kZ1bHyBDVPyI2siGaQ==
X-Received: by 2002:a17:906:ae47:b0:78d:a871:737c with SMTP id
 lf7-20020a170906ae4700b0078da871737cmr11581806ejb.597.1668463729053; 
 Mon, 14 Nov 2022 14:08:49 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 n11-20020a170906118b00b007ad4a555499sm4553937eja.204.2022.11.14.14.08.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 14:08:46 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id j15so20957716wrq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 14:08:44 -0800 (PST)
X-Received: by 2002:adf:f145:0:b0:236:5270:735e with SMTP id
 y5-20020adff145000000b002365270735emr8729407wro.659.1668463724464; Mon, 14
 Nov 2022 14:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
 <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
 <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
 <956de566-d60a-f257-edff-85a2eac06d99@quicinc.com>
 <CAD=FV=UUpR9Euq5r+MujO6BdTk2cnWe_0JTdcP_e5RP47apUcw@mail.gmail.com>
 <87iljh4zwr.fsf@intel.com>
In-Reply-To: <87iljh4zwr.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Nov 2022 14:08:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WPa+CayKowHBDTRZTgv9FtCZWUWiKv-UB7XmQ4D+9P7w@mail.gmail.com>
Message-ID: <CAD=FV=WPa+CayKowHBDTRZTgv9FtCZWUWiKv-UB7XmQ4D+9P7w@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id() has
 an error
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 14, 2022 at 2:02 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 11 Nov 2022, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Tue, Oct 25, 2022 at 1:39 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Hi Doug
> >>
> >> On 10/24/2022 1:28 PM, Doug Anderson wrote:
> >> > Hi,
> >> >
> >> > On Fri, Oct 21, 2022 at 2:18 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> >>
> >> >> Hi Doug
> >> >>
> >> >> On 10/21/2022 1:07 PM, Douglas Anderson wrote:
> >> >>> If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
> >> >>> like to see the EDID that was read so we have a chance of
> >> >>> understanding what's wrong. There's already a function for that, so
> >> >>> let's call it in the error case.
> >> >>>
> >> >>> NOTE: edid_block_read() has a retry loop in it, so actually we'll only
> >> >>> print the block read back from the final attempt. This still seems
> >> >>> better than nothing.
> >> >>>
> >> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> >>
> >> >> Instead of checkinf for edid_block_status_valid() on the base_block, do
> >> >> you want to use drm_edid_block_valid() instead?
> >> >>
> >> >> That way you get the edid_block_dump() for free if it was invalid.
> >> >
> >> > I can... ...but it feels a bit awkward and maybe not quite how the
> >> > functions were intended to work together?
> >> >
> >> > One thing I notice is that if I call drm_edid_block_valid() I'm doing
> >> > a bunch of duplicate work that already happened in edid_block_read(),
> >> > which already calls edid_block_check() and handles fixing headers. I
> >> > guess also if I call drm_edid_block_valid() then I should ignore the
> >> > "status" return value of edid_block_read() because we don't need to
> >> > pass it anywhere (because the work is re-done in
> >> > drm_edid_block_valid()).
> >> >
> >> > So I guess I'm happy to do a v2 like that if everyone likes it better,
> >> > but to me it feels a little weird.
> >> >
> >> > -Doug
> >>
> >> Alright, agreed. There is some duplication of code happening if we use
> >> drm_edid_block_valid(). I had suggested that because it has inherent
> >> support for dumping the bad EDID.
> >>
> >> In that case, this change LGTM, because in principle you are doing the
> >> same thing as _drm_do_get_edid() (with the only difference being here we
> >> read only the base block as opposed to the full EDID there).
> >>
> >> Hence,
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> > I've given this patch a bunch of time because it wasn't urgent, but
> > seems like it could be about time to land. I'll plan to land it next
> > Monday or Tuesday unless anyone has any other comments.
>
> Ack, it's benign enough.

Thanks! Since you didn't write the above as an Acked-by tag I didn't
add it to the commit, but I went ahead and landed with Abhinav's tag.

69c7717c20cc drm/edid: Dump the EDID when drm_edid_get_panel_id() has an error

-Doug
