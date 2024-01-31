Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEEB843C87
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862A310E857;
	Wed, 31 Jan 2024 10:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EA7113B16
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 10:27:57 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc6c4a5bf2fso282444276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706696816; x=1707301616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=;
 b=Njj59DE/75wIKLI6SrjS2UJ2NknVIqMIYObNC+RdibXHuS2lVJZDjbiVqN+ZWYbEkj
 YDK9FhBxefQPIHF7weMW8k/hV4pCtMeSJT7JJrbfhSwYYVkLNS8P44Oh+mFXHs8Vo/6N
 C0WmekZJVgX78+2w0KBLohbbC+RvC8gpLahBLeRnEsbsKyKtsCZWl8+RstHfVVALqxAB
 gHF45XQCwR6F4Vzd6S+f9L+DU9/+maunbA3GqyiXHZY5Td9sye/YnjgIzg0/sXK6HUfl
 B4JrjJ0sf/ulqwIHc/Ei8qOS/g66faV/5Lr/tPRU96jwuN+gMbasyZJ9TcxQqI0J6PWD
 Qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706696816; x=1707301616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=;
 b=BNwoOb1IHqmDlIxNanz5ngUQfxZf3e8gZpGmO0XDUqKNehdxfbZalr9rQtrNnn+A4/
 WX+6+2tIHxM4VN3xDg7+wBEKMGCBJwX1ctBaPieQ5wOC6oFWvWMZUQRphfEm/8QD48Zl
 OpJntUIvWADEp3luNbaqhFtVeXYcEIzUbOy1PyMCyjqoprjRP808zNgSCf5/ABaxgi1Q
 m4+t3nuCtDgvOF3DdV3X1gklBgLGgTRW4bjjJZWxQBaKyA6b/B7uipUHHnm3Y89TChpm
 gbbH+O9TxIQavZXYZ9vL40iWYQIHtuo8Au/GCoTW0JUVP1svw/bNFlvupEETi2PIINmP
 dQiQ==
X-Gm-Message-State: AOJu0YyzFOZv3zjRhtLx0z+m6rK7dYGQi0PDii+oRmC8npWFnp6y/D/v
 TtkoPre5TJscz9zII3KFQ2zeobQwqVptJeNxK1VLXJ6m53fHvKpojMBwaaGmTRh/k1bypjZlHXD
 K7488nVR3kXFo/Je+/33+AZPX2fT6kqluRAjWxA==
X-Google-Smtp-Source: AGHT+IEqJVgu4nIRdtbsrRTsERmdIoAZnatopWJ6POWGE249ajHq/UFYIvx+LLtNTS6kTpwKklekHqS/zpNcV+La09M=
X-Received: by 2002:a25:2fc2:0:b0:dc6:c669:9914 with SMTP id
 v185-20020a252fc2000000b00dc6c6699914mr444876ybv.15.1706696816245; Wed, 31
 Jan 2024 02:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
In-Reply-To: <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 12:26:45 +0200
Message-ID: <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "michel@daenzer.net" <michel@daenzer.net>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>, 
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, 
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "sean@poorly.run" <sean@poorly.run>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > >
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
> > > > Hi Maxime, Daniel,
> > > >
> > > > We encountered similar issue with mediatek SoCs.
> > > >
> > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > disabling
> > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > drm_atomic_wait_for_vblank() is set to true.
> > > > As the result, we are not actually waiting for a vlbank to wait for
> > > our
> > > > hardware to close the cursor plane. Subsequently, the execution
> > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > buffer. This can lead to use-after-free issues with our hardware.
> > > >
> > > > Could you please apply this patch to fix our problem?
> > > > Or are there any considerations for not applying this patch?
> > >
> > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > land
> > > it.
> > >
> >
> > Got it. I would add tested-by tag for mediatek SoC.
> >
> > > I'd be _very_ happy if someone else can take care of that ...
> > >
> > > There's also the potential issue that it might slow down some of the
> > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > think
> > > all the drivers where this matters have switched over to the async
> > > plane
> > > update stuff meanwhile. So hopefully that's good.
> > >
> >
> > I think all the drivers should have switched to async plane update.
> >
> > Can we add the checking condition to see if atomic_async_update/check
> > function are implemented?
>
> Pretty sure not all have done that, so really it boils down to whether we
> break a real user's use-case. Which pretty much can only be checked by
> merging the patch (hence the requirement to get as many acks as possible
> from display drivers) and then being willing to handle any fallout that's
> reported as regressions for a specific driver.
>
> It's a pile of work, at least when it goes south, that's why I'm looking
> for volunteers.

I can check this on all sensible msm generations, including mdp4, but
it will be next week, after the FOSDEM.

BTW, for technical reasons one of the msm platforms still has the
legacy cursor implementation might it be related?

>
> Note that handling the fallout doesn't mean you have to fix that specific
> driver, the only realistic option might be to reinstate the legacy cursor
> behaviour, but as an explicit opt-in that only that specific driver
> enables.
>
> So maybe for next round of that patch it might be good to have a 2nd patc=
h
> which implements this fallback plan in the shared atomic modeset code?
>
> Cheers, Sima


--=20
With best wishes
Dmitry
