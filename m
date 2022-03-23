Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4421F4E5AC6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 22:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0098710E072;
	Wed, 23 Mar 2022 21:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2608610E072;
 Wed, 23 Mar 2022 21:42:28 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 d15-20020a9d72cf000000b005cda54187c3so2014834otk.2; 
 Wed, 23 Mar 2022 14:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gauJU+/Ukt87qElnbOCar/GeP644jnPenO1H+olAZxI=;
 b=cswYNs/WyXAL6DSvgYLR3dF6cUIcVKCxSQGRNXV786efwrusYDE0bclQvwL/1eYS9t
 vThDuK/9GhGm5Ws+5z71Qd6WANakCW1IxYdEHRVO7aP16V8R06I2LqJrdw4RATCO1HP0
 UUGnJhwwcsp+xk/fmmMo/rX+1/XfoPXgN3W38qwm7MH+c8m3HzAOcpFmrbcAhGuFJHfX
 Vw5+f9RS596X3GChcf3jnVR4yHuJTrMPuhPEsnm8gzpHE3KwO/joTbHm5QXM0P67HP7h
 kV7tMbBorXJ887ivq0y7jr9VBFPDYpcw9XRIV3B7VBq9qM221sxbmH/8tVfi1WkmyQp0
 i0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gauJU+/Ukt87qElnbOCar/GeP644jnPenO1H+olAZxI=;
 b=UpkuTs7QPTgCm2fKgTc323YP88GaEhJkYc5C577jH9kRcFck0bGk3UutAoXK4nN+SB
 PH+JjW1VwCq2DIUkjofAJFVb1PXoZkzPuS6NnpTNrLtb9bKyMaw/9kGewZYRDpK2TnVS
 CwaMCSGb/aMzRJfCzQUfBjKDbAVnhU37QJfLOlA30ul954qkkP+gtgZVCmW2Zh1BQoJz
 xryf7T51wGcNrFAfJPdNMy88FbPw0elCkOKuSCy7s43Ku5Zht7+C//2Wg29Lj6QZ1QSG
 pTLMtba1ZVZFr1uPpno50MHwmRQkmosxUTTeYwXfe0etogAY4WW7U3l6G3dLFh81BS8n
 5m0w==
X-Gm-Message-State: AOAM533iOB9r5X/9aG0kQdK2IHsqU18iyvWHUh9fKBXz+0AJEu+SzI6g
 f1Kj418w9PMkBfEZl1gsbG0aGHtFWAwBZMU96LcCBDod+bU=
X-Google-Smtp-Source: ABdhPJxUgqnvMju0kQuK4cFRp3woy6+I3sh81LdOzyl9ntgr/e/GmMKsqkaDy48Yz3SiqBg8bmw7SQ3TapKKosYD62I=
X-Received: by 2002:a05:6830:10c3:b0:5cd:481a:148a with SMTP id
 z3-20020a05683010c300b005cd481a148amr913080oto.200.1648071747457; Wed, 23 Mar
 2022 14:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <1647943132-31250-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1647943132-31250-1-git-send-email-baihaowen@meizu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Mar 2022 17:42:16 -0400
Message-ID: <CADnq5_PB-SOvbJJiRGvGpeLwfYpuYHPT8_0HRW1R6WUJ8vwKiw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use NULL instead of using plain integer
 as pointer
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patches.  I've already applied fixes from others for
these issues.

Alex

On Tue, Mar 22, 2022 at 9:05 AM Haowen Bai <baihaowen@meizu.com> wrote:
>
> This fixes the following sparse warnings:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:71:40: warning: Using
> plain integer as NULL pointer
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> index ec636d0..ef75eb7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> @@ -68,7 +68,7 @@ static void get_qp_set(qp_set qps, enum colour_mode cm, enum bits_per_comp bpc,
>         int sel = table_hash(mode, bpc, max_min);
>         int table_size = 0;
>         int index;
> -       const struct qp_entry *table = 0L;
> +       const struct qp_entry *table = NULL;
>
>         // alias enum
>         enum { min = DAL_MM_MIN, max = DAL_MM_MAX };
> --
> 2.7.4
>
