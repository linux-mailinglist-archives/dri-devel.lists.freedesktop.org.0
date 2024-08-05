Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACD948298
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7472710E295;
	Mon,  5 Aug 2024 19:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/SQELnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230D710E293;
 Mon,  5 Aug 2024 19:49:25 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70d316f0060so3935162b3a.1; 
 Mon, 05 Aug 2024 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722887364; x=1723492164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CE2bwtyEjXybcXwF8rQD5aS3KMAUj8eFnmuCDhVGIGk=;
 b=Z/SQELnMJ1W9us4BlG+xm81y3D4mlz1XZgmZDHUHUQ9aHlC+XDCad9VkxrAbZiomoC
 g5FxYMV00XI9MQ4nnVs7egrJgOHGq0dyr3GbMCigBfmBGdzFEfMiovssk+dq2wcFJoAM
 eUe5iN/w941+piX9PnI+NBm/AmASZ4NO/35VgHsZQeKUlS1ma3z2L9bl037ziGTV6ESH
 ugHdwshY2o3vhcEdHny3LRkybhH0wkg4ICiJ9axRQ/ltCS+wOj0/tVoVQkdh3omq6miS
 EPa6IWICjiobkEDiuBaq3CoM0OI9VkXoRImhIJARNMVlOQoYPw6Et6CWLG/XdysEKzM8
 1m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722887364; x=1723492164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE2bwtyEjXybcXwF8rQD5aS3KMAUj8eFnmuCDhVGIGk=;
 b=IdldaFx9uMKJqWzRfRK+wRt5SrRHRH4+xjQpwFGAG66BrxMfCRFUNMwaBsl+EpmSKA
 lH9eQgi7Nf3ldWgDwEopisTOrczoPvLc23xg6czQi+gaEpgpNQqZf4LGQKhgjsj3G2q7
 IQYQTOKG31r8AUY9jFfK3QzvYriVNRphNwd9dugsy4FLrKkDvOVEsbSe/2es1eA+6yy/
 ZAOuq3z6xa8cN6egR4lofIYJOXrjCuPVkzITCONiv0pSoxZtcvqZN3/3PTTgrjhbZX/t
 He0ST+vR1CX0tLjmodwK9NEV2EEpAsaAKK530nkrJg3CGMnA97n2a0sox0hhp7uWmn2w
 Iz0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnb903IdFX+EFiIX1XiKHamxvYiVjnXQzG+mJjLMVpMg/h5XTr7LlJYu+g1UOte5YRD1poXQH9kYHvQQ5v7hmZvqe7gwxUOzX59L/rpqrVVj9DHkyACAtDejJhA3jlaLzE4fUn3vNRCvl43nmprg==
X-Gm-Message-State: AOJu0YyDJJRZvce9TNBj22s8MImiiDFc2c5eaB8JzYzEq3B/XewMRJYO
 hwXXMlUVsSi9m9C8OHTlEfxcPceGp2trGWB+DX4K22J+p/obZgcHxed5NXzMWxTRyDObSSBbKSU
 xW13KTheBylTcIcFenQa8V43Y7TCaug==
X-Google-Smtp-Source: AGHT+IFYHMkxo2L55S9sDjZLk5hMOxIhiqax4iPzcIPQzELIWlKHEMxXECKWbfLjM3gtzZEs3dyEShRFa2jO7ph4tnU=
X-Received: by 2002:a05:6a21:460c:b0:1c2:a29b:efb4 with SMTP id
 adf61e73a8af0-1c69a6db8bcmr18695039637.24.1722887364448; Mon, 05 Aug 2024
 12:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <3BC6F04B763EF430+20240731041040.43863-1-wangyuli@uniontech.com>
In-Reply-To: <3BC6F04B763EF430+20240731041040.43863-1-wangyuli@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 15:49:12 -0400
Message-ID: <CADnq5_O3RtXU9pYb3ZJkzhNn1GoVUU9J=APkbxEMk07b7s9mCQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd/amdgpu: Properly tune the size of struct
To: WangYuli <wangyuli@uniontech.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, Jingwen.Chen2@amd.com,
 suhui@nfschina.com, 
 dan.carpenter@linaro.org, bokun.zhang@amd.com, chongli2@amd.com, 
 Luqmaan.Irshad@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 guanwentao@uniontech.com, shaoyang@uniontech.com, hongao@uniontech.com, 
 wenlunpeng <wenlunpeng@uniontech.com>
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

Applied.  Thanks!

On Wed, Jul 31, 2024 at 6:25=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> The struct assertion is failed because sparse cannot parse
> `#pragma pack(push, 1)` and `#pragma pack(pop)` correctly.
> GCC's output is still 1-byte-aligned. No harm to memory layout.
>
> The error can be filtered out by sparse-diff, but sometimes
> multiple lines queezed into one, making the sparse-diff thinks
> its a new error. I'm trying to aviod this by fixing errors.
>
> Link: https://lore.kernel.org/all/20230620045919.492128-1-suhui@nfschina.=
com/
> Link: https://lore.kernel.org/all/93d10611-9fbb-4242-87b8-5860b2606042@su=
swa.mountain/
> Fixes: 1721bc1b2afa ("drm/amdgpu: Update VF2PF interface")
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: wenlunpeng <wenlunpeng@uniontech.com>
> Reported-by: Su Hui <suhui@nfschina.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgv_sriovmsg.h
> index fb2b394bb9c5..6e9eeaeb3de1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
> @@ -213,7 +213,7 @@ struct amd_sriov_msg_pf2vf_info {
>         uint32_t gpu_capacity;
>         /* reserved */
>         uint32_t reserved[256 - AMD_SRIOV_MSG_PF2VF_INFO_FILLED_SIZE];
> -};
> +} __packed;
>
>  struct amd_sriov_msg_vf2pf_info_header {
>         /* the total structure size in byte */
> @@ -273,7 +273,7 @@ struct amd_sriov_msg_vf2pf_info {
>         uint32_t mes_info_size;
>         /* reserved */
>         uint32_t reserved[256 - AMD_SRIOV_MSG_VF2PF_INFO_FILLED_SIZE];
> -};
> +} __packed;
>
>  /* mailbox message send from guest to host  */
>  enum amd_sriov_mailbox_request_message {
> --
> 2.43.4
>
