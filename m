Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E588CD8B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 20:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE8010F23F;
	Tue, 26 Mar 2024 19:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z9WQLYGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4BC10F23E;
 Tue, 26 Mar 2024 19:52:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so4185309f8f.1; 
 Tue, 26 Mar 2024 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711482724; x=1712087524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoJ7Xgxb57e+lLV6U4E0sAWdkd/64u+XAVmAgLbMPw0=;
 b=Z9WQLYGmHBCz1rbaQRKQggySbtM+tHh7G3Hrn/BhyoP+0t85W+LbiTb/bEgnHCnD02
 oOpmKbRp0y+XmjHv47SesBLM/0cwG90kOquMnl1I80abeYipFmpgz9ngBq59jILdqA89
 2WAzJyzVqm0ZxeAqqhdFtrWra6st5PHIV/r7P4q/BVJbQk8eywAKveEUiWXhRvq0AEky
 PbjuSPi2hc9HvR9HJ/KjOKFOrV3arU7jq8MCT+UUCHz6RMdH25GOfRspx7v7ekZPBOMt
 UU/m3bkkJyKmLWvAJQnxMrc1woO7CEPGVvcECbqTB/29MOyDVclAFMPg93tMqHx2mSYc
 iBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711482724; x=1712087524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VoJ7Xgxb57e+lLV6U4E0sAWdkd/64u+XAVmAgLbMPw0=;
 b=Y7ztL4k/QOcBYv0n580GizEK6pTy67gXOYFG/BimaxsDti8wZZM2UpkLkdXrjEcb95
 BcDIJcQYFSG8EhuvvZMYLbWeE1J6aLj5IeR1JpwvDi32ZTXLekN3pmfhyMLs5KMjGpst
 rI5bsCMCYs91k9ZbZtBagb5M3qz0H6O5A7Wx4sY7rfmB5/WM4qw/d5QieYWIHK4mu41n
 RRexw8vQiLleG6GvKks004l9Q2Cko2opg+dqPX0n/o6sXbg/CdtwRiBzfPhzV21+n5jd
 hxi6WQsnUI1O7NLX27G2ELFwIOzWX6bg776OvPHxKrVeMGeGH0OwKi5PYrtlEZyn2fKl
 1N2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCgtkpDPXWvkPHMKqx0alwQUurQfWWQx+HJtPpFUPYpfbGbVRaGuT7fcuQunSNzsrhDgz7LQSoAPnVtM6vIxZiplI1YC7+G/VJZBvlpqO5pfe0YICzsbr5lHJHmL5RjnCjLyXKvrbo+n5QeYtemIj2
X-Gm-Message-State: AOJu0Yy4DvKM/WXmTOY9qlI5kgkeigPzogiv0yJu1yHuXSqn2aE9uku6
 H+a+7paFYB4hcbO72lXxDeUaCOnJam1RtR+/K/oxT4j3U9H0kmQ6BwZIo5CpL9fy5dXTrgV5vjd
 eUKbuno+3FSxkzBOl84KlsEZ6SAjg+XMApnQL0A==
X-Google-Smtp-Source: AGHT+IFdWjE4WHoVtPjuQcx0WsU75NBlLUIGPA+pXpYqfXBQ6kNVdedZPLpDt+1PDG/+8EGDVjm0fb4X9eM/yrOADWQ=
X-Received: by 2002:a5d:640c:0:b0:341:bfe2:da36 with SMTP id
 z12-20020a5d640c000000b00341bfe2da36mr1745593wru.6.1711482724438; Tue, 26 Mar
 2024 12:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
 <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
 <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
 <CAA8EJpppre8ibYqN7gZObyvzR08yVbTevC6hDEDCKQVf8gRVRg@mail.gmail.com>
In-Reply-To: <CAA8EJpppre8ibYqN7gZObyvzR08yVbTevC6hDEDCKQVf8gRVRg@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 26 Mar 2024 19:51:53 +0000
Message-ID: <CACu1E7HhCKMJd6fixZSPiNAz6ekoZnkMTHTcLFVmbZ-9VoLxKg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Mar 26, 2024 at 7:47=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 26 Mar 2024 at 21:32, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> >
> >
> > On 3/26/2024 12:10 PM, Dmitry Baryshkov wrote:
> > > On Tue, 26 Mar 2024 at 20:31, Abhinav Kumar <quic_abhinavk@quicinc.co=
m> wrote:
> > >>
> > >>
> > >>
> > >> On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
> > >>> On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
> > >>> <miguel.ojeda.sandonis@gmail.com> wrote:
> > >>>>
> > >>>> Hi,
> > >>>>
> > >>>> In today's next, I got:
> > >>>>
> > >>>>       drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: va=
riable
> > >>>> 'out' set but not used [-Werror,-Wunused-but-set-variable]
> > >>>>
> > >>>> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> > >>>> fully implement devcoredump for a7xx").
> > >>>>
> > >>>> Untested diff below assuming `dumper->iova` is constant -- if you =
want
> > >>>> a formal patch, please let me know.
> > >>>
> > >>> Please send a proper patch that we can pick up.
> > >>>
> > >>
> > >> This should be fixed with https://patchwork.freedesktop.org/patch/58=
1853/.
> > >
> > > Is that a correct fix? If you check other usage locations for
> > > CRASHDUMP_READ, you'll see that `out` is the last parameter and it is
> > > being incremented.
> > >
> >
> > Right but in this function out is not the last parameter of CRASHDUMP_R=
EAD.
>
> Yes. I think in this case the patch from this email is more correct.

Yes, this patch is more correct than the other one. I tried to fix a
bug with a6xx that I noticed while adding support for a7xx, which I
forgot to split out from "drm/msm: More fully implement devcoredump
for a7xx" into a separate commit, and this hunk was missing. Sorry
about that.

Connor
