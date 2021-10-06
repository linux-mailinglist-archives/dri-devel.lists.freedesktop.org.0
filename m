Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B44235D5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E38A6ECB3;
	Wed,  6 Oct 2021 02:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8346ECB3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:31:08 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q205so1135833iod.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bq9ss4KGNTszJ/kr+WZe6xTy7aLeLEFMgM617QHj7Q4=;
 b=TFOgfLbssDLWXqgCEl2UkHChoVh4e/FDI3d5hi7PU/H3mkdfRDa/XyUa+7NLlGcJ0G
 lyR8MCEij49zKnhkJUKibBFMzapmSWysRvZkbBxy6teoJsMZHMFwD4G+uEHmHDAiQjlb
 UcjqBpNKg/YWTO316tR0011lAmkVVcHcaU/mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bq9ss4KGNTszJ/kr+WZe6xTy7aLeLEFMgM617QHj7Q4=;
 b=VQFGk+NW9PycpmpgujxjqJSeNyMeWqlgabx6Lu3HZSH4OV3vtiHBbzgvS3Jqxr9KEs
 qlVTeP99oNDdMIIXrNmL3BLlsKVx+1FYAPUBDteNZQExF5YIouD1FEdY/nrNoBQPison
 ikWEWG2EW+MnZlgYy69lxIYme0oWidDh2349tchLLTWqKrRvxU41v9tqJ04WXUbLx86a
 QbDkUYet+cVgex3PPaDpOfb8P8q+OhEea//oVRLyI8dan9akACS/3OTNZ6N0H43byI9O
 mPK6vvwgqLq6Cu6iBomBOLeDsVNzVfjS5/RnDJ/aEh6crjX4HcRcVelw8H7WJRfHwCwy
 PVLw==
X-Gm-Message-State: AOAM530dWDDuhCT/zx+Y27r+7lOgQCoeBGrt9li4FoadJRuW2lRDkTi5
 Ny2kKWs4TXRLYi5d5+Ete4WWGelukhQn1g==
X-Google-Smtp-Source: ABdhPJx88bNGW9qU3wzDPBHMu+JVUZBPerECZAqLozBBL857Z8Hgr0yzw9HflzmdvuyLPP8wAil8xA==
X-Received: by 2002:a5e:9810:: with SMTP id s16mr4744991ioj.171.1633487467933; 
 Tue, 05 Oct 2021 19:31:07 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id t1sm5980686ilj.64.2021.10.05.19.31.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 19:31:07 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id m20so445855iol.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:31:07 -0700 (PDT)
X-Received: by 2002:a05:6638:248a:: with SMTP id
 x10mr5311411jat.3.1633487466752; 
 Tue, 05 Oct 2021 19:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
 <YVxzX9h+jBqOj1/V@intel.com>
In-Reply-To: <YVxzX9h+jBqOj1/V@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Oct 2021 19:30:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEVJ8trPx39-oepbW6gZJYCcE_W5F0rrC0gUsLTFUy9w@mail.gmail.com>
Message-ID: <CAD=FV=XEVJ8trPx39-oepbW6gZJYCcE_W5F0rrC0gUsLTFUy9w@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: In connector_bad_edid() cap num_of_ext by
 num_blocks read
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 alexander.deucher@amd.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 5, 2021 at 8:46 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Oct 05, 2021 at 08:10:28AM -0700, Douglas Anderson wrote:
> > In commit e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid
> > corruption test") the function connector_bad_edid() started assuming
> > that the memory for the EDID passed to it was big enough to hold
> > `edid[0x7e] + 1` blocks of data (1 extra for the base block). It
> > completely ignored the fact that the function was passed `num_blocks`
> > which indicated how much memory had been allocated for the EDID.
> >
> > Let's fix this by adding a bounds check.
> >
> > This is important for handling the case where there's an error in the
> > first block of the EDID. In that case we will call
> > connector_bad_edid() without having re-allocated memory based on
> > `edid[0x7e]`.
> >
> > Fixes: e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid corru=
ption test")
> > Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This problem report came up in the context of a patch I sent out [1]
> > and this is my attempt at a fix. The problem predates my patch,
> > though. I don't personally know anything about DP compliance testing
> > and what should be happening here, nor do I apparently have any
> > hardware that actually reports a bad EDID. Thus this is just compile
> > tested. I'm hoping that someone here can test this and make sure it
> > seems OK to them.
> >
> >  drivers/gpu/drm/drm_edid.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 9b19eee0e1b4..ccfa08631c57 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -1843,8 +1843,9 @@ static void connector_bad_edid(struct drm_connect=
or *connector,
> >       u8 num_of_ext =3D edid[0x7e];
> >
> >       /* Calculate real checksum for the last edid extension block data=
 */
> > -     connector->real_edid_checksum =3D
> > -             drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
> > +     if (num_of_ext <=3D num_blocks - 1)
>
> Something about that doesn't really agree with my brain.
> It's correct but when I read it I can't immediately see it.
>
> I guess what I'd like to see is something like:
> last_block =3D edid[0x7e];
> if (last_block < num_blocks)
>         connector->real_edid_checksum =3D
>                 drm_edid_block_checksum(edid + last_block * EDID_LENGTH);
>
> Techically exactly the same thing, but I don't have to read
> the comparison twice to convince myself that it's correct.
>
> Anyways, this is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> either way.

Yeah, my brain had to work way too hard when I read over my patch too.
I've changed to your math _plus_ a big comment explaining it. I added
your review tag. I'll give this another day or so and then land.

https://lore.kernel.org/r/20211005192905.v2.1.Ib059f9c23c2611cb5a9d760e7d0a=
700c1295928d@changeid

-Doug
