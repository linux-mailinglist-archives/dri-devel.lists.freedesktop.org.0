Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEC6ACD8A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 20:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEFD10E42D;
	Mon,  6 Mar 2023 19:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D9B10E42D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 19:06:02 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 0F51F2403BB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 20:06:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1678129561; bh=lYBdhg1YA4AwLrghglMHaM5tmPspIbQP7vnr3TspeGI=;
 h=Date:From:To:Cc:Subject:From;
 b=Oip7dB3xh8E+pU/LeqFcCSXF9045Rvtm/+v+aVsgla0XcOHYKXGTesCP5XYpMerhf
 FDJsQ4hOEwL8hIQuuWVPtuwbsqhyi3+DJb0Hv2oGIGgxYnu9chav74oZ5mu+N0mMPG
 WR9hGJ7hRlov2csEvy70VH9RtXfrknANJ1xvFyVWbe1laU5rWVwygJaU/epo9iDyKr
 L7NwJbSFbuRfOnLUKCRNcq81tmY1qc1NdGTg7l8QgYB6j+ywIG7lHgoLmqJy0Guhe5
 9CIQm6eOonIgXpkj0XBFSh9bJq1cej3qKg3LX+CLJbr14zByipwQiQ21JB7/LPGKwb
 1Rrpc+0Qn55wA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4PVp2H5dVWz6tr7;
 Mon,  6 Mar 2023 20:05:59 +0100 (CET)
Date: Mon,  6 Mar 2023 19:05:58 +0000
From: Patrick Boettcher <patrick.boettcher@posteo.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: IMX8MM: assign panel to mipi_dsi in a device tree
Message-ID: <20230306200558.5b40fa44@yaise-pc1>
In-Reply-To: <50f7516d-0057-8c8e-654c-f9b1b4176588@kontron.de>
References: <20230305162248.06ba45ab@yaise-pc1>
 <CAMty3ZA0m-CVdFsk5D55jEAkTCRPMbKo4YwzfKyrymM-98PO5A@mail.gmail.com>
 <20230305204555.293cd5e9@yaise-pc1>
 <50f7516d-0057-8c8e-654c-f9b1b4176588@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Mar 2023 09:43:22 +0100
Frieder Schrempf <frieder.schrempf@kontron.de> wrote:
>This is the NXP vendor kernel which differs a lot from mainline,
>especially in the graphics/display area. You probably won't get much
>support from this list as most people here (including me) would advise
>against using the vendor kernel at all.

Understandable, I did the same at the time when I was working in media
and DVB was still a thing.

>Probably they are working and probably you can get your setup working,
>too, somehow. But you would need to ask for help in the NXP community
>or elsewhere. The other option is to switch to mainline (recommended)
>and use Jagan's patches for DSIM support that are about to be
>upstreamed.

Thanks for your feedback. Unfortunately my client wants to stick with
the vendor kernel, so my only chance is to see whether it works with
upstream mainline and if so, at least I know the hardware is OK.

Why oh why do we have vendor kernels? In small-system's Linux there
sooo many vendor kernels. Very hard to understand. It's 2023.

The answers to a similar problem I found in the NXP community board
was: go look at the driver source and see what's wrong.

Thanks again for your answers.

best regards,
--
Patrick.

