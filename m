Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35428B4AAA0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 12:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E2010E6A3;
	Tue,  9 Sep 2025 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OCBC34dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046810E6A3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 10:28:50 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-628caee5ba2so3571406a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1757413729; x=1758018529; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JKGepJQf9M6lLtehJhlq5BApUCT3KilSUJbItoq+UYI=;
 b=OCBC34dJ5kE9b4D2pVjfQQcEr9NqU0LWf3Fn9HLy96Vl838f5WECyPEceo0dLxLPUh
 8uHuccuq1Ei7scKZqQCWn8IgCUxubOoT2QXiS7NI+Kt4py5vR6NjBeMgY6fR+TP2bVj+
 NKLOfrgYIQaE+TvOlolzz14p1AMAy17j5zu4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757413729; x=1758018529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKGepJQf9M6lLtehJhlq5BApUCT3KilSUJbItoq+UYI=;
 b=IWJkEGTDmHfqocy/gosqYogi5v6d5bMxTIvBY94+EOYhewv8YOzMCcDAEp+ilARD3/
 l4ZMFqYVRTcpFWV0/ZBuySjd/BBi+ZHGZi1wZKZNTkfaTIZgVI0Gw8N7XiyeV+7vl8GH
 A7nNVSvJMWjsZRff6AS5j8/FtRHQJjE4GdeY6QRNRDJXsVl6t85W9hp6FvwTWzkkpD9A
 RfVI1laPVnyJfaeeiUqUxF23r3sfxl1IVVFhqCMHChwzRyGHq3AnBBsncuN5KYm0whCe
 MCuIRpbc//OaOHcNLaz0LxdIxQtgtskIFU/XKE98i3WOzGF+qFVAi72C3Lm067o5aWrj
 5AOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUriZluSztA1Dy7nATksdT9ljgKhcyuLXWol5hE+KPxn9aO82F+JtG8vWtAYo079e7cLZnuVTEKU9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxditD72GtOPLZcLvR3YTY/ronmWJUHZKT+TbPCnk1WRv3CiggJ
 HkHr/4SDiP8EZZXOkxSdhCi5AKcxli/sU2Tpj++5RD+d12+gWSpVcFsP8Rii26YOnNg=
X-Gm-Gg: ASbGncvB6LgHkA0xnb+2o8PkXCjGbmkexFjfxKqTm7TsMv6KvQbl63UL1GQZRdWBnnx
 TYN7fOy9ymxetFfOSaTjvjD5tAcptLKaNWR+eHja3/ltdmFYE3qxf2TOXf+J6hRO4GfR0R5lM8+
 3lUVxqSULLFLg+d/Vb3CL71JWV+HQovldzstOnl9/tSyYijsgQHVeAZbooSwGY9bLsa2m+/YwdN
 9wZNf0bV7LM0YUxiKMVQ5ewEgVw7IcUC6If9sq23lyk1iMp7vkjghEfoQ3W5jSqrTPCWHN4ENXw
 MybOB1TjZlrNN33sDbRCkYGkvXHlOEoBHnjQZ8r7kx7x69rB6fxR09KtoBzVU/Fpn3HDz/Uyox0
 6ECFqR56BM75JFJpP1HlGpbhdPsTWmiYXKHOlXK9gK3wY
X-Google-Smtp-Source: AGHT+IEBkJ3EwLJJ+SbqYg1kqZCCIo6t5rvPOtBHOjN/zdmZCuifWtmUOwJ+nIlb5XiDEeLQY82oaQ==
X-Received: by 2002:a17:907:7292:b0:afa:1d2c:bbd1 with SMTP id
 a640c23a62f3a-b04b1f7639amr1089829966b.30.1757413729254; 
 Tue, 09 Sep 2025 03:28:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046b783722sm1472154266b.97.2025.09.09.03.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:28:48 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:28:46 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [01/10] drm/drm-crtc: Introduce sharpness strength property
Message-ID: <aMABXu_aijfcdWRY@phenom.ffwll.local>
References: <20250724134544.284371-2-nemesa.garg@intel.com>
 <CAFZQkGzBCU+tDUP=KahwCq8=LLW3a8NKiNK5U4JQ0btUFFz+9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFZQkGzBCU+tDUP=KahwCq8=LLW3a8NKiNK5U4JQ0btUFFz+9g@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Fri, Jul 25, 2025 at 01:22:00PM +0200, Xaver Hugl wrote:
> Hello,
> 
> This patch is Acked-by: Xaver Hugl <xaver.hugl@kde.org>

Since the kwin MR looks like it's ready too, the kernel side looks like
it's ready for merging:

https://invent.kde.org/plasma/kwin/-/merge_requests/7689

Might be good to record the links to userspace and igt in the commit
message so it's easier to find. Anyway, Jani asked me to stamp an approval
on this, hence:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
