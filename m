Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5058A2EA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 23:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D5112A46A;
	Thu,  4 Aug 2022 21:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37A9018B;
 Thu,  4 Aug 2022 21:52:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i14so1675004ejg.6;
 Thu, 04 Aug 2022 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=XGVxhvWebi09u50nEyRtzfdSDoh+U76+Ahl1lp2ZZY8=;
 b=D9Q2m0PHStwPDjKM3/Jpb4NceuJ9WzJRb72H1QUpMpggPCAARBm3b0lkrGIcso1AZQ
 ovye+97JPoUozd0OEbKYlYyWyc2FB/4k24vvl4ydC315P5EBHLlNqUxs56+MLzglea3q
 jHMwFATGieCNDhoBdvILfQJAMJ0zoQnfXR40LdMUrYF0daHfZO85VMhYYtEQH8nX0c+P
 sQC1rt3zXXVwTlQl/5uCmCWeEF41FC4g8RmWNVGUwBdfgR7tTm7GknM4prt6pOUVCP06
 mYSHG4WmejdGn8B9e3tu4l/lBRFHGhfN5IB+HUgZ5krVrNnUC2+8gG68jxKruOAzuwCG
 VSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XGVxhvWebi09u50nEyRtzfdSDoh+U76+Ahl1lp2ZZY8=;
 b=Ml4SP6BEFv1FWq8RBgernebDijwbeS742d1Q+yCxJ0j5X2f0GbMABrkwkSwI0ZTmox
 Cgfx182OMp2Zyw2HOjU8twB3RGcUag8P1oUX530NydRAbxPz24+U+TkZ3g59x2HVS10X
 gSec6h4GGb7gaT1i3RHXYahyhmsuFux9cr+CZK+s5nkDB1eTwU9NjUKODrWriH7S8WZM
 GMz6krd6FM560xw4WmV5rXV0ZqM51Uqv41kDv4VBBDzvc7tFvY7ycb3K98jeXdRKe7Hw
 RrPTMizlCf6WF4IHmql5DTnTY48/jvH4/mqYh7BYmm72XdIZDfmHy1wywYYUtpw20ESM
 CGBw==
X-Gm-Message-State: ACgBeo3exc0BpVlNEq3dtfBYuxjHnie6oVZt1HRV5E0tnDG2fPWglH3h
 XyUSoW9jN56Gtxj5mSZQ0kb7Q7hzC+XhI/1hYDU=
X-Google-Smtp-Source: AA6agR427x4QqJbOu2BlFhPQqof86KwZzGGxqtZa6zH5hsQzpjs0ShErbUaw3eUbPD953ckJB7ROp9ZeR2mRPAJ4Nkw=
X-Received: by 2002:a17:907:6eac:b0:730:a07f:38bb with SMTP id
 sh44-20020a1709076eac00b00730a07f38bbmr2998462ejc.750.1659649926301; Thu, 04
 Aug 2022 14:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
 <20220714145423.721e1c3b@maurocar-mobl2>
 <83d9f973-abdd-3d8b-5955-84cfc3f49eea@amd.com>
 <CADnq5_MNkeG4E9ZXRLpgFQxrDN9jDhk7KYYHbjvtY-cUt5Kk8A@mail.gmail.com>
 <076231a3-38e9-e013-e106-aa926d009e77@amd.com>
 <87zgh6b1dp.wl-ashutosh.dixit@intel.com>
 <CAHbf0-EpHZmpqFgbyY753xQ2HZ_26bYT3qkYy0+EiVfYowzqxg@mail.gmail.com>
In-Reply-To: <CAHbf0-EpHZmpqFgbyY753xQ2HZ_26bYT3qkYy0+EiVfYowzqxg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Aug 2022 07:51:54 +1000
Message-ID: <CAPM=9twjM7txC5J7bgdaS7=k91GP_FPNttAT0-7tR9ehAtxtNw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
To: Mike Lothian <mike@fireburn.co.uk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Aug 2022 at 01:53, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> Hi
>
> When is this relanding?

It should be in Linus tree now enabled.

Dave.
