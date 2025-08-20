Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B3B2E0DB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 17:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA2910E783;
	Wed, 20 Aug 2025 15:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fnXwNixv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9310E783
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 15:25:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-323266d2d9eso47665a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755703530; x=1756308330;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Uwy9jIZdofD/KICjKUSkalZ1bxXpwdmk7aQGqM1F+w=;
 b=fnXwNixvyLW4Q/KVUuizk8qyUzv25eLlYkA7nBLPjZL2Z1CYCddzc8cZfabLSnaQwZ
 TtJFEhfSxkKdZ3OaleObw/hFHiiLoDhFf/dqIHnIlM0ub03eBrB26HqYv16shr/52ZuA
 9Y3HPQdTBpI3mQxdzhjBqPjPgV/cDDArGbZQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755703530; x=1756308330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Uwy9jIZdofD/KICjKUSkalZ1bxXpwdmk7aQGqM1F+w=;
 b=nN5+GIxR1swkFaBOtyi+gZJCzMA3Pj8reAEQUIClFJd7/AHs+bK0m8rI4VxxIsDUCx
 jRVAVlRFguJsdx4OyWOmeSZv2FJeu5wwAEtVsgVd0u1yZxdS16xQtUGIxr9R02jKvrv9
 TAC62e2rK+BD+7Qo+GQe7V8FYWDAIZoBjfmUbpIjnCa15ly5P1O59dzCjZKzTvmNjG22
 QhVTaCayZnthbUhOl6kQJKaM8Z6xk69iskKA/lW1OerfRIhVauG/HttQR54ljwrsmf+x
 foZHM3QC5TBHRZTWbPIr6m1p2WjXNxVVqnyUxNylZ5qqq0mAutMO9ATv363xZ35Jwg/v
 /GwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHCrENkoPjo6Vp30SRLPyHplFpf04iu/8tHlf+m51F845ADnYPtvQlOTUJ6DDbaD1AtpSxqBFzN3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTmlQvdQkOeYr/UqVn8kYHjjozOCRf4IlqLuPaHjTrMZbHZc/k
 HXqpkuGg2pk1AHRcqmMRgsrqfgn3YLwDLJl2W5GFneloedmcIBH+NoMByaz/4urlrMs9yp9ifgB
 a1geTIQ==
X-Gm-Gg: ASbGncsBbLwbMvDZhK2P0z4SM6bnPFTWWES+woZCHQKj6XptWe7ibTQU9v2Tp4fmszE
 vg9lFepvCD0nkl1aZ6B+M/zfgfm1oGvtYt60x5JB6GUGhb6WLI82gLG3Lofql2TL/0DQkkIjica
 VbIqjgSVxdqHTleAtqxqjsihoyCzcvSA+HQcEiVl9JjSmJvzNIxCQoPXi2KfzqHpVspxFruAOJs
 dlsG+BY1Ly9yoVV6pIeX8a8f82yXxKmEzazvAWivk4n9GGxiNdR8a2U830VNx/AF+OrRFMVA7qN
 tljl7VgBwaMfrAAuX+ZsPGax+FQ6Y5jWO/t24TOVP50ywtEA3AjnTQgwUkfpirr21G3bjpCqadk
 mLpDOU7Rk617koMGbphQrmCRqO2yqLc9TLIr23yzR+g5qwnIguLF99/ipFWW3WeheBu2nD3p+a1
 M2
X-Google-Smtp-Source: AGHT+IFu0UctCK9J5wnE0KvxE625KNI3wHzWJq+3EWVVowqA2EiVzZbGAE2XjHW0CLdqp+Yr5sqY4A==
X-Received: by 2002:a17:90a:e710:b0:31a:ab75:6e45 with SMTP id
 98e67ed59e1d1-324e13fde5amr4195376a91.28.1755703529644; 
 Wed, 20 Aug 2025 08:25:29 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e258af67sm2658423a91.27.2025.08.20.08.25.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 08:25:28 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24458195495so42698805ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:25:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3z4w5kdud4SN6X8iDSyXVIvuyyVwVinKQHp7L6b6iS29zbf6Gig941vp8g+ZnPq0n1ztJFRyaO3A=@lists.freedesktop.org
X-Received: by 2002:a17:902:f70e:b0:240:66ff:b253 with SMTP id
 d9443c01a7336-245ef237b85mr45917035ad.46.1755703527669; Wed, 20 Aug 2025
 08:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250812082135.3351172-1-fshao@chromium.org>
 <20250812082135.3351172-2-fshao@chromium.org>
 <CAD=FV=X_CiSoXyKkg8jBJLPKe3WDBpLEOAngQJNnN8yZfaC+qw@mail.gmail.com>
 <CAC=S1nhXO4mHkxGbLzja2au7RAfDR+-yRoGAkuMCKCc69N4rng@mail.gmail.com>
In-Reply-To: <CAC=S1nhXO4mHkxGbLzja2au7RAfDR+-yRoGAkuMCKCc69N4rng@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Aug 2025 08:25:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFR7b=7h6gnyH_MtLW-dcngEqocBz6Lox4_JSBMO9RhQ@mail.gmail.com>
X-Gm-Features: Ac12FXyCoYEHWTUKnbt2HWCJxT_MXeti6--ZquIbT9ku4wcEFO6wcTTI38buFwc
Message-ID: <CAD=FV=WFR7b=7h6gnyH_MtLW-dcngEqocBz6Lox4_JSBMO9RhQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm_bridge: register content protect property
To: Fei Shao <fshao@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
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

Hi,

On Tue, Aug 12, 2025 at 8:01=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Wed, Aug 13, 2025 at 2:07=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Aug 12, 2025 at 1:23=E2=80=AFAM Fei Shao <fshao@chromium.org> w=
rote:
> > >
> > > From: Hsin-Yi Wang <hsinyi@chromium.org>
> > >
> > > Some bridges can update HDCP status based on userspace requests if th=
ey
> > > support HDCP.
> > >
> > > The HDCP property is created after connector initialization and befor=
e
> > > registration, just like other connector properties.
> > >
> > > Add the content protection property to the connector if a bridge
> > > supports HDCP.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> >
> > nit: your Signed-off-by should always be moved to the bottom when
> > posting patches. I wouldn't bother re-posting just for that, though...
>
> Ah sorry, I didn't notice that..
> Could you rearrange the tag order for me when applying these patches?

Sure, adjusted and pushed to drm-misc-next:

[1/2] drm_bridge: register content protect property
      commit: 407a2fab3c99c40ad1acedaf028e8222da1f0433
