Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB63925B0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBE26EE0A;
	Thu, 27 May 2021 03:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6C6EE09;
 Thu, 27 May 2021 03:56:29 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id c3so3812405oic.8;
 Wed, 26 May 2021 20:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m0jJCLmOTTk7R3I0dOOysXS/9UkIHt3JyqhG11vxOu8=;
 b=bhVAq5i/UwQ3hdFM6/4lFFKrEsLKys4PeBECdlxkFDsGZSH9uR5zIou5Hn48fGzrIE
 cdZRNIdiIJC79QcCtMHLoRsPfKzl3BGxraNIpTDD0JDqiUifLKCkrFoouE+Mqoa0RqKd
 TXxZigAH0zfBwsHG72QOJQzWqM04RIEWixdApmY87iWanX837uR96/2chzsRLRa4mEKq
 FjsetMfTlcqHk30WCuWfqvM2W07ZeDWBw6apDAUlz3M33WfCS8s57PJVtnWQiCagAJ0v
 8DdJOxFaNVdDuwoI72sffvFNR6dv7xECjeBuqyq7+C2HvS+KQ8UNStrnkVean1pJPCL0
 kW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m0jJCLmOTTk7R3I0dOOysXS/9UkIHt3JyqhG11vxOu8=;
 b=X7Pj4AvFlJWgJ68CUQn5eeQIl4sqjV5xfqEdihahnS59TzZEBUvaZ8SRTzTkR6wVI6
 pHxaGBPNMf8mBgYp3iOVPnfG+fgHr9QP/jtJIfsqT5JxPkk3/zL8oEjJ0+tUWc6URhOY
 jUv07b/PdqyIi20nsNzufDrzWX8QiuDOm1Rgoiz+xsvYUdV09zn+TxhAc6+DImUZzLs3
 UTR9WUh5zK6nxEoa1bj3h68Q8emL08Iluixid7ChfaU8kJswkoa4Bh3E3W1Phqjwe8+f
 0gurMIWEpH6VH11BP4vvfTg6mfG7B3yHjAYKVuCy1qM2dNt0yLkERWunXALq0XckXefb
 lgmQ==
X-Gm-Message-State: AOAM5323lI9RkPm8sgUs2Mf+v2uW4SEGv7RbEJejZm0Jfe4lvE5tRohW
 T7tV5Yo+0wdH6I+ozQ+gCX9TaimuvHtL5t5NpR8VOUek
X-Google-Smtp-Source: ABdhPJxdi3Mn6amONheYLR4VwqBYJHZISa2gtEudSqMqeC7zJHQsy0+SZo4vA8m8fcUpIEww3nOPrh/0Ukq0UoxZKYM=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr3994650oie.5.1622087788663; 
 Wed, 26 May 2021 20:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-10-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-10-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:56:17 -0400
Message-ID: <CADnq5_Oq0f+0e31pBBqej0Cvi2c_w2RFxbaChz+O2r4ezXkSAg@mail.gmail.com>
Subject: Re: [PATCH 09/34] drm/amd/display/dc/bios/command_table_helper2: Fix
 function name 'dal_cmd_table_helper_transmitter_bp_to_atom2()'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.c:14=
1: warning: expecting prototype for translate_transmitter_bp_to_atom2(). Pr=
ototype was for dal_cmd_table_helper_transmitter_bp_to_atom2() instead
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c =
b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> index 00706b072b5f8..6d2fb112ad9f9 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> @@ -129,7 +129,7 @@ bool dal_cmd_table_helper_controller_id_to_atom2(
>  }
>
>  /**
> - * translate_transmitter_bp_to_atom2 - Translate the Transmitter to the
> + * dal_cmd_table_helper_transmitter_bp_to_atom2 - Translate the Transmit=
ter to the
>   *                                     corresponding ATOM BIOS value
>   *  @t: transmitter
>   *  returns: digitalTransmitter
> --
> 2.31.1
>
