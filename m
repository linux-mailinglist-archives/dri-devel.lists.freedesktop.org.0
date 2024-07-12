Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75C92FDE6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 17:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5DB10E045;
	Fri, 12 Jul 2024 15:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Kvd+ZpD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE5C10E045
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 15:50:53 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-44926081beaso12530061cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 08:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720799450; x=1721404250;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iG5A4YXtzS1gv1mDoqU9AHeDK5e1XcR6A6PUMNeVCio=;
 b=Kvd+ZpD3n8r5T8kr22sAI2BHKXL/y1th6uXwzhOo5gmCmg7d8U/hojsyHFF2Yl4ezp
 VREV6s4gdON1j83qB5z99OKw2DMzFewIYE41MvI3qBPIAc5kqxtXgsONwoaa+6Pwuqu9
 cqapIOXlh8qsdVLgH06EMJFFpvJltqN0tho9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720799450; x=1721404250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iG5A4YXtzS1gv1mDoqU9AHeDK5e1XcR6A6PUMNeVCio=;
 b=M2KvFjWKBDUDecoybv8CdQJA9cX2R2RGK9mFWPdnFysWjQ0jO/dMcN4nhUUohKn9LU
 OvFP56F2pdNRA7Ytg7V48sDiA6kerrjs+h1qVF/eF7on2meFU3Zx7hqMv2e8Fkr2qEju
 UFizswNXAK5qL56yDxYkulT60Z9LdjQMruIVVYdzf4IdpaPHUIhcOPTLSJyJ8b1t15IU
 /30L5KoUCYbwgQgV5MN8ugItJYQ2TrgTtYCacBvFTiMU5WUG6gkqL4gng8C7REvykOXV
 XeJQrr5rzAcI13qypxSYOdkk0D/u8Yaw7tN94LvMTxd5K5Qm2TVSRwfLaNRLze45OvR9
 kUSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVpbeq1CrBdG538+Wq0T6f2ZYoLpcl7Ee95zUl8yCKGrmSNBj30cbsA8F7bwuanLso3sDA7bk1cysQRQRGXuiFbv7IANsz+wndSgqBiTFx
X-Gm-Message-State: AOJu0YwXXSutQmhjFc91SDtBa9lPOtGKkE4T3su3aK11qiXD3igthEM+
 924XHNvcfMlGi6ujzMucHEyDIye2aucSehKYyGFfPPI8luVTs3O2OEG3RhCbYB0uULqjPedmqM0
 =
X-Google-Smtp-Source: AGHT+IESSY4mXndjDXJoGSO9f1sXvesgQdvzyn2uzhqGZ4kHbfu37tjXyEGjOduz/GAwoDI8LgNd/w==
X-Received: by 2002:ac8:5a56:0:b0:446:390f:b06f with SMTP id
 d75a77b69052e-447fa8c90eemr162202011cf.38.1720799450178; 
 Fri, 12 Jul 2024 08:50:50 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9b5120asm42093671cf.44.2024.07.12.08.50.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 08:50:49 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-447df43324fso263151cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 08:50:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPhzTfXP7T3gR8CozDfkSvVcxH9dcNzM3qnT4RAUXlAGELbkaNuAbesuB+3w/qAKuQ8ON6c/uYGQyuLToOq1SrNiadnDCAv2a3EThFfXX6
X-Received: by 2002:ac8:5dd4:0:b0:447:eeb1:3d2 with SMTP id
 d75a77b69052e-44e9e6589afmr2940221cf.27.1720799448329; Fri, 12 Jul 2024
 08:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
 <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
 <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
 <D2M42ODWQPAU.I0BMEOLKUP29@kernel.org>
 <CAHwB_NJ+YEMoL18Sr9HFmTVH_ErDztyF7vxxPFAE0Y2ta3dO0A@mail.gmail.com>
 <CAD=FV=VNx5qEyWDvVz6AVDryqvw09tkYRYMjbFuUQS4Wvyok6Q@mail.gmail.com>
 <4f3b24d6-9638-49d0-8308-00da09c7ed76@linaro.org>
In-Reply-To: <4f3b24d6-9638-49d0-8308-00da09c7ed76@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 Jul 2024 08:50:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5fYweYUoeYD=8qa_jTpF2P_ZjHKJrz0o3ikgrH4XJKQ@mail.gmail.com>
Message-ID: <CAD=FV=V5fYweYUoeYD=8qa_jTpF2P_ZjHKJrz0o3ikgrH4XJKQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
To: neil.armstrong@linaro.org
Cc: cong yang <yangcong5@huaqin.corp-partner.google.com>, 
 Michael Walle <mwalle@kernel.org>, quic_jesszhan@quicinc.com,
 linus.walleij@linaro.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Fri, Jul 12, 2024 at 7:56=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 11/07/2024 21:36, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jul 10, 2024 at 6:09=E2=80=AFPM cong yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> >>
> >> Hi,
> >>
> >> Michael Walle <mwalle@kernel.org> =E4=BA=8E2024=E5=B9=B47=E6=9C=8811=
=E6=97=A5=E5=91=A8=E5=9B=9B 03:38=E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>> On Wed Jul 10, 2024 at 9:12 PM CEST, Doug Anderson wrote:
> >>>> Hi,
> >>>>
> >>>> On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Michael Walle <mwalle@kernel=
.org> wrote:
> >>>>>
> >>>>> On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
> >>>>>> Break select page cmds into helper function.
> >>>>>
> >>>>> Why though? I don't find that anything easier to read. In fact, I
> >>>>> deliberately chose not to factor that out into a function. It's jus=
t
> >>>>> a sequence of magic commands, taken straight from the datasheet. So=
,
> >>>>> I'd like to keep it that way.
> >>>>
> >>>> The consensus of previous discussion on the lists was that folks
> >>>> agreed that we should, where possible, make it more obvious what the=
se
> >>>> magic sequences of commands were doing. IMO separating out the page
> >>>> switch command helps. Certainly I'm always happy to hear other
> >>>> opinions, though.
> >>>
> >>> Fair enough, but in that case, one should take the datasheet (which
> >>> you can find online) and replace all the magic numbers with the
> >>> correct command names from it. E.g. 0xff is the ENEXTC register. To
> >>> be clear, I'm not just talking about the "switch page command".
> >>>
> >>> As patch stands, I don't see much value, TBH. On the contrary, you
> >>> make it harder to compare it with the Ortustech panel datasheet.
> >>>
> >>> just my 2c,
> >>> -michael
> >>
> >> If all drivers replace all the magic numbers with the correct command =
names,
> >> it will be a huge amount of work (assuming that the datasheet can be f=
ound).
> >>   I am afraid I don't have enough time to complete it.  Thanks.
> >
> > Makes sense. I'd be interested in hearing the opinion of others in the
> > DRM community about whether they'd prefer to land something long this
> > patch as-is or drop it.
>
> I don't have a strong opinion, but I think only changing the switch
> page operations doesn't make a lot of sense by itself.

Does that mean you think we should drop this whole series? For the
"panel-ilitek-ili9806e.c" driver dropping seems fine since the switch
page command (and many of the other blocks of commands) is commented,
but for the other panels in this series IMO even just getting the
switch page adds to the readability... I'm happy to just apply patches
#1-#3 or just drop the series.

-Doug
