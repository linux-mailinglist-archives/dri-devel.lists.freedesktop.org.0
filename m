Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5787741A9F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 23:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB80110E0C8;
	Wed, 28 Jun 2023 21:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B28A10E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 21:20:25 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-570877f7838so17557b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1687987224; x=1690579224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ekfb+8jnQjb0rMmjY0dUBWnVd1jyDWvH/VVzXj3W494=;
 b=R2n4QZrHf3/xwAib6xY0y711Iyw3WIznurApfcQV7ejZRUMS1k67mPtaIiPFIuLlXE
 8dPI3Qs3YD+aY7tIAVvyCNo/a6Fp2JkgIXSgkfBR+lOEcP3/gi5eLJ9SOor/KznLreuT
 4EDJNnAT0WZOS3KqfqAa1PXdzOpNc26ORy17cYTNalHr4IDvSFtlxiZdTwOaL76NJBWe
 HdCrxIXITAnjY8t23Nl4gEYynIp8HIhvmBR9FgEhmbBql0Bo5oNaY4lnnJys0XdVdr8E
 oKIqFC8ihWhsGh+RAKQT/00liaaxuwXfDVc9DQFwSYVUcBw2PasyeHrtMs7yo8nk7SSp
 DUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987224; x=1690579224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ekfb+8jnQjb0rMmjY0dUBWnVd1jyDWvH/VVzXj3W494=;
 b=HoEqZpQ95NT1FlOIy+eTVB0SzWSbuFmB/emYt7bx1OHlaHWGGjqh76fc3Q0WO82ZEN
 uEfiDgN6OBbcNeXSwaZahrSzeK3dsp0/fsV25w7bqW2hdLU7W42XI+FSw7qINBYQ2orP
 Wh13g51GJprDHF7c9UhQ4NQlXk8gowa9Jh+VHIA6H+SF2r6IDEeLPZtApPlao9ev7HZj
 lYz7t00tBqz1Xd2hwQJptrfv1LhdAekB2MPOPjeUqWXjl/Hj9qXoMtROwOzMXv1P09Na
 7p6ASR4RltyK68k4pkKaejphYWbq+29A7FyE+4UmsNC5wwsS7fds8uAuI2V6xF0U5rj3
 95gA==
X-Gm-Message-State: AC+VfDyvgCrPlspBXYOTTM7ww8Y0m/o7UOJrctJNQdJbJtFUGJC4eYS/
 dYN8NUSlBLp0CSTC2e7yIwhJllr3OHngFdIqZTtkcQ==
X-Google-Smtp-Source: ACHHUZ6D85D5C1w3H+xEQN6Qdcb+sVlnGnAqgw1jLsztz/k1XxsLPD3iC+7hS3DXqruaRS7h92OBnYdR5JvpawJr7xU=
X-Received: by 2002:a25:25c6:0:b0:ba8:296c:e59c with SMTP id
 l189-20020a2525c6000000b00ba8296ce59cmr30093218ybl.53.1687987224132; Wed, 28
 Jun 2023 14:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230628180534.31819-1-quic_jhugo@quicinc.com>
 <CANDhNCqUkhiWgjCuLVX=vpBsHYj9zto95HoBH1f4XqOEkx9Zhw@mail.gmail.com>
In-Reply-To: <CANDhNCqUkhiWgjCuLVX=vpBsHYj9zto95HoBH1f4XqOEkx9Zhw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 28 Jun 2023 14:20:12 -0700
Message-ID: <CABdmKX0A8mqz5cS4+CqjRgpQQKuSp=3SvE1KJ_di09VjJQVoGg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Liam Mark from DMA-BUF HEAPS FRAMEWORK
To: John Stultz <jstultz@google.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, benjamin.gaignard@collabora.com,
 andersson@kernel.org, linux-media@vger.kernel.or, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 labbott@redhat.com, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 1:39=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Wed, Jun 28, 2023 at 11:05=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc=
.com> wrote:
> >
> > @codeaurora.org email addresses are no longer valid and will bounce.
> >
> > I reached out to Liam about updating his entry under DMA-BUF HEAPS
> > FRAMEWORK with an @codeaurora.org address.  His response:
> >
> > "I am not a maintainer anymore, that should be removed."
> >
> > Liam currently does not have an email address that can be used to remov=
e
> > this entry, so I offered to submit a cleanup on his behalf with Liam's
> > consent.
> >
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 76b53bafc03c..1781eb0a8dda 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6168,7 +6168,6 @@ F:        kernel/dma/
> >  DMA-BUF HEAPS FRAMEWORK
> >  M:     Sumit Semwal <sumit.semwal@linaro.org>
> >  R:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > -R:     Liam Mark <lmark@codeaurora.org>
> >  R:     Laura Abbott <labbott@redhat.com>
> >  R:     Brian Starkey <Brian.Starkey@arm.com>
> >  R:     John Stultz <jstultz@google.com>
> > --
>
> Acked-by: John Stultz <jstultz@google.com>
>
> Though probably worth adding TJ as a reviewer?

Yes please!
