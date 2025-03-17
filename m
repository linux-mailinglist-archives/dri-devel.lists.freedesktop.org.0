Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A79A6621F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 23:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C15610E192;
	Mon, 17 Mar 2025 22:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g3dscVJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892FA10E192
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 22:56:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso951081766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 15:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742252215; x=1742857015; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ohnbD9HST5mn+5PVHLWOCx41oZ6CqeGk3ifbuefAvzA=;
 b=g3dscVJvQ4OaPLVlEGQs8ISH7SwR0jueGyOZFbgVEWqFFSvXYSn+2hfvKrEmwfE33i
 +RZQXFAndj9WgzgpsRbLkU5e8TJhDjzwznL1E+Sgltsxn9zZ3fHYpcRhjM82FMSa7dCG
 fV8MQidSw/cm0fH6Z9NUCBvGLLq771xIzkHebYijZ4op5nb5CGwece1WmP5IFpLcBJvQ
 oEHroB99Dn7ctRH/pSPC5VVPfvqQkvX2h9cwktZy15fWG2IWRpkxM+IltS0491dlmNxV
 dAUcLMUdEfUwaHDvvk2o/0i0Lpq/rG1ScO0ZJNh29ERrlo3JUM1DXFeFk99tQGTdrKOL
 +e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742252215; x=1742857015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohnbD9HST5mn+5PVHLWOCx41oZ6CqeGk3ifbuefAvzA=;
 b=CzjzgglbXO6PCKHS5+hZntP6xIHClOdpGr8V4oky7qujke1+OHFOPgXazmtvPokIw4
 p8/f+49Yg8laI+m704ljDtLyXH7xd3AmNQ3+ry2d2NabaTpYtL4fLIKYuFiUIaztjUbp
 4cD4vubXckSTkCJ6bilLlfRM+CLvXwzS2rI6dR+aS4f3+IzUJH1AfHcNO7ZmqoLwDG25
 1XINcik1sxoUEd5Bgb+FOwlf8wpTJRwor0aeZnKFat77MDCeIhZv93+NrG9fgFeNgOAg
 gQ15YozuWItJ/MpC1Y8HANZRTKK/nj0xct+VemK5+K0d3y4yIUi95a0GFnfgyig75Y1y
 2u/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS6akmiUJXhJjZ1Gwl79lLnaLCvXUvuAefSc/u/abGPZGVrnLOnSMH4uTtdbC3rQcG02IL4OA+hSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc0dShfEmupcFkFXa6vJjcWOwS2RJqChTjzJgk3hfmwUt26qT0
 QjanSz0XpbYu/XOTp3clvoDRBEuCPhJxPIMqE53/RHtqDSBJzuDwWPJYBm1COY1QcF+Z3CnIbsV
 8f+iypsK3enMf1RVxf+JW7I5dzuc=
X-Gm-Gg: ASbGnctmXvjLXkpKL1M2mfhQS1+jAMOcGDBF0mfABaHD2WhgyphW1vQ4BcLtn6ySozD
 fMjLlJJaNPKf7lifrQ767iOk3nhJNG2JTxiFWvjjP+kQlt2e+cIvn98O6TgyMFXhr5QSLnle0I3
 y8yD4j68zJJJz3d15duZXZ7cAP
X-Google-Smtp-Source: AGHT+IG5c2AKfafLHhqewzGjoy7JQPZVl1/smJNnze77drFWI3ZuNyHqFeaM/mxCilbOmM5Q4oVA7/RiV8IU8XBCbIg=
X-Received: by 2002:a17:907:72cf:b0:ac2:bcf3:b19b with SMTP id
 a640c23a62f3a-ac38d8d1f2emr116636466b.49.1742252214473; Mon, 17 Mar 2025
 15:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
 <874izre0aq.fsf@trenco.lwn.net>
In-Reply-To: <874izre0aq.fsf@trenco.lwn.net>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 18 Mar 2025 08:56:41 +1000
X-Gm-Features: AQ5f1Jp-xAiBDwu3-_7K3Dlm6rUr4V1lmAoixbXtePi_ukSPK5ZTUaJK2e2pCOs
Message-ID: <CAPM=9tzv+=+ZGRtHgapUVAiDjHn=Bp33BqyLLQKDuKsR-AoC7A@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: clarify userspace requirements
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 simona.vetter@ffwll.ch
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

On Tue, 18 Mar 2025 at 08:53, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> writes:
>
> > The guidelines mention that firmware updates can't break the kernel,
> > but it doesn't state directly that they can't break userspace programs.
> > Make it explicit that firmware updates cannot break UAPI.
> >
> > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > ---
> >  .../driver-api/firmware/firmware-usage-guidelines.rst        | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> > index fdcfce42c6d28..5f8f13e2ee510 100644
> > --- a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> > +++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> > @@ -42,3 +42,8 @@ then of course these rules will not apply strictly.)
> >    deprecating old major versions, then this should only be done as a
> >    last option, and be stated clearly in all communications.
> >
> > +* Firmware files that affect the User API (UAPI) shall not introduce
> > +  changes that break existing userspace programs. Updates to such firmware
> > +  must ensure backward compatibility with existing userspace applications.
> > +  This includes maintaining consistent interfaces and behaviors that
> > +  userspace programs rely on.
> > \ No newline at end of file
>
> This ^^^^^^^^^^^^^^^^^^^^^^^^  is a good thing to avoid.  That can be
> fixed up at apply time.
>
> Dave, you're the only one with fingerprints on this document; is the
> change OK with you?

LGTM,

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.

>
> Thanks,
>
> jon
