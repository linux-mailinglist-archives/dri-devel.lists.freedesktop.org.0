Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F019EC374
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3547A10E605;
	Wed, 11 Dec 2024 03:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="isUg+BM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558FD10E46D;
 Wed, 11 Dec 2024 03:43:32 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-8418a2f596fso197551339f.1; 
 Tue, 10 Dec 2024 19:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733888611; x=1734493411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cH1mM7zgDjQ29maw8yzbllsYQuAR43E0lxlHNTTv4o=;
 b=isUg+BM60J2PaHHSbyHz06Hk1wyXzP3EL0FH548WEEB/hlZUbckTLtWRQUVfnzh0kd
 fg/pa/EfSyFWsjCYqgdY6pOv3YG6CZGdbwEiETmqVlhAYkQrWqkaePHXh3bjE9QnBIcA
 gkCPb5+AylDAjkTZv9KGDOVoQUbA0xr69l9YyLkeU56y68BtVsCpgh68bhD4yyXHQZSX
 moTD7B8mvfMFHymmyEsOY/5QxJ0ag2Qe21kEj9EV+cQZh4nnh7EakJEmTBrVAkFo+sTz
 51keC376S8aZzWBCBUK8ky+/v8ZDJi07lmMCw+dN8muaov3n8SbO14/5/2i+zK0hnXHQ
 Z3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733888611; x=1734493411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4cH1mM7zgDjQ29maw8yzbllsYQuAR43E0lxlHNTTv4o=;
 b=PfknkBkAlFJtL+TyUmnoeAf80awIFDrl+GM2Osp9QTC2h2O102CPpaMCWVU1nGdcep
 zOyS3y9978sEhNDLVPuuMLMSK2tPRrogVPe9QsFt2Zjh2E0tZVbI7MLEMOCS9zZ1cVOf
 AtRCL56IAXiIxWf8IiRVM3lqVFkek9iKqVpNb6GeZHsZQydiedBLqbUJVPK4mZBHUBxY
 sG8pwvp/oPvFKTa1qb1o0cJm9zaRDMQaWyvtbJ+KPk3njOuBoegGC+GeHDby7iR8scLm
 4XdZ7YpqjH80SORNsOE0D2e9LRggXBpkRGc5Q9PLJfYgEvsME4lDVVXw8V8I0BDHIIN/
 odDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrHcHvB+pasetYqljNVv9hK1tKgZKFQf/ynttGbePy9oZefU6c2AhoFU55LAdUxb2Jn1HhlQCDcN0=@lists.freedesktop.org,
 AJvYcCXyQ31cjAXXDy4yOySTbtvCmTJ++GHEOANDxPob43rb8O+Yhx7ITOf0S47LJ8TLQJxJdG9w2udChPOe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjS5o6IllkN7ylG1NoUM3iUfeHHSL5zNrnA9OcF7K6jsJ0JkwE
 woOBUW9zYHGTVAD6wl6FAyVh3guBawjNbIEhCeOFoPhnzQojGH7/nyOFZ/pRWUFRfce8rMDKdV7
 6TZEOcNeNVcFL1c4jRxZZNXgUiSM=
X-Gm-Gg: ASbGnctnO95GD5TRICXLr6Z+jLQIZGKRSzBdE/VBZz2Oo57ArftWWTLo8RTeGKXVxAb
 UyIug4f7+XuClgznc5V/HshKYHRa9IWH5FfU=
X-Google-Smtp-Source: AGHT+IGyFs2ybV2TpGqUFfLsmDGPrsekx8uabC3DOBZW5+y8ecKLujGvlTe7kk+e78b8/IN04qEwyEGNin5DhKkcZs4=
X-Received: by 2002:a05:6e02:1d8a:b0:3a7:1a65:2fbc with SMTP id
 e9e14a558f8ab-3aa0933d97dmr15169745ab.23.1733888611229; Tue, 10 Dec 2024
 19:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
 <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
In-Reply-To: <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Dec 2024 19:43:19 -0800
Message-ID: <CAF6AEGs4EebrwyQZviNXqB2=3h2wgZpmbrdGHuEU4z1D014GRA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Pavan Kondeti <quic_pkondeti@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 10, 2024 at 7:08=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> > On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> >> On 12/10/2024 1:24 AM, Rob Clark wrote:
> >>> On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> >>>>
> >>>> When kernel is booted in EL2, SECVID registers are accessible to the
> >>>> KMD. So we can use that to switch GPU's secure mode to avoid depende=
ncy
> >>>> on Zap firmware. Also, we can't load a secure firmware without a
> >>>> hypervisor that supports it.
> >>>
> >>> Shouldn't we do this based on whether zap node is in dtb (and not dis=
abled)?
> >>
> >> This is better, isn't it? Otherwise, multiple overlays should be
> >> maintained for each soc/board since EL2 can be toggled from bootloader=
.
> >> And this feature is likely going to be more widely available.
> >>
> >
> > The DeviceTree passed to the OS needs to describe the world that said O=
S
> > is going to operate in. If you change the world you need to change the
> > description.
> > There are several other examples where this would be necessary
> > (remoteproc and watchdog to name two examples from the Qualcomm upstrea=
m
> > world).
>
> But basic things work without those changes, right? For eg: Desktop UI

It isn't really so much about whether certain use-cases can work with
a sub-optimal description of the hw (where in this case "hw" really
means "hw plus how the fw allows things to look to the HLOS").. It is
more about the hw/fw/whatever providing an accurate description of
what things look like to the HLOS.

I'm leaning more towards the hw+fw providing HLOS an accurate view...
and the fact that that carries over into other areas of dtb (ie. it
isn't the only thing that slbounce needs to patch, as I previously
mentioned) reinforces my view there.  This seems like a thing to fix
in fw/bootloader tbh.

BR,
-R


>
> >
> > So, if we can cover this by zap-shader being enabled or disabled, that
> > sounds like a clean and scaleable solution.
>
> I think we are focusing too much on zap shader. If the driver can
> determine itself about access to its register, shouldn't it be allowed
> to use that?
>
> -Akhil
>
> >
> > Regards,
> > Bjorn
>
