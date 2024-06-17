Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA990BB5F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1516410E0E9;
	Mon, 17 Jun 2024 19:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F8YGrwju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B829910E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:48:51 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so5994065e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718653729; x=1719258529; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ops3zTaR5ZyUWKEjkJve9ai8olwJx/5cRRvmSedCGGM=;
 b=F8YGrwjuxIkg5lDC5e+lclPETNs1JlaEsxIXFl3OcDsdBYws6KgUgi9+qpz4fQI/vY
 a/hHm5L/bQdiZegIJkdFsmprmcEjYd9ROTAB+kfrKq6SjLmLnYZum0EsZ2kVFkcStio7
 krV1GMTnynH9MD/Gi0tFBcV0AMf8NTzbvGracu59+WJ7BBD2IoVLKCMpeazT4riZLyEC
 FWNDWQF/uJran5m7YR8V2Vvlqe+uRKIJrz5cFF5Zd036EGONhdqtxlKZY+4iSstPYePf
 QPrCuXX9YS6uGLjpX5iCNeW45EBYR+P81o3de/vWfRWsJk1yO14Sjz500I6z3KPGxw+k
 876Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718653729; x=1719258529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ops3zTaR5ZyUWKEjkJve9ai8olwJx/5cRRvmSedCGGM=;
 b=A+GSh1VlJZJkWKGywpp2Ytm4+gIT/J4dGzFHvvzPkRuLVBz8H1oI51wjCE3AqTbH4r
 nZv668Ur1YXWwoSBM9tdTi3X9gbSsyyJVPHUPkrIGpHnpI3q4RdFyGys8tVXbFb0HZm4
 iCi1KKVNtzLJJIRVzn3etzfeje88kYXlE3n+VuUmKQ7VwGTgu6PY3VemwQRtZgAMJ6IO
 I/O+m+k4DR4c/oA557TxcKB7rJchyge+NI/QvWbXAcvlo44FKcyuFcS5ygrE+v9/NLkf
 Sgswb8NQ5IXo6NOYS0fzuOUD4dtrU5s+a3KftXl99+06EvX7ZrHuHka0VHqFqEm6BAhH
 XXeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPtw1rZ6qOTIs4vl4zYSKIBIMwh3hvczDJfcJdORdZnM9+W4eGndiO216NpNqhVbx6dGbx914gDPKtTcmFKeRA4ymJZccPjZEstKB9nTpz
X-Gm-Message-State: AOJu0YwGvJhqUcKSRVv4YppGnEjuotopB06vaI2cw6uTC+syWon5jDIx
 oocHYVYuy2WfbgRUJKyFPefefPKsz0lxR8dNdbOMILfvwQ98mTJ99D+Mj90hmFTNnZAM8U+cy44
 GJC4=
X-Google-Smtp-Source: AGHT+IEj+RsHCbRIti+vyDdnQfnYo3iQgQrDOwXaE1ngqXsN/p+L70mScKYCPjiqmYIfPDB9HDFkEg==
X-Received: by 2002:ac2:5e74:0:b0:52c:81ad:77f8 with SMTP id
 2adb3069b0e04-52ca6e6cadbmr6675850e87.32.1718653729431; 
 Mon, 17 Jun 2024 12:48:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cc1d80b1esm104281e87.240.2024.06.17.12.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 12:48:49 -0700 (PDT)
Date: Mon, 17 Jun 2024 22:48:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
Cc: Brian Starkey <brian.starkey@arm.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "nd@arm.com" <nd@arm.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <yjyxdt4k2hna7iaoji5gngyf5p2u56m7fis6hv2v6csookh7kj@a7q7k7smu33d>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <DM6PR04MB517866DC4DDCD418DF3CE0F3ECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR04MB517866DC4DDCD418DF3CE0F3ECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
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

