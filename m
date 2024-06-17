Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6A90BB67
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2126210E4A7;
	Mon, 17 Jun 2024 19:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lZ1Nrooq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9015710E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:52:31 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52c7fbad011so5566532e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718653950; x=1719258750; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s/XpPxCgd8flBmhR8jIMkUb/gtO2031cylRo804oeaI=;
 b=lZ1Nrooq28qXly8SpT58rSmiG6QSeep0grS+7sLlDrUWiPy9zkU7y8Qr55L6c4l4QR
 JhSPWtTRtOTL2Te7DJ3ZObMn8Y7xvKuliX1Rt7ruEEcTQdWVGBp6j9Aq73uXuCOp9rcq
 68pG1CGqeWxZf3YpyolArTlnu8u8qxX7B5/ZOIz2udMPFE8JjVUOaRkcMi+XMUPs35w6
 0OT/hkPLVapaWuPNboQ61FiHgNzGO2hg+eACIaF8MBXtpCPGJj/qByw6+o7jnrIMF4Le
 5yjKfw8inZltdx672V2EuuUgqON85ePCnz4ZrLbQ5rVQIN2OCFTSo/I4YEPGrJIk7WtK
 mlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718653950; x=1719258750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/XpPxCgd8flBmhR8jIMkUb/gtO2031cylRo804oeaI=;
 b=KxjuuMzS2BuYhbN7VrHFJUyBL3kbeX02l8JcGapRtbI1HNVFHU7zJE/e3H2ER13yri
 H2ANCGoU574OF/KmiHElKOpFE2tJIM/I9laDRmZBJ/+YQEUzZ434iGV1g6FMW4pRaI7o
 4D6kDB8Iq1icxudX8wyLZqR5m1JSeyGPgo7VQP+lgHx+DHGS0fY+GcYjCBWM2/pepzWH
 pUxphc4WDjXGnZ+tShJ+1TZ+15+qx5RGBvwh41ss4svd9NY2pQ5THrNpV7XiZKvt1A4r
 ynBk+7y4+jryZkPm/B8zrAIqGLDAKRmsSSJXGkCfJ+sCmSssiz2RlJufsXhu7hfxQFVR
 wFLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSr5a8P85D1WXFbL8vFQC2MvP64lj59FjdSSCpvOE1p24b0ImdtzUP3U9X7YOSaURr2sBLCd/Fj81+HPlImlo5FcPls0oNUdG3oASc0XC4
X-Gm-Message-State: AOJu0YzMp3aWQNO5vurjmG2yO3qRGB1T51CrG7GJj6tGraMA7HngFss8
 8uJjO+P+oF/M/Bxa3yUiuN6VIihRCW7nzTYI7NCVfIUFEm2IRhUJRPjHVBafi4Y=
X-Google-Smtp-Source: AGHT+IH8nhd5lSdicBqezhXcxHOQVIftzs8sqX2ZtCDD9UqQcAHb79gf1gZk75ZlkMuq4DKakKHUfA==
X-Received: by 2002:ac2:5e8b:0:b0:524:43b2:d326 with SMTP id
 2adb3069b0e04-52ca6e6dd66mr5743476e87.37.1718653949584; 
 Mon, 17 Jun 2024 12:52:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287b357sm1307848e87.236.2024.06.17.12.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 12:52:29 -0700 (PDT)
Date: Mon, 17 Jun 2024 22:52:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Brian Starkey <brian.starkey@arm.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Hoosier, Matt" <Matt.Hoosier@garmin.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, nd@arm.com, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <cnbiivlsrutjbxw7jeetuyrnm3luvepstlwqxxrzsfhyzlgukk@3jx64owwkv2h>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
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

