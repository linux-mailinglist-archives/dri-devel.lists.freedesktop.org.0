Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5BAB8DFA
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3943310E00F;
	Thu, 15 May 2025 17:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZPRFwnRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EF310E00F;
 Thu, 15 May 2025 17:40:28 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d96d16b369so8542255ab.0; 
 Thu, 15 May 2025 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747330828; x=1747935628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Gv+jyqF5iQ9QDCMmj+4HNiLTyap9tDvvCFpoRNaACI=;
 b=ZPRFwnRb+uZ1c6a3TPRDHOk2Scy6b1PKGii62EosyTahyx+m9hk5/z0bj0J5gLETpe
 Mfunv7Va09dCDBg5+X7JgDeOtnJlfKdzuiymDypmDU8V/5DH3zQTQJSK7WLVSY9qF9xm
 HVsQnyIvvMEComuNgCU932j8w8q4oR95j5bvxlAjZ4c7d0Om0RwJhsYTaKjQ/KfUzC9G
 uBjnQHyL0Ozb5y75avmv2bCv4+YBHB5N+gBVVTxUSplWPg2A/831FvMxtkLaEOUu62xU
 M2yQNjG5h+iCwEieTpORzKWDqaPRwgEkkEKtee6oRHZn9YrFtaWx0uEOLR3R2RAUceWY
 iHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747330828; x=1747935628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Gv+jyqF5iQ9QDCMmj+4HNiLTyap9tDvvCFpoRNaACI=;
 b=Ip791QMY5dEKi3v8cH2GtvoqVUgTRxkL8jh/UxE6LdI7J9bSFNEo4fKWlyJO/gJyWF
 RpPk63LF0Modhdr77dmYXFoQrUdcp+etiKVbpLCiBtU5xpC5sJgAhOABi6UsjdLvYcKB
 xyh+z3eWS26TVoGvbJofoipG86QlklOlB+ALHk0/w5pJajJfnysr68nujlA9YZEI9Yjy
 j+/bMITRKuHVohe5xvIm2cRIsFZSn0NnYhUyXcIikZdj5WlaD0aVb7Fb/vKbEqE/JMMg
 fngiSOsSBhSP6ndAek8KQW90osYN1z34ypFy+fWYDyGr42I02za1sPh4enuvYXbJbmX2
 /6IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD39PEjPYQ/e4oE3Vy2v4vCSL920qPKU6RcoEr2CcwgOBogBAA0ByG3JL3gRlfCHrwokazJp3M2OQ=@lists.freedesktop.org,
 AJvYcCWaMi/CARiYz029dNiedZ0XjrNnTdIbKmivjSDqG5P1WFSP/GxDZ3r72Obxr/h/PC6T0K8G5DrZysek@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzImMcKTyEffYH1jO3qxChoQXOakwKM++Ie1v/D5qVdJJnKxGlE
 DWV2EA4LkqVsPuLc+xe8wIDOLKyEvUtdk5cv2qcHagndzUvr2XmDGtZMquLy5sFXtuBSTx61HH4
 uNJq1jpj13lzBvplkLT1NyNG/MOCm34A=
X-Gm-Gg: ASbGnctL71lhs0lZ0qYcjYbMIKaqzGHiFQXtg+lHaJcyB80KSHs6hrOlL5toSLa/6dW
 lcPZQGvDLl4IWG61jfo4vWf90mTtW5lIpONwdGYrNARFzQyCtu4hHCFtcms06PPWi2xeJGp2l9Q
 H0YptcTqapqZ2AalzldHc6kZvp+lM8e7M4IJgnqgtKnmX8e3svPQjejrURFt4B968=
X-Google-Smtp-Source: AGHT+IEJipXdl2VdU/Oec1bGlBvZGZ7tO6kaKvHUZEoNz8drXkpWOZVfZlKq5HOiApXq2RnjQWE/s2cZ189LZWiNKr4=
X-Received: by 2002:a05:6e02:1a6c:b0:3d9:398f:b836 with SMTP id
 e9e14a558f8ab-3db84321988mr8926665ab.17.1747330827801; Thu, 15 May 2025
 10:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
In-Reply-To: <aCYkk4Y7feltfp79@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:40:15 -0700
X-Gm-Features: AX0GCFtd_SrDNpGNgyp8XAQPhmBBmDgvcdrcdNZ8xnRlH3UestZq2hfK_c4xVuQ
Message-ID: <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 phasta@kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> (Cc: Boris)
>
> On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > For some context, other drivers have the concept of a "synchronous"
> > VM_BIND ioctl which completes immediately, and drivers implement it by
> > waiting for the whole thing to finish before returning.
>
> Nouveau implements sync by issuing a normal async VM_BIND and subsequentl=
y
> waits for the out-fence synchronously.

As Connor mentioned, we'd prefer it to be async rather than blocking,
in normal cases, otherwise with drm native context for using native
UMD in guest VM, you'd be blocking the single host/VMM virglrender
thread.

The key is we want to keep it async in the normal cases, and not have
weird edge case CTS tests blow up from being _too_ async ;-)

> > But this
> > doesn't work for native context, where everything has to be
> > asynchronous, so we're trying a new approach where we instead submit
> > an asynchronous bind for "normal" (non-sparse/driver internal)
> > allocations and only attach its out-fence to the in-fence of
> > subsequent submits to other queues.
>
> This is what nouveau does and I think other drivers like Xe and panthor d=
o this
> as well.

No one has added native context support for these drivers yet

> > Once you do this then you need a
> > limit like this to prevent memory usage from pending page table
> > updates from getting out of control. Other drivers haven't needed this
> > yet, but they will when they get native context support.
>
> What are the cases where you did run into this, i.e. which application in
> userspace hit this? Was it the CTS, some game, something else?

CTS tests that do weird things with massive # of small bind/unbind.  I
wouldn't expect to hit the blocking case in the real world.

BR,
-R
