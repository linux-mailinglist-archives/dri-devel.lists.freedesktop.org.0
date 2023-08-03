Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6276EE43
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60D10E61D;
	Thu,  3 Aug 2023 15:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C360810E61F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:36:35 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d414540af6bso600678276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691076995; x=1691681795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0RiJFEC2TyWpgAWWlJd3Y77KTp5pRBuPs5ibASU4PI=;
 b=msm0BrH5ifzTm01PEG8loMj+Dv1GrOKfhgu/XSIx1g+nFlN4UO80QOmhBgbUGHLOET
 maNjsAY+vGJJgwH/4V+q274S7lxVJ/o1g++CATTAcBMW68NExx464ohZxTreY1fYRZL9
 JbA/OcyXEEyywWi2COfWs6+oNKRJ06biZaviM8/KGRJfrpmWZWNddjeqEDPGvdDyXIdq
 onfSG/O6E5wBSjEE4dpknFYoFiabzYeUYTekvYoYg1mkfzN879EnqlJ1Z25Iul8WbTXR
 7wEeb8bfakbUlapSQzWb7Twa/r6JvEBEYvwDEoi+KyEk7sG3EuSL9+cYm2WtLuKINiY3
 2wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691076995; x=1691681795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0RiJFEC2TyWpgAWWlJd3Y77KTp5pRBuPs5ibASU4PI=;
 b=Br5KlWzLudwFvTDNLHUo47KD3cNQtin6GRfET48dfeA6+GH9/n0p/1VN1Ve6tOVt99
 2/u0GvWvgjeq7d6ijFz6Wst3FKNOihf6UlzhGM53PtsysAvqxHHj9fy1dMkJqkroQiu0
 DmY+HZRR+h4bniQ8bjuUdblvLdqD0ePGdvLe2K5C2IcuJ19FT6dHaKYx/iivcHtFntrF
 xgDNFR24+/7obUBvoIpj6Z0qiL0WoZZuYA5sAfMlaewo0+Zm6nj3vaRJxY3EC8YQmT4y
 9DRqFCiE1+wF3nyTlvHdG3uYA8TpLgFZMBpH9u2b7PygQx19MZnk3s+XukwEaPolr6PL
 xSUg==
X-Gm-Message-State: ABy/qLZ4ha1Culj0p9DgUxtn81FHJuSDnkyKxgU4RLdJVXa50xRWJuDn
 x0M9WMZiFbl95cOEqI6g0sFdXag90eOPuD4Vkd+PaA==
X-Google-Smtp-Source: APBJJlFYQquHXzrsKhhJGfCCxFrZ+hdH5p9FtN6ueneVgQ9/HLwNKPKeUcb1fuSTmM6kdAbJLQt1skEwUHmvVNRluF4=
X-Received: by 2002:a25:738f:0:b0:d04:caf3:261e with SMTP id
 o137-20020a25738f000000b00d04caf3261emr16385250ybc.53.1691076994786; Thu, 03
 Aug 2023 08:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
 <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
In-Reply-To: <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Aug 2023 18:36:23 +0300
Message-ID: <CAA8EJppCECObEe5UG3LsHUsmYfKzakWzVw33S4nVc=DB9sA0ig@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 18:31, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, August 3rd, 2023 at 17:22, Simon Ser <contact@emersion.fr> w=
rote:
>
> > The KMS docs describe "subconnector" to be defined as "downstream port"=
 for DP.
> > Can USB-C (or USB) be seen as a DP downstream port?
>
> To expand on this a bit: I'm wondering if we're mixing apples and
> oranges here. The current values of "subconnector" typically describe
> the lower-level protocol tunneled inside DP. For instance, VGA can be
> tunneled inside the DP cable when using DP =E2=86=92 VGA adapter.

My opinion hasn't changed: I think this should be the USB connector
with proper DP / DVI / HDMI / etc. subconnector type (or lack of it).
In the end, the physical connector on the side of laptop is USB-C.

If we want to make it different from GUD, we might want to define a
USB-DP connector type (which would also include SlimPort).

>
> However, in the USB-C case, DP itself is tunneled inside USB-C. And you
> might use a USB-C =E2=86=92 DP adapter. So it's not really *sub*connector=
, it's
> more of a *super*connector, right?
>
> I think [1] is somewhat related, since it also allows user-space to
> discover whether a connector uses USB-C. But relying on sysfs to figure
> this out isn't super optimal perhaps.
>
> [1]: https://lore.kernel.org/dri-devel/20221108185004.2263578-1-wonchung@=
google.com/



--=20
With best wishes
Dmitry
