Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC107E2C76
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9609210E3CF;
	Mon,  6 Nov 2023 18:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D846810E3CE;
 Mon,  6 Nov 2023 18:55:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6ce532451c7so2537440a34.2; 
 Mon, 06 Nov 2023 10:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296947; x=1699901747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlsdHfJoSxj4C6+EWFlQXpykD0ggHxFHCNPoza6FO40=;
 b=Ig7AB7ruO7wzjL2igWc28u9WwJaxO3h750BdDbc25YkMRgwSyLhs73gfiBIRdr2F+2
 7Xt+I7JukkBmUTrOgZTg4Epjp4CIx/xRTADnHx00KETqYlRHDNGPN34m804y4M2OY40a
 V1hSzFW4auwlDPMdQyQNcM8lTLoc4aJ828ADdeyHHZ20pI/cgwNYzNOxeGon/+twdb3B
 DXkL1NimFk9ZuBSNAGAFGyBl9uHbOmYSO9igyUic2tbURjBKqd2OUK8pe2W0vx5sx6T2
 8E4rwFTtSAZnWClUabLxlhOt9+zx/frUzMAmI8ukKxiz5V5s/+2g0Vim/7AVdhMSSw90
 vLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296947; x=1699901747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlsdHfJoSxj4C6+EWFlQXpykD0ggHxFHCNPoza6FO40=;
 b=Q6bSfavDNNYz8fG3O1yI1VaQlGtz0ATEeto3M+IM1CAYSs3gErY8n5V4OOHsHq1//P
 nenDxS8ycrrcNL09PrqQKYZxMO4M6vvvowLNDN04dtsvmG+wL2rvhKSsiG0dZFhPAv2k
 O6dhHcxNyGZIsd6Jw6ZQz0XYvn8/PRWf91aaa0zSPTd5GHpZ2/U3Acb4b1mR6it66V4P
 s8A9EukPo0i1H6gGWbS3F6uKsz5FaE2iIM3tisMefr6VuHZIUqaQeTEoRQajmFWqkf5C
 XgRv6cGWknD2cXmVW6jU3/SjamlAh30EQe59si0PYEoMDWtaBHVrbAXXjjCjdRiTMn1S
 o/Zw==
X-Gm-Message-State: AOJu0YwkNGfGCb3QoGeFvYU7LubbzLB9vgDpf9wBeojCvidvIZ5yvrut
 x3uSUNUCtzlbfXPafLIamvmrp55qLyL+JWcH8to=
X-Google-Smtp-Source: AGHT+IEkR6x1Zh0ykYQTzXTD4aBkfgt5NssWzvOEVxyh8znMkwhiQwaf9MnzYBKcCskVrhA5ssog/3XBzYOv9A5C9pw=
X-Received: by 2002:a05:6871:a002:b0:1e9:8885:b537 with SMTP id
 vp2-20020a056871a00200b001e98885b537mr555442oab.41.1699296947029; Mon, 06 Nov
 2023 10:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
In-Reply-To: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 13:55:36 -0500
Message-ID: <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  This matches what we already do in the other clear state headers.

Alex

On Fri, Nov 3, 2023 at 12:00=E2=80=AFPM Abhinav Singh
<singhabhinav9051571833@gmail.com> wrote:
>
> sparse static analysis tools generate a warning with this message
> "Using plain integer as NULL pointer". In this case this warning is
> being shown because we are trying to intialize a pointer to NULL using
> integer value 0.
>
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>  drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/=
drm/radeon/clearstate_evergreen.h
> index 63a1ffbb3ced..3b645558f133 100644
> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs=
[] =3D
>      {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>      {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>      {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const u32 SECT_CLEAR_def_1[] =3D
>  {
> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =3D
>  static const struct cs_extent_def SECT_CLEAR_defs[] =3D
>  {
>      {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const u32 SECT_CTRLCONST_def_1[] =3D
>  {
> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =3D
>  static const struct cs_extent_def SECT_CTRLCONST_defs[] =3D
>  {
>      {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const struct cs_section_def evergreen_cs_data[] =3D {
>      { SECT_CONTEXT_defs, SECT_CONTEXT },
>      { SECT_CLEAR_defs, SECT_CLEAR },
>      { SECT_CTRLCONST_defs, SECT_CTRLCONST },
> -    { 0, SECT_NONE }
> +    { NULL, SECT_NONE }
>  };
> --
> 2.39.2
>
