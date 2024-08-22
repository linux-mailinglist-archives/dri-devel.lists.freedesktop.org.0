Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A207295BE44
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 20:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386310EBCC;
	Thu, 22 Aug 2024 18:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ClikCpGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C75C10EBCC;
 Thu, 22 Aug 2024 18:34:13 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-75abb359fa5so117131a12.0; 
 Thu, 22 Aug 2024 11:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724351653; x=1724956453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMxxaOtK8U0yo4hnUE3Sr+BVfCfehARBQJOIM+1YP0Q=;
 b=ClikCpGcP+fizO3engFSYSBmLK5pNRkjAo23dRHQDBlSSw9ZVMzAcw1y2lqJtAms/G
 hV7ZD0OMozTPvf/D4C5Lt6hpktEF5ZaOAYvUGAickakZnWcACx6vHbiTQKfud4OtYYZ/
 frLRD+SjfnEzYIU+w6A4Qwtn3MhezjzC86tBceqogUApjxBVIXCM3wlBDN7EUIDtZXyU
 hbJqMuhVUvJOhZDrKJMPI5ScSKTUAm4PMprVOGuFrW7lSWNLOZ4yMtdGu6TZKuV2R+uh
 BFtApUIC2n2FJhvzSW12Ye21H3uIiALnYg1zMRS/GsZ2DXwyLqaRzMwiBs5xtE7Rw9UP
 dlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724351653; x=1724956453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMxxaOtK8U0yo4hnUE3Sr+BVfCfehARBQJOIM+1YP0Q=;
 b=U0CAj9oJsvHSq0dhI1Gx3fcT1Fu4jxHTRGV+1FGzaItyJyeOVXXqk+EQXD/1wLw9dP
 S1RzcQ++gRet3hKf6nSHrgYW7A32npQtOFpzfc0FCgJQ6KmaHnC/NXhRTV5JFqQJ/0dx
 Z0iUfAmHTyf3sB+J2rK9LgSOV5Hkn6KedqQ1/3WhlmyQId8u6TuccaRLA1eMmpSjxNGk
 T0VcZPrjHC2X6hqOoAVAZWgHm1IL2vrtN/rvpOD4djXL6Gg9yTtyYUGnR0kWYmiw6/vB
 juWyBB7k9WacetqFHfG0466hsO/iPPLmmrTZEPVqKDBe0gIgqVvcwfmE24clKoECyGqN
 zTZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVc2+ACTT1fVKgTePi+3eMBsVaW5BJZNOtp+kFhHZp61VU3RwRsGdwJtngO1jb44zkMGTlL1ZU6raO@lists.freedesktop.org,
 AJvYcCWTXC6N6VNA/DUAQiY05qmxbWnXDMmIVKTplFyqLdXXIcPRRRj3iiJ71X1j9P2+xpGSt8V6tH3m@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf2+fFDlfpMtMkUk/+6squEi//+17JOvudl1hN5DqjCJ+fx7bN
 MQHauZ+YQoenToVNSzZM1JV6nLjzam0TwtFWXKjgxVttyyVmN6GGeur5C1EcP/sdrB0T3eQ1ujN
 5VzXonxweH6WFCYL005R+5Yh2H3k=
X-Google-Smtp-Source: AGHT+IGPF1XUUudFvjGPHATL7UDa9u1dQKv5EqeuytdBdTms5BymTb5tqh+mLj1j4yketuXtjUee6wZ3btV4aNuNyKo=
X-Received: by 2002:a05:6a20:7348:b0:1c4:f30e:97ff with SMTP id
 adf61e73a8af0-1cada1f1452mr4450575637.9.1724351652819; Thu, 22 Aug 2024
 11:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240822065723.1336181-1-yujiaoliang@vivo.com>
In-Reply-To: <20240822065723.1336181-1-yujiaoliang@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 14:34:00 -0400
Message-ID: <CADnq5_Pm0Vg-RNtnRoj1Dkc2Ke3paz1D6PeDkaKacGstBn7uVg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] drm/amd/display: Use max/min macro
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Alex Hung <alex.hung@amd.com>, 
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

On Thu, Aug 22, 2024 at 2:57=E2=80=AFAM Yu Jiaoliang <yujiaoliang@vivo.com>=
 wrote:
>
> *** BLURB HERE ***
>
> Yu Jiaoliang (6):
>   drm/amd/display: Use max/min macro
>   drm/amd/display: Use max/min macro
>   drm/amd/display: Use max/min macro
>   drm/amd/display: Use max/min macro
>   drm/amd/display: Use max/min macro
>   drm/amd/display: Use max/min macro

Is this the preferred kernel coding style for these type of
comparisons?  Otherwise this just seems like a lot of churn for not
much gain.

Alex

>
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c            | 4 ++--
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c | 4 +++-
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c            | 4 ++--
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c                 | 2 +-
>  drivers/gpu/drm/amd/display/dc/spl/dc_spl.c                  | 4 ++--
>  drivers/gpu/drm/amd/display/modules/freesync/freesync.c      | 4 ++--
>  6 files changed, 12 insertions(+), 10 deletions(-)
>
> --
> 2.34.1
>
