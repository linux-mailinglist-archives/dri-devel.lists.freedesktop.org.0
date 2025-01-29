Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7AA21B10
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309AB10E04D;
	Wed, 29 Jan 2025 10:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="piDthlIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6687910E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:40:06 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso556932e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738147204; x=1738752004; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vyooTYkohgYua0GBErn7xjGDeIZbWcfbmQSP4ECylwA=;
 b=piDthlIfBnuL0QB2m59C6n9KvbnHlrHGtqb+E7tnd2rSCAoxReR/UTsV6Wm8bVkFxt
 gxhcxlQN7vH7ZwpJCA8Ybw635/Bb1rVs7cKinL8kMrxUJcoqUtsvL4YLObv+YfNgNszs
 8QUTAyhcSbzmXvYFe939D84p5GXi9QVhMqZ0n3Q+FKvH//QLJCGid0o4ESk5P1RkHMJI
 yrUm4Ys19C2p1nBgM871SQ6BhnnqjO71DblZa4KLYawrhDArKEi8iISLTA/N61xn63O1
 AgRydeyFtAz1abuBkKAL0oG6aaYLpDRE6kZICHrrdGcZbx3wNDLqKOfGMxtwrX8D/xya
 WW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738147204; x=1738752004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyooTYkohgYua0GBErn7xjGDeIZbWcfbmQSP4ECylwA=;
 b=kymx1YUUcdFPjfs2kEtKjHPru0Zcbkglv2Cqk2eA39b9lpJ6968qybTYbnXrOjSmc4
 pRZzhcLCJAWMuoaQbkN5F8vL02QWYfHTHCyV7+IzPxKTkpBxUfh6jHm3TyYzeNaiUtp6
 sEK8/zjOXQH8Otwyb3uDfs8ReWEsjtv7c1OVNLCRzgPapBHpX7vKPWz90Gw9rg/UgG6S
 ossGsNynD3Dwgv7EuX9PUaWwDxaK7QgSZifyFJujmZ8vXuvklf2ZEK6Q/De3h49rziYi
 xgYU49J/Qr3E9oD/I0AQNTn2JsBNZvnjC+hof4Ysopj6CjcYTz80IEY++eeuCHjx7ylC
 tceg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX6/TwLcSCA8LAzrO5hLsXQGrwAyIGkxqkdEN7CGSuf/xwUubtBRuan7as4zyHH9jXcbAECJLTGms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcpXVCSQlePdvqKespKvSy3zl16wGXTJEuIuyRbRtWIlXtSVTC
 GvTYHw2YBsxOSycDLGt+NtVsnRl4N4p2UQBL9NZQpD/7/TbyOukuIaS63UIPYH8=
X-Gm-Gg: ASbGnctBPSLWFon9RfwKTL7bWbpHQ1w/NjdFpIbZVeQd/RA9xj7laIpXa5JtvDQMEHF
 UUXGStptLQj2Sydr2IzkQkmqdjg8fHDWP7SXVdco4EP0HTObFYTmafnqQoH84ldKcjAsZ6Nb/mg
 14q67RZmRPrqOn4PuLeXbJMeCy9g/ReKUXIIUNYeczmH+5bAn9aG3bC9T1HfGEj2gh2LR8Yk2WJ
 NKGhfRpllm6EJb8iJhlwhOl5T4rly17fGAL8wKx308OTBvjeMPHPL2DNIP4Jp5+jMQZvGiyg8KM
 r+kJ1kyfpoBbC1oGsq0cU0vo8QCwARLQ7xKmTFousEyocRlB/w+vD0n8115wH9XCwUvwSJk=
X-Google-Smtp-Source: AGHT+IEz2Qy0OdKT7BD14guLqtxkS8/XNT3Iqa+7CbyOJev2OlqK+JoJiYooOG6A556WOHQP1LCrpQ==
X-Received: by 2002:a05:6512:1293:b0:542:99a7:b415 with SMTP id
 2adb3069b0e04-543e4a112b7mr1169518e87.0.1738147204528; 
 Wed, 29 Jan 2025 02:40:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c83799d7sm1955517e87.170.2025.01.29.02.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 02:40:04 -0800 (PST)
Date: Wed, 29 Jan 2025 12:40:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
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

On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
> >> For any remote call to DSP, after sending an invocation message,
> >> fastRPC driver waits for glink response and during this time the
> >> CPU can go into low power modes. Adding a polling mode support
> >> with which fastRPC driver will poll continuously on a memory
> >> after sending a message to remote subsystem which will eliminate
> >> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
> >> With this change, DSP always sends a glink response which will
> >> get ignored if polling mode didn't time out.
> > Is there a chance to implement actual async I/O protocol with the help
> > of the poll() call instead of hiding the polling / wait inside the
> > invoke2?
> 
> This design is based on the implementation on DSP firmware as of today:
> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
> 
> Can you please give some reference to the async I/O protocol that you've
> suggested? I can check if it can be implemented here.

As with the typical poll() call implementation:
- write some data using ioctl
- call poll() / select() to wait for the data to be processed
- read data using another ioctl

Getting back to your patch. from you commit message it is not clear,
which SoCs support this feature. Reminding you that we are supporting
all kinds of platforms, including the ones that are EoLed by Qualcomm.

Next, you wrote that in-driver polling eliminates CPU wakeup and
scheduling. However this should also increase power consumption. Is
there any measurable difference in the latencies, granted that you
already use ioctl() syscall, as such there will be two context switches.
What is the actual impact?


-- 
With best wishes
Dmitry
