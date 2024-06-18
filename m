Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B1990C579
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5271810E60B;
	Tue, 18 Jun 2024 09:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ELvtCmBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96E10E242
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:48:25 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dfdff9771f8so5358331276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718704105; x=1719308905; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rDDv2iKGFDtQwQrxhsS7qoOxcnnWj5b/fqDatUmCqrw=;
 b=ELvtCmBVET+76KExrFXh0h8K2bJ4Vx1n//KtE8HUDV5WboUphI/cfHHjz82qzz0s39
 o+RvSsSjB+YZ9oK9uhN3EH8JMjgyopIqwAfqeWOtXboWrnwapghvfdmHi3scBgA3t3oN
 pbpfemutv2r6ZRaSzMztkO7d983zhKnWg4kWvdv96mK3MIARhXx9jbs9mmBsPi9cW2tq
 dcT33dwRx9ILCrf8mlabeW1FuHOP0x5Z/LEuju7gKsC6q8+2WdYOwOrWeMbwBTp5IH/T
 +8ldE45Wl/M9idrdpwrV8W6veYtu4Ggw+0sHnacppYOUQDPn2eqiULvaqS7G/El24KX0
 mSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718704105; x=1719308905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDDv2iKGFDtQwQrxhsS7qoOxcnnWj5b/fqDatUmCqrw=;
 b=Xq0aRNT/0bpoAeZkRCEfDts/l4c/eZM0iyIeifIULw5vJaMevUX/9wZZovZ0NDX3+f
 ZFoyaYQ612J2twWvr1kGirErULaCwxUM7ZIWSijkRPTetV+oSMxtV/6zMX82IefnpG92
 UePRgfR1BUvlS9qalBmd8imkZPOJKB17IxE1HNyqX3BGN8LgQOuGTlUdtKjNzjRc92ga
 LoIx5qs3fHCtTZDUx9FPDIjWAG/LOqwLKIzC1gKOYx5cu4kcZxg8BmMA4eFOYFSE7l4P
 Mt5N19drurq2umhEUedWWkQNcN+4vL8LHCen5qYCrh/1MdixyvmQTAlC/Bvh9teHk16k
 xsyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy6IkOcTDSmBpUD57Enpef7VhMGdQkopWGXNQuLPlH8kSXKaBFtUK3RaxHEPd3WEjhgj32eyVwN5qxoMVKlBI7xe0X6KsP0924G/Hcjh3P
X-Gm-Message-State: AOJu0YyQELaIOf3Hpk4+1zIen/usIiRpYRkF+NNQ5Z2Xt5AEkRhmVKh/
 S+rNk4INRJ7/U6KfbrGyXnL7jcTuuURQWvBGP4TSvzx3K2zOXPGB/+0L2944uITLlCcwRITPywo
 eoCg1CWCcTBNeTBlBOVzQCbm5OC2dVEjLayI0RQ==
X-Google-Smtp-Source: AGHT+IHrW7J0hMiVsncuFoNwMnPtIbUcG1mcNOdcfEl+zrQr4Y91nLtGWXMCouAsPYG0SFhNADf6E9ydXIxB58d1SYM=
X-Received: by 2002:a25:aaac:0:b0:e02:8b7a:2b07 with SMTP id
 3f1490d57ef6-e028b7a2c8cmr1170832276.20.1718704104622; Tue, 18 Jun 2024
 02:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
 <cnbiivlsrutjbxw7jeetuyrnm3luvepstlwqxxrzsfhyzlgukk@3jx64owwkv2h>
 <ZnFUg91URIHn_SbR@phenom.ffwll.local>
In-Reply-To: <ZnFUg91URIHn_SbR@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 18 Jun 2024 12:48:13 +0300
Message-ID: <CAA8EJppWq-At2nLTzqg7T5tr-ZR6Sq6dRd9XX0r4MOM2diT30w@mail.gmail.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Brian Starkey <brian.starkey@arm.com>, 
 "Hoosier, Matt" <Matt.Hoosier@garmin.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, nd@arm.com, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
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

On Tue, 18 Jun 2024 at 12:33, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jun 17, 2024 at 10:52:27PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Jun 17, 2024 at 11:28:35AM GMT, Abhinav Kumar wrote:
> > > Hi
> > >
> > > On 6/17/2024 9:54 AM, Brian Starkey wrote:
> > > > Hi,
> > > >
> > > > On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
> > > > > On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:

> > > > > If/when we have hardware and driver support where you can use the
> > > > > writeback connector as a real-time streamout kind of thing, then we need
> > > > > to change all this, because with the current implementation, there's
> > > > > indeed the possibility that funny things can happen if you ignore the
> > > > > notice (funny as in data corruption, not funny as the kernel crashes of
> > > > > course).
> > > >
> > > > Indeed, the wording was added (from what I remember from so long
> > > > ago...) because it sounded like different HW made very different
> > > > guarantees/non-guarantees about what data would be written when, so
> > > > perhaps you'd end up with some pixels from the next frame in your
> > > > buffer or something.
> > > >
> > > > Taking Mali-DP/Komeda again, the writeback configuration is latched
> > > > along with everything else, and writeback throughput permitting, it
> > > > should "just work" if you submit a new writeback every frame. It
> > > > drains out the last of the data during vblank, before starting on the
> > > > next frame. That doesn't help the "general case" though.
> > > >
> > >
> > > Would it be fair to summarize it like below:
> > >
> > > 1) If the same CRTC is shared with the real time display, then the hardware
> > > is expected to fire this every frame so userspace should wait till this is
> > > signaled.
> >
> > As I wrote in response to another email in this thread, IMO existing
> > uAPI doesn't fully allow this. There is no way to enforce 'vblank'
> > handling onto the userspace. So userspace should be able to supply at
> > least two buffers and then after the vblank it should be able to enqueue
> > the next buffer, while the filled buffer is automatically dequeued by
> > the driver and is not used for further image output.
>
> Yeah if you want streaming writeback we need a queue depth of at least 2
> in the kms api. Will help a lot on all hardware, but on some it's required
> because the time when the writeback buffer is fully flushed is after the
> point of no return for the next frame (which is when the vblank event is
> supposed to go out).
>
> I think over the years we've slowly inched forward to make at least the
> drm code safe for a queue depth of 2 in the atomic machinery, but the
> writeback and driver code probably needs a bunch of work.

Do you mean handling the queue by allowing userspace to commit 'next' FB_ID?

I was leaning towards extending the uAPI with something like explicit
WRITEBACK_FB_ID_QUEUED and WRITEBACK_OUT_FENCE_PTR_QUEUED properties.
This way once the fence has been reached, the drm_writeback might
automatically put the old framebuffer, move _QUEUED to normal props
and then signal the userspace. This way the single-frame writeback
drivers can support the old API, while allowing cloned-writeback
drivers to implement the streaming approach. Also, this allows drivers
to do clever tricks, like forbidding the _QUEUED operation if the
refresh rate for the writeback connector is too high.


> -Sima
>
> >
> > >
> > > 2) If a different CRTC is used for the writeback, then the composition loop
> > > for the real time display should not block on this unless its a mirroring
> > > use-case, then we will be throttled by the lowest refresh rate anyway.
> >
> > what is mirroring in this case? You have specified that a different CRTC
> > is being used.
> >
> > >
> > > > >
> > > > > If we already have devices where you can use writeback together with real
> > > > > outputs, then I guess that counts as an oopsie :-/
> > > >
> > > > Well "works fine" fits into the "undefined behaviour" bucket, just as
> > > > well as "corrupts your fb" does :-)


-- 
With best wishes
Dmitry
