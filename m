Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B578726C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2253510E56E;
	Thu, 24 Aug 2023 14:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012D10E56D;
 Thu, 24 Aug 2023 14:54:14 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1ccb58b0099so1720082fac.0; 
 Thu, 24 Aug 2023 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692888853; x=1693493653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uq2Rz/w+UiLDK0KSC/5EPK5xtKDfT2UzyQDOd90+rl8=;
 b=r/u41aDOlFvgovHMmxhiPpcEp8F3dJl8NxdLPxd0RxgM7IeYIS2+Y1e22SXn2H4JK9
 wAAj07E/4rQfvEHH78dkNfzgCtH8kkUhQ/+e1oEUwY9SAawpg7of/CSO1oMJJ4tBJQoN
 32yY0NGzLKwGIBxObrFeqoO6/fFyk3DmUiI6RzHZQDiYGTYIk4033+rCnWnXwzBHaPwv
 eDa2wI4zP9HwCaZrxWax2aFgAEQiwoOVvI790S2dd2iPQABKg3DvytsQ3hnfosUuLv8X
 Lot58yYxx9ceTIJw7VJqNmkroxkti/8y949toMoaUOgtm1A1DSdd4Pc+yWWedC3nAom9
 +c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888853; x=1693493653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uq2Rz/w+UiLDK0KSC/5EPK5xtKDfT2UzyQDOd90+rl8=;
 b=foiyvCWgxE93H8kbL20pbO1moQCqk8Q2lLdyvNDd7xfd6pv5TgpHJ2wqJBZWWcoOCO
 EKJ9oe3a3SnbzZd8fp4iFgYPCbKPRynYIiGF6q20V8GnEk28csny4tuvyoie0dYu8PHF
 Mqhr+wQVJnk4k631K4tqgxzQb3GAGQWzX92vxoGg5rKzt9HgSb8ZjcMK9l57HEicBqBL
 3eEvE0SUZdoA/iL5i3qziRequQ2/tOE5kt81qaSp2crngpejQ6L58oZvp+cD6OC9/0q0
 3MLSIU9lvcFcX9YYN/RIYay1FnY3+tWILV/QGTjny5hVaeWKC+GylWsfX6Q5Iw9hqAKR
 eJPA==
X-Gm-Message-State: AOJu0Ywpotf41WiiBuqCb7aGl0Ncfm9cdr4EMFhi2nI9Btzt3eOMjKlZ
 s3ZekE8zIMoPCSiTc6WFHrHD8AglM7/epa7P5nU=
X-Google-Smtp-Source: AGHT+IHUyRZ/s5Z6miDsZM4/btsiHyGcD5fOaPP18HwdLud7Ptz241jKPAZW2574frmcEqtpe95tmk35JGOaA0yWEFY=
X-Received: by 2002:a05:6870:702a:b0:1b3:54b5:ac6e with SMTP id
 u42-20020a056870702a00b001b354b5ac6emr19528580oae.50.1692888853662; Thu, 24
 Aug 2023 07:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-13-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-13-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:54:02 -0400
Message-ID: <CADnq5_MHVEyxf0-xnbWq7q83OPVmp-0os+Fekaa6BEpXijA_xw@mail.gmail.com>
Subject: Re: [PATCH 12/20] drm/amd/amdgpu/amdgpu_device: Provide suitable
 description for param 'xcc_id'
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 24, 2023 at 3:38=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:516: warning: Function parame=
ter or member 'xcc_id' not described in 'amdgpu_mm_wreg_mmio_rlc'
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index e77f048c99d85..d4f0e4327dd3f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -507,6 +507,7 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
>   * @adev: amdgpu_device pointer
>   * @reg: mmio/rlc register
>   * @v: value to write
> + * @xcc_id: xcc accelerated compute core id
>   *
>   * this function is invoked only for the debugfs register access
>   */
> --
> 2.42.0.rc1.204.g551eb34607-goog
>
