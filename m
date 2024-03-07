Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE08751FB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC1B112ECD;
	Thu,  7 Mar 2024 14:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7EQIs8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59647112ECD;
 Thu,  7 Mar 2024 14:36:44 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso1044258276.0; 
 Thu, 07 Mar 2024 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709822203; x=1710427003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHybDwoUQOGEnt+QSZ4qpGKiQdZfRISLyzghHxirBk4=;
 b=h7EQIs8TAN0ZKEIRl4D8rtR1VKmlOb4/6+JrNI6Dakr6fEiWiBJ+R7r8aTSHZTXo5o
 DM9dnbsQHbGP2narC2C45DKdZccqzCUYqyqpRKex7Gq+mKWscTl1Cni2Ct5ecGJYtcKu
 Kf8uOfaXCih61+OpTj+yAJGIB12Hdd/VonBlgfB5P6nMWWIjMQMRyGpRWfr/dhOVkZkD
 PxMVEn67UsUiL5CwI2YhARAuTHudMXVrK/+vNSQSY8zLMCwsj7Scmv95jRqe7a8je1df
 tgL9Gpq34HB1yEg9jPuieIP50XzBH0YAT7O12SwF0bGknT6eGORdCBnYN0M9/9n5KYHi
 JN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709822203; x=1710427003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHybDwoUQOGEnt+QSZ4qpGKiQdZfRISLyzghHxirBk4=;
 b=triaQp4WaTX6PaAEuv/684pAM5/CvC+NWD0i4QB+5EPrxbAycvXHevwWC6bLTs8j3W
 oLFsHhfKnJ7Xb9bFXjP7NRwVkkU/DvhCo78wOjbRftQbTUaO6NcfjrSXgFgBIGl5o9NS
 TyZhVF2um9qQmXjiHgRxXlB7FBuS1ygJkc3R+rvePLLdZjI0KG6ICrRG7g5bR46xc2Cf
 cQGDEKk+zQnJzY1vL8w/MbiCSBly34O5Sf4Dmt7n/Sq55Jol3vy8Ld7Qo8lQuMB82/Qq
 Tyw5i1nufshphT1urPD9jglQs9o3FG5jl3o2U1kUhTJaa20k1yxTA0++WSILaN5SwY3Z
 95PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXYQh3VVgVcLYiVZt6sB6O1ZfwDalAKzpYntwqEtNp065mPazsRu4NeG8kaboJrHZ+d5QbqNlJcpBqPk/8YRgXHiHi9494EWqn+ePKvnFNApRfAX+hPjL1VIMS5au8T6SSczh729DioGcsnMoD9b4=
X-Gm-Message-State: AOJu0YwvLUcCMUX1ibxGLq+/tVEka0UGofU1Z2ED31aICt5TXAZ9TdSN
 jmu7Aj/6/6/2O3dTBL/w4H61F8QZ9guYFe5Ww2/z4+hbOLlCVHSpy6cOfVHVSZkY2lj5N3TX/cG
 GQ7Jx5GSusm/62LBsDY65AbDg33Y=
X-Google-Smtp-Source: AGHT+IHqGNr5ebrqhQZaCNGX931iRI358HI2V8ahGtUjcv4saDmeLQ+WBuZgDziGoSCFNHMzUxpws4F/TTL43G3uKd4=
X-Received: by 2002:a25:aaaf:0:b0:dcd:ef35:91d5 with SMTP id
 t44-20020a25aaaf000000b00dcdef3591d5mr15657405ybi.2.1709822202973; Thu, 07
 Mar 2024 06:36:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709749576.git.jani.nikula@intel.com>
 <115327b880b69b1c8ad157e5ff7f6b419868fab0.1709749576.git.jani.nikula@intel.com>
In-Reply-To: <115327b880b69b1c8ad157e5ff7f6b419868fab0.1709749576.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Mar 2024 09:36:30 -0500
Message-ID: <CADnq5_NXUYjq1bTbK1xGW-zREfMvNxYyg=B0jxA4oytGnUoi3A@mail.gmail.com>
Subject: Re: [PATCH 04/22] drm/amdgpu: make amd_asic_type.h self-contained
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
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

On Wed, Mar 6, 2024 at 1:43=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Include <linux/types.h> for u8.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

Do you want me to pick this up? Otherwise, feel free to take it via
whatever tree makes sense.

Alex

> ---
>  include/drm/amd_asic_type.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/drm/amd_asic_type.h b/include/drm/amd_asic_type.h
> index 724c45e3e9a7..9be85b821aa6 100644
> --- a/include/drm/amd_asic_type.h
> +++ b/include/drm/amd_asic_type.h
> @@ -22,6 +22,9 @@
>
>  #ifndef __AMD_ASIC_TYPE_H__
>  #define __AMD_ASIC_TYPE_H__
> +
> +#include <linux/types.h>
> +
>  /*
>   * Supported ASIC types
>   */
> --
> 2.39.2
>
