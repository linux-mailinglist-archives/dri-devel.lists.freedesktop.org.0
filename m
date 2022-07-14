Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9A5757DC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 01:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D46110FFF2;
	Thu, 14 Jul 2022 23:09:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDED710FF25;
 Thu, 14 Jul 2022 23:09:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y4so4272766edc.4;
 Thu, 14 Jul 2022 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=usiaDZ3+mcCOdGF0hiI8uf9gPAbOUG80jqOg1kR3mEw=;
 b=p7d2V2uQhBGsRRWHuwlCWx+fK13U3Kazk626LDZZUGxSW0NRD7ZQ0Qr/Ne+8GDR3JX
 jZgkHCZaH7dcr637RaQgA0ccBqIKDJGLqZJ2lLszox/oSW15Ppy5XEtL/MxAGPZE+n7k
 X8sF+uYvYWua/GEJA7yOQ/9us8em0dZhj2aoOpGuOXPeRWr3YrNshYyiO+7TGFJNc+gA
 inSn3m6XgpoXQGbwZvHS/AQoqaWBcmrzt0CrcW/1037FtKEBozaVs3bsX/+suBrYCiwQ
 YawrONGQQ8MUij5J63c4YIf59AXUW0XeFpA+8DQxM1ZCr7kjwvq0Q70iP5R26T8JAQrB
 KTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=usiaDZ3+mcCOdGF0hiI8uf9gPAbOUG80jqOg1kR3mEw=;
 b=blSIFcz6qR8zzUvIZPeZj2Kx8Jv2yvSZflGvFXmNtQEUQnPnz8XMQX4+nHgEcY9Qlv
 Btjui3oExINFm4B3lzu6Y70GYkp0nosb2HjJCMjJj41D5qdwAZfXUnfYBzhtaaAi+Y+Z
 t5CDTBlNM1SKju3YKcx00db5KCxjomV53sTaBiX6DfE8Umht3PoNJFh6pmM7lj1KuHpD
 ZLuos8vxpprIkMQ97ZueNN0u2Ucm7ZNeYstG6zn2bzHDuDoeriGyxkxn/6ZFANIQ4X7F
 yaVftSRLGvfeyPr18Bz5nUg3SeZNUMIpjG2bE5lnIxljieCa1VqAwE4YHQIg59Ws1nOJ
 qDWg==
X-Gm-Message-State: AJIora/zNeW4LaV8kd8WOf3LmyKYh/mS0Ij4BRiGmWuTXcj8Dc6VOzjg
 kx9QnryLidlyIi0NAqgCSG2ElYN1aRlH01BP6g2T8XFV
X-Google-Smtp-Source: AGRyM1uXlpXAN2IicBnnzFfzBcflF8VFT6ZA4YYUCPWYJaD2Tmxc9WAttOCWml6ZHj8EMsyYzWvVXrAcBrfxLdnTcEg=
X-Received: by 2002:a05:6402:414c:b0:435:1e2a:2c7f with SMTP id
 x12-20020a056402414c00b004351e2a2c7fmr15404449eda.132.1657840143181; Thu, 14
 Jul 2022 16:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220412225955.1802543-1-John.C.Harrison@Intel.com>
 <20220412225955.1802543-2-John.C.Harrison@Intel.com>
 <Yli4/8OIbjyRaQAK@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <Yli4/8OIbjyRaQAK@mdroper-desk1.amr.corp.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Jul 2022 09:08:51 +1000
Message-ID: <CAPM=9txdca1VnRpp-oNLXpBc2UWq3=ceeim5+Gw4N9tAriRY6A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/guc: Update to GuC version 70.1.1
To: Matt Roper <matthew.d.roper@intel.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <Intel-GFX@lists.freedesktop.org>,
 dri-devel <DRI-Devel@lists.freedesktop.org>, John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Apr 2022 at 10:15, Matt Roper <matthew.d.roper@intel.com> wrote:
>
> On Tue, Apr 12, 2022 at 03:59:55PM -0700, John.C.Harrison@Intel.com wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> >
> > The latest GuC firmware drops the context descriptor pool in favour of
> > passing all creation data in the create H2G. It also greatly simplifies
> > the work queue and removes the process descriptor used for multi-LRC
> > submission. So, remove all mention of LRC and process descriptors and
> > update the registration code accordingly.
> >
> > Unfortunately, the new API also removes the ability to set default
> > values for the scheduling policies at context registration time.
> > Instead, a follow up H2G must be sent. The individual scheduling
> > policy update H2G commands are also dropped in favour of a single KLV
> > based H2G. So, change the update wrappers accordingly and call this
> > during context registration..
> >
> > Of course, this second H2G per registration might fail due to being
> > backed up. The registration code has a complicated state machine to
> > cope with the actual registration call failing. However, if that works
> > then there is no support for unwinding if a further call should fail.
> > Unwinding would require sending a H2G to de-register - but that can't
> > be done because the CTB is already backed up.
> >
> > So instead, add a new flag to say whether the context has a pending
> > policy update. This is set if the policy H2G fails at registration
> > time. The submission code checks for this flag and retries the policy
> > update if set. If that call fails, the submission path early exists
> > with a retry error. This is something that is already supported for
> > other reasons.
> >
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Applied to drm-intel-gt-next.  Thanks for the patch and review.
>

(cc'ing Linus and danvet, as a headsup, there is also a phoronix
article where this was discovered).

Okay WTF.

This is in no way acceptable. This needs to be fixed in 5.19-rc ASAP.

Once hardware is released and we remove the gate flag by default, you
cannot just bump firmware versions blindly.

The kernel needs to retain compatibility with all released firmwares
since a device was declared supported.

This needs to be reverted, and then 70 should be introduced with a
fallback to 69 versions.

Very disappointing, I expect this to get dealt with v.quickly.

Dave.
