Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C640976EEA1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3310E627;
	Thu,  3 Aug 2023 15:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E62010E627
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:50:00 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-cfcebc33d04so1161525276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691077799; x=1691682599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+4Wzr5DVMlZc1pH6QeuSNiApXly7C56WNxj8x1bVeY=;
 b=gzhMq4KPHvG6ZhunE/V3Y0xg8sylBue0aRsl06ODKlaEdf3szqY3SrKaupRovtgbEK
 gKga/H3lpF5ch1m5g1NEqcopsbgdHkGl2WoU7JzehexLVIizdIATMrp2SFRGWJruTrgg
 UBpbPjc05NN313xxV3WERtnbE/ed1k0uf4DrRFCRJd0+CPiz8VPjLjOBvAPxK821Flhk
 e4owjgBBtLtSqSibLWbbtcOCQ7uf7nzrlQSmj8ZdqZ1Ja+buMt93gdzCs8MLM3T48sZc
 WdO4MuDaut0np4XNQJx7tR5vIYqV3rSpdNmLkqisODn+QLJbe6KUROS5fwxkIpvd+kUL
 mNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691077799; x=1691682599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+4Wzr5DVMlZc1pH6QeuSNiApXly7C56WNxj8x1bVeY=;
 b=GjOpF5HZ8lp1JiYcxM51KaMHmjG5hL67h+Y3XSjqLvG4J7DP4nGG216AcRWQGnCrvV
 aCZHoiKpDaeyZV5fzW4qbBmiGu+dZdQYMLaKoGOxVufw500buWNvxTuxg1XqJqRdX0Mf
 QkAQKe31J+Hl/0pk4V2eZ1BnZ4rST4vgn3MyEeNyrPKkiORZWFICz/H8sl2snKlTyNqo
 0DUtM6+BKmTZ2cq2uRe+COrHiMyMZWh2iFlirfx8/N+/XBPQSt0/kEdFtfpv+wGYIw8R
 JE5lgNY0M75y8zbQUHrF9eDn3ygpqTTe2nQC74d3re93YIAyZn/LoneA3Uhh82CbM7ks
 xPug==
X-Gm-Message-State: ABy/qLaumxE86aV3JzE9LGXvLQ70VeimNFjX9IgOGyzoiabsLs3pTb9f
 c447qFHV+HAiBVtQX9qRVo4ZlPSEUvk1pNMuQt2aCg==
X-Google-Smtp-Source: APBJJlGqe5OwfFXTkIX8KjflNZxLCJaBlCJcozkLSMt9bNI1VvyZ4ueyHK5KDKBhNWN4ugZ27MKACXtQew4zW6psAas=
X-Received: by 2002:a25:2386:0:b0:cae:d40f:5934 with SMTP id
 j128-20020a252386000000b00caed40f5934mr18670211ybj.27.1691077799474; Thu, 03
 Aug 2023 08:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
 <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
 <CAA8EJppCECObEe5UG3LsHUsmYfKzakWzVw33S4nVc=DB9sA0ig@mail.gmail.com>
 <C-Fu9j3hts_YcQxukEbidrKyTdqYNxYuWUX-694HnmYKiJGZip24s6R8-dULdTvb2VE972he3PZlju2K9wFNkA9j-XKUGemuWiFLGT1eUu0=@emersion.fr>
In-Reply-To: <C-Fu9j3hts_YcQxukEbidrKyTdqYNxYuWUX-694HnmYKiJGZip24s6R8-dULdTvb2VE972he3PZlju2K9wFNkA9j-XKUGemuWiFLGT1eUu0=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Aug 2023 18:49:48 +0300
Message-ID: <CAA8EJpqvTV8yhf-xC5vbRuzhNjQ2qp5yxhTWWN6AdxX1-+JszA@mail.gmail.com>
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

On Thu, 3 Aug 2023 at 18:43, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, August 3rd, 2023 at 17:36, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:
>
> > On Thu, 3 Aug 2023 at 18:31, Simon Ser contact@emersion.fr wrote:
> >
> > > On Thursday, August 3rd, 2023 at 17:22, Simon Ser contact@emersion.fr=
 wrote:
> > >
> > > > The KMS docs describe "subconnector" to be defined as "downstream p=
ort" for DP.
> > > > Can USB-C (or USB) be seen as a DP downstream port?
> > >
> > > To expand on this a bit: I'm wondering if we're mixing apples and
> > > oranges here. The current values of "subconnector" typically describe
> > > the lower-level protocol tunneled inside DP. For instance, VGA can be
> > > tunneled inside the DP cable when using DP =E2=86=92 VGA adapter.
> >
> > My opinion hasn't changed: I think this should be the USB connector
> > with proper DP / DVI / HDMI / etc. subconnector type (or lack of it).
> > In the end, the physical connector on the side of laptop is USB-C.
>
> - Even if the connector is USB-C, the protocol used for display is
>   still DP. There's also the case of Thunderbolt.

Yes. But the connector type is not about the protocol.

> - This is inconsistent with existing drivers. i915 and amdgpu expose
>   DP ports for their USB-C ports. Changing that isn't possible without
>   causing user-space regressions (compositor config files use the
>   connector type).

Yes, I know. Consider my phrase as a personal opinion or minority report.

I think that using DisplayPort for USB-C connectors was a mistake,
which we now have to cope with somehow.

--=20
With best wishes
Dmitry
