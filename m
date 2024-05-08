Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEB8C0702
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 00:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AD4112A8D;
	Wed,  8 May 2024 22:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RoW64v8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9AB112A8D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 22:00:28 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-792b8bca915so13413685a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 15:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715205627; x=1715810427;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
 b=RoW64v8Qx8hfm4w62JDpP8s7cibzqIPqNiy8mE5hnVEGxDtQLAedbwqEBKAC8lyF14
 8hhuGjcRq7TTutPGSfHdMW2VXHyG47EQFJh1fcLlds95u7HwdVWi7VuzlblYlOJrTk9w
 7lG1fGRx3oubUmYHGwNkDWKeGNf7wwHGXc+2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715205627; x=1715810427;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
 b=PIOjSW5J6KjjnmSiWzZoXb+zDO43EzQNGvDIUtpjLEui5z9qGhHyeZ+vMeIwr7itGM
 J7skKIVBXCp8SOC96UZUkYRFv+LYfk59FOeSJtpR02Yhoq04z4IKYR0S8i/Fpfgkrbck
 LjuqViMv34Y1OrxrmFOT1tBAES3bM1nTYxLZfjd/QIRkWEc+qHo0AlLeVp/bT990gqpE
 tUoAa/nLTfzpZhlqvZsu9sogsoRe4at0gh1tTD7DTMrGjqhY5LEd8EHmyb8mUuo6zfGu
 mekGLj4FM4s4X+p96I6DLOtt5e+YzNTvaPUk6TsQtUm5bCxUIhQOPLm8GcYkMZd9ESX2
 szmw==
X-Gm-Message-State: AOJu0Yz+j2f5CSv7/Iyfy+vWOOPvlF2yZBNAPKJbdDAZer8ly4zbGdqw
 d1ggBPXg3X1YntXNqvuqY7FnrrOCzXKmPqVxHJaz25E1Mad4olkt5BFLK04hKkC/oF0gcOKYcHT
 A8ilfFvkWbEK9KRIbPhCx8hMRCyYaU0eYvCKK
X-Google-Smtp-Source: AGHT+IGWqLU1ICb4oSoi/9XAMgJVPuBLEWgl/SHPBap7kXqtX8RC2o95pm9Fnnk+3bonio7wO95HePihNpjGcIn3FZg=
X-Received: by 2002:a05:620a:3721:b0:792:b938:7769 with SMTP id
 af79cd13be357-792b9387953mr305283485a.11.1715205627263; Wed, 08 May 2024
 15:00:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 18:00:26 -0400
MIME-Version: 1.0
In-Reply-To: <87a5l0lmlv.fsf@intel.com>
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
 <87a5l0lmlv.fsf@intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 18:00:26 -0400
Message-ID: <CAE-0n50O22Mn0N4jMUAK6YMRJiDvuW9VhPnLg=TLV-SecS3p6w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kbuild@vger.kernel.org
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

Quoting Jani Nikula (2024-05-08 01:43:56)
> On Tue, 07 May 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
> > compilation is broken on machines having python versions older than 3.9
> > due to dependency on argparse.BooleanOptionalAction.
>
> Is it now okay to require Python for the build? Not listed in
> Documentation/process/changes.rst.
>

I doubt it is ok. Perl scripts have been replaced with shell scripts in
the past to speed up the build process. See commit e0e2fa4b515c
("headers_install.pl: convert to headers_install.sh") as an example.
