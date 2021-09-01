Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC53FE286
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 20:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B013B6E250;
	Wed,  1 Sep 2021 18:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21376E250;
 Wed,  1 Sep 2021 18:51:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u14so1166582ejf.13;
 Wed, 01 Sep 2021 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uo8KSFTOZI4VpQQ+BhHQP63dF3Fk50Tmc8d1l6vAmKA=;
 b=dMKlSmIjTGaRFxxo1eFawPjWsKhmECXZln2Cr40VSGRtYd+tz5V/lfz0DeA2/q9spM
 RQjIZTJAny1byemUTpNbnx5Jb8Yu53WuWlrYWiVpw35cDlwe1U6c+gTh3d3saXnOy5wS
 bbO+XwHLgYhaR4sqyvkUs4QgcGCuX3O6m017CgHRPWDvomNdrHiKMWMOYlov05vd4LAY
 UujJW6gPCpHzAa/EYTda5DtE7UymI5xDraJGLgVtPPl4wlDu40XnLxIVGKONBzntkeKO
 itsbJnLMTZmcNWUAR7+f3utPO84vHvRb6flEGe8tW7WCIzX5sPdZRRYSIjxUR61OMy+G
 LRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uo8KSFTOZI4VpQQ+BhHQP63dF3Fk50Tmc8d1l6vAmKA=;
 b=UBfkTh5kBzkdIKdsalcL6nvXABShCHr7RNd+eUI3p+tWxNMnIOO1TTlOxmpNBHn7oI
 RZo1VaZAFZODBLECpicMxfsiR9W8xGNwm9mb+n2MbTce0OXbnr0hLKD4kTOJg4LbG4Du
 Mvvx3vX6/44YiDzUrV/hzDKwxXlX5RcHMTwOv6Y4Z9mXpgl++6RIN6Z97c7EZa/p02zv
 i4x92PLEzkw8JOLgw47I6/CnC1PAf79IZcL9bnpela3fBzwerwSsraK1LxWIqWFKWcEG
 3GxPyRkddUWDjgeeZ7tX38COP+SG7MxnNJ/3Fdt7Fpttjrsh4gBf4Rw2shmbyHaS2hvQ
 mHrw==
X-Gm-Message-State: AOAM5307QaX5hQ44OKaw6ITyFS7mNs0MuHY5hOoNmKuNN7r4X++kTuh9
 6rp9EV60hJTsUtkBCyO8WCWsSCG2M1xYOYTMneo=
X-Google-Smtp-Source: ABdhPJyW9LjbebWnAFBPfu0iZIJQGc0GwqzvY/JTblbaqLdWUtg7kVLRyEFCXSOqRvZiEzCC9R4xgHqkK3dlNK1I+Wk=
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr993014ejc.237.1630522269102; 
 Wed, 01 Sep 2021 11:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
In-Reply-To: <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 2 Sep 2021 04:50:57 +1000
Message-ID: <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, 
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
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

On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> >
> > [AMD Official Use Only]
> >
> > Daniel
> >
> > From the link you share it looks you(or someone else) have quite a bunch patches that changes DRM_SCHED or even amdgpu, by that case before they are merged to kernel tree I'm wondering if any AMD develop reviewed them ?
> >
> > They looks to me somehow conflicting with what we changed in our repo....
> >
> > It is really a chaos for AMDer if someone else out side of AMD changes our kernel driver (or/and scheduler) without reviewed by AMDer, just like we are requiring your review if we tend to change scheduler's logic here ....
> >
> > This one changes AMD's code: https://lore.kernel.org/dri-devel/20210625133327.2598825-2-boris.brezillon@collabora.com/
> > And I didn't see any reviewed-by from AMDers ...
> >
> > This one also touches AMD's code: https://lore.kernel.org/dri-devel/20200604081224.863494-12-daniel.vetter@ffwll.ch/
> > Which is conflicting with one patch we submitted (in our repo rightnow), and neither see AMDder gave a review-by on this one (let me know if I missed it)
> >
>
> Monk, this is not how upstream works.  You need to participate.
> That's how communities work.  There's a reason all these discussions
> happen on public mailing lists.  The patch author can't be expected to
> know every person on every vendor team to CC with a patch.  If you
> have concerns, you need to raise them when the patches are being
> discussed.
>

I'm not sure I can add much to help this along, I'm sure Alex has some
internal training,

Once your driver is upstream, it belongs to upstream, you can maintain
it, but you no longer control it 100%, it's a tradeoff, it's not one
companies always understand.

Usually people are fine developing away internally, but once
interaction with other parts of the kernel/subsystem is required they
have the realisation that they needed to work upstream 6 months
earlier.

The best time to interact with upstream was 6 months ago, the second
best time is now.

Dave.
