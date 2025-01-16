Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C7A14261
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 20:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA30D10E227;
	Thu, 16 Jan 2025 19:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z77PzqVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1472D10E227
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 19:37:31 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso256622566b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 11:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737056189; x=1737660989; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UGMOysBI5e/dqO6GmDq+xFiu0iPMHmZNzcFnIWT7kd8=;
 b=Z77PzqVs5ws9nCkW9wLChqjzIpbQBp2HgpngHWP2MGBfaTYruPOzEO+MO2Uz0Gu92R
 gpJlMAjeu3yFoflBXhyI7U+k+DjCN0eOrPUz/Gu3ElXMEz54Z4baaJPb8I/awy8H3u5I
 39YCKKZoiZr9IlVuwrONRGQqtx77UPR6UJQzGw6KUtzZrIp0pnnnQ69g/dqBBpUWszSI
 j5WMIcpHeu6xgridUFli3B+/hZUXYlAa8a0uLsIDLAU/9X5o0pK+QmoweFohzCgb+kut
 cU+rsG24SSKDXtF08inQwJAoQjY9SVGrln7x1lRtEO8Ikir/jAYv25R/LfVGFND1pHRa
 J9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056189; x=1737660989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGMOysBI5e/dqO6GmDq+xFiu0iPMHmZNzcFnIWT7kd8=;
 b=Ku3CzmTZti1xU6+CRgYKBNPB5a2HK3NTuhYndnn/nFOeh+eQYK94pi9xM4pe//Eo4A
 TO8inuH7B4ZomUZrMZe3+l7A3sIn5vnn2HW+12vxrhWr/Q86oQo1FqzlD2jeMoiDQuH7
 U3P8Gahm8awmwkDMhsJZARfBkRla8lN2V9wnquMETQAdiVxbYMGV7Z8QLTqpPwXwqcnu
 8tLT2KOGpPOqX4fW4l6b6vwJxp4sIEREq2EB/GX1YoVkNKWrFNDp9KG+z2JJ7089A0KT
 gPBCaLpuX/vcj2m5DFGxI2inZ2W5/UQZePTUfZD4t/wvPCri/OeyC1UgwwKcBMOiSP6W
 FBew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtfc9RUbh2oCJ9TbfhjaucjTNAbIcoWooSfhIQwLpfGHoZ1afOLSzM6EcstkZQ8UjtCQOaNyTBIHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiqcrhqeFszBg0MKzsUL/4SLiY2+nHkEefoDR0Un4W0UR/lnaA
 OXUV41YEA7HEO2o6xSRsplR5amM/nsLiRmsg0x5qVVOa7p/Vca2hTgijL0HAag0RcR+rUmxONcn
 QyFbfK/uhvHPCCJnQmO86J3xp8d0=
X-Gm-Gg: ASbGnctQEQ+17ohvYJ7yn9x584gjJBcL7UxCaM2yYH+TlZPqGjKYdBzjjon3vq3qkrQ
 5KmVQBxXs9atu/KcKUb2H2nAgwtG0QadkIfXz
X-Google-Smtp-Source: AGHT+IH5odnZRmfmV6g5Z35ysaKoE6pg/vE/w8ce1P+6+gQinioIXMmBZxIjKCtVIVMbh5DUBMR5kSEsXgqVKSWNTcw=
X-Received: by 2002:a17:907:1c91:b0:aaf:c27e:12e7 with SMTP id
 a640c23a62f3a-ab38b15ce17mr7822366b.23.1737056189248; Thu, 16 Jan 2025
 11:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20250113121851.31382-1-phasta@kernel.org>
In-Reply-To: <20250113121851.31382-1-phasta@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Jan 2025 05:36:17 +1000
X-Gm-Features: AbW1kva_iWW0utxV_qOPpHVrU-Y1WRMs9pQUAVgQIowivUBJkQdRNNjPAUjcF9U
Message-ID: <CAPM=9tzLvLmPkHYMzAfUfShavvAd+9E+CHaaydu39ru6bkYh2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update DRM GPU Scheduler section
To: Philipp Stanner <phasta@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Yosry Ahmed <yosryahmed@google.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>
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

On Mon, 13 Jan 2025 at 22:19, Philipp Stanner <phasta@kernel.org> wrote:
>
> Luben has not been active and has not responded to mails since summer
> 2024. Remove him from MAINTAINERS and add an entry in CREDITS.
>
> Philipp has a new email address and an ACK to commit work time to the
> scheduler. Thus, set the state to 'Supported'.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---

Reviewed-by: Dave Airlie <airlied@redhat.com>

for both, drop them into next I suppose at this point.

>  CREDITS     | 4 ++++
>  MAINTAINERS | 5 ++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/CREDITS b/CREDITS
> index cda68f04d5f1..1593ada4209c 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -3948,6 +3948,10 @@ S: 1 Amherst Street
>  S: Cambridge, Massachusetts 02139
>  S: USA
>
> +N: Luben Tuikov
> +E: Luben Tuikov <ltuikov89@gmail.com>
> +D: Maintainer of the DRM GPU Scheduler
> +
>  N: Simmule Turner
>  E: sturner@tele-tv.com
>  D: Added swapping to filesystem
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26..fa288ef20c59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7888,12 +7888,11 @@ F:      Documentation/gpu/zynqmp.rst
>  F:     drivers/gpu/drm/xlnx/
>
>  DRM GPU SCHEDULER
> -M:     Luben Tuikov <ltuikov89@gmail.com>
>  M:     Matthew Brost <matthew.brost@intel.com>
>  M:     Danilo Krummrich <dakr@kernel.org>
> -M:     Philipp Stanner <pstanner@redhat.com>
> +M:     Philipp Stanner <phasta@kernel.org>
>  L:     dri-devel@lists.freedesktop.org
> -S:     Maintained
> +S:     Supported
>  T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:     drivers/gpu/drm/scheduler/
>  F:     include/drm/gpu_scheduler.h
> --
> 2.47.1
>
>
