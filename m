Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69275AFCCB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ECE10E36D;
	Wed,  7 Sep 2022 06:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1F410E36D;
 Wed,  7 Sep 2022 06:48:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y3so28232401ejc.1;
 Tue, 06 Sep 2022 23:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=BVuk17Av+bi2jPnkL9wfgDXhvd64IxzBdo6fgEYGs04=;
 b=l+Ix4zgCkeWJQbwso5ymf9RKOOdyJP++7E7Hn7qNe8++KSvt+whxkZnLOMrQDs0DOx
 8Bnxfj3DRwnWqEyzdSyphQxdWMFT3V9Qs7b/tDHbUlIorwV6gri3bErqpuPWekLHhOlc
 95QccTtWJAE1QfDqOjrgxBl7o3tHfz3Xov6eefmcjs15qr03X6yCbHQUZzOjBwtnJ2Ce
 v3MSn5FI8PTpUV7LwrFWYTCWsHEzEAT0OYOVxybHCEP0lYHSssUuWNBoYyY5Iuisb3F8
 v4ZMnm1GSBiSXQSM4x8txzQJ+vXfmqGl5JiI3TvxUzzycXJ69jn0CXTzpi52Mui/bNAT
 qL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BVuk17Av+bi2jPnkL9wfgDXhvd64IxzBdo6fgEYGs04=;
 b=DqR3UPlSu/sIgY8//WzwsQOA6chppVmmmP1KmzrmRaknkFW4pS9flIwCR4WEHMhuAQ
 JEtsX61oMPUy286E/vquHZd88QrWTt4pZp7Z7SgnWlhYdGTYrbO9QjcOJ5nh3LolQepM
 tZieL0qdjvPa/JZRTgMws5EvwZVy4pD/3PlJYCJv+GYUkU6bzJ8uFJ+d8IoxPc+xahGf
 Uh4gso6XfeLSW5lGfXA7P8obfMOvqVpY0m4nAX9mQBLRijJDL673B2uv5s0iDqE2Dkd2
 pUxtj7JTOTY7cw0xLwCLyP2v1vq31ifLwWF8XDLfOHt7SYK/9koz90VuS3ehG9ruXhal
 tCZQ==
X-Gm-Message-State: ACgBeo2r1VLlCUNbN5F05A1mZr8ctEJMXGNwwJ1IBX5FywiCzHgaaVzJ
 IfX+BKfux/VIriIH8AVqzxudk7vylSlmVH2jPHE=
X-Google-Smtp-Source: AA6agR5oNcJ4xiLosx9c+PBGIQP4JwyWHajAGIDrk+o8018ZQ2ZLnOx2wULEGsptfZkH/pKAB98ijFHADY5kXzED1SI=
X-Received: by 2002:a17:907:6d16:b0:731:17b5:699 with SMTP id
 sa22-20020a1709076d1600b0073117b50699mr1428930ejc.23.1662533286189; Tue, 06
 Sep 2022 23:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
In-Reply-To: <20220907030754.GU1089@zhen-hp.sh.intel.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 7 Sep 2022 14:47:54 +0800
Message-ID: <CAJedcCwPKT8Zj8aPmXz=M3zG+xvCzyo4OspaPp4-LY+DgTfteA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, security@kernel.org, alex000young@gmail.com,
 airlied@linux.ie, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xmzyshypnc <1002992920@qq.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhenyu,

Very glad for your reply. I agree that the bug is hard to trigger in
userspace. But it is possible to happen in some specific scene. For
example, if calling pfn_valid failed, the bug will be triggered. And
it did happened as the [1] commit description illustrates.

As for the patch, I think your plan is the best. We need to free the
spt only in bad case.

[1] https://github.com/torvalds/linux/commit/39b4cbadb9a95bf3f13ea102d6ec84=
1940916ee2

Regards,
Zheng Wang

Zhenyu Wang <zhenyuw@linux.intel.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=B8=89 11:33=E5=86=99=E9=81=93=EF=BC=9A

>
> On 2022.09.06 19:36:56 +0800, Zheng Hacker wrote:
> > Hi Greg,
> >
> > Alex has explained how we figured out the patch. We did analyze the
> > code and found it possible to reach the vulnerability code. But we
> > have no physical device in hand to test the driver. So we'd like to
> > discuss with developers to see if the issue exists or not.
> >
> > Best regards,
> > Zheng Wang.
> >
> > Greg KH <gregkh@linuxfoundation.org> ???2022???9???5????????? 16:04????=
?????
> > >
> > > On Mon, Sep 05, 2022 at 03:46:09PM +0800, Zheng Hacker wrote:
> > > > I rewrote the letter. Hope it works.
> > > >
> > > > There is a double-free security bug in split_2MB_gtt_entry.
> > > >
> > > > Here is a calling chain :
> > > > ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entr=
y.
> > > > If intel_gvt_dma_map_guest_page failed, it will call
> > > > ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> > > > kfree(spt). But the caller does not notice that, and it will call
> > > > ppgtt_free_spt again in error path.
> > > >
>
> It's a little mess in code so in theory it might be possible but
> intel_gvt_dma_map_guest_page won't fail in practise...
>
> > > > Fix this by returning the result of ppgtt_invalidate_spt to split_2=
MB_gtt_entry.
> > > >
>
> I don't see why changing ret value can fix this issue, as it doesn't chan=
ge
> any behavior e.g caller of ppgtt_populate_spt to handle possible differen=
t error return.
>
> As current code looks assuming that ppgtt_invalidate_spt would free spt i=
n good case,
> I think the real cleanup should split that assumption and handle free in =
error case properly.
>
> > > > Signed-off-by: Zheng Wang
>
> This misses proper email address.
>
> thanks
>
> > > >
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/=
gvt/gtt.c
> > > > index ce0eb03709c3..9f14fded8c0c 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > > @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_v=
gpu *vgpu,
> > > >                 ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gf=
n + sub_index,
> > > >                                                    PAGE_SIZE, &dma_=
addr);
> > > >                 if (ret) {
> > > > -                       ppgtt_invalidate_spt(spt);
> > > > +                       ret =3D ppgtt_invalidate_spt(spt);
> > > >                         return ret;
> > >
> > > But now you just lost the original error, shouldn't this succeed even=
 if
> > > intel_gvt_dma_map_guest_page() failed?
> > >
> > > And how are you causing intel_gvt_dma_map_guest_page() to fail in a r=
eal
> > > system?
> > >
> > > thanks,
> > >
> > > greg k-h
