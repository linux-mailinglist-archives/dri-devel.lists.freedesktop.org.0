Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8386C814
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA910E34B;
	Thu, 29 Feb 2024 11:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UgjqIDsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA76110E34B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:33:36 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7c7c9846910so35635239f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 03:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709206416; x=1709811216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdwXQtCzfRxqJt2/JOnHMtt1+ULlsFGxa5d4NtRnE9o=;
 b=UgjqIDsMWtqXrv97sRfNCXEE6aNLxIC37EubXpjLviCDr88ZmgQdhN2iN+2Sm8wGtA
 5+7ywlaDEsCFqf3v9/4XMJ2e5PI3bogABKZA1iO0XHal7W+6XgHsr5JttYF8gHFHr38b
 Z083F8bz6h7BpUIMZ4QeVoWodn5+UJ4kJ2E52rLVVjDzc/Yz2eboyJvR8OwK7Yuav2gO
 IKwnmQY3xdwEl1ybQU7dQFTMnv2rUU7AsbDqk4hPP8YetGIZMzCF27ZQqNRcsWhDNbKw
 6boJha9xxihgZFydfUu7ZGuHKO5wX3I8RJDReOd2tEjYfQeqtxe6kf9WVcSR+0Zf1Fv3
 DFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709206416; x=1709811216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OdwXQtCzfRxqJt2/JOnHMtt1+ULlsFGxa5d4NtRnE9o=;
 b=TYTrZECp2aZxcs9U8axRnvzirMPEjtkcdKVTGhzFDCXY82jKo9De33BEzvw5eelrsK
 TD7gkGPbvsdFKZ1vWHOeYMhhdkQzk1wkC85uVcC7fYtVwqXqSm5cmOC2eIqyIeoFvF1T
 xdCBc6VjJzN1JQPBpoM6+fVA827xnI/HmxDw0StFBoBNi4lvbnRILK0+SsRctTAMjlfr
 Fwr0ZSERb0huFXWK9onW/D7HYdF0F0/AmFPTOdZXB9KZ1MGXtqNBWXlORjvYNr3nQh9G
 /5yXFSDDAjJQDoWdhUioWANWEnEE/enNgKIQ2bnK8DQOM7XJs4JjTViIF6pxeV+qbIhQ
 Qo9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEmAzoE/WzjFSjQHR7shl8jSyqmztQiJq6YHIjIDlCv3tV9BwRZCh9OxAfCXRkBW18lYEB28qSNQ3RPUmQz3MP7TxMDuPzMB34VppHH7Pm
X-Gm-Message-State: AOJu0YzCExcjwmBaWZlC1XOIEcZNy+QpWoFrEucA9Hr+qtwrRAiLvc74
 CCroOXtJH63LQz7iY5Fqxoc+FKESegZ2GN3s36qhdT8LJuMre3LgsVwVogaWcfe84uC+rr7z36L
 L3WMYReq/pUH2DJrrk+pjvTRhMYZgzxVjTnyJ
X-Google-Smtp-Source: AGHT+IEyR1QF0mvxlymN3UNZ9/6PJpld7SFPaZT8wcg31g8q4y/VVJDwXOdOLXwJcDBtzynOXQAaauZ5TcxpJAykKUM=
X-Received: by 2002:a6b:c98d:0:b0:7c4:9cb9:da3 with SMTP id
 z135-20020a6bc98d000000b007c49cb90da3mr1901383iof.1.1709206415733; Thu, 29
 Feb 2024 03:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-2-panikiel@google.com>
 <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl>
 <CAM5zL5qrMNfyiXMOJHUzLySm_U2U8kbD=D_Cyn0WjkvpikiYpQ@mail.gmail.com>
 <03f65fbc-9cf8-4347-8277-e53cb01b00a5@xs4all.nl>
In-Reply-To: <03f65fbc-9cf8-4347-8277-e53cb01b00a5@xs4all.nl>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Thu, 29 Feb 2024 12:33:24 +0100
Message-ID: <CAM5zL5r5JtA2HojaYZkSfUvoMTSNWALQM8HVuuXq-Znu7+TvGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of
 .query_dv_timings()
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org, 
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
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

On Thu, Feb 29, 2024 at 9:02=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 28/02/2024 16:34, Pawe=C5=82 Anikiel wrote:
> > On Wed, Feb 28, 2024 at 12:25=E2=80=AFPM Hans Verkuil <hverkuil-cisco@x=
s4all.nl> wrote:
> >>
> >> Hi Pawe=C5=82,
> >>
> >> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> >>> Currently, .query_dv_timings() is defined as a video callback without
> >>> a pad argument. This is a problem if the subdevice can have different
> >>> dv timings for each pad (e.g. a DisplayPort receiver with multiple
> >>> virtual channels).
> >>>
> >>> To solve this, add a pad variant of this callback which includes
> >>> the pad number as an argument.
> >>
> >> So now we have two query_dv_timings ops: one for video ops, and one
> >> for pad ops. That's not very maintainable. I would suggest switching
> >> all current users of the video op over to the pad op.
> >
> > I agree it would be better if there was only one. However, I have some =
concerns:
> > 1. Isn't there a problem with backwards compatibility? For example, an
> > out-of-tree driver is likely to use this callback, which would break.
> > I'm asking because I'm not familiar with how such API changes are
> > handled.
>
> It's out of tree, so they will just have to adapt. That's how life is if
> you are not part of the mainline kernel.
>
> > 2. If I do switch all current users to the pad op, I can't test those
> > changes. Isn't that a problem?
>
> I can test one or two drivers, but in general I don't expect this to be
> a problem.
>
> > 3. Would I need to get ACK from all the driver maintainers?
>
> CC the patches to the maintainers. Generally you will get back Acks from
> some but not all maintainers, but that's OK. For changes affecting multip=
le
> drivers you never reach 100% on that. I can review the remainder. The DV
> Timings API is my expert area, so that shouldn't be a problem.
>
> A quick grep gives me these subdev drivers that implement it:
>
> adv748x, adv7604, adv7842, tc358743, tda1997x, tvp7002, gs1662.
>
> And these bridge drivers that call the subdevs:
>
> cobalt, rcar-vin, vpif_capture.
>
> The bridge drivers can use the following pad when calling query_dv_timing=
s:
>
> cobalt: ADV76XX_PAD_HDMI_PORT_A
> rcar_vin: vin->parallel.sink_pad
> vpif_capture: 0
>
> The converted subdev drivers should check if the pad is an input pad.
> Ideally it should check if the pad is equal to the current input pad
> since most devices can only query the timings for the currently selected
> input pad. But some older drivers predate the pad concept and they
> ignore the pad value.

Thank you for the helpful info. I will switch all these drivers to the
pad op, then. Would you like me to prepare a separate patchset, or
should I include the changes in this one?
