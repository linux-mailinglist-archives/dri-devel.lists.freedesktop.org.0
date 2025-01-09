Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4793A06BDD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 04:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77610E985;
	Thu,  9 Jan 2025 03:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rh2qZa2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7911010E984;
 Thu,  9 Jan 2025 03:12:52 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5f32168ddd8so231719eaf.3; 
 Wed, 08 Jan 2025 19:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736392311; x=1736997111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkPaEizzVylaqIVJqpAtMxdZUsuN54Vz1Vbvy9dJAp8=;
 b=Rh2qZa2fdh+MYqHJAnlaScNh/CiHz2N7oc84W1RNbO0ztsw3iarlluNbgFLjjWNwey
 B3yB4DI7xY2WWAKZRqD9A7qDWNBp67SJv9NustOhOO7ZLiVBfMl4cvZjNUH/figytC7x
 n0sR0GpH4sPkid1wC9B1e4zX6pZYC7U8J1STzBdqARpOXTsMqo8p6hglDZ4MO1HN7IUh
 j/Uhb4G9WNkpyO+rZ13iq/yLYHWX5VcVablhhw24EFk+AqLrzhgFlRADTCqexOW5ZdQA
 oTa2cP7Q9kIiNTWVRzfciHlKq/aQXKEu/sHPDWGskyBwmMOuV9O4ptL1axN+Fa9fnyfF
 1bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736392311; x=1736997111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkPaEizzVylaqIVJqpAtMxdZUsuN54Vz1Vbvy9dJAp8=;
 b=ekw6K6KeVwcctZzrB4TuB4yo6B/dGuKv4P5NOh4vabz/oIu03tvv+NroBJP8xjol81
 TkMIpEsgDzfMxQT9J+cVsFIF0XfbEu41+B4Er9T9/QQEx6YInrtrhSINZ8ye3somaNiA
 nZKBcIhZL37t7epRtffGUVw42/3KsEi2ckM3TeLK2i1PTFhCT01Pr2OyhWGOti3RDFxr
 +YiD18peGsado2tnVPpDIeigsUz8I/PS4BY/I02wSXIyp1hxtFO9xjNwDFbJ1qcp/CEz
 YjkJAVLFKxJfJ0rvBcX8rpoAUi3ut/XCc4DQaZkVoA16Say2u0nhmvCiy9Lzm1Uteacl
 oDLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+RYlEu32A9i++OkcwaZ+PvhliWQp/6wNkKovRXWa4I0UK1AZ+AGEjYi0hoHgk6aSA7iPbo1zuTkU=@lists.freedesktop.org,
 AJvYcCVI7/XQdYXKiw+Cw9+Oald+RPhwY7R4boflU4wABXulEDawkVCGehDwyrCB+CsX5Sjy1wdW9FbbPHBH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywug+lEXnw2QmjEhKbvkel5Qzn5tvZpHpPuX4ahEvmQBwRy0z7d
 xG/WUk7qJLG7Mndoc4hQyAawERHNEPLGbb+vSLsyzB/aE7GmHWeU5veixxCefBWrlvzDjRAigjs
 DMn8u3bEQ24F5fbG/rzhCwqEBiDLsyg==
X-Gm-Gg: ASbGncuXh2pY3RKXPx9FHf3zoNK9J86CHquonOK1Cyv35EwGXxSricBcCxPaubWGT8u
 jkxy2kkIvTpbLFslo6BTBkbY3U6yzP/CtxFmzrw==
X-Google-Smtp-Source: AGHT+IGKouW4s0ig1IZFdOJPK75zftIgIAhAggfpl72VYElMCOiKodqi0Waf3EQSOR/7MKpPpbXuI6HMuz9FLcROVp0=
X-Received: by 2002:a92:c248:0:b0:3a7:e732:4713 with SMTP id
 e9e14a558f8ab-3ce3a9c1aa9mr39893615ab.15.1736391867932; Wed, 08 Jan 2025
 19:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
 <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
 <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
