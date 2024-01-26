Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2383E17B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D2810FD3E;
	Fri, 26 Jan 2024 18:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D0B10FD3E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:29:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3394dc75eadso711523f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706293700; x=1706898500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MysLpERkz0mzZyPK1tFCO7q3rwancbhx+xp7RkPmWr0=;
 b=aWKL96UQrPzN8GfKd1iDE3Ke5QEq+5nTIdZBFTpF1nU1gZ/KUMH/y06CpEbtMNGJbC
 FCpiCdcQzeqRWKiYZXP1UVgggHLJvEx3OFDY7tb487/cQrwr2ecDZI07Y/3KodCj1whq
 GC19QDHWn/y/aMoTBM+la0vYhLOT3qceMkgjSbqEsgOxlAdloJ56WADeluaQkhJaf0ye
 wZTqMxQ1DMo/mzJXA4nyg/vZe3f7S7isudz9UKV2NyZ6RHAj/zMQKvC6k0d5/ouhZVLO
 Pi52veBo1Wto7eXhaG9N11aa6MxyMyDVaU6jqtEsQDQaWTMn6SagYd/C/Vcrc+i0lHqs
 IjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293700; x=1706898500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MysLpERkz0mzZyPK1tFCO7q3rwancbhx+xp7RkPmWr0=;
 b=avcEaPswajwA+lHQN04tj47LqtvWE9UV9geqzEiRVxyTrjJfIRW+I55c1s2bQawRXX
 j3IinIIVOzNzADChpuvjBAP+KKO0u9pr+iXWmvPXq9kGe+3p1gbfD84EERoXlwDxivN/
 yboTSEMjLsABW0HRmQKF60ouMcIs6R6/JX0xJHeg1EZUIhV7NCGGN3l5PaGQEVuDpWBz
 4Z1RDLTKQnOa36IBgGgabwNgGdBSfpxfFeAvbEHHsK92gxldLno9Un4KkvM3oKKnCCRY
 T5LlmvjjLPwUv5p+Sb9EYSep7+WFyzlUWY5wW4GFU490UbaOHZUR+oA1yrvW+r+SRa6F
 uRQg==
X-Gm-Message-State: AOJu0YwZ0KUJFOebZ50pdSdtCzM4cKincJjsIaTxUhV+gNYn/a10wHy7
 RuMTIeT3O0yhiFg80ASVFrpjQjROrZC0CTNli+zLI2QLj/4f9l0A0FC+fDFYEdcC+hCApPaumQP
 da8RupSXXRtOv0bqGRjCXcGmURzM=
X-Google-Smtp-Source: AGHT+IEEhVmrRyoykZVvxdyf0Rsy3n7egR71cs0hFB7bUpUdamL4pmFk3FBlb8VywPeR6ACbGwR0Crk0G7VNN/sKmyo=
X-Received: by 2002:a5d:55c5:0:b0:339:35a4:7cab with SMTP id
 i5-20020a5d55c5000000b0033935a47cabmr35995wrw.116.1706293699251; Fri, 26 Jan
 2024 10:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
In-Reply-To: <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 27 Jan 2024 04:28:07 +1000
Message-ID: <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
To: Inki Dae <daeinki@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <mwalle@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just FYI this conflictted pretty heavily with drm-misc-next changes in
the same area, someone should check drm-tip has the correct
resolution, I'm not really sure what is definitely should be.

Dave.

On Fri, 19 Jan 2024 at 16:37, Inki Dae <daeinki@gmail.com> wrote:
>
> Really sorry for late. Will pick it up.
>
> Thanks,
> Inki Dae
>
> 2024=EB=85=84 1=EC=9B=94 9=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:50, =
Daniel Vetter <daniel@ffwll.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>> On Tue, Jan 09, 2024 at 09:47:20AM +0100, Michael Walle wrote:
>> > Hi,
>> >
>> > > > Inki, are you picking this up? Or if not, who will?
>> > >
>> > > I can pick it up but it would be better to go to the drm-misc tree. =
If
>> > > nobody cares about it then I will pick it up. :)
>> > >
>> > > acked-by : Inki Dae <inki.dae@samsung.com>
>> >
>> > Who is going to pick this up? Who has access to the drm-misc tree?
>>
>> Inki has, so I'm assuming since he acked he'll also merge.
>> -Sima
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
