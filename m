Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A528C50E68B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 19:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45910ED93;
	Mon, 25 Apr 2022 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9F410ED93;
 Mon, 25 Apr 2022 17:08:10 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 c11-20020a9d684b000000b00603307cef05so11225013oto.3; 
 Mon, 25 Apr 2022 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luUxyYSSREVdQFdtrc0m9ipVrl/3T6wRxhlnsIThqWg=;
 b=Uvx0h2A1RbmYx95kT2LrLn/fl80ZbpTyPe+hSP5lXiPrMqg1QYXJAUAa0P5d0hyA31
 FvsrTAj5Tiqd6JtBwsL1zOowdM8OGoaKKy8lz4M80YoR28IVx/lezur706Ng2wTubKnJ
 +YbvNGCKYk57Z9GaLoDwJ5cSB65YSQgfZsKmQRnxN6x5odqxyIDQpuodN0rPM0K1yTNz
 sQM3l9hKJ3cdfWQ5d1VixIrATddlwSdvk+zYrfY9z/NLFL2rJPQnEEofYuwdTL3E3LL4
 fJeO9m9tCCajV+54TZqkYKQLzVXkCnNUlIfAYV8qGuVvDZYgPPk5M+wPCJhORe5YSBRk
 TnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luUxyYSSREVdQFdtrc0m9ipVrl/3T6wRxhlnsIThqWg=;
 b=mht4gququfLee7CdgkmT2dzz5XwbN+9Z/H+CxoMC0O79dIKz0EjJdXIAeWmFsR9QHB
 Fl2MFK7sngBJbvWJIJ9shs8PWqvHEwhq1GDdGZo7oSebIvcNGkKAvViHLW1eYBVl6tgo
 BNRoHqmng1CZ16EtzZgx4pVMtCLSFxkl5EQdtuLjuhrfk7B2+90HRjIw3F9kyWdeWXN/
 ajK7OWZrMladDJIsIoGmmJwiORjYEJalPnrCXmotet380Fn0rz7l9LtJ3u7Gw78uEGHv
 WCVbdRRXKDKhHdqiBZjS/BXcASvrrRBN+knb97jZBvmK/qsJiBlb/ByhxPMaWqkvEyhd
 A5Vg==
X-Gm-Message-State: AOAM532p5+HHrF0KhP+ZLGwYvPBqsHI+ANFt1Ma1Ss9fMGSoSiaFuKuz
 GnExupbBlNReIvBF1tbP3Bc+rgtG9NpoeCT5yJA=
X-Google-Smtp-Source: ABdhPJxamLKNMhMi1ouviFPH7sECZVbru0DA7KnS0AE1HYXe726Xyj3MnW6JDTe+kIFf6ERxuiU1HtXnqB5q3T+mSG4=
X-Received: by 2002:a9d:7a8f:0:b0:604:25d0:f231 with SMTP id
 l15-20020a9d7a8f000000b0060425d0f231mr7010853otn.200.1650906489686; Mon, 25
 Apr 2022 10:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220423012943.12133-1-rdunlap@infradead.org>
In-Reply-To: <20220423012943.12133-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Apr 2022 13:07:58 -0400
Message-ID: <CADnq5_NixUWpRxD0YzxxDSC6FCTr9HsF_bDxMrh=KeaFyWMJhw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix non-kernel-doc comment warnings
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Robin Chen <po-tchen@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 9:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix kernel-doc warnings for a comment that should not use
> kernel-doc notation:
>
> dmub_psr.c:235: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Set PSR power optimization flags.
> dmub_psr.c:235: warning: missing initial short description on line:
>  * Set PSR power optimization flags.
>
> Fixes: e5dfcd272722 ("drm/amd/display: dc_link_set_psr_allow_active refactoring")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Robin Chen <po-tchen@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Anthony Koo <Anthony.Koo@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Applied.  Thanks!

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -231,7 +231,7 @@ static void dmub_psr_set_level(struct dm
>         dc_dmub_srv_wait_idle(dc->dmub_srv);
>  }
>
> -/**
> +/*
>   * Set PSR power optimization flags.
>   */
>  static void dmub_psr_set_power_opt(struct dmub_psr *dmub, unsigned int power_opt, uint8_t panel_inst)
