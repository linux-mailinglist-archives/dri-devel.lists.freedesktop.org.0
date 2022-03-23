Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263094E53FF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 15:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0EB10E707;
	Wed, 23 Mar 2022 14:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25D810E707
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:07:42 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id g24so2851399ybj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/7ZbYCWiVif9GBu4s2XUvjIkcvQUl6K4Hf9iSZ4zAtc=;
 b=74QifQtMTtn131sH0xLq5Tl+T/r1VrvyXbxA3+qpTar7JWF0NX/aXY+H4mjGWDY9/S
 YUt3VvTqsvTxnck6cqZX/tCbyVtGWAY1m7yuPSbWpJIQKe68Rjh32fZxBTIjICRpO3FG
 l6uRdBQ3vCTqUEym5IVZR0r9eE8kFQ3MbO4MfI63iPTS/63w++evEAfxjil5ka4ctcme
 WTHwTJTYrQ9l+3XC0IOBjrfgyeN2/C76C62R2flWbYns9nbjCHbOA+prZQUM5L470e6q
 r7OK0tZ5KuVHXV/r1ayXm864/JBkvc/KnFCW6ocmCRoc/KXgtFT+5cRgDY5/16zSUF9u
 G7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/7ZbYCWiVif9GBu4s2XUvjIkcvQUl6K4Hf9iSZ4zAtc=;
 b=YsgBb2gqIXXwKkwaERFKLaOlYve+Mo7K/IjmevHyvOv3cQ0c3W5C8eprnVR7x6o7Ge
 RSZu+nrEB3dSFC42+2NXpgatMhgqlksk4NQQLnt3K7OpD4HwEssaEtnizkmQn/IChLZM
 Lw+1AFO0Pq5Sw3DZMdmMBHwcgghHvFI9PHlm/xEc3dV8eDwRBlBVBp4XfN+3K6r8oV9B
 PG4wCk/Rlrx6U/AnvZt4OCWljB4DL038Dml3w7Wtso3Xuv6V3LTx75aVSJPh7+7EVYmj
 BXZxc4V0fUsqfurEFuV2vYZrdQQcdGI0BPJbMRTlbiqzk12aZS3Osmd2fmDEgttljspa
 nlGg==
X-Gm-Message-State: AOAM531MvYRnjVQp50/Mf5W7tXotrzjY0oNNPJNLRfA8F4B3L6sFURJZ
 89gYNrH882RT5dFK94fzG6ru6TrrlVm1PsyZ7yAarA==
X-Google-Smtp-Source: ABdhPJwU9SU6cd8ufDNN68NqrzLbhbdH+sboO+FrRycnWfi5Uz+BQ7WWGy7xlkgdgYBMpDCgvRJLC5g0mCYyLK4cXpU=
X-Received: by 2002:a25:e749:0:b0:633:93d4:4b66 with SMTP id
 e70-20020a25e749000000b0063393d44b66mr66929ybh.553.1648044461999; Wed, 23 Mar
 2022 07:07:41 -0700 (PDT)
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
In-Reply-To: <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Mar 2022 14:07:30 +0000
Message-ID: <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Rob Clark <robdclark@gmail.com>
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
 Shashank" <shashank.sharma@amd.com>,
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

Hi,

On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com> wrote:
> On Mon, Mar 21, 2022 at 2:30 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> > Well you can, it just means that their contexts are lost as well.
>
> Which is rather inconvenient when deqp-egl reset tests, for example,
> take down your compositor ;-)

Yeah. Or anything WebGL.

System-wide collateral damage is definitely a non-starter. If that
means that the userspace driver has to do what iris does and ensure
everything's recreated and resubmitted, that works too, just as long
as the response to 'my adblocker didn't detect a crypto miner ad'  is
something better than 'shoot the entire user session'.

Cheers,
Daniel
