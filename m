Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046A9AB3C1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0424510E6C2;
	Tue, 22 Oct 2024 16:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fm73fekB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7398010E6C2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 16:21:41 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e2e3179b224so774489276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729614100; x=1730218900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/AB6AS7bJ5wBbcya1+n7l9nd8Ua0pFUCnTuSAh4P1Yk=;
 b=fm73fekBWmr5uu4fUFFzdku2BEha33Rmt0ZZjdfstqe4LzFdQfJEsu7rTxhkrw136P
 EPs8PQONbNRJCC7meamYxsTZxE03UX5z5J67josrjBVlE8AS8nwwYsGp1S/2R4TZmqL4
 nM/EItsC+w0LYR21uiGA7VdeYLHSaVtyAflUEAiXeqFzEBoKR/UwxKCVsicD5sEq50rx
 PvED8HVI5xrgFkKMuq5RlRUUTlLeQy4AvjOCEBEjMZ1rAYXX06dKlVPfydEgmbz5Ap+R
 JkHtPtIfJNzXzlDc6Tmd9jP+sNQaPBgVF/vWvAsAp55WkbFcW0H4WHiz292lXJCj3K3l
 4PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729614100; x=1730218900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/AB6AS7bJ5wBbcya1+n7l9nd8Ua0pFUCnTuSAh4P1Yk=;
 b=q3dfgsVZXdvBSHJ3+4OOHVIwnwPPKVhWBSicdugd5VDoZphS00uRNtDXf8V7w4astE
 rROugHtsE3VRaETucLL6xo7GRZNrQ1OpcVtAb6X8gd+6KiWV5J4xd2VBbcWMI1R0Exb7
 rq+fcNopX8tzX75PkLFlOVBVV4HOUNZcmHkECss6XVQrSj10vzXBYx3S71Xn+72MqBOC
 r1B2qXsOSCCBFmd79m1rNhykzMTe+86HBxTfAkrFv8oCaH+b/LrU+sg3f5ZvXurXu993
 FV8GuTUt30ai56xkvWmb2sEu9GWABBzjz2vk+Q/legjtoIxDR96R+JNQhzxPkeBhkYsv
 Ub3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvcT1CmwA1jFxf8wfNMysttUARhZI6w6SrVOnCykl9CqhgXv4E4vmV9ro/IGyvdLiy6OgH80GUILM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGvNlhy0JK9RS6GK8W2MDB4JT6XYpyhKF5T8ZWgS0CdCftTiXT
 aFfJHggPf/CVivOKmGBb2HVxtdwqodnPhsAei16v4ZmdDLyGfd36UMGvJK9voHaYqCrP8bBxwt7
 Yq7uDxAh7ZO5fK9e/TVo0Q+9Z3xs=
X-Google-Smtp-Source: AGHT+IE+TRHtfB4nMJrRi9Yp3xiRB091X4SarymBV8L4OkkaBBLISizccqEWXgEdDSpDwu8/sSxQcDkT1iKSKP2SLdk=
X-Received: by 2002:a05:690c:6f87:b0:6dd:beee:9218 with SMTP id
 00721157ae682-6e7d3b848a3mr42202967b3.30.1729614100326; Tue, 22 Oct 2024
 09:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241017162054.2701638-1-olvaffe@gmail.com>
 <20241022123052.3e0f3f17@collabora.com>
In-Reply-To: <20241022123052.3e0f3f17@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 22 Oct 2024 09:21:29 -0700
Message-ID: <CAPaKu7SbrtMpD=TvrB_y1DfhN1rNafLwAkdhX6+gzCW0ukg=0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: ensure progress for syncobj queries
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 faith.ekstrand@collabora.com
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

On Tue, Oct 22, 2024 at 3:30=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 17 Oct 2024 09:20:53 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > Userspace might poll a syncobj with the query ioctl.  Call
> > dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> > true in finite time.
> >
> > ---
> >
> > panvk hits this issue when timeline semaphore is enabled.  It uses the
> > transfer ioctl to propagate fences.  dma_fence_unwrap_merge converts th=
e
> > dma_fence_chain to a dma_fence_array.  dma_fence_array_signaled never
> > return true unless signaling is enabled.
>
> Looks like a bugfix to me. Should we add Fixes+Cc-stable tags so it
> gets backported to stable branches.
Thanks.  v2 sent with the Fixes tag.  I did not add Cc-stable because
I was told it was the maintainers' decision last time.
