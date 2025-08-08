Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B276B1E8FC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662110E12B;
	Fri,  8 Aug 2025 13:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WbUwXiWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CFA10E12B;
 Fri,  8 Aug 2025 13:14:46 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b34a6d0c9a3so2424681a12.3; 
 Fri, 08 Aug 2025 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754658886; x=1755263686; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iawHC1WUTHg8Q1cXEPmQw82NLULRa7+zvXxXpbCHsU4=;
 b=WbUwXiWFSKQl2qi7cnadzZh7QhHu4KmvV2GgjCYDkQYtZJmBFMOtgJq4jfD81Y40if
 7Vn5lktmL3I0sb1gV7iRgUmLSX0kHyVx6YiHPT8PVmLfOW7AdsepvQI7LWZIh9l9q1fy
 IJI7gUCIUprlU/r/0WQU8Ya2D8u3BqnS4XSMqKcYAFQicv2BvgbHmQh0Me7nDy3PkwS6
 MhLjfTK7v7GCnPUTeUTwslFvXLshBYD+pAEedAVgbRBGh0zESaBbo7j/yn03oO+9ff+L
 Ht7jDdCsoNDTJ6IDoFuVYDkHm4wjGivmazwKHz8Mde8NHWpglf+26C6XFreQsuRgkvZi
 wpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754658886; x=1755263686;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iawHC1WUTHg8Q1cXEPmQw82NLULRa7+zvXxXpbCHsU4=;
 b=PK0BqFy7Bk07ZkqS5ki6F8B04Fu3jPtBFyn+6Dyo3k/hGyVCdFQQ0UqjE4Cy+NYOcV
 WAowVa+2z8eicB43RST2qHFuDWAOgMlxXbfZFhNiDf4t95jZCbkZqhM4pgCQU7b9Nere
 19+RGTxbxJMEoJdMqAMuv3OHj/k4KoqtFDviXFGKSuyEqQKSHOITdz4SDLucxnRcedVC
 Prl4Jac3iLudlk3pwBWaf661LFkccL/dzqeyowzWfb7anNLACCPVc1suDA/i0OrX976S
 7uY2EqfR7cZrfMIf+YCXjgzmZbT/dEcssc4NLprRVtcHGY+TwwwGbnfw02FQOZtmGGq+
 akRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp59Zj7efyQbOK+g/gw9Esl6TZCi5MkDAbHqS8iWqE/2rJjfyYAdTnEmYRDTZ/XdDoPga++u7/@lists.freedesktop.org,
 AJvYcCWX/epEHmpRTWAqjXi7FvgLLVQvID9PHyphWccC4xc1gzOzlFpaB5YoqgEqDaXg+bOcysvLJZbcUBdJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+KXH1Yg2SPL5jT/ThF6tbiNacCN8rcahcFvpZF0+nRXqRbHjC
 Jgjj99QbCiR4FvHglr+FegwqbKZZnsQZ2LQFIi8lYgYlB9zYlZRXUKw3zYKFuMdDCXvusHolNIh
 EKKQichLSmDTJ9jz3u3849QTGsLPomEY=
X-Gm-Gg: ASbGncuFkGEM13/Cvx1q4ZNmoywgmhYzIz6sHyyXYnLu3O2YsRvqBgUUoBPa+zq8iA4
 tQBMJO49VhaenEN5cT791WlyVlfTXvIgT8SYuRNXcFH4+dookPjjdpw/nKA+73EWihixrD0TDgK
 pHmTz63MUTO7+oheCUsiY/1hcMP+a/uDtEHiSlIOJAaV2Oz5avN3wRqkbLkfNyl4yS39u3o/9aW
 +Jn/co=
X-Google-Smtp-Source: AGHT+IE5B69vo+qtzdqrQ3DUHSvn6ONntAXNi5ew0A1UUjK2jQU3cn7X/PwXfy8EPU8TJl9/ldX9BWKqUwOEssBbTe4=
X-Received: by 2002:a17:903:228f:b0:234:ed31:fca7 with SMTP id
 d9443c01a7336-242c22cb8abmr46205595ad.48.1754658885711; Fri, 08 Aug 2025
 06:14:45 -0700 (PDT)
MIME-Version: 1.0
From: Abinash Singh <abinashsinghlalotra@gmail.com>
Date: Fri, 8 Aug 2025 18:45:16 +0530
X-Gm-Features: Ac12FXzRfdTGh3UkiWjvhnApGvuKIGi5zSWG1b8VaHhC3jJmLNLblI0mTB7_0K0
Message-ID: <CAMV7Lq7hCuUpkgU6bjs6oCENb_OgFchzf7DywM7g=YjWDNYz2g@mail.gmail.com>
Subject: [RFC][DRM][RADEON/AMDGPU] Starter TODO task: Convert dev_*() logging
 to drm_*() variants
To: alexander.deucher@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000095bd82063bda5b84"
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

--00000000000095bd82063bda5b84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I came across a "Starter" task listed on the DRM TODO list [1], which
suggests converting logging in DRM drivers from dev_*() macros (like
dev_info(), dev_err(), etc.) to the newer drm_*() variants that take a
struct drm_device * parameter.

The rationale is to improve per-device logging clarity, especially for
drivers supporting multiple instances.

I=E2=80=99d like to work on this for the Radeon and AMDGPU DRM drivers. Bef=
ore
proceeding, I wanted to confirm whether this change is welcome for these
drivers, and if there are any driver-specific considerations I should keep
in mind.

If it=E2=80=99s acceptable, I=E2=80=99ll begin preparing a patch series for=
 review.

Thanks for your time, and looking forward to your guidance.

Best regards,
Abinash

[1] https://docs.kernel.org/gpu/todo.html#todo

--00000000000095bd82063bda5b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I came across a &quot;Starter&quot; task listed=
 on the DRM TODO list [1], which suggests converting logging in DRM drivers=
 from dev_*() macros (like dev_info(), dev_err(), etc.) to the newer drm_*(=
) variants that take a struct drm_device * parameter.<br><br>The rationale =
is to improve per-device logging clarity, especially for drivers supporting=
 multiple instances.<br><br>I=E2=80=99d like to work on this for the Radeon=
 and AMDGPU DRM drivers. Before proceeding, I wanted to confirm whether thi=
s change is welcome for these drivers, and if there are any driver-specific=
 considerations I should keep in mind.<br><br>If it=E2=80=99s acceptable, I=
=E2=80=99ll begin preparing a patch series for review.<br><br>Thanks for yo=
ur time, and looking forward to your guidance.<br><br>Best regards, =C2=A0<=
br>Abinash<br><br>[1] <a href=3D"https://docs.kernel.org/gpu/todo.html#todo=
">https://docs.kernel.org/gpu/todo.html#todo</a><br></div>

--00000000000095bd82063bda5b84--
