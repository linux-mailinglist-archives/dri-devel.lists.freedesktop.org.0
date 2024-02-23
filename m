Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8FD861C66
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 20:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984710E0FC;
	Fri, 23 Feb 2024 19:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DTem8oqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE7610E052;
 Fri, 23 Feb 2024 19:20:25 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7d5c25267deso327688241.3; 
 Fri, 23 Feb 2024 11:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708716024; x=1709320824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpygWIobeeqnXshX/tRPPBd9Dc0Ilv2Fxo8B3+OQ3wo=;
 b=DTem8oqNy8c+QfSIHT176qMt5NKBUYYRof8K7qL14qPmaTZCcw8Cj/G34QZ1rlsJZz
 OICM9tlasrpKwSYVtqU3rAZavCBQdY5V2W6mGJnN6JfzOWazOkiBV/bYqq7qAbgTHGhW
 38M4JD2XK8AU7fariXDETNkGBJKAuXjF9H6ETst86oki9MSmBDhMPZ6GvGXmJbxPj/6y
 uSjvh8M/H9kiXeVCWSRgukFz/+x1AUYgUHFfCOQ5dAiLSygBlcyyM/fM7AYeTWhCBthy
 tREvj4IZ7JRmRHPbH6P5COxD4pUdUFt9m0pdsWqIAmu2mBFWioWXeWh0pJa0HilAKSyI
 GIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708716024; x=1709320824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MpygWIobeeqnXshX/tRPPBd9Dc0Ilv2Fxo8B3+OQ3wo=;
 b=vLiyuSA3N555juboFGDfsjKmiXDsuk6aSI21qH+lB8NLKVoYFNEkom25Tpviawxh2K
 7R/G+7KByUUxZ8XfXdDLkZKMXKW5OxDBrV/F6fUmU14b/WlQYzJP98vIaaJSFjulrGWf
 e6411DQlH/eATIkXB7jeQKyrFBkjfx+R6h8mFqvYqiITeMDeiC7WUyVBk47X6XCjWNIi
 ZE4buJREjKB1a8sR1sXyk/zJHDS49d05CO9InvPHeXsL+YaWCLnVGRkdalBY5HX2iDJ6
 j6gYseZ/CIX5W26wWf7P9Pc+y63GkmpCEOGVNFgpm5zdIENdlre62JRD+KmdDGOuynLf
 rglQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnnR7TQpkFU8P3OowPuhrjwDT5lQKgkwWLvVALbKqgR/czMgWy9rosc0pW8sDOd2TU7Er9BrLBV4YG1nKcsy9lVc+3AoGl8u5V20IRIw7+j9wbbpkVOS9d/DH65ZxVC7GPOBPc34usyeFJBx+0MA==
X-Gm-Message-State: AOJu0YzRNJUxiTKkCWgftze74SKhAo+1OPBffc/DOJnzk3uN86hc1rst
 MZarHQpCMjA1cqOlNOug49RYff/sFGFK4tmqvRKIgTBf5eBfqmbE7eFeFHMp1skMf9KZI2CKmhV
 8MqAn3+3A0a+2YEPEq95dkb/jBQE=
X-Google-Smtp-Source: AGHT+IHKeoSIsbZvGBwasu4eASwuBq4PRnWshzB9b+gKFIhi9aAnBvznfBt2v03dZpUOny5EBg87j2pUn3ezgfuigb0=
X-Received: by 2002:a05:6102:1622:b0:470:54a3:23b6 with SMTP id
 cu34-20020a056102162200b0047054a323b6mr1045586vsb.14.1708716024497; Fri, 23
 Feb 2024 11:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20240217202015.2034288-1-tuliomf09@gmail.com>
 <9b3fc6a9-a24f-4270-ac66-696fde238947@amd.com>
 <91f787db-9a11-4f6d-8bcb-d0e4b05604db@amd.com>
In-Reply-To: <91f787db-9a11-4f6d-8bcb-d0e4b05604db@amd.com>
From: Tulio Moreira Fernandes <tuliomf09@gmail.com>
Date: Fri, 23 Feb 2024 16:20:13 -0300
Message-ID: <CABMo7LKeo9R5h1SdMCproKOoWFsHNV7wa11z5Foc0cL7hQgqEA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean unnecessary braces
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com, 
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch
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

Hi, Christian!

Ok, thanks for clarifying this for me.

I'll continue analyzing the files here, now based on these points.

Best regards


Em qui., 22 de fev. de 2024 =C3=A0s 06:33, Christian K=C3=B6nig
<christian.koenig@amd.com> escreveu:
>
> Am 21.02.24 um 19:01 schrieb Rodrigo Siqueira Jordao:
> > [SNIP]
> >> diff --git
> >> a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> >> b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> >> index 87760600e154..e179dea148e7 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> >> @@ -110,14 +110,12 @@ uint32_t
> >> dcn32_helper_calculate_num_ways_for_subvp(
> >>           struct dc_state *context)
> >>   {
> >>       if (context->bw_ctx.bw.dcn.mall_subvp_size_bytes > 0) {
> >> -        if (dc->debug.force_subvp_num_ways) {
> >> +        if (dc->debug.force_subvp_num_ways)
> >>               return dc->debug.force_subvp_num_ways;
> >> -        } else {
> >> +        else
> >>               return dcn32_helper_mall_bytes_to_ways(dc,
> >> context->bw_ctx.bw.dcn.mall_subvp_size_bytes);
> >> -        }
> >> -    } else {
> >> +    } else
> >
> > Actually, we want to keep the braces around the else part to keep the
> > braces balanced with the if condition.
>
> Yeah, and checkpatch actually complains about that. E.g. you shouldn't
> use "} else" or "else {", but always "} else {".
>
> So the patch is actually a bit bogus and introduces new coding style
> warnings.
>
> Regards,
> Christian.
>
> >
> > Thanks
> > Siqueira
> >
> >>           return 0;
> >> -    }
> >>   }
> >>     void dcn32_merge_pipes_for_subvp(struct dc *dc,
> >> @@ -250,9 +248,9 @@ bool dcn32_is_psr_capable(struct pipe_ctx *pipe)
> >>   {
> >>       bool psr_capable =3D false;
> >>   -    if (pipe->stream &&
> >> pipe->stream->link->psr_settings.psr_version !=3D
> >> DC_PSR_VERSION_UNSUPPORTED) {
> >> +    if (pipe->stream && pipe->stream->link->psr_settings.psr_version
> >> !=3D DC_PSR_VERSION_UNSUPPORTED)
> >>           psr_capable =3D true;
> >> -    }
> >> +
> >>       return psr_capable;
> >>   }
> >>   @@ -278,9 +276,9 @@ static void override_det_for_subvp(struct dc
> >> *dc, struct dc_state *context, uint
> >>           if (pipe_ctx->stream && pipe_ctx->plane_state &&
> >> dc_state_get_pipe_subvp_type(context, pipe_ctx) !=3D SUBVP_PHANTOM) {
> >>               if (dcn32_allow_subvp_high_refresh_rate(dc, context,
> >> pipe_ctx)) {
> >>   -                if (pipe_ctx->stream->timing.v_addressable =3D=3D 1=
080
> >> && pipe_ctx->stream->timing.h_addressable =3D=3D 1920) {
> >> +                if (pipe_ctx->stream->timing.v_addressable =3D=3D 108=
0
> >> && pipe_ctx->stream->timing.h_addressable =3D=3D 1920)
> >>                       fhd_count++;
> >> -                }
> >> +
> >>                   subvp_high_refresh_count++;
> >>               }
> >>           }
> >
>
