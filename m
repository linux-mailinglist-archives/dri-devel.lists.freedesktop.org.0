Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0881C6B273
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 19:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6461810E081;
	Tue, 18 Nov 2025 18:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p6nU6jC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86BA10E081
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 18:14:52 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-787e7aa1631so1024317b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763489692; x=1764094492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s982Y9Kmt/g+UxRz61j1vftrihk5DEhC/lR/3qy5Uns=;
 b=p6nU6jC4tDaG2/Wk7Y/WAP6c7YvVpYvoIz/up68qgRoFH7mkKOB3E1S5eIPBVz0PLJ
 VS7b6/gEod0J6TS1nDV2UMXOOHHb/NE42NNJcN7Q4Yck+bygTPFz2BDIBZBRwXKVw7li
 VYXKLoMMYkgzJaXk+wWRR8g/PdVJulB20Iku0A5Ut8r63NUaCuguEia5pqEasbhSTaUP
 8HRrAWCrRIP2DtmXMuaMlOY0XBH4fzfwEB/VCofmOi4QVoQoGuB8YJcxXODqECjW5tZP
 /g50yhmRDl06WXgEZ6bM5OcWlSfXC4Yld6nCM7ZdGVeOM0FxBBMfy394G99k7xUhAUBq
 lvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763489692; x=1764094492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s982Y9Kmt/g+UxRz61j1vftrihk5DEhC/lR/3qy5Uns=;
 b=S2X5Kj+aIh9mgMhgmPmr54Ez2iCpla2QucbXXzlZ/jt2yzYrtm1CV8aYfZtXIVmXJQ
 S7meb6jYrynsb/G8ErrwDCMetrLMv4T+CoyF641A7lR7W5X/0gMB/1jungBxcn3Z/CFt
 e/j/TJy2BjHK1g2XvQtNs0sxC5SZzmdJcdofmD9II6MgnMIDFYB58GvPBhD7n7clqUEb
 zIdinf4ta0gih6LEIYzw47DrRDTpksp349vO+ME8ZkcuvSjtLcWoVxA1viyfw7vGWo/5
 yBxL/U37hfTwcMF/neggt0F8wHJ5hpjiKL8bHOxIGQh3tbTsz/fSD6LELv3QdVoKCq8p
 vrXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHqm6+pICGaDICCA16wYcbox1RtJmk1nyJc/J6+U/8m1ExWmm9EsqwMbppY6pSu2obt30q6ZKSW3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykmxrFizZCho3XjC3ONxH+5YMLui7+E9fqmPx5IzM+HZUFyeDT
 EJWQhJJN+hP7xhYdEqFmYuK5DsFyYBrpacGpqVwA1tF9ed/Lw8BWyKDXQ0Rlfoc3xJ46kWRnjwi
 llYcLEZiyiFEOUm46m0uNx8568IQJN1NmwQOQvvzp0A==
X-Gm-Gg: ASbGncvKHr6MCfczg08fxPRMYWFfTj+gvAw67XxOAwkY0UR12jfhR+nH/jRAZx6KM9Z
 cFRBahInrCt3XIXMInEodLtxF668f5Fn8/npT58SDAdTn7evIi1/wP9lZPIw7MQtIrDynq33j4I
 x6NALKQLhWUvICG52jOLho7YKYFMg82kKFM0MghYRlPcZ9B64dAuEkkXpareF/wRh/8B7MxVn/C
 nwPTmLx6htcPLjnHcfE9KH2CO+C5MS58j0wgc68XreUUcz3F2+jfXC9mjJo08Xe/jZBsyjvhbJh
 qdNbtw==
X-Google-Smtp-Source: AGHT+IEFNuYNCX0S4eIlBRnrlHRTobtJRl4hW1qDhhS7lfNvBT3jfAY77nvtNY8xbtFPGlWBfqYng+gAcjAIB8Z7Feo=
X-Received: by 2002:a05:690e:1209:b0:63e:336c:20e1 with SMTP id
 956f58d0204a3-642ebb8f0c2mr354499d50.25.1763489691914; Tue, 18 Nov 2025
 10:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
 <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
 <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
 <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
 <17cedb40-d64a-4824-a1a9-c82d21f4606a@ideasonboard.com>
 <CACRpkdbtySSfCiV-6Dqy--D+J0vcnyvcFiASLYGauNHSK9TCjw@mail.gmail.com>
 <8256d054-a946-4aff-9953-03b29a4d01c5@ideasonboard.com>
 <CACRpkdaCyqESKyhfmBpnnto8MTFLVLfZxv496Kgy7KpW_rRXLA@mail.gmail.com>
 <126de82c-b301-4785-8ad8-7e6d018ce12f@mailbox.org>
In-Reply-To: <126de82c-b301-4785-8ad8-7e6d018ce12f@mailbox.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 19:14:37 +0100
X-Gm-Features: AWmQ_bkFd944O6OMdNfs0hujKShY9diu4Ptqs-iNSj_uhdwyhQJ3k00iUBRT0ro
Message-ID: <CACRpkdYcrxc=RTatx7aguh99HLJfiwV+5fSBuKvyYDJbJ5fUCQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
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

On Tue, Nov 18, 2025 at 5:47=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
> On 11/18/25 3:31 PM, Linus Walleij wrote:
> > On Tue, Nov 18, 2025 at 2:54=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >
> >> The questions I have:
> >>
> >> - Should we 1) keep the current upstream sequence as default, and
> >> specific drivers can opt to use new helpers that make sure the crtc is
> >> enabled early (like your patch), or 2) revert the sequence changes fro=
m
> >> Aradhya, restoring the crtc-enabled-first style, and add new helpers
> >> that handle the sequence in the new way, as it is currently in upstrea=
m.
> >
> > I'm opting toward (1) given that:
> >
> > - The new sequence order is natural, a sensible default
> >
> > - Only mine and Mareks systems appear to be affected despite the
> >    patch has been upstream for a while.

> I might have had a revert in tree for a while, revert which I forgot
> about, sorry.

If it's just you and me that have a problem with this commit
it's fine I guess, we can just fix our drivers.

I am worried that since the new behaviour has been in v6.17
there might already be new code that implicitly depends on it and will have
visible regressions (such as flicker or glitches...) if we just
revert the behaviour.

Yours,
Linus Walleij
