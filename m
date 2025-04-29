Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2AAA0480
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A6F10E316;
	Tue, 29 Apr 2025 07:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ANHS4qrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1E10E2E8;
 Tue, 29 Apr 2025 07:29:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4ac7so1581566f8f.2; 
 Tue, 29 Apr 2025 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745911760; x=1746516560; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nB16d46ObHB8u6nVtTntzLBupJconoj9kwzJ3jXfuGc=;
 b=ANHS4qrbHr3UuVzSaXDQvQmIZb3od+1LKvY59km5mQTWU4dGqpBrK2E5l7lzo/yzrH
 kMV7OB6hk+tSG+q52X0gc7eudlfTiISeB/7zRCmSzQQSVUL2ucfs9s3XpcFi76axHuin
 OCtDhJBN/opt0X/cBxKRnbsdJNHpV1UqRcYsK+Z8Oie0U6pBX/TtUv1X8Nsg7If2X3wz
 IrwrKNX0NgWqjs49HI95ytXmUwoRm5yfZh3AvyGSOsM9+SYrIQoFYA7Ef+k3KW7dstkQ
 TUZOKTyNwFYGYmeA5PyZPzYGpwu/qbU7aYPctOwG3C6p/G29gscNChkJJi4pT1WaV0QM
 NBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745911760; x=1746516560;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nB16d46ObHB8u6nVtTntzLBupJconoj9kwzJ3jXfuGc=;
 b=r+5re2cHuvogSin/Zjrqo7eI2D+7EkqpQlbm+Sv0QFNpWWFpoN1w+ed+2EEEYxZVq3
 v9MnnpOmemH9nbsBLc+l9nbjLJWcf/s22mJKlrXH2XFhC89t3zsM0ZlcIC0Cy7DwN0zw
 YHygJKErp//EY0nQAwTN9rUFx2zMVOBjB7gxVgD726twmVgivteoVPYD6Pspw8EvavBY
 xwww8voxilVntKCySC9D/fsuJKZpIB81FOoiEp3050iYiLdcO7cX+Vb4hVz0DBLmmOQv
 DMEyL7edMGtY75fyT1y3/oiY9SzEgdnAMCQ6g5YZG8I3UzYRbPERRMOzy/Zov6ImlygG
 DmjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZSfcKS9Nzcm3SmB2i9ObqkpkofaP32F+5PxVvtLB38hU0EB4hfPeHhLbg27NAn0RJjju3jU7wRsae@lists.freedesktop.org,
 AJvYcCX4sE1MxSTkjKhWtIhMM5Mi5jtb2rvhcBhPyttqaLd78HoHuiBiBJBbcPkBlWySqEu7N0rQxa5+OJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4uc/jlp4ks9GoGkm0sXjrjVzhtQtnjVEH/eSglMCHk70suJQQ
 i8pe/pbT8H+Eika8/8kDfFPokRwgLxG7InIAYTpsY9Ps2rgeUASbv/qkyNrlQcBCACaE+M5g0aO
 LGZm7UE3IH9jugdjFdfMzt32QpsFZZOqlU8Wp
X-Gm-Gg: ASbGncvV4SOoK/1XW3jYdQ7gEWfCzr66kIOQxWRVB6L8C9ylrIPMCQaImzxJvWrxgOE
 hhwmsHHxtLLc/e2CGWNteTi7/bo04CTeTRQmXBNHvEcz2wg5tnkoKNIR/pOKfZYLZMxQquqILGJ
 x5b+5z7zJMOvf4ybn/6gmWzA==
X-Google-Smtp-Source: AGHT+IGYH+/K1GZOU/QSl1r2kiF4KEFaj1inSbQnOFj14BW9qXm19tT4T3PO/rKmu2OgA58JjsRPNok7uGYGfI+sRlY=
X-Received: by 2002:a05:6000:144b:b0:390:d6b0:b89 with SMTP id
 ffacd0b85a97d-3a0894a3cbdmr2251940f8f.50.1745911759877; Tue, 29 Apr 2025
 00:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com> <aA+N8YHX0DZ6h9Uj@linaro.org>
 <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
 <aBB3ElgEoCF6yYNY@linaro.org>
In-Reply-To: <aBB3ElgEoCF6yYNY@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 29 Apr 2025 09:29:08 +0200
X-Gm-Features: ATxdqUG_WUVY9yNmdKHgJ7MZ0Rv5ZBxNNJhPW4Q15-XQGQ2pSpWhkKi8ojC-FfY
Message-ID: <CAMcHhXpstN-g5idywuJbUxeKNqMUTTV=HQ6qvo0_Ann+-mEUbA@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Apr 2025 at 08:52, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-04-28 20:23:45, Aleksandrs Vinarskis wrote:
> > On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > The change itself makes sense though and I think makes sense to be marked as a fix.
> >
> > Just to confirm, you mean to mark as fix only the 1st patch, correct?
> > Since it's obvious now that the currently present partial LTTPR
> > support did not break anything that used to work.
>
> Well, the way I see it, the LTTPR support is broken on some specific
> docks, even if it works in most cases. And since this fix improves
> the already working cases and fixes broken ones, yes, add the Fixes tag
> to the 1st patch only.

That is not entirely correct. Current LTTPR initialization [1] does
properly set LTTPR to transparent, and then non transparent [2]. In
this case LTTPRs are expected to be trained per link, but are not. It
is reasonable that LTTPR(s) may not work as expected, as they are not
link trained as expected, and now they are not in transparent mode
(anymore).

It does work with X1E onboard LTTPR and a simple external display, but
that is about it. It does not work with _any_ dock that has LTTPR. Or
basically anything that has yet another LTTPR in its way. Given that
max length of DP cable at full bandwidth is 2m, and docks typically
have 50-100cm built in cable for PC connection, not counting outgoing
video connection, this basically means that any DP1.4 and onwards
docking station (not an adapter/dongle) does not work.
Additionally, it appears some fancy monitors with Thundebolt/DP alt
mode ports instead of just DP alt mode also have a retimer onboard
(might have to do with particular monitor support DP-Out for MST), and
also do not work in current setup.
Additionally, it was recently found out that without this series, rhs
USB Type-C on Lenovo Yoga Slim7x does not work either, which likely
implies that IO board on the flex cable for that connector features
yet another retimer.

I wouldn't say it's broken on some specific docks, rather the other
way around, current LTTPR support is limited to 1x LTTPR onboard X1E
devices and nothing else.

Not disagrees wrt to Fixes tag, just wanted to clarify current state
and the impact of this change as it is not limited to just 'specific
docks'.

[1] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/msm/dp/dp_display.c#L378
[2] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/display/drm_dp_helper.c#L2926

>
> I'd even send that first patch separately to ease the merging, but that's
> probably just me.
>
> >
> > Thanks,
> > Alex
> >
>
> Abel
