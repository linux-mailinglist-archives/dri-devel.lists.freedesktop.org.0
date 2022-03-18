Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2384DEA51
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C5910E2BA;
	Sat, 19 Mar 2022 19:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAC610EA07
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 15:45:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dr20so17455862ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iEoUOGNuvWutEIurlLjPrbp6aIbsgX9NoeRfOy5dLGk=;
 b=DNyxJPUVY3a3yXjwkgNmDeTZP28aOjJhD5zrO8oUQV22xMuvBRqBEhj1Hz6aw8f95K
 N8SWbRTkgRh550F17RVQonRKEUhmCMq485ad48SfTs5Wp7ZL0q3xCFzgnCOzNxwjcPyN
 jJJn8Dn3GnOsMI9itRww5SZHhy+ue+yoUXy6kGuBH6f/vGXHl+XElD/C/ZWF2YZOCyKk
 3awiI+4OmS6AcWEVUMpZkPNQdaBX6jhechb1HE1LWI8p0rvC0gMQOmOrOcAmV+tmRQ1B
 7bmzYgr0CGm5TQ4rOAAGpkGn5+pB/s5vNs7CJUqvYz/xOAesYKJ1weQh4wnHdbSbcK11
 JArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iEoUOGNuvWutEIurlLjPrbp6aIbsgX9NoeRfOy5dLGk=;
 b=vf71MM6Szq//swBAyu7OtL8AFLS4WTXxiS4q3HpqYf/uWydAdXTOga1LMkaq3YiXaC
 zfEbC0as4pRa8LSxnhI8g+s8Tuj38iXGnyFLzyzjm7+D6FEzour0gxIaNGAwzYYtUQHu
 6SmJQkqGPPASXiDCOLSGnez/avTmFKePGN52AqfwBJqRTGvIfZf5cbE3C394t2YMza/7
 cdKK414bhg6agJoeIJ6p2LRyp5ydU7VeIHHAB6p+Saekc2WG8XI+32eAKNNKMyAlQxdm
 d27WuA4RY0bCWhV4GQYXZ3Pya+qwnqnRWOeARfBHwKh4pMGppEIMiwhyL/7ek6UYjD3+
 YlOw==
X-Gm-Message-State: AOAM532jWum83bX5NXVPo+dIBUm6Ao8Wdq8ptgS8XXss93FDGb1hbu+n
 ZUHIelctX76xtH9fbOFFYL/lBmxeH9bEdsCPrzJ+ew==
X-Google-Smtp-Source: ABdhPJxxSv8Wsl18jpwozD6dMsfMf8L0YR73y4KRlXnN10+bPOK6orQ78rzB9xVNxs5f1eYNMbp9Q+OYDrzJs/kGJSo=
X-Received: by 2002:a17:907:869f:b0:6da:888b:4258 with SMTP id
 qa31-20020a170907869f00b006da888b4258mr9648477ejc.720.1647618303898; Fri, 18
 Mar 2022 08:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220317140115.541007-1-shraash@google.com>
 <f1ff7e95-c177-09dd-9393-d0156ce81387@molgen.mpg.de>
In-Reply-To: <f1ff7e95-c177-09dd-9393-d0156ce81387@molgen.mpg.de>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 18 Mar 2022 08:44:52 -0700
Message-ID: <CABXOdTecWs5oTfEDyK4onzrzcBnD7u-3j3ikbz4bvo20PEd17w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fixed the unused-but-set-variable warning
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: Aashish Sharma <shraash@google.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Jake Wang <haonan.wang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Guenter Roeck <groeck@chromium.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Thu, Mar 17, 2022 at 10:58 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Aashish,
>
>
> Am 17.03.22 um 15:01 schrieb Aashish Sharma:
>
> Thank you for your patch. If you are going to send a v2, please use
> imperative mood. Maybe:
>

Uuh, sorry, I have to take the blame for that. I am guiding Aashish
through the process of submitting patches upstream, and I completely
missed that.

> drm/amd/display: Fix unused-but-set-variable warning
>
>
> > Fixed this kernel test robot warning:
>
> Maybe:
>
> Fix the kernel test robot warning below:
>
> > drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2893:12:
> > warning: variable 'temp' set but not used [-Wunused-but-set-variable]
> >
> > Replaced the assignment to the unused temp variable with READ_ONCE()
> > macro to flush the writes.
>
> Replace =E2=80=A6
>
> Excuse my ignorance regarding `READ_ONCE()`, but is that the reason you
> remove the volatile qualifier?
>

It is not the reason to remove volatile, it is to enable removing it.
I had suggested using it, following its description " ... Ensuring
that the compiler does not fold, spindle, or otherwise  * mutilate
accesses ... ", to avoid the use of volatile, and to make it obvious
from the code that the read is intentional. My apologies if that is
the wrong approach. A simpler solution would be to just remove the
temp variable if that is preferred.

> Some robots ask in their report to add a Found-by tag. If so, please add
> one.

I think that should be "Reported-by", or more specifically

Reported-by: kernel test robot <lkp@intel.com>

>
> > Signed-off-by: Aashish Sharma <shraash@google.com>
> > ---
> >   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/=
gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> > index 873ecd04e01d..b7981a781701 100644
> > --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> > +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> > @@ -2913,13 +2913,12 @@ static inline void dmub_rb_flush_pending(const =
struct dmub_rb *rb)
> >       uint32_t wptr =3D rb->wrpt;
> >
> >       while (rptr !=3D wptr) {
> > -             uint64_t volatile *data =3D (uint64_t volatile *)((uint8_=
t *)(rb->base_address) + rptr);
> > +             uint64_t *data =3D (uint64_t volatile *)((uint8_t *)(rb->=
base_address) + rptr);
> >               //uint64_t volatile *p =3D (uint64_t volatile *)data;
> > -             uint64_t temp;
> >               uint8_t i;
> >
> >               for (i =3D 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i+=
+)
> > -                     temp =3D *data++;
> > +                     (void)READ_ONCE(*data++);
>
> Did you verify, that the generated code is the same now, or what the
> differences are. If it=E2=80=99s different from before, you should docume=
nt in
> the commit message, that it=E2=80=99s wanted, as otherwise, it=E2=80=99s =
an invasive
> change just to fix a warning.
>

The generated code is exactly the same on x86.

Thanks,
Guenter

> >               rptr +=3D DMUB_RB_CMD_SIZE;
> >               if (rptr >=3D rb->capacity)
>
>
> Kind regards,
>
> Paul
