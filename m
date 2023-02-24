Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C940E6A243B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 23:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B3910E271;
	Fri, 24 Feb 2023 22:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449E210E012;
 Fri, 24 Feb 2023 22:22:52 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 q11-20020a056830440b00b00693c1a62101so506717otv.0; 
 Fri, 24 Feb 2023 14:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COTKnz3NDXQkTb5s1rNI0BDpJQEcrg3Di9N4FPTfkD0=;
 b=S2WHFice5SRbwNioZEUAnv+lIpdslXuf+frDoeMKE2GsmIdBbdOtWDzXcFdvobAeud
 R05NTghNNhrf7fTfmwfSSqstVcnKwoYe28vFND63hu6Tvz3N4O+nDeuHd+DjpdArHzK3
 S3PS8UgVRfZ9VWz/S/iYOB6eHtnb8ZdfLHflrFPRy3P4Ptzl02OcKgj/HQRzjCby6ElX
 bFQdVFFGBZfi0DHf1lyGRgG6uGA/OQNrE6eoV5DHPJ9GCwfXReAQCVEC8RB4N5zT5/lo
 LIUgpYcrzsPjh667ms5fNEVdaczRjNZ0P/EiIW6qoa69lR941gj4JwBvvJnYBhxCBXhw
 ad5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COTKnz3NDXQkTb5s1rNI0BDpJQEcrg3Di9N4FPTfkD0=;
 b=jIz+ue2c9YfyGfu/ko+QXvgv3qQ5yZCOPncjKgZsgso9KslCU1Zk3/9HiNd1n20p/G
 tBzSuU+fAqu8gg8djOIrFKTWEi+QU6C7rHfN+CkiUDJ8CpBCyIjcaeQCvoHX8L3Gen4j
 oy1PS9ZL3a/r5hR0g4evmpOhdiimpB/pF1vdUVkU74MrSOuSQM5TU94y2qBkrScjytri
 o/YsynOUGa4FlcvBBph5z3oeKn/pWP8f7e+kRcJuvXjB+mPFlA66h3VPmu8hA6XKB1xk
 HVAjWg4n03Ag6DBTOGGRYU4Is6z1smyb9XutvVN16s0D5X+TUaEWPtHUSjsf7SrLAPgs
 w7PA==
X-Gm-Message-State: AO0yUKXxGhcIP8u/7KAPPtHtZKfBWvddfW9nAXmQFdFqbo2MF2qNZLrr
 FrGjSl5oeo6EIuihvOCGvc32+bjakCZHxWk6aKI=
X-Google-Smtp-Source: AK7set/+ubJ5v7+JgV57rVBdMg0E7ct0udKSunoaM79gd40zlVQwF5/UTq+gjgShgCFtxf15n7T/FkmztyI5SPFFnAQ=
X-Received: by 2002:a9d:7019:0:b0:68b:e3b2:8ca7 with SMTP id
 k25-20020a9d7019000000b0068be3b28ca7mr2193511otj.6.1677277371537; Fri, 24 Feb
 2023 14:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20230224164519.2757173-1-trix@redhat.com>
In-Reply-To: <20230224164519.2757173-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Feb 2023 17:22:40 -0500
Message-ID: <CADnq5_MNxZn+LEOg0L_0+zmMZ52qGCQi-KfMmuD_vSwt8rqJbQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unused variable ring
To: Tom Rix <trix@redhat.com>
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
Cc: tao.zhou1@amd.com, Jane.Jian@amd.com, leo.liu@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 ruijing.dong@amd.com, James.Zhu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Feb 24, 2023 at 11:45 AM Tom Rix <trix@redhat.com> wrote:
>
> building with gcc and W=3D1 reports
> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:81:29: error: variable
>   =E2=80=98ring=E2=80=99 set but not used [-Werror=3Dunused-but-set-varia=
ble]
>    81 |         struct amdgpu_ring *ring;
>       |                             ^~~~
>
> ring is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v4_0.c
> index 213b43670f23..023a1fffa6a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -78,12 +78,10 @@ static void vcn_v4_0_set_ras_funcs(struct amdgpu_devi=
ce *adev);
>  static int vcn_v4_0_early_init(void *handle)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       struct amdgpu_ring *ring;
>
>         if (amdgpu_sriov_vf(adev)) {
>                 adev->vcn.harvest_config =3D VCN_HARVEST_MMSCH;
>                 for (int i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
> -                       ring =3D &adev->vcn.inst[i].ring_enc[0];
>                         if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_R=
ING, i)) {
>                                 adev->vcn.harvest_config |=3D 1 << i;
>                                 dev_info(adev->dev, "VCN%d is disabled by=
 hypervisor\n", i);
> --
> 2.27.0
>
