Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCEAA5CC3C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 18:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A28310E643;
	Tue, 11 Mar 2025 17:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JAVHKrqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9984210E674
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 17:33:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30797730cbdso60884481fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741714391; x=1742319191;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eXqqH4KEKZGZtmnxGZpVEpu/EwdmYompCY/YmOfeggc=;
 b=JAVHKrqNMWdjkz3HUw7X4xu7sMmGiRFSghLua4+2CM9ujiKcs7aa1DS40/SBV0Ra+j
 usSu57nwpS1Z8rPvhQZj6YTTiCMKrRMdeQOkoMnDLc6OnouU7kZnRvSE4uY1Pbg7rEDu
 teU5YCzI/BBgIP/mdVnBxfyv6E8OmWECeLadI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741714391; x=1742319191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eXqqH4KEKZGZtmnxGZpVEpu/EwdmYompCY/YmOfeggc=;
 b=v49To6m1mrcnCgVpnsQPjVSa08jfvZAZ4D70uhQ1GpXRPRm/b2YKALxudN0ycHWiFT
 J2loWfQF5bAhqBZSwQTXVNoFYdlpler4RKyZT0wKoLCikDg8+3zP4Rod9MGQQgEW2ZD+
 ue2ZD5a7A66sXUXCBQQ++SvK9VWnNlAuFctVQesK0vKLsNf/CpXzVjnjfiwcpcYyAPf0
 5SSd2ZZGpDksilBb/zGZd4y8nS1iG9BxjsnqALyt1UMdPIuFlbF5wmW5ulcJbBIOsTmN
 NcOezVw7aYcwhyHQqgysoJgUToRpW4yI/Fbc7Rnct/im8uaCgHPKvdNDMYOceUzk1dSx
 TicQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9AnwEUbWuPY/iBRkBbCMwUNTF9gGDEBS70Rg/3QrBSRpLh5nQaKDkaWp5ug+lN+nDhdID9W9v8iA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrVCWq7IX7MFdtQXfgAyBiOfZkm73bFqE9qsvGU+SlxJnCsSXT
 HD2ySBSH+E9ey937HPn/O1mQ08tKsFdm4DUNu3B1IDZcwTfAZ7WSUJ79YNbNhm1NTMi4ejpw7ln
 ARhMX
X-Gm-Gg: ASbGncutLv8wBo/4+qx1rAKA/iYljrAdTCUP6AQBLkshk0sH45o7swDO9qJvzQg29PY
 gxIt3FulXZSE0OSuZyRe/TjXb3udwaV+yJ6LSkRwwbCRcVfpHlcyQfC3mJ4Ner+lQhne8l4MXnk
 bLuf4ZGx3/R4pRKOcIcP3RmlKGfGd6MmSuEdyszrGLaUZGYKQrz7kXwXaZmuqwF52IN/mKgYRmU
 ZSo8/FPoaQldGQ9zCEhmy6VeP5SaulKdsix52bHwLaGG90PUwoz8srM7E/MjrJDWO2UblZi+Dt5
 UspQB6wfqzOAJimvyaZKEp8MJtDV6WaLGgBPb31VB/8mfjs3/SnHJE92NxBOD8tiRtNt8zNM8wq
 +1Qm+PxpM
X-Google-Smtp-Source: AGHT+IHe6lG42+n4oxFbkU3h3/0aZOHAZHMF9Kg6OoiGVvIlv4Nu3AnEuzCDxkKeAT3OPoMWJSfPww==
X-Received: by 2002:a2e:b8d2:0:b0:308:eb58:6580 with SMTP id
 38308e7fff4ca-30bf46387a6mr62180291fa.33.1741714391357; 
 Tue, 11 Mar 2025 10:33:11 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c086a36d5sm11805861fa.2.2025.03.11.10.33.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:33:09 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54298ec925bso7641994e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSB+rIeJbmYDpkLik+7nVx7z6JkkAiltIYrOIC+4L/fAO+vj2beWFheb4mhSks/yEC0yMRZuhTcQU=@lists.freedesktop.org
X-Received: by 2002:a05:6512:b11:b0:549:38eb:d68b with SMTP id
 2adb3069b0e04-549910b5eaamr7637883e87.33.1741714389505; Tue, 11 Mar 2025
 10:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250309040355.381386-1-tejasvipin76@gmail.com>
In-Reply-To: <20250309040355.381386-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Mar 2025 10:32:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBZjnVQJC2mh9C5_mF3Oz_qXmBB=Sw3B-6W=qDAsbWrg@mail.gmail.com>
X-Gm-Features: AQ5f1Jpc46SQirm9tGzN71Qne-KkyVQnyxsbd4VDLmdc6G7lUbX6SjygOF_K9bg
Message-ID: <CAD=FV=VBZjnVQJC2mh9C5_mF3Oz_qXmBB=Sw3B-6W=qDAsbWrg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 lujianhua000@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

Hi,

On Sat, Mar 8, 2025 at 8:04=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the novatek-nt36523 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Remove mipi_dsi_dual_msleep
>     - Change mipi_dsi_dual_dcs_write_seq_multi to use the same dsi_ctx
>       by swapping the dsi accordingly.
>
> Link to v2: https://lore.kernel.org/all/20250307091519.245889-1-tejasvipi=
n76@gmail.com/
>
> Changes in v2:
>     - Uses mipi_dsi_dual_msleep
>     - Changed mipi_dsi_dual_dcs_write_seq_multi to not equate accum_err
>       of either dsi_ctx.
>
> Link to v1: https://lore.kernel.org/all/20250306134350.139792-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1681 ++++++++---------
>  1 file changed, 821 insertions(+), 860 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
