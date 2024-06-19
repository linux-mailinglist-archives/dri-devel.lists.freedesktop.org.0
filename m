Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DCB90E3CC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F03410E994;
	Wed, 19 Jun 2024 06:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aqOdXdyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3E10E04F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:51:35 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-633629c3471so40273457b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718779894; x=1719384694; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BPD4FH5Z6XYJ4s0wVL640UeHtQp1qf7sTtTQ8uN0s7Y=;
 b=aqOdXdyHvQxjZIo9wqvH6oOnOEG3c/QcARSq5oB54jv3k0Esb+XWZAUNKu3PJEd2DQ
 GkOayddkmlbiCQdzdgIMvZbWsUotD51DLLAwPjOtdyOhvqlJUvvlbqsUTB/GuEGnSDx9
 b4XCOOVbd6hVLiO9bcfN85PWjEcB8PyqtWWhZuItGrVA4gm5ywuL2iLOR6ti42jBUYhM
 +OkQTcj6I7tlqi3njYl4gdNia5Gk8VPpSgKVThqvLyS6KgmNCtyBf1S86e+Dlj9CGetr
 LXmX3gI44m9Hb09VN5f+2RzWfaGxOV3V1abFDTSKp566QZYGzu2FPQmk1AREzHxCbliF
 ZhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718779894; x=1719384694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BPD4FH5Z6XYJ4s0wVL640UeHtQp1qf7sTtTQ8uN0s7Y=;
 b=Z8e3ax9WzmqE/IHAiR+txSJuw8NAt0/yxOwna117ivrFLdAsKEsMUlAMg6kNLovGAC
 gw9kpQAa1akLt5tSF+aweiAusqSY4/mbmKnji7mlq288L8e4EMS8T30Im6AsRgvX8am8
 OHOYVRS8zpnFGI/jUtjRaYNZQQsOh5p2omAtLsQHQxJlJs49i8wmfeRheC5q++72c75S
 okvPXv6jNnQ6RO7zKcIRKrUROTlibEWVExTGfgCbkZhUmUvxxaaEFe9ibPyyY5V6cAWf
 ksL3BWYATEHC6e//Wnjhd0nXpoYo33wlQBwSeQ7uzbD9ZbE7jY+TMZ4ZpLX3hWSNU46j
 TBUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUietSSTKd1rc4pciGOxGTHj20zjT34zM8jKZwMVEr+7Ojdao5iw2y1Ye3yR1DLyI24NbMDxlc4orTJY4SM/rRdunAgUogk88GCoMdgGliI
X-Gm-Message-State: AOJu0Ywc64a6abvYRuxcup8tY2DS+sAsJCTAD95/D4EMQ7dWLQGttGyz
 M++MhWzghL6/Q8/R1h7jX7xKSJT1YuWsxuaCzVV5k5Pp8/ZwgPrGNoh9uERWozP/GbVqEfhIOp4
 e2/t05y8yvYa27Gj9UYjeqrIoIUCLxb5DaGt8+w==
X-Google-Smtp-Source: AGHT+IH2XcE/dBnfT1RjnglTzPe2luoK+sxDcwp43Ihj/fpPq/iIsZC1LxBJiupwY0hsNWfYczw8I/tF38tYTVAvwO8=
X-Received: by 2002:a0d:e810:0:b0:632:5b24:c0c with SMTP id
 00721157ae682-63a8dc08affmr17737217b3.5.1718779893073; Tue, 18 Jun 2024
 23:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
In-Reply-To: <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Jun 2024 09:51:21 +0300
Message-ID: <CAA8EJprOf9vvdBcdX=Xem3UMFo2pmh37ooreqRX0Bzvadv_yTQ@mail.gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, 
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
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

On Wed, 19 Jun 2024 at 09:45, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 6/12/2024 11:58 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> >> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> >> to be added for PD notifications and other missing features. Adding
> >> and maintaining new files from within fastrpc directory would be easy.
> >>
> >> Example of feature that is being planned to be introduced in a new C
> >> file:
> >> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  MAINTAINERS                          |  2 +-
> >>  drivers/misc/Kconfig                 | 13 +------------
> >>  drivers/misc/Makefile                |  2 +-
> >>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> >>  drivers/misc/fastrpc/Makefile        |  2 ++
> >>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> >>  6 files changed, 21 insertions(+), 14 deletions(-)
> >>  create mode 100644 drivers/misc/fastrpc/Kconfig
> >>  create mode 100644 drivers/misc/fastrpc/Makefile
> >>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > Please consider whether it makes sense to move to drivers/accel instead
> > (and possibly writing a better Kconfig entry, specifying that the driver
> > is to be used to offload execution to the DSP).
> Planning to keep the driver to misc/ only as part of this patch. Moving to accel/ might
> introduce some conventions to be followed which might require significant changes
> in driver.

To me this sounds like "we are trying to avoid following the
conventions by hiding in the shadows".

>
> I'll write more meaningful Kconfig entry in next spin.
>

-- 
With best wishes
Dmitry
