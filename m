Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18AF11BAA5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FD06EBA1;
	Wed, 11 Dec 2019 17:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897716EBA1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:52:26 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cm12so20127995edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 09:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EOLH9xGCIq9oFG6bGYcwxtab5R0yLdxQF2RKFwaOSEY=;
 b=QtS2DDWmg7esT/nYCWb3rscHFH/clJDFIgWAx22w2ai3YrtC8ZQhIe9JZZOUB138PE
 cqZMcOAuxS1zSq2Unve1xSUAHXyPunSq4s33+3vHBf4EEeogwhOqb6YUljDudVa07Ij6
 rhkqY9PQbXwVl7L+o3Ij6ET49Eyoe7RsSO6+1sLes0Aiegxs1jijTWc0rEqhT9B8R6fD
 jWEuQvqgWaC9QkEWb9wzB0+ngV7hNdllDBVt3LA/S9BSjxntOvBUyvyBEj/n4apirpCZ
 qY2ihyY4kpVNTXOoVq2j3ITU+GpJgRV7Vk8+Qjc9m+g3NDB9BjWrgmLH5Yu3VUM1inZ4
 VlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EOLH9xGCIq9oFG6bGYcwxtab5R0yLdxQF2RKFwaOSEY=;
 b=jrQKweajMgHA0HON7wJQYBiWNGBbeag/i+79a2imJWIsJgz2mwdRW3POqXumikwObr
 LuxVVjCSlpPjww17dRbhPqDhIjulNOxR54JNc6SvEzSZNiqVehuRIhj4KHoEbYFyPbvc
 3dc5QAnwNWT80SR04Xq+6thVCP/TM/n0cYCA36SakCWLY9C2xibSBmhZCpQkzYHIEhqF
 yxvNLZU0Vm3NyZ2oAcCUbhnHKEdxQHuJ+N/CKFhlRPEpSqE7fiqIki1b9k0ya5H2dBp3
 Vzpk1IZDxFhsF5e/tkIVHlEXYQfS1tfd6Mce/rM6x/W0RMcJO73Dcd17HPsCD+nkhnOa
 af4Q==
X-Gm-Message-State: APjAAAXHWbXQLxO1aobzx0Ud3E0dRrU7GpLzztnPnYLp6m2F6gvY4kBS
 h7SV/4+nBPzY177XmqGfdklb4BvYIQnjjRq8gik=
X-Google-Smtp-Source: APXvYqwacMwAWOGpTQKdLSDOz3XzoW/Cj4bB+7U0MWOvr3excbWCD/NOs+alqBf1oo3wDDLgUaeVQCEDNYwqJAO1vZA=
X-Received: by 2002:a17:906:2296:: with SMTP id
 p22mr4757180eja.269.1576086745026; 
 Wed, 11 Dec 2019 09:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAAaE5fP+Znp1O4t=M7bwor8FH=f-z9CL0wQ9NTjtLSwjFb0LoQ@mail.gmail.com>
In-Reply-To: <CAAaE5fP+Znp1O4t=M7bwor8FH=f-z9CL0wQ9NTjtLSwjFb0LoQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 Dec 2019 09:52:15 -0800
Message-ID: <CAF6AEGtpPoZK4FCSLN=285hRQihhEjaLZTO82eFdKmwYWQMSHg@mail.gmail.com>
Subject: Re: Question about MSM Driver
To: ggermanres <ggermanres@gmail.com>
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
Cc: Jeffrey Hugo <jhugo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 6:22 AM ggermanres <ggermanres@gmail.com> wrote:
>
> Hello.
>
> I have question about MSM Driver.
>
> I using Dragonboard 410 with ili9881 display. This is hobby project. This display from xiaomi redmi 3x/4x. I made PCB board for connect them. I changed dts, created panel driver (this all on buildroot with my config). All ok. Run platform. I saw linux console. Freedreno (opengl test app) is working fine. But I saw flickering like on old monitor I saw from phone. I tried changing timings, but this helped a little bit (I used it from dtsi from xiaomi repository).
>
> I think this is with vsync problem. Your driver support DSI_VSYNC input? In panel driver I sent command for vblank, on oscilloscope I saw pulse on this pin 60Hz. I tried find path in your driver code, added some debug output in code with sync. I saw MDSS_DSI_0_TRIG_CTRL configured with support TE. But Its not helped for me.
>
> If you know something, tell me. Or how change driver to support DSI_VSYNC input.
>

I guess this is a command mode panel?  So you'd be caring about the TE
signal?  As far as I understand (from, iirc, jhugo) this was handled
by the hardware and not exposed to the driver on older devices.

If it is a video mode panel, the problem could be different (userspace
not waiting for pageflip event?)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