On Mon, Jun 17, 2024 at 11:28:35AM GMT, Abhinav Kumar wrote:
> Hi
> 
> On 6/17/2024 9:54 AM, Brian Starkey wrote:
> > Hi,
> > 
> > On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
> > > On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
> > > > Hi,
> > > > 
> > > > There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
> > > > 
> > > > >   *  "WRITEBACK_OUT_FENCE_PTR":
> > > > >   *	Userspace can use this property to provide a pointer for the kernel to
> > > > >   *	fill with a sync_file file descriptor, which will signal once the
> > > > >   *	writeback is finished. The value should be the address of a 32-bit
> > > > >   *	signed integer, cast to a u64.
> > > > >   *	Userspace should wait for this fence to signal before making another
> > > > >   *	commit affecting any of the same CRTCs, Planes or Connectors.
> > > > >   *	**Failure to do so will result in undefined behaviour.**
> > > > >   *	For this reason it is strongly recommended that all userspace
> > > > >   *	applications making use of writeback connectors *always* retrieve an
> > > > >   *	out-fence for the commit and use it appropriately.
> > > > >   *	From userspace, this property will always read as zero.
> > > > 
> > > > The question is whether it's realistic to hope that a DRM writeback
> > > > connector can produce results on every frame, and do so without dragging
> > > > down the frame-rate for the connector.
> > > > 
> > > > The wording in the documentation above suggests that it is very likely
> > > > the fence fd won't signal userspace until after the vblank following the
> > > > scanout during which the writeback was applied (call that frame N). This
> > > > would mean that the compositor driving the connector would typically be
> > > > unable to legally queue a page flip for frame N+1.
> > > > 
> > > > Is this the right interpretation? Is the writeback hardware typically
> > > > even designed with a streaming use-case in mind? Maybe it's just
> > > > intended for occasional static screenshots.
> > > 
> > > So typically writeback hardware needs its separate crtc (at least the
> > > examples I know of) and doesn't make a lot of guarantees that it's fast
> > > enough for real time use. Since it's a separate crtc it shouldn't hold up
> > > the main composition loop, and so this should be all fine.
> > 
> > On Mali-DP and Komeda at least, you can use writeback on the same CRTC
> > that is driving a "real" display, and it should generally work. If the
> > writeback doesn't keep up then the HW will signal an error, but it was
> > designed to work in-sync with real scanout, on the same pipe.
> > 
> 
> Same with MSM hardware. You can use writeback with same CRTC that is driving
> a "real" display and yes we call it concurrent writeback. So I think it is
> correct in the documentation to expect to wait till this is signaled if the
> same CRTC is being used.
> 
> > > 
> > > If/when we have hardware and driver support where you can use the
> > > writeback connector as a real-time streamout kind of thing, then we need
> > > to change all this, because with the current implementation, there's
> > > indeed the possibility that funny things can happen if you ignore the
> > > notice (funny as in data corruption, not funny as the kernel crashes of
> > > course).
> > 
> > Indeed, the wording was added (from what I remember from so long
> > ago...) because it sounded like different HW made very different
> > guarantees/non-guarantees about what data would be written when, so
> > perhaps you'd end up with some pixels from the next frame in your
> > buffer or something.
> > 
> > Taking Mali-DP/Komeda again, the writeback configuration is latched
> > along with everything else, and writeback throughput permitting, it
> > should "just work" if you submit a new writeback every frame. It
> > drains out the last of the data during vblank, before starting on the
> > next frame. That doesn't help the "general case" though.
> > 
> 
> Would it be fair to summarize it like below:
> 
> 1) If the same CRTC is shared with the real time display, then the hardware
> is expected to fire this every frame so userspace should wait till this is
> signaled.

As I wrote in response to another email in this thread, IMO existing
uAPI doesn't fully allow this. There is no way to enforce 'vblank'
handling onto the userspace. So userspace should be able to supply at
least two buffers and then after the vblank it should be able to enqueue
the next buffer, while the filled buffer is automatically dequeued by
the driver and is not used for further image output.

> 
> 2) If a different CRTC is used for the writeback, then the composition loop
> for the real time display should not block on this unless its a mirroring
> use-case, then we will be throttled by the lowest refresh rate anyway.

what is mirroring in this case? You have specified that a different CRTC
is being used.

> 
> > > 
> > > If we already have devices where you can use writeback together with real
> > > outputs, then I guess that counts as an oopsie :-/
> > 
> > Well "works fine" fits into the "undefined behaviour" bucket, just as
> > well as "corrupts your fb" does :-)


-- 
With best wishes
Dmitry
