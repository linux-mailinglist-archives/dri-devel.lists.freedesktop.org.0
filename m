Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307179B84C0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1E210E92B;
	Thu, 31 Oct 2024 20:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i6Pnv9e0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1325C10E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:57:26 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7edb3f93369so995825a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730408245; x=1731013045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqfmQwWGNi5gSLmw1HABwNExxBu+L4ODwUKeBji42II=;
 b=i6Pnv9e0IzxVP/fHGVDA+G/rMpcDgK5kjbHPpUYyljblD/ohYzEdmT9MwkIHZ+22MA
 w+lohb7STn7y4+oJstcEZe8CP5cx0F8EC7B1+cVna+V4j1fb0MaHodbf9+ovjDGlL33h
 Pdt2XZSi4mmH2jR+1oBnAHQtZW1E588Vz0lqfLKVPU2mLWQU+pmebqcxDz4RaRLxXo1g
 bDvRhhe83+3AD/KFDx4ZXx+zwqKd7YOZHdemfmhtOnOvtbqY/UeX5/du8aCUTK0P91rG
 7RETlpJwxKRgQ33D6p+f7FECBUR/njxsmY2m8wcKbMwEAZMLbV/s46w/BletXpGVtkPq
 GAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730408245; x=1731013045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqfmQwWGNi5gSLmw1HABwNExxBu+L4ODwUKeBji42II=;
 b=noHGYZ61vy+LZSk4xHuHo7QZVkBRT9ALnaLa0VRpdNs4SeYUAGCWXqsHHjg/soOqNX
 A+CnVoxLqvvCdZHREbu1lOLLbwOLpMzk/Y0Om/ojw/WDd2S5ICSj1DH7h10qyNubBWgR
 pqn3OdUXa/+WNpgS7h+gunAtBoNrvjmUJfoKHi9qJPfebDZ5PSbInJ9LVUHK2O/jeum1
 86x+NNXKkBYA77FCpt7sMzyRgl0N7vo4XG+ZYRtrk/SDumsBLWizKS2THjBmHT4fnYjt
 zM+NpKCIDPK//Ii5o+DfjcvUe0eUyz1FU1004tNNzpFqY0E+pPMX5dxFOEruaYm+0XHO
 K0MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2PfyVK4OQZASOPMzdXofvSN1Op5fNMP5c2osdc2EhFhUbfm8xblDvjfh43OXSetIMMGrOmSfoDjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy1bclSJm8UeBWKnerrH0tkhK+WenqIWNYHzNEG151BBga5TKS
 K3vnNbrSP0nIjZTG7BM7JSQ0J0DRbU4mBV68ccLSj7bFF7oSwCX/e93WtVR6Nc60eku5jNqCwur
 QYZFFnXWQpxgKW4rsj1WTIbKnBz8eD439OMg=
X-Google-Smtp-Source: AGHT+IFIw26pXtZcuM6AN/ZqMYbGVsCgRkzH5TP7hpaJgtgceL/sAoqy9JWxKl/WqX4itdzDFO11igw7MP0bP5zmrpA=
X-Received: by 2002:a17:90b:5306:b0:2e2:c15f:1ffe with SMTP id
 98e67ed59e1d1-2e94bdf49acmr1809259a91.0.1730408245293; Thu, 31 Oct 2024
 13:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241020204156.113853-1-christian.gmeiner@gmail.com>
 <8f050428-53b0-401f-a60f-3d4732c0a75f@igalia.com>
In-Reply-To: <8f050428-53b0-401f-a60f-3d4732c0a75f@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 31 Oct 2024 21:57:13 +0100
Message-ID: <CAH9NwWd8iWALZbVkcPUsMGWNZSgh-8ARgyHSTULJpOqVj+88zw@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel-dev@igalia.com, 
 Christian Gmeiner <cgmeiner@igalia.com>, dri-devel@lists.freedesktop.org, 
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

Hi Ma=C3=ADra,

>
> I have one major issue with this approach: I don't think we should
> introduce a `global_perfmon` in `struct v3d_perfmon_info`. `struct
> v3d_perfmon_info` was created to store information about the counters,
> such as total number of perfcnts supported and the description of the
> counters.
>

Ah okay.. got the idea of global_perfmon.

>
> I believe you should use `active_perfmon` in your implementation and
> don't create `global_perfmon`. This is going to make the code less
> tricky to understand and it's going to make sure that the hardware inner
> working is transparent in software.
>
>
> Only one perfmon can be active in a given moment of time, therefore,
> let's use `active_perfmon` to represent it.
>

Relying solely on active_perfmon makes the code hard to follow. I need at
least a flag to indicate whether we are in global perfmon mode.

> I couple more things came to my attention. First, I don't think we need
> to limit the creation of other perfmons. We can create perfmons and
> don't use it for a while. We only need to make sure that the user can't
> attach perfmons to jobs, when the global perfmon is enabled.
>
> For sure, if we go through this strategy, there is no need to have a
> count of all the perfmons that V3D has.
>

That is a fantastic idea.

> I would prefer to treat the global perfmon as a state. Ideally, we would
> enable and disable this state through the IOCTL.
>
> One last thing is: don't forget to stop the perfmons when you don't use
> it anymore :)
>

I've sent v2 of this patch and hope I've addressed all your comments.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
