Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E2A8ADB2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 03:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260D110E80A;
	Wed, 16 Apr 2025 01:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTz0j5eA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7800510E80A;
 Wed, 16 Apr 2025 01:53:35 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5e5c9662131so9596805a12.3; 
 Tue, 15 Apr 2025 18:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744768411; x=1745373211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e19ozdcE7IbomEf30Wwf0grmgEk+1M/Dzc+QxYejxr8=;
 b=MTz0j5eAw7Umi/3Z1RbCtoCf40IcnC4U2Ao9qdJCFLy2JUM3czs8T3pCXrHw7TLLhq
 8834KWlAJx4Y1m140ECqPD2Nx9bt4SDHD/U8PQI38I3WzLo3HuJoWPJ5LsPbZF3DD1HG
 Mu9aD8D3Z3y6/B2xV6nZuHlwcKzRU0W/hlud38KvyunuNc2gSsSV05SAErwMmifZa9DO
 1x+fzDZcBGhx7EYDYhWMjd69DsMzl5sZz6p0dKXw9s2xArbfu0n/kkD1ohteyA113oY6
 11r4rGJZmMBXgywQLSVxQPKOwTSLpZez1dwVqp+RGiV2ENeJT7L3NtsMsa94aUzSNXQC
 m60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744768411; x=1745373211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e19ozdcE7IbomEf30Wwf0grmgEk+1M/Dzc+QxYejxr8=;
 b=s81HRrJ31kGMI7lCHeqLMujUK+EdZyk6AijZKEObJh2x0M3JwYx45oYcYXy7WLkeUD
 WiUGY/V9HAhysvXLb/pvmRSRXfNt4jtk7fsX9UK40sqqxa5tQScCJOATkV3HJOq19MtK
 xkOucwU4GTARddjbhXJpcoV3W+ZTQqKNbkqPuHro/aB9Ll2GACRL5d444XRuDek5ElYC
 sG+SKvES1qIRwPxYG6b6mM8+vQlq3SdMYGxN7q9JYi7xqn/9UUGTxxUDJYFwd6AcZacC
 BiVSbWHW+ulmTHiUD7OcCMqZ6drCGxMAYcsFYU7eLPgmuZSiTG7LFCLOAD/0FbvPkq2m
 7pHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF4bScf9EhLbE2cSAkOG5EcS9sqdNYd+VMkDOayHo8VCeXY1wnM4+DybzI+CqHTf1E7/Q56A==@lists.freedesktop.org,
 AJvYcCW3tbrdhstMuqrFKSaWH3oxflpIrXYTy1USCMNMfkI9xNq/bSdqQ2HZqonL6uLVKs6jkeFNPQLQUBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmoWd3Hue+uZdDEL5YTQ97efS3Obsq72jY1A5A+QEd7q/RnzOV
 L9B5PG2PM4Ew8bdO7WdH3NEd8bOZBEW6cQInF6x7d7IHcGRdA6iRzRAuQ6AW47GY4tYMmD32/hW
 Xwej3CnzA8AmjMxG7Cd4ZIoOQF+E=
X-Gm-Gg: ASbGncv2MtYzJUUro6L4g/d8JTi6hETpsXfuifer8vcgtmhn8NR5hmNfDbszgYo74Oq
 Fl7s9hOTbKXiZfYinR+5VrReMYUGIA/LN5Nvn5qOZKYge94GtOJxyDu9etY+jfOAfCqcdTXbC6R
 CfL3gpV1FRA3O1mUZty1pMlD8=
X-Google-Smtp-Source: AGHT+IGD3Qp6FIzJC9ll2LBqkwWJICeLoFZCjvLcF/uO1E3BlzXIrfgQuO3jDutGwzfoa8eIeGzozE7QKJP6L09YJ8w=
X-Received: by 2002:a05:6402:2548:b0:5e7:b092:3114 with SMTP id
 4fb4d7f45d1cf-5f4b720e400mr12006a12.9.1744768411372; Tue, 15 Apr 2025
 18:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
 <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
 <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com>
 <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
 <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com>
 <CAK4VdL38fkraY2sujHCVnuhLJ8pQ4f-MejUcfsFTbdxusys3Kg@mail.gmail.com>
In-Reply-To: <CAK4VdL38fkraY2sujHCVnuhLJ8pQ4f-MejUcfsFTbdxusys3Kg@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 16 Apr 2025 09:53:19 +0800
X-Gm-Features: ATxdqUHz59yqYDYZeJV48fS7GlYJXdTkuU_VYZn0rvFkG6wJAO1neOoLyfWt3zU
Message-ID: <CAKGbVbttU7Ru7-AuB-+sLCUZRvb8nmGZAE-mwq0WU7-3p=VA=w@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Erico Nunes <nunes.erico@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
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

On Mon, Apr 14, 2025 at 9:19=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> On Thu, Apr 10, 2025 at 4:04=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 10.04.25 um 15:56 schrieb Qiang Yu:
> > >>>> This prevents applications with multiple contexts from running int=
o a
> > >>>> race condition between running tasks and context destroy when
> > >>>> terminating.
> > >>>>
> > > If implementing flush callback fix the problem, it must not be when S=
IGKILL.
> >
> > SIGKILL also calls flush (again eventually), but we can detect that in =
the scheduler code.
> >
> > See the code and comment in drm_sched_entity_flush(). We could potentia=
lly improve the comment cause it's not 100% correct, but it should work und=
er all cases.
> >
> > > Could you describe the problem and how this fix solves it? As I don't=
 understand
> > > how the above difference could fix a race bug.
> >
> > That was the point I wasn't sure about either. It should *not* fix any =
race, it's just gives a nicer SIGKILL experience.
>
> Thanks for this feedback. So as mentioned in the initial letter, I'm
> also trying to understand if this is the correct fix.
>
> This problem is unfortunately not trivial to reproduce, there is only
> one application which can reproduce this so far and it is a
> complicated one with multiple contexts and relatively lenghty jobs.
> What I observed so far is that as it is right now, a context might be
> destroyed while a job is running (e.g. by killing the application at
> the right time), and a context destroy appears to release buffers that
> are still being used by the running job which is what causes the read
> faults.

Free buffer in context destroy when job running is the bug, we should
dig into it how it happens. And if multiple context play a key role.

> This added flush made it so that the jobs always finish before the
> context destroy gets called, which prevents the issue for this
> application in my attempts. But I suppose it might also just be that
> it had some more time to finish now. If this is not the correct fix
> then there might be some more missing synchronization between running
> job and context destroy in lima?
>
I'm afraid this patch does not fix the root cause, we should find out
the root cause first. This patch could be added as SIGKILL improvement
later.

> Thanks
>
> Erico
