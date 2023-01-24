Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C02678FBD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E48010E22B;
	Tue, 24 Jan 2023 05:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4451410E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 05:19:40 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id a9so17539187ybb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 21:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aajEhhXMmVsLvsRhsLFIHWTCer83l1wUnEHXjAc9R8E=;
 b=HXwn1ky8iT64aFx7McfTeeaiFLZbLoAJ3B9CEKlXlfz+ZIJPzk2W23dcFvmyfcHKm/
 /e1CKrRmP6kEOBWodZu2dJKR2oRUBcvo9MlAU1T1lqV/AV2amIqI71VFaPP0+mY3FaiA
 /x8RwfM5h4JAUDN56UjeDO00Cecdq7KGrX21h/aP+7/l2sjZPG1J8E62uOOTbvYC31dr
 m0ZdEYNY5CTl7cZqQnCupYNjrwq/o/wP9v9gjGfGEdUwvx82LQ4D2bkkGRiThX5nWRX2
 rbxvvO/oaio2bT6pDr3oTEmskoSdEM1K2HobUWF59zFD5BsXT0yKvPanPKIWuTTApNnA
 1/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aajEhhXMmVsLvsRhsLFIHWTCer83l1wUnEHXjAc9R8E=;
 b=cRceIEthkoTD+fTIGRFekX/E2tqt0NrtfpUQw8JZGfpGNBA4tf/q+9qNGtpS8rq4SL
 ilw2mA+FBkJ9/ZBTZv5u/yg9m766pyY++tXqGjQxhPKGb8JOS4AyJkAIW2JXSE5AomNR
 yaQNS5Oxe5yJudvQkUy58l/I1iA0ZkZxnX9gnobpq0ASV+wz1gjpdq/vYe3Q7N+O/2+L
 c8djHC9Vb3ourp70hdAiWktgzYQt0Q2I52sVXnI3wqgYB3Bd1/DlZc5uOpQxvKbeK9RF
 kIeRSkUU8wgeh6rLlIXQFbnPrXFA7cB8wyV3onVbCg0GZ3rSo3fmJcXOkMzUnhYHZEFi
 g9LQ==
X-Gm-Message-State: AFqh2kp58y/3bh8E7Ge8ximjtJ64wJjqvWXxgoc+aS1Yh12VGDTYr/Mj
 hv+1ZwNdHdQp0T1QJLHD3WIyhcHjb/M52ArjYpO1
X-Google-Smtp-Source: AMrXdXvQncnILbL8UBISoiDSpnnYYKPmxdsRjcxC8OI06Nei40MBcVTislakm2TngBoftXVs7J5nHk+E7v7/FzWgYHA=
X-Received: by 2002:a25:dd5:0:b0:801:7846:7e97 with SMTP id
 204-20020a250dd5000000b0080178467e97mr1160754ybn.49.1674537579258; Mon, 23
 Jan 2023 21:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
In-Reply-To: <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Jan 2023 21:19:28 -0800
Message-ID: <CANDhNCoVkq4pQJvtgmvJJe=68ZoQOdjYFkbGG-PXVujX1py4aw@mail.gmail.com>
Subject: Re: DMA-heap driver hints
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: James Jones <jajones@nvidia.com>, linaro-mm-sig@lists.linaro.org,
 sebastian.wick@redhat.com, labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 ppaalanen@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 lmark@codeaurora.org, tfiga@chromium.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 8:29 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
> > - I assume some drivers will be able to support multiple heaps. How do
> >    you envision this being implemented ?
>
> I don't really see an use case for this.
>
> We do have some drivers which say: for this use case you can use
> whatever you want, but for that use case you need to use specific memory
> (scan out on GPUs for example works like this).
>
[snipping the constraints argument, which I agree with]
>
> What we do have is compatibility between heaps. E.g. a CMA heap is
> usually compatible with the system heap or might even be a subset of
> another CMA heap. But I wanted to add that as next step to the heaps
> framework itself.

So the difficult question is how is userland supposed to know which
heap is compatible with which?

If you have two devices, one that points to heap "foo" and the other
points to heap "bar", how does userland know that "foo" satisfies the
constraints of "bar" but "bar" doesn't satisfy the constraints of
"foo".
(foo =3D"cma",  bar=3D"system")

I think it would be much better for device 1 to list "foo" and device
2 to list "foo" and "bar", so you can find that "foo" is the common
heap which will solve both devices' needs.


> > - Devices could have different constraints based on particular
> >    configurations. For instance, a device may require specific memory
> >    layout for multi-planar YUV formats only (as in allocating the Y and=
 C
> >    planes of NV12 from different memory banks). A dynamic API may thus =
be
> >    needed (but may also be very painful to use from userspace).
>
> Uff, good to know. But I'm not sure how to expose stuff like that.

Yeah. These edge cases are really hard to solve generically.  And
single devices that have separate constraints for different uses are
also not going to be solvable with a simple linking approach.

But I do wonder if a generic solution to all cases is needed
(especially if it really isn't possible)? If we leave the option for
gralloc like omniscient device-specific userland policy, those edge
cases can be handled by those devices that can't run generic logic.
And those devices just won't be able to be supported by generic
distros, hopefully motivating future designs to have less odd
constraints?

thanks
-john
