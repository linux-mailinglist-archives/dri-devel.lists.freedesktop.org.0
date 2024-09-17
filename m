Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A697B1CD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 17:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55910E1D4;
	Tue, 17 Sep 2024 15:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MhURv13K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84BC10E1D4;
 Tue, 17 Sep 2024 15:30:39 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3a09af86744so10375935ab.1; 
 Tue, 17 Sep 2024 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726587039; x=1727191839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPW/AgdMn9HEEBlCh+UVWWKGsOQrfUimterFynorjKM=;
 b=MhURv13KLad6WW9wscEu1/SAD/MAsQkHEl1i1dMd2CJGYOqs2ypDE8gX2mn+TUAbxN
 pojTSQ4yoLfIJts3hQFv2EUPol9Xi6MXoM7jSSiWsjxN0klNS1jOR9tl6M8w7fE511YE
 SMAcTv+GdbdESprALuIPyuaWg2SDnfkro0GuG08jsQsItcJ0mMX8AFWyWfipvWdl/2sK
 Zk9ac+DkUfeUlDqnBJpVagGQkiXq2YEjxdEEQXOMQoPrnzkMMtmFUCC2pKk9f+7tJkhn
 IcO38YbwyoqgoaX2imC2f8/oR4AqHGo2hamtrpOoMuYlewyNbidLLxpLjfxmfTbmzCRa
 2iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726587039; x=1727191839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPW/AgdMn9HEEBlCh+UVWWKGsOQrfUimterFynorjKM=;
 b=sUHrVs5zZ9wRoN/c6TDfPE8rQNTixQdpTYFnJQPMCwNUSVYrnolNG7W/QLrb5togWI
 IvXySXRQJ1gg7f2vHSvyADFhjEVNkULuO9st+ts9uv31RK2S4kUrpb1Ih/bL8n62PAos
 8bmbsoJegqm+Hrc8gzADL0ZLqvLPjbhnhvkb+m5TORlikA4DyGNR50pnbjoXamj/ii9I
 0bdPdxgLtv0KndXIUp6jMi7p+QgtF4H8Vy48+dhIFfawHJA3wSRtuPILfFfE6tg2bKNC
 oAhJeZp7ShMyFqOGJCJfOEM87zgY9Bxdo5g3Ulah0xKHXVU67+WSzNoSsLQPKv/DmOGi
 nYiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5hRJX49LoGh6bizxe75a9R5hG2WttEBO1C858nM9bcWQwXSoKE07ZI3ddJljy2kD1siH4mBJ2ziU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeQXAV/LNQT6BgLNY7lMLiksgqlajAnrEjNr8VZRHA+f4CZE7k
 z45hFbDv3gCuGaDWBb4y7f6bn4lN04+v14zXxWcMYzYpH00GP3n9RgB7AiN7dRAbg6PR0WWoEiX
 nFwTvXEczwKlR4N/W8bzdexLbJwc=
X-Google-Smtp-Source: AGHT+IFnQfX2Dm7t85FaLReCnsm/k3IVJHP6S0jDSauS+A3CY0LNPlrSmf9NZpTDLnGuUiYPAko0KJRt85OCKIPoMnY=
X-Received: by 2002:a05:6e02:5a9:b0:3a0:8c68:7705 with SMTP id
 e9e14a558f8ab-3a08c6877c6mr117243125ab.21.1726587038839; Tue, 17 Sep 2024
 08:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com>
 <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
In-Reply-To: <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Sep 2024 08:30:25 -0700
Message-ID: <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Sep 17, 2024 at 6:47=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 13.09.2024 9:51 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> > devices (x1-85, possibly others), it seems to pass that barrier while
> > there are still things in the event completion FIFO waiting to be
> > written back to memory.
>
> Can we try to force-fault around here on other GPUs and perhaps
> limit this workaround?

not sure what you mean by "force-fault"... we could probably limit
this to certain GPUs, the only reason I didn't is (a) it should be
harmless when it is not needed, and (b) I have no real good way to get
an exhaustive list of where it is needed.  Maybe/hopefully it is only
x1-85, but idk.

It does bring up an interesting question about preemption, though

BR,
-R

> Akhil, do we have any insight on this?
>
> Konrad
