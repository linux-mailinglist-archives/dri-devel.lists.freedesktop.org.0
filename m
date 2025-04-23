Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9845A97CB2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9B10E3E7;
	Wed, 23 Apr 2025 02:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AzzS9jhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6EA10E3E7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 02:14:05 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so835531566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745374443; x=1745979243; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UO1oWyybOFYuKCuGsQ4yBPVZ9X0D3n/38DsQK1HWIEU=;
 b=AzzS9jhUmLAUrZLdfNm39obzoRiiU/soyCOeJ5iIR5ZZDUtLxGIs+ySOwjlAvkFLak
 UXoN9wEWtT5mCsCfxjGR2Yi7MVxhkjm4++1y0/A8mGlpALcalRfVZLCe4I5jUzv4Qg1D
 Gq+obsbcIh9eemMQbf/bpCtV18fEyExVlRfqx/rF6SUMw7QPS49SZbEKQRBi7O1Ex5zT
 QyZygK5DGL2nbNGioEkTVadZO3P2tZ8FrUCfHQCuq0ceg/VHXcS08FKu7FCcdvZIdnvW
 Wlu6pWxKQGGpFfGJsiXoHdzE0NIl3gUs7t8voD4JcDtvyBtwZzS2hX/5EjjXtLSDlVah
 QlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745374443; x=1745979243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UO1oWyybOFYuKCuGsQ4yBPVZ9X0D3n/38DsQK1HWIEU=;
 b=dTNSu7pcvsVI3TNaodADoACu8I57OI4PEjPehSAA9XcMqNcDuOCWRvmfYZPxDJm7Ry
 VTxmGv9PctRVoUEgJTGwifd5i/eKWa1B5JizbQ91LVSQLxapiYyUuzhNqOauEeVHqRVQ
 xVimKcDbK1gPRIEgvn6g9uHKnQM+4xXACRabcSmmMtqBSZNyE1jZPfbKNY+3ZAlT88UN
 XVVKz+swil/WaoZ7pF9/svUrtXqPqCGzvmR7QC3dQVSgNBLruu0AVCnVSiscNUDI6clf
 sqHkpn8ZbfVBemxp6pRPn16NMv87rIJo2lC996iIQEJ2Zl75cnHlE+bjePlAQLGCq+71
 If4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9BtCson5B4TMnpJrjyXszElzecLgXhyTAv9KrpesCAdrEtptI9Qdpw6DpvwUhFH/5d6iUWuKyyW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW4ejxHR/10yCLQCdZRTF0QahtFZnUOQcq6QaKofKBhydSpCJs
 4H+/siQeOZbz4aG06AqQaR8BYdNvgMOwUTzMW+wl8BItdgdKkzV1BzewdzVCLp+2FW7Z01VtBRn
 VNUxfj0toU1Mdg6ayGx2v4MPHZJo=
X-Gm-Gg: ASbGncvJkJ3cd5Ia4356IiqfTaDK9wrFCmqNKnAwm99KzhrUv9qndGpektAyvsS5M8n
 k4NK/zKDFW/gFOHUpN045HooE1Zm3YEIVFmJzYVshM178spkQZEH1GcPQa3QMytDpHUCGmfcw0l
 115FFzGhdyuonPRNAwE5AWawAMF9yet9M=
X-Google-Smtp-Source: AGHT+IHbfVdKbeI8Ajvzav9tgHsDd5MvHxp6VmYeBHCnH8ngMu90CrqdER4eMugoH2qSA7vfu6NbwwAJDYxtSF0Ns5A=
X-Received: by 2002:a17:907:72c4:b0:acb:5f17:624d with SMTP id
 a640c23a62f3a-acb74e135e3mr1410063366b.57.1745374443285; Tue, 22 Apr 2025
 19:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txG6J5cAMcKJWE_Ya7HCdykQYeM=s5qmEwcTVLbF9qoAA@mail.gmail.com>
 <aAhG2E8+0W6JHibK@lstrano-desk.jf.intel.com>
 <aAhJVYI8G9zbnliY@lstrano-desk.jf.intel.com>
In-Reply-To: <aAhJVYI8G9zbnliY@lstrano-desk.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Apr 2025 12:13:52 +1000
X-Gm-Features: ATxdqUGAKydIYX2McFk4OpGvxfT72xkAbV_d-WuULnpXv_6rlGB3PpKqFRNrJa0
Message-ID: <CAPM=9tzxrutvKdEiFNV10RqyawObQt-kyBFQb_3s8Hz6UzDkxg@mail.gmail.com>
Subject: Re: force_alloc in ttm_operation_ctx
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, 23 Apr 2025 at 11:57, Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Tue, Apr 22, 2025 at 06:48:08PM -0700, Matthew Brost wrote:
> > On Wed, Apr 23, 2025 at 09:35:35AM +1000, Dave Airlie wrote:
> > > Hey,
> > >
> > > Been digging a bit into cgroups stuff and I found this force_alloc
> > > flags in the TTM operation context that seemed like I should dig
> > > deeper, but I can't see this flag being used anywhere, places set it
> > > but I can't spot the consumer of it?
> > >
> >
> > A quick grep shows:
> >
> > mbrost@lstrano-desk:drm$ grep force_alloc */*.c
> > ttm/ttm_bo_vm.c:                        .force_alloc = true
> > ttm/ttm_resource.c:             .force_alloc = true
> >
> > We have this wired in xe_bo_evict() too but always set it to false at
> > the caller.
> >
>
> Ah, I should read better. Yea, this appears to be unused, only set.
>
> git format-patch -1 c44dfe4de0539
>
> This show when this flag was changed to a bool there was one consumer of
> this flag but that user has since been removed. My guess is this had a
> use case, that use case changed, and the flag was failed to be removed.
> We can probably just remove it since there are no consumers of this.

Oh indeed, I thought this was something going into kernel, but yes it
was just leftovers from something exited via vmwgfx.

I'll send a cleanup.

Dave.
