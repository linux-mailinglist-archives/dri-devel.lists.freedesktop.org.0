Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5C924213
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D4410E066;
	Tue,  2 Jul 2024 15:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HD0mLVSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D7610E066
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:15:34 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-650b8e0a6ceso4190977b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719933334; x=1720538134;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNWhwi3BuKwIDlYJ+Eok6lmEciKDFhWO/KDN1iS7pU8=;
 b=HD0mLVSRCQs2EAFAb5fkIdyzRlih7bF1vrEU5cSTteW/51PxZXdiHij4XSw/T4JoZu
 NaRky+3/wEqMbS9GQzYDOOrIFu2hwDHDW8YoEQKSsUKZSm/PWc+4CqW/uI6gqWgCA246
 Hd82GuaxnY4iZ2d8ti8zTEQ52lzyA6kPPF4dxOgvER5j6Iqm4g3A1Dk0UFA4t1i32ScN
 4UD8MTZkaqmXZXBCMnH3K1mp2AwWq/kRwv/qv74eswHC33NBw3jsOqOqSB22L42j//3V
 3yoJlJoKpVg5Gv2naaTF3iRxF6xeskThrOtV6sBCoGiex65uuJS91gUeOnfBqvFZJKDY
 mplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719933334; x=1720538134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNWhwi3BuKwIDlYJ+Eok6lmEciKDFhWO/KDN1iS7pU8=;
 b=Meb5sUvDkHTTHR+eZRNNl2pubbTRU4CfKcOlI1Fv2NGVSZZyATMu4Q7pGdigsnTnjR
 yzNtV+R4SfcN3y8peipsiBcyilJjWBaox2z6WPYIYol8Y1iXzLI3B9jJwAQUrSSGvoYa
 l3ZNh3Mtj2/Hp37go5t/KqabCMeV4SYCpJ+QE/M5/pQXA5vgZzBcd5afM+7Gxu5EcW0h
 Qr2xhYJVVvaW1bTb5ZqOQTSxchD4h7Y52zExkW/5qdWrPo5RJug/sIkclcSORoGMByvx
 8zzHLp/xbyVEGr6ob/r+F3J3Pg8gTwGMFgt+RJTBTvAd6+7HqbrXx+WxyIh6zyOo+J7b
 7CyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyqZ0DOlWXLOIfBZ/Jlez3yBBGwKHbkRNMn7Sy+m0yvgF4YP5uXvvWy8E3DjkRDB6pucmRVlPlBPksEQozUqmyn0TWWbURv/hEG3D5FM6s
X-Gm-Message-State: AOJu0YwSzO13RXn1xPE/tRK9fUu0HHlBiUaQK135StASiGQ1/+s/1i4n
 /M4QCJkjv2yYbbTHcv/sJKvR6nIYS4e/7MX/JcwjJnO9SeVud5REHUbO0F/ZDMBWV7pT3hf3Y4u
 yWNXEBvS8coNKjxLxV7AMXdRiFPY/lmqJnsOi
X-Google-Smtp-Source: AGHT+IG2EeoEjGrNJPimBuxzgEbGPnYMmLCli/IQeFkWY+JfiCJPJ3fhsOk218T1gggIpWBX9AKMu5hfbJ1J9S3AKQI=
X-Received: by 2002:a81:ae17:0:b0:650:9799:41d2 with SMTP id
 00721157ae682-6509799460cmr10823267b3.30.1719933333549; Tue, 02 Jul 2024
 08:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
 <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
 <20240702064017.GA24838@lst.de> <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
 <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
In-Reply-To: <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Jul 2024 15:15:19 +0000
Message-ID: <CAJuCfpFCiUfpa45rG74zd-KoQcaA2fwgUw86iSF2CDiFrXCOdA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Christoph Hellwig <hch@lst.de>, Thorsten Blum <thorsten.blum@toblux.com>,
 jack@suse.cz, 
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Tue, Jul 2, 2024 at 7:34=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 2 Jul 2024 09:13:35 +0200 Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
>
> > yes that is
> > intentionally a define and not an inline function.
> >
> > See this patch here which changed that:
> >
> > commit 2c321f3f70bc284510598f712b702ce8d60c4d14
> > Author: Suren Baghdasaryan <surenb@google.com>
> > Date:   Sun Apr 14 19:07:31 2024 -0700
> >
> >      mm: change inlined allocation helpers to account at the call site
>
> Dang, yes, that was a regrettable change.  But hardly the end of the
> world.  I do think each such alteration should have included a comment
> to prevent people from going and cleaning them up.

Sorry I missed this discussion. Yes, the definition was intentional
and I will add comments for all the cases which were changed this way.
Thanks,
Suren.

>
>