On Mon, Jun 17, 2024 at 05:36:34PM GMT, Hoosier, Matt wrote:
> >> >> >> There is a discussion ongoing over in the compositor world about the implication 
> >> Hi,
> >>
> >> On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
> >> >On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
> >> >> Hi,
> >> >>
> >> >> There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
> >> >>
> >> >> >  *  "WRITEBACK_OUT_FENCE_PTR":
> >> >> >  *	Userspace can use this property to provide a pointer for the kernel to
> >> >> >  *	fill with a sync_file file descriptor, which will signal once the
> >> >> >  *	writeback is finished. The value should be the address of a 32-bit
> >> >> >  *	signed integer, cast to a u64.
> >> >> >  *	Userspace should wait for this fence to signal before making another
> >> >> >  *	commit affecting any of the same CRTCs, Planes or Connectors.
> >> >> >  *	**Failure to do so will result in undefined behaviour.**
> >> >> >  *	For this reason it is strongly recommended that all userspace
> >> >> >  *	applications making use of writeback connectors *always* retrieve an
> >> >> >  *	out-fence for the commit and use it appropriately.
> >> >> >  *	From userspace, this property will always read as zero.
> >> >>
> >> >> The question is whether it's realistic to hope that a DRM writeback
> >> >> connector can produce results on every frame, and do so without dragging
> >> >> down the frame-rate for the connector.
> >> >>
> >> >> The wording in the documentation above suggests that it is very likely
> >> >> the fence fd won't signal userspace until after the vblank following the
> >> >> scanout during which the writeback was applied (call that frame N). This
> >> >> would mean that the compositor driving the connector would typically be
> >> >> unable to legally queue a page flip for frame N+1.
> >> >>
> >> >> Is this the right interpretation? Is the writeback hardware typically
> >> >> even designed with a streaming use-case in mind? Maybe it's just
> >> >> intended for occasional static screenshots.
> >> >
> >> >So typically writeback hardware needs its separate crtc (at least the
> >> >examples I know of) and doesn't make a lot of guarantees that it's fast
> >> >enough for real time use. Since it's a separate crtc it shouldn't hold up
> >> >the main composition loop, and so this should be all fine.
> 
> Hmm, I don't think this matches the implementation. What I see -- sometimes people call this "concurrent writeback" -- is that the writeback connector is wired directly to the CRTC that's feeding the regular connector whose picture is getting captured.
> 
> Something like (for frame N):
> 
> * DP-1
>   * CRTC_ID = crtc-0
> * plane-0
>   * CRTC_ID = crtc-0
>   * FB_ID = fb-0
> 
> * Writeback-1
>   * CRTC_ID = crtc-0
>   * WRITEBACK_FB_ID = fb-1
>   * WRITEBACK_OUT_FENCE_PTR = <whatever>
> 
> 
> Are you saying that that for frame N+1, we should switch DP-1 to use a different CRTC while the writeback is still busy being retired into fb-1 through crtc-0?
> 
> >>
> >> On Mali-DP and Komeda at least, you can use writeback on the same CRTC
> >> that is driving a "real" display, and it should generally work. If the
> >> writeback doesn't keep up then the HW will signal an error, but it was
> >> designed to work in-sync with real scanout, on the same pipe.
> >>
> >> >
> >> >If/when we have hardware and driver support where you can use the
> >> >writeback connector as a real-time streamout kind of thing, then we need
> >> >to change all this, because with the current implementation, there's
> >> >indeed the possibility that funny things can happen if you ignore the
> >> >notice (funny as in data corruption, not funny as the kernel crashes of
> >> >course).
> >>
> >> Indeed, the wording was added (from what I remember from so long
> >> ago...) because it sounded like different HW made very different
> >> guarantees/non-guarantees about what data would be written when, so
> >> perhaps you'd end up with some pixels from the next frame in your
> >> buffer or something.
> >>
> >> Taking Mali-DP/Komeda again, the writeback configuration is latched
> >> along with everything else, and writeback throughput permitting, it
> >> should "just work" if you submit a new writeback every frame. It
> >> drains out the last of the data during vblank, before starting on the
> >> next frame. That doesn't help the "general case" though.
> 
> Are you saying that on hardware whose writeback implementation is
> amenable, the drivers will generally fire the fence FD in time for
> userspace to post a next frame to the real connector's CRTC for the
> immediately following frame? Or are you just saying that some hardware
> could support it, but that the DRM framework's insistence that
> userspace waits until the fence fires might still make it artificially
> too slow to drive the hardware to its full capacity?

Current DRM uAPI for writeback supports single-frame jobs. Userspace
submits an FB, it waits for the fence, then submits next FB, etc. This
is not well-suitable (nor it is defined in a way suitable) for the
streamed operations, where you want to generate a stream of N frames per
second. Even though userspace sets a mode which includes a particular
frame rate, the WB API has no guarantee that the FPS will be or can be
met.

In my opinion a proper uAPI for the streamed Writeback should be closer
to v4l2, where you submit several buffers in advance together with the
corresponding fences and then they are filled one by one and the
corresponding fence is signalled to userspace. 

Note, in my humble opinion, it should be perfectly possible to setup
writeback as a clone to the existing connector (if a clone mode is
suppored by the hardware) and then to supply the jobs (FB+fence)
occasionally rather than for each frame. Such userspace operation should
not cause any degradation on the main connector.

> 
> I want to be a good citizen and do stuff by the book here. :-P
> 
> >>
> >> >
> >> >If we already have devices where you can use writeback together with real
> >> >outputs, then I guess that counts as an oopsie :-/
> >>
> >> Well "works fine" fits into the "undefined behaviour" bucket, just as
> >> well as "corrupts your fb" does :-)
> >>
> >> -Brian
> 

-- 
With best wishes
Dmitry
