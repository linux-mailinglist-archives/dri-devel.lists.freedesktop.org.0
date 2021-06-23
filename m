Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CA3B1AE8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA19F6E8DA;
	Wed, 23 Jun 2021 13:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0E6E8DA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:15:23 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id r5so4079751lfr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yOpcYe1VImC2Ru3j1mAesgD8NLFGduXso588+LnpwWE=;
 b=aQRnJM1yCclqTGVTvhmY4RFqBfzPYZy676af5RSeub5reF6XCYAf0su79QLyByJiIe
 PdkRgVBkhK4jrTsiY4W7iPqV2yQ1FyYQeS62scFfMRYW1xbBgK0X6FA6SyvzzU4pr2Ry
 2hFqc3zEFy9+6D6MCotRMNRJgP99c81d9fEJJPgUBY8yGwIcaxjjlm+Ux56OreZS0uKw
 EJx+FsTfX1IED7myoNgesZlohn62Mf6NJv2K94cHX2F9K2RzK6jfjY5rC/IOGck7NHac
 DWNXigHBSgfdNjX1yJVOKbgCLxk7hB+VXZW8RiwjS8+5gT3yJ2Zq+doEKTucGRdP24BN
 Ff4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yOpcYe1VImC2Ru3j1mAesgD8NLFGduXso588+LnpwWE=;
 b=tHKkZXOYJ2EE1C9nki9VEMu/2Bi6mXOkVYO8QiMN6kt6sjpkUNwkBXvbuCIheO4C5L
 /SV+p12g77WUgn/zEmXAArIVUFbyoJt6hqqIsWdPBqcBnnqSJ/qRjus/JJJflPokI2Id
 Hrfv8zxPuAPGoEKv7/vAEdaXXjPYr3tEhajm8/B8hZi/zQ+bqj6tW5m51GdBdVzoLucA
 OPQYkUPd7YO9Kdni/+KQSbragjLbZUUQ4PcYG2mv6qBDAmKpwaYu99k9hLLT6h8Lusxe
 q7/dM5KHIS30Sc2RfUP1Xygs1tt3oec/N67L6OYCYuiXAGVMDEx9J7+Oa1Hx3uQrV3It
 iVIg==
X-Gm-Message-State: AOAM5325pTKPUHWaHYQsh+ar8N0/B3cjKDXuFBkkQFUv1ZKdhZPnuk4O
 wy8ws+TJLFXVeJbtfSFBt5X4+2FWUmYsnzvUgsc=
X-Google-Smtp-Source: ABdhPJzjZgNJWxMYRIckLoI3N2BfkhWGRVxcQmTYv08rmlJfHjLQ9EjDl8TKrpYZ2UfzHHkgdXzOQL4ENANxeVfhHT8=
X-Received: by 2002:a19:4345:: with SMTP id m5mr6892671lfj.599.1624454122461; 
 Wed, 23 Jun 2021 06:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210610122550.jnriewchqspdcrwk@gilmour>
 <20210623121311.qlbnije5gn7o7so7@gilmour>
In-Reply-To: <20210623121311.qlbnije5gn7o7so7@gilmour>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Wed, 23 Jun 2021 08:14:46 -0500
Message-ID: <CAPpdf58AmzQkAQBx8x_kjfREto9qugYS0jLV+0qfp+atDFRimA@mail.gmail.com>
Subject: Re: [GIT PULL] HDMI codec improvements, v2
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 7:13 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jun 10, 2021 at 02:25:50PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > Here's a PR for the changes to hdmi-codec that need to be shared between
> > drm-misc-next and ASoC.
> >
> > This is the second iteration, fixing a bisection issue with compilation
> >
> > Thanks!
> > Maxime
>
> Merged into drm-misc-next
>
Not sure if its applicable - - - - - but - - - - I've been waiting
wanting to use a 4k monitor on hdmi for a number of months now. There
is a bug filed where I wasgiven to believe that my issues were likely quite
connected with hdmi.

I would be quite interested in seeing any hdmi fixes also added into 5.10.????
kernels not only the 5.13.??????? stream.

Would that be possible - - - please?

TIA
