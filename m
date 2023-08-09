Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99039776863
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 21:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AE210E0FE;
	Wed,  9 Aug 2023 19:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B9510E0D0;
 Wed,  9 Aug 2023 19:15:41 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso2466461fa.3; 
 Wed, 09 Aug 2023 12:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691608539; x=1692213339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ih33D6tUiZAfLMClGioyRnGVJHXSceBJGFUENGWTcCM=;
 b=Sqvs8vImIOvNM0R/NJECHqrRWJcQXlzLh4iNYEVO6/4xd/JQdBmZVHvRc1yzJx8tj+
 DkQsb5BpJG1ZvhJkXFChG24teQ6ifDk2rs/a7sZMQF+l8Kb/Wsu36Vqqq6GC/BRnER3v
 ttuFeKNY9DHdMvEhu3z9la68E+7PIwFHSRFMQTl/i4fKjLqfKcIKkTU+now5G2zrgCC7
 a9INIUkGuz1hR/3LUKrgOkWcyu+cw2t/L+WCR1lFQt0n3pQn6DA5iIbVyACF9kWih4Nz
 7NuH/xOmuR26Tivw0nUE9k9+xTpXsWTM1v+DcY1ggv3owgEqhy0vbT4pZWaaP4FcSh9q
 +0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691608539; x=1692213339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ih33D6tUiZAfLMClGioyRnGVJHXSceBJGFUENGWTcCM=;
 b=D3fJ9ALo/bgqpo+qfZi/EdREwgYh05CeDowL+0nTL6YSVoxXWdq2rR4gbyansixJwq
 9AbsHRcJ8ivgG3X23+7jtveGVRU4oBPlP355L7cDByJQc/y6v/1hUserVuS6VbCUC1QT
 20te5uznFcBcPYxpZgH0REVjVRbpj5v1Rgc65DWyTdJVt4luedRbkuvXtRDBvrm3IzqZ
 d0Bjc758sdGPyLngRK6fu7D7es0d8/tH4vx20wNrKEF3AMVLfIQZxWV2l4iGNiJc1Gf0
 mijpbd/47wIf5dslH5OsDmveCZX/GbDDBf8n8MXWcoiFz+i4vAfuGa/T4z+83uWklJqD
 oFRw==
X-Gm-Message-State: AOJu0Yy2Bo2f21sy1qT/pN/goLyroO/hgYJpKoDhJf2Oo0zSrIDx4lbz
 J8+s3DKqR4M9vxB0SdQo8Nj4oxy4+yIG7O8/0Sc=
X-Google-Smtp-Source: AGHT+IFsP5OgaRMoPOM34vrjG64okHGUQOwTqcXiolOB6OqqEE7g0Qk8DFtykBiuzRS3C9+gSbCYObkNPd0iap0jm3A=
X-Received: by 2002:a2e:878d:0:b0:2b6:c8e8:915f with SMTP id
 n13-20020a2e878d000000b002b6c8e8915fmr103212lji.22.1691608539294; Wed, 09 Aug
 2023 12:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <ZMz3IXIzXS5gNK3G@phenom.ffwll.local>
 <CA+hFU4wbn=efbS10c14A9sLTf9GYJ_O12kowh76ELLdo2+x5fA@mail.gmail.com>
 <CAAxE2A48uybsU6DY+fLTzQ9K2b0Ln+SW6bt3capbGAGb7L8fvQ@mail.gmail.com>
 <3ca7a141-1385-351e-9186-00874e254165@mailbox.org>
In-Reply-To: <3ca7a141-1385-351e-9186-00874e254165@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 9 Aug 2023 15:15:02 -0400
Message-ID: <CAAxE2A5pgwb-xLDzr9XyMp-1k7oFUWR9X812b17LSb98RTFKhA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 3:35=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 8/8/23 19:03, Marek Ol=C5=A1=C3=A1k wrote:
> > It's the same situation as SIGSEGV. A process can catch the signal,
> > but if it doesn't, it gets killed. GL and Vulkan APIs give you a way
> > to catch the GPU error and prevent the process termination. If you
> > don't use the API, you'll get undefined behavior, which means anything
> > can happen, including process termination.
>
> Got a spec reference for that?
>
> I know the spec allows process termination in response to e.g. out of bou=
nds buffer access by the application (which corresponds to SIGSEGV). There =
are other causes for GPU hangs though, e.g. driver bugs. The ARB_robustness=
 spec says:
>
>     If the reset notification behavior is NO_RESET_NOTIFICATION_ARB,
>     then the implementation will never deliver notification of reset
>     events, and GetGraphicsResetStatusARB will always return
>     NO_ERROR[fn1].
>        [fn1: In this case it is recommended that implementations should
>         not allow loss of context state no matter what events occur.
>         However, this is only a recommendation, and cannot be relied
>         upon by applications.]
>
> No mention of process termination, that rather sounds to me like the GL i=
mplementation should do its best to keep the application running.

It basically says that we can do anything.

A frozen window or flipping between 2 random frames can't be described
as "keeping the application running". That's the worst user
experience. I will not accept it.

A window system can force-enable robustness for its non-robust apps
and control that. That's the best possible user experience and it's
achievable everywhere. Everything else doesn't matter.

Marek




Marek
