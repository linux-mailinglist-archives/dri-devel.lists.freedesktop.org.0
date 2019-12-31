Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F09A312D9BB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 16:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B10C6E23D;
	Tue, 31 Dec 2019 15:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC796E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 15:21:11 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id z12so30364046iln.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 07:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M7wDnYJLkdZ3OOSrLZqOeBqYHWkaMb/EXIdOIWi2ux8=;
 b=cbmWvu809wZwdtci+lKYzW4AhYVpnBdlWm0HloHr3t0MlPEoqkF+d3fd81CayHS+fh
 /A5cRX5GGeuxhJP503RVB9OZnzNuQCi33fmHjYSpw4ibMEb507/yR94QpjQCbTtvR4lI
 2ZR1pqe2d7rGSsTnq5T/ocPoKQjPUSsxO9bUua5KZW1NXDr+JCaOVDiiXIwU1Itc9Zu1
 A0XVdMFQvblvWdVT8PcxSdFkKxJ41sNrAYO4zptbeglWbEsFKtccfsBEa3PuoXrSgQEc
 96nk7odHY5j7Ts6/fRh/1njXnhM1uuPGX/TTkcTq0TmGb9jMorJph/R6weDxi8hEbJKL
 KKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M7wDnYJLkdZ3OOSrLZqOeBqYHWkaMb/EXIdOIWi2ux8=;
 b=TJ9Ycft+mt0L3cbuEAyvwYd7JFDiM8Sm7NmVYwIEaFk0Se1j2yhTjMOQdh9vNy8k4G
 7jRi/9TdCPw2aefAktF4En/nOdMEMksnm+Ba4Y7P7Gbd1/+ZrBvRcBMFAKRwNbX3fT12
 qrCk6poSPwTNxGtIy/HmYRsoP+YNXJ6Lo/7s8dPf+Uu2Mhp+gunQqnqvCEWQbOiini4x
 ZRYKCNQ97cQQohE5OqqyH9+He2gxpUPQPt6izRvlXlBnA2lAKTnjjiqCe0tRceYuw0j9
 NZxPNRaaE5cZdCD5IKgk/Mf85KxVmAtkoWzjGvtzFdw49Ggb7UWDKwJaal2ngY8LSGHO
 OvIQ==
X-Gm-Message-State: APjAAAURdGf8RPQyK9Em6IrShKyGSm1l9Seyb20VzZt+b1UQUKroPW+B
 ZGFf261jlGkJNPTsmqAl7hE8HX71tVqZr35Dxs7ofg==
X-Google-Smtp-Source: APXvYqy3MQrOnoaWbnV7vTPuZtjUUgc057hivbXdtKRtupkYm0cWiXJtUpFsHUEFrTtUPNyNYDJrHT3Sn1/xfTDTMZ0=
X-Received: by 2002:a92:5d92:: with SMTP id e18mr60949654ilg.75.1577805671148; 
 Tue, 31 Dec 2019 07:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20191230194102.2843-1-wambui.karugax@gmail.com>
In-Reply-To: <20191230194102.2843-1-wambui.karugax@gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Tue, 31 Dec 2019 10:20:35 -0500
Message-ID: <CAMavQKLzkP6WKkxkNRYmvo7uhJFuvXjs_ryasFEMi3MeGMhaGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: use BUG_ON macro for debugging.
To: Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 30, 2019 at 2:41 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> As the if statement only checks for the value of the offset_name
> variable, it can be replaced by the more conscise BUG_ON macro for error
> reporting.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c7441fb8313e..0fe7907f5a7d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -315,10 +315,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  static inline bool adreno_reg_check(struct adreno_gpu *gpu,
>                 enum adreno_regs offset_name)
>  {
> -       if (offset_name >= REG_ADRENO_REGISTER_MAX ||
> -                       !gpu->reg_offsets[offset_name]) {
> -               BUG();
> -       }
> +       BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX || !gpu->reg_offsets[offset_name]);
>

Minor nit: This line is longer than 80 chars

Other than that,

Reviewed-by: Sean Paul <sean@poorly.run>

>         /*
>          * REG_SKIP is a special value that tell us that the register in
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
