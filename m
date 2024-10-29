Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB169B424B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93910E071;
	Tue, 29 Oct 2024 06:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ezxZLXRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E22B10E071;
 Tue, 29 Oct 2024 06:18:11 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7ea9739647bso3591623a12.0; 
 Mon, 28 Oct 2024 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730182691; x=1730787491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbH+MxlZZP0jfdF1t+NhFG6akIfHUreHIb4HeUjiq8Y=;
 b=ezxZLXRHdIFkHK7/kBci1qz19mC/9EhBzOxdiaByGbA7X5mT3AFuXhTEHIvT/0t5MP
 5EttXjrYavFvgxW4Ec/6HuSgfn6jqjwVlJpsLgn/swjr+6R3QTyrZmSwp2x8m1Pi/myI
 I63D2D4K67xIpCNoDUONU2HjFQ0C0OEzcHVEHmRO9Ac1CNSVEZLwyz8TZhvt1n3t9TeE
 xDX30pj4y5OztKeQOuRW7q/a43ytVgTUack59vXXN6WC2sUTmS9LTPVu7T5XbjYHe+es
 97JDuMatY6NckqW3ftMWUanKKbQqMLPu5e9Y7B+rQXD4m8LPzaEOMn+L9SrvkLb0yv5k
 Hx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730182691; x=1730787491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JbH+MxlZZP0jfdF1t+NhFG6akIfHUreHIb4HeUjiq8Y=;
 b=tZxcUnrlS70VzN09ykZtjBE+T/cI6UGteNb8B/tqSKUPNIUcon3bBDwWMtLELjo0ry
 AVFX7sm/ugRbHy/Iv1FF5AL//vGwa9G3VpOXtXZ9XKZ7+L9uiPw9LEMCkmXdCiaoBn+K
 vkNP/TusGCdUXHc0DgPiYVNOn3lo7lCouFyjzbXESd4JWiMkOpc5eL2IySAaEPrnSq90
 5gf6pqpBV5Vj7SVPEqcyARv+hmn3duy7+TOOkhIOY+EhOjq/7VJeWPdDITXQazfIGD8J
 yu1mqgOWFho93DIKu56pADexajouN4Stwi4hNjNHEvugK/5NanzkLWXzh3x9jL9qOOo4
 kWXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVez8iz75IC+AG79v+XSUK1E47rRkEVtUnLLJOwClSRLDG9d3Yeq5nvsH6yT+IcnTHHop4VQWC61Zk=@lists.freedesktop.org,
 AJvYcCXMi2jARwOS0KMttYR+i0IsTH1hEvfn7ipoTR07X/dn+1UpXGxQ5hjnQC1x6nbzMIddtzUsbbf4N48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkxgHzNFTyfWTJ18r5yY28SW2D+q42Dtn2f7c9ruc/ZcAw1yuR
 Bo++CXr8XY/J7HTKekJvbfrOPBkAWLiTIEpwj379laqmSpNe1xjPKUw8yYomniKBjiZzAA957m8
 P7K3UU+0l+1ITzv/Q8WR9T4DbqOE=
X-Google-Smtp-Source: AGHT+IEakR8+6KFEHZc1bHgt3VBR9Z5XpuWlN6ZYFkC6UU38ogv3Y7zZUo33OohAhhDzC6sTqSsezfL4MOPl/EAohnc=
X-Received: by 2002:a17:90b:315:b0:2e2:ba35:356c with SMTP id
 98e67ed59e1d1-2e8f11dceb8mr11682733a91.39.1730182691042; Mon, 28 Oct 2024
 23:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241027045752.10530-1-gye976@gmail.com>
 <53slkiaabzxkr4npxjgc32igwnspzyohvswwhooc4nfzdjw547@q3nnf3wblgfd>
In-Reply-To: <53slkiaabzxkr4npxjgc32igwnspzyohvswwhooc4nfzdjw547@q3nnf3wblgfd>
From: gyeyoung <gye976@gmail.com>
Date: Tue, 29 Oct 2024 15:17:59 +0900
Message-ID: <CAKbEznsv9yH9vYSqhCi0gJt-oww3R5t0YWP_YtpTF-=CvgzWkw@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix build error for XE_IOCTL_DBG macro
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Thank you for your review, I missed how && work.
I will revise a patch that print only when cond is true.

sincerely,
Gyeyoung baek

On Tue, Oct 29, 2024 at 4:47=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Sun, Oct 27, 2024 at 01:57:52PM +0900, Gyeyoung Baek wrote:
> >In the previous code, there is build error.
> >if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
> >'drm_dbg' function is replaced with '__dynamic_func_call_cls',
> >which is replaced with a do while statement.
> >
> >The problem is that,
> >XE_IOCTL_DBG uses this function for conditional expression.
> >
> >so I fix the expression to be compatible with the do while statement,
> >by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html=
".
> >
> >Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
> >---
> > drivers/gpu/drm/xe/xe_macros.h | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macr=
os.h
> >index daf56c846d03..58a9d1e33502 100644
> >--- a/drivers/gpu/drm/xe/xe_macros.h
> >+++ b/drivers/gpu/drm/xe/xe_macros.h
> >@@ -11,8 +11,8 @@
> > #define XE_WARN_ON WARN_ON
> >
> > #define XE_IOCTL_DBG(xe, cond) \
> >-      ((cond) && (drm_dbg(&(xe)->drm, \
> >-                          "Ioctl argument check failed at %s:%d: %s", \
> >-                          __FILE__, __LINE__, #cond), 1))
> >+      ({drm_dbg(&(xe)->drm, \
> >+              "Ioctl argument check failed at %s:%d: %s", \
> >+              __FILE__, __LINE__, #cond); (cond); })
>
> but this would print the debug message regardless of the cond being
> true. Previously this would enter the condition if cond && 1 (due to the
> comma operator use), but printing the message was shortcut when cond was
> false.
>
> It looks like keeping cond outside and the statement expr to cover only
> the call to drm_dbg would work.
>
> Lucas De Marchi
>
> > #endif
> >--
> >2.34.1
> >
