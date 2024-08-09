Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591794CB06
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 09:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD4910E0D2;
	Fri,  9 Aug 2024 07:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R63WlXAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640CD10E081;
 Fri,  9 Aug 2024 07:13:47 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7de4364ca8so212526866b.2; 
 Fri, 09 Aug 2024 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723187626; x=1723792426; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Pv4I4YaejEgsElZPxnngKBe+yQT+aVahF37ordesRpg=;
 b=R63WlXAGYRpYT3ZS+7rtz5KAiLiC3aWCiez55N3EibdECQuoGfWndKjKzmWJHrZeqx
 vcprlzOEoNML+N8jj9C+FuCqVZMgc4Jt5P0Ce/z9JbVoggfeqOgEEHP6joyr0ZHGWtyr
 itnOO1YtT3vXYYSUAJikSSn5X6pst8sKK5d2ifr5gzJzTGQEUDBKpZjJWuxqzO1+NR68
 zHi7LoXBr/qQvmgxc99fIb0XAYrdmu6+byXagVeSqfukrx69xSfb8RiqMAkYRA72XLUi
 yk29WbND8FqLyhuM5UeVMeP3QufUOvlx2b8TPSuEBUgwGo0T55wMzobMzlWN7502SOtX
 XtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723187626; x=1723792426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pv4I4YaejEgsElZPxnngKBe+yQT+aVahF37ordesRpg=;
 b=Fu8SortYzzKqhL297RkXJpdiJXVtZ3r7YgmXUvRmSkjsDFYPI0wj9hPgZD7TKQUR+x
 3sEYA9UpZmp6PXrTOIX5lkbfSokM2oiNdwX8iJsp3so2rUBbJ9wxHqrW1zS4ax8X0yyl
 ShFc2fq4lz7yZUKEBe3x94wKGqaT7QZu7lVBOoCYzDZUp7TzbRBJV+OjeIRoK7yWOpk2
 80KA614nlqDHgcGxw5dQSTFTpX9NTbGepe0MbZNI1UHcrV5+9LS66a/BH3dS05Gcn+ti
 +wEerSCVEt0XWdXODbrNYODir+uGwhyuTyncJUBl8LE9R+2v7zcRuwYTwJg5TfJvU902
 kNHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMI+b+Eg/MBcOCHxzcEQDt8UhERFqBVftZE58uOduDLvQwTCGH39uOibEjsvOVqNQExetH9kumTvCkkgAWEBAxcoPL9iFWl4+brr0FdrnGcbeYPtkcrvtGjjJ0pRUTW4rwC+7cZUmqTp+jf+m8k/ZeIgFCREgKQDlRnztz7ZJDpUvGcHmFjYnGM7Efd3smB9eaiyhr7JmmXjEUqa/bhuNYTH0aMwf96zJ+xh8xDlXwRew=
X-Gm-Message-State: AOJu0Ywpfo8CHZt4gayUEjpxDzutUvfHX4JZY+EY9n/Ab0uEK1DvBEPg
 ZAKcIkBTeKKm8FnHtZ1BjY1WXv3T6Ml5/U7tbggPf8n+QnS7uEHIvh1InnKO/pkjjZVGTmBKglo
 CxCpq7aAPMEfDmkTloW+OvpAaFag=
X-Google-Smtp-Source: AGHT+IFCoo4tuMgQOW43yZ295KRyZr8Ephj6zrbAaDIcAq+5L/uWBwqG5PdknF9srRZDKuiMGVQWekf8vfw40R9KZVA=
X-Received: by 2002:a17:907:d854:b0:a77:aa6d:e0c7 with SMTP id
 a640c23a62f3a-a80aa5dd7d8mr54927466b.30.1723187625368; Fri, 09 Aug 2024
 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <ZrSFpj20b1LbBhCJ@linux>
 <8f7c531a-ecb9-4c30-b4bb-2bdf3056ff34@kernel.org>
 <3b87c155-f35d-4812-a4b3-ac5e0bfe0c18@kernel.org>
In-Reply-To: <3b87c155-f35d-4812-a4b3-ac5e0bfe0c18@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Aug 2024 17:13:33 +1000
Message-ID: <CAPM=9txC6kJwmLhmVZAeJtf7-EZsV7PGoBM4oq-A3+fUTa2c=w@mail.gmail.com>
Subject: Re: [PULL] drm-intel-fixes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tvrtko Ursulin <tursulin@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
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

Hi Krzysztof,

You might want to familiarise yourself with the drm tree development
procedures before weighing in,
and snarky comments like the final one are not appreciated on this
list or in this community.

The drm next trees are never rebased (only in super rare emergencies),
we never rebase next onto fixes,

This leads to a number of things that are different from other workflows.

I agree the duplicate SoB isn't great, but it's also not harmful,

The cherry-pick thing is normal operating procedure unfortunately, we
get told if we leave it out it causes problems later,
so we add it in, and it resolves itself in the future when the next
trees end up in Linus' tree.

Thanks,
Dave.

> >
> > 1. Duplicated committer SoB.
> > You added SoB. No need to add two. It does not get stronger. You do not
> > change the DCO rules by adding two SoBs. You cannot confirm something
> > more or twice. Read DCO one more time...
> >
> > 2. Useless cherry pick SHA.
> > fatal: bad object 97b6784753da06d9d40232328efc5c5367e53417
> > (Tried with repo having several maintainer repos and the linux-next)
> >
> > Only you have 97b6784753da06d9d40232328efc5c5367e53417. Maybe few other
> > people as well, but all other do not. This does not bring any useful
> > information, rather obfuscates public git history.
>
> ... and in case you claim that 97b6784753da06d9d40232328efc5c5367e53417
> is in drm-next, then your workflow is broken because:
> 1. You will duplicate the same commit. One in drm-fixes and second in
> drm-next. Just use git features, like branches and merges... First you
> apply on fixes, then you merge it to next, for example. Or any other
> sane way.
>
> 2. If you rebase drm-next on top of drm-fixes in some time in the
> future, then that cherry-pick SHA will not work and will be totally useless.
>
> so either you create duplicate commits (that's how Intel gets stats?) or
> you introduce to git history totally bogus SHAs...
>
> Best regards,
> Krzysztof
>