In-Reply-To: <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Jan 2025 19:04:16 -0800
X-Gm-Features: AbW1kvZUwRXF-wTU5eTUH3s0B17tGFt4YK3etDC_4Sz_buO1KY-fi-pTtDWhh28
Message-ID: <CAF6AEGuFTW4hVursv-EKQ7GfVuUDJ4C0qWS0F+j1jPi+mP_xnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jan 8, 2025 at 6:22=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
>
>
> On 1/8/2025 6:14 PM, Dmitry Baryshkov wrote:
> > On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@qu=
icinc.com> wrote:
> >>>
> >>> Force commit that are disabling a plane in the async_crtc to take the
> >>> non-async commit tail path.
> >>>
> >>> In cases where there are two consecutive async cursor updates (one
> >>> regular non-NULL update followed by a disabling NULL FB update), it i=
s
> >>> possible for the second NULL update to not be queued (due to the
> >>> pending_crtc_mask check) or otherwise not be run before the cursor FB=
 is
> >>> deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
> >>> context fault since the hardware would try to fetch the old plane sta=
te
> >>> with the stale FB address.
> >>>
> >>> Avoid this issue by forcing cursor updates that will disable the curs=
or
> >>> plane to be blocking commits. This will ensure that hardware clears a=
nd
> >>> stops fetching the FB source address before the driver deallocates th=
e FB
> >>>
> >>> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> >>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
> >>>   1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/m=
sm_atomic.c
> >>> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca6=
31dd28d4cdc2b8c7dc0 100644
> >>> --- a/drivers/gpu/drm/msm/msm_atomic.c
> >>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> >>> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state =
*state,
> >>>          struct drm_connector_state *connector_state;
> >>>          struct drm_connector *connector;
> >>>          struct drm_crtc_state *crtc_state;
> >>> +       struct drm_plane_state *plane_state;
> >>>          struct drm_crtc *crtc;
> >>>          int i, num_crtcs =3D 0;
> >>>
> >>> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state=
 *state,
> >>>                  *async_crtc =3D crtc;
> >>>          }
> >>>
> >>> +       /*
> >>> +        * Force a blocking commit if the cursor is being disabled. T=
his is to
> >>> +        * ensure that the registers are cleared and hardware doesn't=
 try to
> >>> +        * fetch from a stale address.
> >>> +        */
> >>> +       if (*async_crtc) {
> >>> +               plane_state =3D drm_atomic_get_new_plane_state(state,
> >>> +                                                            (*async_=
crtc)->cursor);
> >>> +               if (plane_state && !plane_state->fb)
> >>> +                       return false;
> >>
> >> hmm, I suppose we want the same even if the fb changes?  Or
> >> alternatively somewhere hold an extra ref to the backing obj until hw
> >> has finished scanout?
> >
>
> Hi Rob
>
> Do you mean we need to also check if old_plane_state->fb !=3D
> new_plane_state->fb, then use blocking commit?

yeah, basically.. if we release any outgoing fb the backing bo could
be potentially freed+unmapped leading to the same problem.

idk if this more conservative approach would cause fps issues..
holding an extra ref would avoid potential issues, but offhand I'm not
sure if it would be a perf problem in practice.  Maybe with animated
cursors?

BR,
-R

> We can try that out.
>
> holding extra ref gets tricky IMO. In this way, the calls are balanced
> in places we know.
>
> > I think a more correct approach would be to run a worker, waiting for
> > the commit to happen and then freeing the FBs.
> >
>
> Hi Dmitry
>
> This option was tried . It gets very messy to handle it this way. Then
> we realized that, the worker is going to try to do the same thing a
> blocking commit does which is to wait for hw to finish scanout and then
> cleanup planes. Hence this was preferred and is better IMO.
>
> >>
> >> BR,
> >> -R
> >>
> >>> +       }
> >>> +
> >>>          return true;
> >>>   }
> >>>
> >>>
> >>> ---
> >>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> >>> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
> >>>
> >>> Best regards,
> >>> --
> >>> Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>
> >
> >
> >
