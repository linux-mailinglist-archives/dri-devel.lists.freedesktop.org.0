Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4411A6B5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0746A6EAA9;
	Wed, 11 Dec 2019 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536B76E9CE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 06:34:29 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id z12so18436208iln.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LnlhPhwrwhKWR1phS0Nm+X1oLAnw1Q6Ps2LzFwtjOXA=;
 b=iWKx872KPmJDhgFcf5COT7Op+IIuz8zU4qTC/GkfEPj+L4ny0kYCXvXcvnrF7slFtO
 tRTq8JfxBf+FgO4ZsVHcARsFtCGen0274loCE2qfu2jt8RQaJf4pniitusGBQ/Qk/+tW
 jxZRhZ6WiohSl8XkyFg4MVrs3mQIB4j7FmLHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LnlhPhwrwhKWR1phS0Nm+X1oLAnw1Q6Ps2LzFwtjOXA=;
 b=fkLk+mABtGnrZN5qKnraZnDW+PkvH++9/E9pa5YvIoAQZJafUrGPFHKXaBd0AdnTkv
 4cEctktNwZI5dY0jO8AW9+O/RgxMiYZaS5eWWLXjlSmVAgqW/YjdN9IxMRZFYM19DBHz
 +qiFmn/lyQN2m2kP4x+s2WXgYqlEBnzbQTKMCZITpM+D+4yNZGBoqJhwpa81YeuV6PWb
 L09ntb12ZEEa3Hoe2CNw3KAmhA5A85DHiWoSQBlH1fayj9bKYZy9c74E2fOQOv9SJWfA
 dFsN8liylr/krryVFZYxH20S1+6YQMSqHSZD2k2GHOYN7EvvKslJuTuqgn3268Uo3g82
 qshQ==
X-Gm-Message-State: APjAAAWPfuvELcx7hbGjoxidkmnGuYp+XaI+MF7Q2OEO6t/5f6PllC/G
 ztxwTN7+PrNal8osXKJqf8mP8OtIAEXB3YuxB/uiWA==
X-Google-Smtp-Source: APXvYqwyDUXZr0DPSegpq3sAtZxRx7aKRikChcC82VUiHoKa26vAu7iCTYDvSPxVVC1O1YVH3pzvAaJlwxGQZUvjaFU=
X-Received: by 2002:a92:d610:: with SMTP id w16mr1456477ilm.283.1576046068601; 
 Tue, 10 Dec 2019 22:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20191209145016.227784-1-hsinyi@chromium.org>
 <20191209145016.227784-4-hsinyi@chromium.org>
 <20191209145552.GD12841@pendragon.ideasonboard.com>
 <CAJMQK-hNSF-Vu4CfTKiCUdBRmaONf=Lp3NN0-nFor6mxY1seJg@mail.gmail.com>
 <20191209153238.GE12841@pendragon.ideasonboard.com>
In-Reply-To: <20191209153238.GE12841@pendragon.ideasonboard.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 11 Dec 2019 14:34:02 +0800
Message-ID: <CAJMQK-hMYodXFDWTGAXTOOG9A=12M7vvYooXA8yaD9L--G1qog@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx:
 support bypass GPIO
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 11:32 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
Hi Laurent,
> You may have used a proportional font when writing this, the | doesn't
> align with anything using a fixed font. Do I assume correctly that the
> hardware multiplexer is actually a demultiplexer with one input and two
> outputs ?
>                                      +-----------+
> +---------+         +------+    /--> | HDMI      |
> | MT8173  |  HDMI   |   -->| --/     | Connector |
> |  HDMI   | ------> |--/   |         +-----------+
> | Encoder |         |    ->| --\     +-----------+      +-----------+
> +---------+         +------+    \--> | ANX7688   | ---> | USB-C     |
>                                      | Bridge    |      | Connector |
>                                      +-----------+      +-----------+
>
Sorry for not noticing the font issue, this graph is correct.

> > There's a hardware mux that takes mt8173 hdmi as input and has 2
> > output port: native hdmi and anx7688 bridge.
> > If gpio is active, we would like it to go to HDMI.
> >
> > Previous approach is to make hardware mux a generic gpio mux bridge,
> > but this is probably a very rare use case that is only for
> > mt8173.(https://lore.kernel.org/lkml/57723AD2.8020806@codeaurora.org/)
> > We merge the mux and anx7688 to a single bridge and leave this as an
> > optional feature in this time.
>
> I think that's a better approach, at least at the DT level. The HDMI
> demultiplexer should be represented as a DT node with 3 ports (one input
> and two outputs) with a control GPIO.
>
I've resend the original gpio mux driver. So for anx7688 there's 1
input and 1 output.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
