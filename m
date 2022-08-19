Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BCB599ED0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123E710E908;
	Fri, 19 Aug 2022 15:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C9A10E908;
 Fri, 19 Aug 2022 15:53:12 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so5680492fac.2; 
 Fri, 19 Aug 2022 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=CBON6wUUJtdJ7sqqMZwarBOptDuvgv0pQ4ftADp75o0=;
 b=YKOAsmwkDqDfvM20l4Lh6uuwgDuwW7cbK+4jA+LC7iAC7meCT0NLSwnFPDnXi74eKl
 yVhD9IJ6AXVgUicEgtUGAcPukBcGTY1AdT1i4dMw8651aIkYmCS7rKLH/zQ8mm6PYkCb
 TPWMzLwuSRty3pM7RepGWoCOSLr1tg1dzv56uwlo8OnjUbxQe5dlHusAnOA3yMFzEN2m
 ngkIqcz4HoP1u6ravMguyNkYFqXF56iJ+YvV8+ES25bLsODdYingqBTet9m9RHy+vVTo
 Zm84LgwjvGV7i1NbIsl+4g6GODiI0yXKVhRHFBA+x7XO12bYN25vg+Yf2BOW4s3YzS93
 oIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CBON6wUUJtdJ7sqqMZwarBOptDuvgv0pQ4ftADp75o0=;
 b=ER3PU8vaS2DeI3/bO6cNfkovTysW6qxardhdMhHwNHkrQqoXAFs1PfiXytQ/hZE/Aj
 msswyMmzFMBERnpCKIQl5G/PDD0TZqJcbmkAUNIal2ZrhIBwCIvDfpYCgI/KB+X3M3it
 yRdTrz3oCRbVF7B3MYnXJaQ0yvSh5g4ECF8VM/KYzmaQKjRk5ZqXh2ZZlbBt+zV5kJ4P
 sJAbtKoW+qd2edMmTn/08IdtU/ZBdSJNMnxYhb+1aP6tOmYABNTxLj3ULDjoQmLSBZ3t
 7gkpqq/azZrNO3g0nnDdtwlu9TevZdgyLCJc4S8jOg4AaSZCxHFJYPgcij+9TyAOHq+R
 wmuQ==
X-Gm-Message-State: ACgBeo324moeDYqZ/Wy2Yppbs5jiQUE0m9gkBt6wzMReDDm25xNFE+Ua
 ZKc59WL+hCEujfGxpKj2IYrqiSaqmDubyUfy6Bc=
X-Google-Smtp-Source: AA6agR7z0K2xqOKY94O/LSE9XZ82/tt5Bd4MR7meWJb+VTDodOAj64+SBqVf088mUrfo8YbPdneQyp78d6KcSKDTmi8=
X-Received: by 2002:a05:6870:e98b:b0:10d:fe5c:f818 with SMTP id
 r11-20020a056870e98b00b0010dfe5cf818mr4094491oao.106.1660924391783; Fri, 19
 Aug 2022 08:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220819015302.1731088-1-magalilemes00@gmail.com>
In-Reply-To: <20220819015302.1731088-1-magalilemes00@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Aug 2022 11:53:00 -0400
Message-ID: <CADnq5_MzPN2mRhKxrEtm86WOjjgp1MTBk6RGWqd=VjQRqQf6DA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused header
To: Magali Lemes <magalilemes00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: mairacanal@riseup.net, sunpeng.li@amd.com, tales.aparecida@gmail.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 isabbasso@riseup.net, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 18, 2022 at 9:53 PM Magali Lemes <magalilemes00@gmail.com> wrote:
>
> dml_wrapper* files were removed in commit 724449e30433
> ("drm/amd/display: Remove unused code"), as they are not used anywhere.
> However, the header file wasn't removed, so remove the header as well.
>
> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> ---
>  .../gpu/drm/amd/display/dc/inc/dml_wrapper.h  | 34 -------------------
>  1 file changed, 34 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h b/drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
> deleted file mode 100644
> index 5dcfbd8e2697..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -/*
> - * Copyright 2015 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - * Authors: AMD
> - *
> - */
> -
> -#ifndef DML_WRAPPER_H_
> -#define DML_WRAPPER_H_
> -
> -#include "dc.h"
> -#include "dml/display_mode_vba.h"
> -
> -bool dml_validate(struct dc *dc, struct dc_state *context, bool fast_validate);
> -
> -#endif
> --
> 2.37.1
>
