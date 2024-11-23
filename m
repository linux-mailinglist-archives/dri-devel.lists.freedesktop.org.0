Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1C9D6733
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 03:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB2C10E463;
	Sat, 23 Nov 2024 02:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X2ZWFwnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BF510E463;
 Sat, 23 Nov 2024 02:41:51 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-83e5dd0e5faso114790839f.1; 
 Fri, 22 Nov 2024 18:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732329711; x=1732934511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70gmuVqd5ZnoO1vvK5nWrsFGGQmS9boqrWJIu2Mw/JQ=;
 b=X2ZWFwnMM7APZCl/myoCV4v2R/x0XCb9KkEI0A871T2Iw3btgH5/6V7w8+LGqHtQsh
 qUlNeqIO/XRBiYq0A3K/5vBz5DzW7Fo2AjTjnAaIYfOhTtkFecDgbJT4sapDjG+9zJmp
 UoT4OJS8VKJnsfwSCCLRAFo+bYP6VhciaFaJG9exCf8gmReC+6Fpe+VQnVpM94O2C/vF
 Bo+BZJ2FqiMTAA9Tep6Sen7doPVZtnT+3/YfgHb6+3Nq3RouSFTPHLJ02U2vevLER7pI
 aaoI5+ZIQQ/KJBeQvG9+jTgNWKu+CvilFGUsywU3USCHi2lqQBGX+uNR7sz1WbFlgbK5
 aCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732329711; x=1732934511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70gmuVqd5ZnoO1vvK5nWrsFGGQmS9boqrWJIu2Mw/JQ=;
 b=QSK3WnuizeSdx8MI6JLukDxKLEDtLTgo6mmbOCV9veyYW2goEGLpb2w17LhhMpb5T7
 acor3kdiq6G3xSyviceVaC3NRDEK5cIb+aYosuNZr1E24A1a4FMag9liaXq0YwVy5KNP
 omXXTxSKN6gfcQLNrFWaXq3rQcMNFh9c/Wuj8XkgNC4OnfH8FiM/6+cVwSEW5Wc1N/ba
 CTLouk8k/o+J6o/vcE7AVKqQbd8cpU2d14xxN3ymTYCjmoNK6Dbb5geuK7HteOFyWNil
 /e5ITxA5E2IKl1Ezo8m30jQfALiGO9BbaY9fFlVzDMGBQiDQDP4AAQ7SiQRuRsicz6lR
 uZQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1WjjKQkF0cGrlII+mZQbcb4N42E/cumzFAcqjmngkNgvaFXIkYfrR0eCpocAOVqXPThrrQPiiXBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsGGfcrAPHyJ6lzBBw5pppunyhbbLm5Q/TBLduM/5aIxO1RL1j
 H1bVuEGl28z7bPiRBmMNgp7wKxO9cLzZ6HGnw9dRyJVxJY0OQg0T2OCvLYwZw+zee0lj2XR9XmN
 XlWR7eNTZpDJ58WysgZsnPM/azeY=
X-Gm-Gg: ASbGncvL9fgr1E/oRZthpwdJ7EvUQu4FPI+ZcofZyvcZg2lkDfnn8jgt+8rTEoJpYhG
 8/yoWvnpOyTM8+Jcmt3Wza2UOcqulXxQ=
X-Google-Smtp-Source: AGHT+IHCuNiL+FpVrEqzvuP5atIKEy/3nfa6jAXX2Bz235hjzWk72EjraJCcQQQADNxbedTXxFJysZnkRKitQUoDPeM=
X-Received: by 2002:a05:6602:1491:b0:83a:a7ec:cc0e with SMTP id
 ca18e2360f4ac-83ecce46417mr403776539f.0.1732329710689; Fri, 22 Nov 2024
 18:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
 <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
In-Reply-To: <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 18:41:39 -0800
Message-ID: <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Fri, Nov 22, 2024 at 4:19=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 22.11.2024 4:51 PM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 4:21=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 21.11.2024 5:48 PM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> >>> helper macro to make it easier to add debug logging which can be enab=
led
> >>> at runtime via drm.debug.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> +/* Helper for returning a UABI error with optional logging which can=
 make
> >>> + * it easier for userspace to understand what it is doing wrong.
> >>> + */
> >>> +#define UERR(err, drm, fmt, ...) \
> >>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err)=
; })
> >>> +
> >>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> >>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS_=
_)
> >>
> >> I'm generally not a fan of adding driver-specific debug prints..
> >>
> >> Maybe that's something that could be pushed to the drm-common layer
> >> or even deeper down the stack?
> >
> > Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> > just #define UERR() to be a wrapper for it, since line length/wrapping
> > tends to be a bit of a challenge.  And I have a fairly substantial
> > patch stack on top of this adding sparse/vm_bind support.  (Debugging
> > that was actually the motivation for this patch.)
>
> Alright, let's not get in the way then
>
> > I noticed that xe has something similar, but slightly different shape,
> > in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> > length problem into the if() conditional.  (And doesn't provide the
> > benefit of being able to display the incorrect param.)
>
> Maybe rust comes one day and the lines will start growing vertically ;)

Rust for the userspace facing rendernode side of the driver, in
particular, would be interesting for me, tbh.  Especially if handle
related rust<->c layers are designed properly.  I've lost track of how
many handle lifetime race condition UAF's I've seen ;-)

Re-writing entire drivers is a big lift, especially when there is so
much hw+features to enable.  KMS is limited to drm master (generally a
somewhat privileged process), so less of a concern from a security
standpoint.  Much of the GPU side of things is "boring" power related
stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
any process that can use the GPU in a typical setup.

BR,
-R
