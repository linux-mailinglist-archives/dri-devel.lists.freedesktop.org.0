Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958999F117E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101DF10F07D;
	Fri, 13 Dec 2024 15:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="blwDgZRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA210F079;
 Fri, 13 Dec 2024 15:55:13 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-844cd85f5ebso157503239f.3; 
 Fri, 13 Dec 2024 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734105312; x=1734710112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6VmOCA+V9XQez6fdrDoIQI1Lpi009QCYLL4t5PPetk=;
 b=blwDgZRRe7bsaPXHQ4zzubwENZyULXbAckAMfMDhY0pnoUDk2VhiduMGD54syLKoXI
 XituCDc1IgTyAwKVsxgvnzkY9xufnVTPw+70LA6RjIwvcayA9ppsCqHivIvqtvAVGPZW
 13gE2d0sc7pswiEyE3yMjGWgOI10FOe5mYtvjM8ZpSYVL2JpM4MJa/RoHR6ykaHYNGRn
 a7lXa5UcBkVzG/aGMBWhA/473xf9bziY7HzJK1TsCQ7BT/0O6t56jIDYpNyVtFQQWtVt
 ZJgdhZHorKxTcnkXSNX2NsQGz9l5a/L5TuNpm70DnNH+FxQolSOsut4xaQ7IWUKo75dW
 6m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734105312; x=1734710112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6VmOCA+V9XQez6fdrDoIQI1Lpi009QCYLL4t5PPetk=;
 b=gu+wuWmvwce24tC5ZQFS9bW/TY8LbQ4+0qOqU+TZcUPbgkzzSc8cUV158z79m/clRO
 EcRrkMh7Xsu7H4gxwinn9Lh573roGjwERBjlhT41vDILTcxCbhDPsIZ8dS8shelvGkx/
 WAbKmJZqWkUh+jS0LFbz646FGOztPpN10h3gHb4MdqQMbG+AvZo7GqaP2x9s/0q80vE5
 hrU1sp/Hp7XY5amhH08iOTalLeiBJLaOB5euf1oONqqLDsnsgf1T9AhwVh/Cd5G+cQDs
 0JglRy3ceXvNvH8BbUOydE9YU5n+C0rP6nyhzs2XLzND0m2lpDL2g+GN07NROwEFUsjG
 vhcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQwwPuhZQ3xaMZmM2xwQAp9UVYjnvV83AS3LUXweFTb7NrC9mrWQ1Lv+kAS/tfRJKJwksAbSelI2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwjIsAwk1iWREdUKjLFOTJfEyt/3FOaecX1e52Zbv9+iEdH9a6
 s0jcczxPP+yj1GP7/x4JUnODGhPhQH05yTBmts9EPu0fCzN1HQ6DmK4v37DeSqwurNMAsjNNHxC
 aQnj1pjECxl5OfMs3BmrxFmBIkWc=
X-Gm-Gg: ASbGnctuf+oemWCuVo+DfNL+ExyNvu/eZh3B6BLWU08CGYNjh/9nYtY4mjnKghs0uXc
 8WCqux9iWGAv9x4ZDWw6wvft41YtO7L6a/AnHRsYSAHJ/pVhGqditPk1nELnmYNkO7v+L
X-Google-Smtp-Source: AGHT+IFMG/lnqgLL0G12YQjpdrm4/5MG+SSmjuiAuSfeDBfTY9t2xf5FtjXDqhT4YvP0OFt9oWrlNzgxsZZaqLPfv5c=
X-Received: by 2002:a05:6e02:1c03:b0:3a7:e0c0:5f27 with SMTP id
 e9e14a558f8ab-3afeda2f96emr30053715ab.2.1734105312417; Fri, 13 Dec 2024
 07:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
 <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
 <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
 <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
In-Reply-To: <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 13 Dec 2024 07:55:00 -0800
Message-ID: <CAF6AEGtbSwF2NVAurJxHwb-D7=SutGtMZ-UQbFAPr0ohDsK1OA@mail.gmail.com>
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

On Fri, Dec 13, 2024 at 5:11=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 23.11.2024 3:41 AM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 4:19=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 22.11.2024 4:51 PM, Rob Clark wrote:
> >>> On Fri, Nov 22, 2024 at 4:21=E2=80=AFAM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 21.11.2024 5:48 PM, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> >>>>> helper macro to make it easier to add debug logging which can be en=
abled
> >>>>> at runtime via drm.debug.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +/* Helper for returning a UABI error with optional logging which c=
an make
> >>>>> + * it easier for userspace to understand what it is doing wrong.
> >>>>> + */
> >>>>> +#define UERR(err, drm, fmt, ...) \
> >>>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(er=
r); })
> >>>>> +
> >>>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> >>>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARG=
S__)
> >>>>
> >>>> I'm generally not a fan of adding driver-specific debug prints..
> >>>>
> >>>> Maybe that's something that could be pushed to the drm-common layer
> >>>> or even deeper down the stack?
> >>>
> >>> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> >>> just #define UERR() to be a wrapper for it, since line length/wrappin=
g
> >>> tends to be a bit of a challenge.  And I have a fairly substantial
> >>> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> >>> that was actually the motivation for this patch.)
> >>
> >> Alright, let's not get in the way then
> >>
> >>> I noticed that xe has something similar, but slightly different shape=
,
> >>> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> >>> length problem into the if() conditional.  (And doesn't provide the
> >>> benefit of being able to display the incorrect param.)
> >>
> >> Maybe rust comes one day and the lines will start growing vertically ;=
)
> >
> > Rust for the userspace facing rendernode side of the driver, in
> > particular, would be interesting for me, tbh.  Especially if handle
> > related rust<->c layers are designed properly.  I've lost track of how
> > many handle lifetime race condition UAF's I've seen ;-)
> >
> > Re-writing entire drivers is a big lift, especially when there is so
> > much hw+features to enable.  KMS is limited to drm master (generally a
> > somewhat privileged process), so less of a concern from a security
> > standpoint.  Much of the GPU side of things is "boring" power related
> > stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
> > any process that can use the GPU in a typical setup.
>
> The boring part would benefit greatly from automatic scope exit
> cleanup.. We've had lots of issues in the past with that (that are
> hopefully? sorted out now, or should I say, for now)

Maybe some of the cleanup.h stuff would be useful?

BR,
-R
