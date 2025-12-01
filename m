Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD1C98AA1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1458C10E452;
	Mon,  1 Dec 2025 18:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vd2NavZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514E910E44C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 18:11:04 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7a9fb70f7a9so312063b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764612664; x=1765217464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pACjIJ5Z98dL1VC/6XHBEnEAfmGPEe/jI8Z9/L5Bn2s=;
 b=Vd2NavZ1yKr0xG9fpYA/anBb3pE7CC1ajHWDQbkxGDMS6M2i6yDK5imucw18oYUd2D
 PfsmMUX2ZTEKl4W8BbhTpNZszZSey9Ez99D5vdbB7MZTF5mkJoeiEa1r7yqOTJGEtMhl
 AIwYCUj16F9DAdO4k71Tr041nBX9rJbdFEo0cJHVKHRKEtjnI1fdE/40CneEpeuES+Wy
 ifZAwC+EF3ekWkguQ9rCzPs/OUNWKRvgP0Z40nQlJEAE7DpzQhLO8sZ106bCHxiti7LA
 QWKyycYrdKxYKEWtegenT71XI77P5M/rgRtqu8+61St4VSomKEUW70sWoG3JoxXasS8o
 2CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764612664; x=1765217464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pACjIJ5Z98dL1VC/6XHBEnEAfmGPEe/jI8Z9/L5Bn2s=;
 b=h+Q19yMyKU8TjQbgQBdN+KVV5B6PIQYZmoTu5/pfsRe2pVsBVC+b3nWXXbdhST0Tpt
 DwXpRWxK4IeLxkpLKT1ZJvvUgwLCzTdjudsISXZBgjW4wEgElLhmobmBNHIdW7f+hFU8
 1iQwFvNfj9iNWaFU+NayOCBEybrkhBFA48ckNnRYkienSKqyI3vaoRaB+wZ8GRN+DZjv
 09tcvIYXmKehLbdu6UxEW6R9/B4iGtdnd8St+Nk1LEFG5yv8KIPf0JA5pBAhrkRY/Rrv
 iKPRco+wsrhqzy/9JU2MQQAe2fI5A8HN1sp9nxhol7i95w06Ri9fjIeQJnxGd8E0n0hB
 kJ0Q==
X-Gm-Message-State: AOJu0YxC6gup9lISzi2VEGuS1r3rEuMGRogtJONdNSqROB5pZwfUEnXp
 Iy6jcgKZHrusYHXGca+UmupW7NlSsZ5szv9e3+gQTHcf13RIyvsjMItXd23HBuCX8Zs7pXmBxAn
 ek4kgXk/dYxMRqc8PpaYGIqo25qkA3Hw=
X-Gm-Gg: ASbGncsNoW+cDkrxG4rqjqZqPJJ0S4XyLr7fwCiGWmTaFyZtniUdqI/LlGearmzSSYo
 i9JiN4sMQjiTE6l8SaDKEfIg4uYar4YWsub+dYMinS2V8yiloMaLPCZ8XIzYN9E9Xtx4BAMXK77
 wPBh/ElwZK6CSHjEOBr030JgUYvUDHcqQOKvreVG0ZvLmAX2snHJqU/Fqijfevh5tD5S2pIeIJM
 vnYJPn3uAGJ3DBpxJy7mIRPd68qJQmFuCOYyUyTXokBx7ubJxdkMoeVfpJcOLqBveBVyTM=
X-Google-Smtp-Source: AGHT+IE71pJafFwUFiPS9h38WORURTVaywA11WteMOZkloki51qtSpW8dr8VyIrZTMlaeGq2FnTBiE1ewdbGlm1RvZM=
X-Received: by 2002:a05:7022:20b:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-11c9d8851e0mr22415203c88.5.1764612663631; Mon, 01 Dec 2025
 10:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20251129073740.1813659-1-rdunlap@infradead.org>
In-Reply-To: <20251129073740.1813659-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Dec 2025 13:10:52 -0500
X-Gm-Features: AWmQ_bmuZ0JnGfMfHwqT7CqSUNa9bxeI_sau48Vz1Z6fx06hE5loP7Vv_ifbeOc
Message-ID: <CADnq5_OWcjQjNEuUKva1HJE+8ufD6dOecwZdikAuhvaQ_HBMZA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: correct kernel-doc in dml21_wrapper.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Austin Zheng <austin.zheng@amd.com>, 
 Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
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

On Sat, Nov 29, 2025 at 2:37=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Fix all kernel-doc warnings in dml21_wrapper.h:
> - add missing @dml_ctx entries (2 places)
> - fix function prototype typo for dml21_create()
> - change a blank kernel-doc line to " *"
>
> Fixes these warnings:
> Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:30
>  function parameter 'dml_ctx' not described in 'dml21_create'
> Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:30
>  expecting prototype for dml2_create(). Prototype was for dml21_create()
>  instead
> Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:55
>  bad line:
> Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:61
>  function parameter 'dml_ctx' not described in 'dml21_validate'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Austin Zheng <austin.zheng@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h |    7 ++++-=
--
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> --- linux-next-20251128.orig/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/=
dml21_wrapper.h
> +++ linux-next-20251128/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21=
_wrapper.h
> @@ -17,9 +17,9 @@ struct dml2_context;
>  enum dc_validate_mode;
>
>  /**
> - * dml2_create - Creates dml21_context.
> + * dml21_create - Creates dml21_context.
>   * @in_dc: dc.
> - * @dml2: Created dml21 context.
> + * @dml_ctx: Created dml21 context.
>   * @config: dml21 configuration options.
>   *
>   * Create of DML21 is done as part of dc_state creation.
> @@ -40,6 +40,7 @@ void dml21_reinit(const struct dc *in_dc
>   * dml21_validate - Determines if a display configuration is supported o=
r not.
>   * @in_dc: dc.
>   * @context: dc_state to be validated.
> + * @dml_ctx: dml21 context.
>   * @validate_mode: DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_=
INDEX
>   *           will not populate context.res_ctx.
>   *
> @@ -53,7 +54,7 @@ void dml21_reinit(const struct dc *in_dc
>   * -dml21_check_mode_support - for DC_VALIDATE_MODE_ONLY and DC_VALIDATE=
_MODE_AND_STATE_INDEX option
>   * Calculates if dc_state can be supported for the input display
>   * config.
> -
> + *
>   * Context: Two threads may not invoke this function concurrently unless=
 they reference
>   *          separate dc_states for validation.
>   * Return: True if mode is supported, false otherwise.
