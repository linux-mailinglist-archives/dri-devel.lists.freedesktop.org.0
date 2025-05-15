Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F7AB8DE7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722310E943;
	Thu, 15 May 2025 17:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="idlKlKom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36010E933;
 Thu, 15 May 2025 17:36:41 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d8fc9dbce4so8268365ab.0; 
 Thu, 15 May 2025 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747330600; x=1747935400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqHcNXrLgFH+FE/dQ/7Jqx//cnQWyh3PmPGZhUVuq2M=;
 b=idlKlKomiDhT8N0lfBkc0o/QczuuVWozBrLWRnMEz+DveUwRbRIUl4TvtqEBIbLx/b
 ikTkO8xtgV2QCRUdZpSMCjNS+eOud0JEv942q+/3lb0HJOhtqjaH57fIuh7LE6DrvtPC
 t9ujEl3A0seOTZlqMwYrQzZs3fl/gcQcZzr+xpBZYN1Nrm7jkjoKKquiztekHZMQoaKg
 HSe4kV4BXwU8diNjE4SORqLLLmr8jTo4q3BYXYolshbDLQErP7WtIyP/gNcdsT7bf9kO
 P/QXaOFaddUnIk0cxXYl2DhguAgXnvSQGlZ2n3Oz3XVIpzrf7Ow3cn+IipEKv1t1xkhX
 w7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747330600; x=1747935400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqHcNXrLgFH+FE/dQ/7Jqx//cnQWyh3PmPGZhUVuq2M=;
 b=qoonat5Tu8XMCxgmhILTxtumEIS6iH3tuEhK84QGZxvnV9vzPPk8wTFCvC2/gNFpAw
 9ITpZsKUEw8L6ZhQfOghmVrweCUCFbGfGNVzQDo46rho5C8WP5gwTzGL1tQEo2aISW7p
 zIqmqUNfz1nTGVxRI2SxzLycSS5om77evUZq6cSF9LJ06ebQCxBpqbbHgDCRl/FQE5jV
 Tyvtz4YajuA2Ossaf5C0sfEEislI4kqJqrqAJk7jXUhLrNylh9tFqHekQGgv62VqCZpW
 xOXsyoCqrTosiT1ckEowhpjiX/UkAD8DmRfhxBb7aTcQnb8oN0ZvT1sIqCCA22qAOK2i
 GBQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1zyP2xGmIQ86mbT29xtaeGeM2gZt/Q6ftH/67vfIRSizIJ+VuvbtDlWFV0Osp6r6l/mWqOTPuDUs=@lists.freedesktop.org,
 AJvYcCXunb1L7vO/Wn7Ri9SGh3eJxJmJyaWCZGzgR4fK6fvAwk6d5OVJG9ftpmgNOds8mAB0sOahvSRs2dF4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGiGUwAiP8ZO/2teXRqU4O7xwToEp5uOVB0M51COuRCX4dj8ME
 CtkxspaoeVv2TaH35GMnoDTa1ZlakteQ/rNBOaeNYk9GEhV968xNT1thshVoHarh4rLGpJe1pvY
 4fs00a8nK+OZm0m79X4vxctwz8fmgsp4=
X-Gm-Gg: ASbGncvZISxPREoVjgc3LjyLBhHNsj7cou3Hx2ZHHYbVOSHBlQQxwbxT4SOGUUMudfD
 g8awVYa6JoZycvMNsMqmvXcArb4vmSsDAPBV9lX40jiUv4An9VUPO0GD1O+0yhaL3Pdq35F6j/l
 NkBg7VQ+jZ+Xta5YQm9cPIs51iarHtZLg/2yjAtdtuYLD3DlD2u9xbEfMy1zgWEF0Gb9IEzZGh9
 g==
X-Google-Smtp-Source: AGHT+IFE+JBnt1NPTvRR6pHLKFY0JDRYFTVuXW5ZgFpZdNHczNUdwTdzRDEMxhVRO9gP3eWJ4OQwNuIlrSKjsez6h/k=
X-Received: by 2002:a05:6e02:1c07:b0:3db:7434:a8cc with SMTP id
 e9e14a558f8ab-3db8490530amr2645855ab.8.1747330600475; Thu, 15 May 2025
 10:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <aCYi_mkv47ckB6ox@pollux>
In-Reply-To: <aCYi_mkv47ckB6ox@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:36:27 -0700
X-Gm-Features: AX0GCFtCmghLHobPptzNOWUCvf5wIEoct66-fDcHcf80I6aFdxoL6tqmJhNttBg
Message-ID: <CAF6AEGt8LXUwCiin5Z0Tab-9U66N22aZBVXM5aLFw8pjMXRgNQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Rob Clark <robdclark@chromium.org>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Thu, May 15, 2025 at 10:23=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 09:15:08AM -0700, Rob Clark wrote:
> > Basically it is a way to throttle userspace to prevent it from OoM'ing
> > itself.  (I suppose userspace could throttle itself, but it doesn't
> > really know how much pre-allocation will need to be done for pgtable
> > updates.)
>
> I assume you mean prevent a single process from OOM'ing itself by queuing=
 up
> VM_BIND requests much faster than they can be completed and hence
> pre-allocations for page tables get out of control?

Yes
