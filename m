Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D396E870B0D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EC4112530;
	Mon,  4 Mar 2024 19:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WkhRTyKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4E112530
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:55:50 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6e4e8687a96so519499a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709582149; x=1710186949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NChCIovI4USYlbL0DUhfDLCbSUUEkB22ExtjdPhFtk=;
 b=WkhRTyKDuJQ9lkK3GiKa9cTLzG6503WFpq01j8fkjspn77tVgcFO/FAlMzUO9s+etU
 0wCrTBBPnGrPreXYW0i2RIKiLEz27+bwcUH2400O1NmJi5ieDxBupDMFUN6IERdGwMJF
 mfL1W/jBNOskyfIAcnmVUrZ+zpIlpuijIcGTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709582149; x=1710186949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NChCIovI4USYlbL0DUhfDLCbSUUEkB22ExtjdPhFtk=;
 b=SpwlQ6URjTOjQ5E0vaYCuAn5xwJPw2qBwpLELRpahq+0sLE1DKRGeaOHbOQzICa0Pq
 7VnOGBFMtxRbfg6z/9d0a/GUqYd3IjhSmqDxgtkB9sUMof4FbDLTs30NEBze23yun6EY
 A/YHHiQunLWJTtFl0nXjV8lLjd83lHn/fTlVbbLirrJCu16udxyNXjOi2O14GylmAYn3
 o7AfCPhSSmDzjJYJ2vzff2G0kNOEeQegr7QicOeJfFSAkBLWrJEAqXNYLLSTaLEvGpQL
 cASrUMqDVhjFkIsnWrPfwISb8oaRJpJ7/5znJNGouwW658dLTbt6SylDxFzH5Ffk0Odo
 M0nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0pKoVfs51P3xPhz0JUTgyrM06fV8VjhGom7astOPLrhpjL0artbLNkR8ztAKrbLP+TCjCoH1Tp/ye0HZVDtQuwEgu0ptDQXQq5wyTFIWY
X-Gm-Message-State: AOJu0Yztp39TGtRQTQtaBNfxCQ1CSnmNtSCpYzNI7TySdHy3Rrzu0VFu
 iaC52kzofVbv/yGiRbmedYuF2XdIW3FmF6RAyuHaB3wNcShpEh6ihCBWy90hEdvh5cEe+UnR57T
 JGDA1KcQ4TsB3u9S5F2WF5inS8VbgCdR0RJdm
X-Google-Smtp-Source: AGHT+IH/daYx78kTRsjvivGYL4lFX/eiSnMvvHZW7wCrYqUj4CUHMpbMfS/Z7+FVgRoBdMex8ZYd8yNiaMAznb2VoxY=
X-Received: by 2002:a9d:6c4d:0:b0:6e4:ecc3:556a with SMTP id
 g13-20020a9d6c4d000000b006e4ecc3556amr2250029otq.14.1709582149237; Mon, 04
 Mar 2024 11:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
 <87wmqqjmt9.fsf@intel.com>
 <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
 <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
 <87bk7z6x1w.fsf@intel.com>
 <CAD=FV=Wzm9Y7m9Q6KqO7yWdnc1xToaRMb2f1s2TQMJqpqVYLOg@mail.gmail.com>
 <CAA8EJpqHJTbc+TCpkccjx_eQH36zaNgcQ9QssecNeQUQgfYApQ@mail.gmail.com>
 <CAD=FV=XyV=V-USfq8kp058=FzRQq=bPA5A4GDb1p0zO-KPbtwQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XyV=V-USfq8kp058=FzRQq=bPA5A4GDb1p0zO-KPbtwQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 4 Mar 2024 11:55:23 -0800
Message-ID: <CAJMQK-gKF+ZeAe4Hp8di83Zx8gp-BJ0vuj6uzi0hsaxeju8GyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Mar 4, 2024 at 8:17=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Sun, Mar 3, 2024 at 1:30=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > > The problem is that Dmitry didn't like the idea of using a hash and i=
n
> > > v2 Hsin-Yi has moved to using the name of the display. ...except of
> > > course that eDP panels don't always properly specify
> > > "EDID_DETAIL_MONITOR_NAME". See the discussion [1]. If you want to se=
e
> > > some of the EDIDs involved, you can see Hsin-Yi's post [2]. The panel=
s
> > > included stuff like this:
> > >
> > >     Alphanumeric Data String: 'AUO'
> > >     Alphanumeric Data String: 'B116XAN04.0 '
> > >
> > > The fact that there is more than one string in there makes it hard to
> > > just "return" the display name in a generic way. The way Hsin-Yi's
> > > code was doing it was that it would consider it a match if the panel
> > > name was in any of the strings...
> > >
> > > How about this as a solution: we change drm_edid_get_panel_id() to
> > > return an opaque type (struct drm_edid_panel_id_blob) that's really
> > > just the first block of the EDID but we can all pretend that it isn't=
.
> > > Then we can add a function in drm_edid.c that takes this opaque blob,
> > > a 32-bit integer (as per drm_edid_encode_panel_id()), and a string
> > > name and it can tell us if the blob matches?
> >
> > Would it be easier to push drm_edid_match to drm_edid.c? It looks way
> > more simpler than the opaque blob.
>
> Yeah, that sounds reasonable / cleaner to me. Good idea! Maybe Hsin-Yi
> will be able to try this out and see if there's a reason it wouldn't
> work.

Thanks for all the suggestions. I sent out v3, which still has a blob
type since we need
1. get panel id
2. do the string matching.

And I felt that packing these 2 steps into one function may make that
function do multiple tasks?

But let me know if it's preferred in this way.

v3: https://lore.kernel.org/lkml/20240304195214.14563-1-hsinyi@chromium.org=
/

>
> -Doug
