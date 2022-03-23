Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDD4E54F9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0843C10E6E5;
	Wed, 23 Mar 2022 15:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B543410E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:14:41 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id e4so1948857oif.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bNVc0tULAlEL3lq7qM0pi1Z3xhpGC2YP3yK39iR0gdY=;
 b=hFZnoz5VX/RZIMTngFGU0Zgz3ZXQ6bPmBuiPQrwvkf8JN7njnKvBx9h0wPhWAyUTxA
 Na0wlJ5SyznY3W9Otys4QGTY1pCUgUhUg1dqJWHGiYZdELKiOlY1tBDjRqC0ww9sSdRt
 pCeKTJLh3a4Bcv1AlTxeR0Fsiojx9pUzKlruc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bNVc0tULAlEL3lq7qM0pi1Z3xhpGC2YP3yK39iR0gdY=;
 b=v9joKkwbIv7hq6s0KdFRqePpKXheS1fDHh2w0E98lKLDdBRZxjlS6/6NtTLWbBbWEU
 xWAvOygXuGpR+cAl16OrgH3zBGVDnAAbAbr8jWonkkFNWh7GBOIOvFJ3Wu0odoMbgLW5
 nyxZv7AIlvOuZQNv1kS3Y6MmzD7B1wnxCvVILJJTrklmXs0pVBis5olAWaXqeXS9RJoi
 8E8eSzbh91G7FTYh82ntHiwqvIUeCXKL2kwonjBLDnQ6nQwbFViIBMTZUlXlhu/jl0Ow
 3IkiRI01BwLZUlR9XhF3juxQ1zAkKoKxQWLUut4LzG73JjkjiPVAuOiT7jwRGJ27bvKI
 UGfQ==
X-Gm-Message-State: AOAM530ExG+aQSiiR0Plq0yUUn/71lXmDt/2kQLzXWqplcKblY/Rob1l
 M12ZFNtpktVixo+JbSVe3ThfnrPjYu3H1BZckKVYMw==
X-Google-Smtp-Source: ABdhPJwH8BAnZ5qNY+vtRKlL6eivNshSjTaNVuOFSKOE84nNFWnp/y6r6r29i06fwArfqg7409JYAqMfCw7xYBrSjUQ=
X-Received: by 2002:aca:1919:0:b0:2ec:b56e:692d with SMTP id
 l25-20020aca1919000000b002ecb56e692dmr4910920oii.228.1648048481005; Wed, 23
 Mar 2022 08:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
In-Reply-To: <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Mar 2022 16:14:29 +0100
Message-ID: <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com> wrote:
> > On Mon, Mar 21, 2022 at 2:30 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > > Well you can, it just means that their contexts are lost as well.
> >
> > Which is rather inconvenient when deqp-egl reset tests, for example,
> > take down your compositor ;-)
>
> Yeah. Or anything WebGL.
>
> System-wide collateral damage is definitely a non-starter. If that
> means that the userspace driver has to do what iris does and ensure
> everything's recreated and resubmitted, that works too, just as long
> as the response to 'my adblocker didn't detect a crypto miner ad'  is
> something better than 'shoot the entire user session'.

Not sure where that idea came from, I thought at least I made it clear
that legacy gl _has_ to recover. It's only vk and arb_robustness gl
which should die without recovery attempt.

The entire discussion here is who should be responsible for replay and
at least if you can decide the uapi, then punting that entirely to
userspace is a good approach.

Ofc it'd be nice if the collateral damage is limited, i.e. requests
not currently on the gpu, or on different engines and all that
shouldn't be nuked, if possible.

Also ofc since msm uapi is that the kernel tries to recover there's
not much we can do there, contexts cannot be shot. But still trying to
replay them as much as possible feels a bit like overkill.
-Daniel

> Cheers,
> Daniel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
