Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC15B7D07
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDFE10E5BF;
	Tue, 13 Sep 2022 22:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41D10E5BF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 22:24:00 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso2208446pjq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Mn9WBo5vNNbs0NZJBbiO/Yi28wMF/lgC71dq4ukkoxE=;
 b=Dubdtf184nm84qSfvmgvXOaoKydU193nKrYzRylLXH5pTxCx/EiPSQhBryggNtpSPw
 7dhYt/5APvLYyi7HiY1eUJh4GW+Y1P6SbKRN4mFj8umVUMA/XAnIIxvgofSNBuk4Lc9z
 ejY8Jr+V8zRwa7zRzy5+ZzAMhRmrSW6mGEz0dMIY4SQhGrCvpPVmMHxv1HNChGiOb4b3
 F4rHo62tImNd98RCVCSodsXZrLh9NJqrKy1BF6m86EFHBG/LCQsil0p8qZZMPdviHgNQ
 rXCaImFIuECYoPeovbaFPCBiRi60XvRfm7I/HlUFGTSYcq4KIGNqr5+gq5OL92KZ0zYx
 xxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Mn9WBo5vNNbs0NZJBbiO/Yi28wMF/lgC71dq4ukkoxE=;
 b=oROfHuuQPEZTRJLAmyD+yFApzmREbP7Ihu+tgLJVMfCQBBH95D7uVbDXIIkahalmZg
 mKgO8Kd45PSXLbXLtwBLOjtJf8BFi4EBJkU1G81AH9/yf9ZaiumaV5q4VFm8V2U+z5tH
 RrMvMXWf+uvKu+UxLkOmaJBsTv7mGVjqyP17TujqvFS6J1yW2RIwlzrZ7SGmMo3lj9xd
 Vjbv593iSjDmazcRpn238kFbQIyBIp1ZELOvKVbRlmCeZEmI4OaChKa8Ua9cFWDZKxwt
 i6TFim3htp7W/yIhB1FcATOiiEECXBMbF/YLPeE2w3ioeeg/f+u37Phi17MgjThDfRnf
 S3bg==
X-Gm-Message-State: ACgBeo1a24z4uP3WQrXlfpReVi0Q0yKMZUHZQ0GSTVYcH0iEHVH0ZLDV
 eBPTkWmBFP6i8w45frhvEvHOe3q/BdRiKpC4lVc=
X-Google-Smtp-Source: AA6agR6axQZpOW/L0c5XHtQuHfj2iBCzW+WtzyTHa/pa3vc6ipX86M2QMYAVLusKm7rTN+WViK7NZUzyaIPmTyNN9Rc=
X-Received: by 2002:a17:902:f782:b0:173:1206:cee0 with SMTP id
 q2-20020a170902f78200b001731206cee0mr33234283pln.130.1663107839649; Tue, 13
 Sep 2022 15:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220913205544.155106-1-nhuck@google.com>
In-Reply-To: <20220913205544.155106-1-nhuck@google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Sep 2022 19:23:46 -0300
Message-ID: <CAOMZO5CYaxdgn=Wh2CKsbJegb9hu40qEPOAEYy6x2qxpvPZseQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: imx-tve: Fix return type of
 imx_tve_connector_mode_valid
To: Nathan Huckleberry <nhuck@google.com>
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
Cc: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On Tue, Sep 13, 2022 at 5:55 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>                                      struct drm_display_mode *mode);
>
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>
> The return type of imx_tve_connector_mode_valid should be changed from
> int to enum drm_mode_status.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
