Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2AB392527
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDC06E8B6;
	Thu, 27 May 2021 03:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCD26E8B6;
 Thu, 27 May 2021 03:00:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id a7so1625014plh.3;
 Wed, 26 May 2021 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=an1polfQn6vieJpzgSqPdiPhq14M4oUVqX/Ylf5ziPs=;
 b=iLjcXPx4lqRNQzS3ska24bUU8Af/ko9/sGGaMUI2RpAPp4UphYKVzdDipO9Y6M1GkE
 dIeKh+Wbu7M0IJYH4YV7hRR2J2e+cpmie5MkvOZ6QXhbCNK8ozlr+ebLG9RAR3TZbFNY
 cqNFjJ22qsdDqQiBjJ4TrxeCjDN1GBfAqbGW2h8AsSMI7dp224h6CLRbild7A5zbTnwH
 ylEixnDV4NgDPWuBJDtBszWouxoysKzlIsbdbAXvfvDfFwPq3e3C6eFF0Q8gxmraFcp9
 XNWPwPB5nD4EkajG5bZMVM0b7TJgRdNN7ecydStYCcYAIoQVKl5hIrMS05Wg7CDmgVg/
 gu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=an1polfQn6vieJpzgSqPdiPhq14M4oUVqX/Ylf5ziPs=;
 b=lqsdUNBFNhxydMV0ypmED/QjOn+/ig1Mkx6UoSG3Ees2yjpYAJvmvxUrMa0WmEw5/+
 mGfj78OKpPIwpjNkVhb+HKmkw4oiVilFaSxWWdAq0LBJJc39uP3eO/A3ke8Hu6n8E0DE
 dI4vu3VauH60/eDLeWIOkHmaTtRX8gAw6nsmXRw713VH3RVcnnjZaMmeU62CxX1XLRgG
 SOpAFIqlfj0WEeYUf+8XCycGvKCwWMFAAxGiAcqL7klBOZqhdYttX7JytvK48brDDIO9
 Pm9pnM+3MLRjE2DzjZAsJjoA7hHx/7O3C5Fi0B/jvnM099mr93UOV9PaN9ISf+HDie1Z
 iEVQ==
X-Gm-Message-State: AOAM531KC+OKzTdI7D05liPLULA+ajlrRs0JV8nc/lKhV/vmVsxHaM8j
 kUrSIXeaTV1GPRSQZUBo2icRItnTiZnNiGi67Us=
X-Google-Smtp-Source: ABdhPJwxnVnyzztt10Q86m+xS+QHTuioQsfAf05wWmuIlWJgsJUPA5s9c7IYyF029xW9KvhOQBt41hDKcpXIzZ1E8KM=
X-Received: by 2002:a17:90a:bd08:: with SMTP id y8mr7132190pjr.8.1622084423104; 
 Wed, 26 May 2021 20:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210521041633.GA1747@raspberrypi>
In-Reply-To: <20210521041633.GA1747@raspberrypi>
From: Austin Kim <austindh.kim@gmail.com>
Date: Thu, 27 May 2021 12:00:12 +0900
Message-ID: <CADLLry7xtt60wNqD4ZkcLByqEuyBpdO4VYjGjbrTMLsG1ACdcw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove unused variable cmd_enc
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org, 
 dmitry.baryshkov@linaro.org
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?6rmA64+Z7ZiE?= <austindh.kim@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2021=EB=85=84 5=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 1:16, A=
ustin Kim <austindh.kim@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> After the call to to_dpu_encoder_phys_cmd() is made,
> 'cmd_enc' is not used. Where to_dpu_encoder_phys_cmd() is simply replaced=
 with
> container_of(x, struct dpu_encoder_phys_cmd, base) by compiler.
>
> So it had better remove W=3D1 kernel build warning(s):
>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function
>  =E2=80=98dpu_encoder_phys_cmd_wait_for_commit_done=E2=80=99:
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning:
>   variable =E2=80=98cmd_enc=E2=80=99 set but not used
>
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e..088900841bf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete=
(
>  static int dpu_encoder_phys_cmd_wait_for_commit_done(
>                 struct dpu_encoder_phys *phys_enc)
>  {
> -       struct dpu_encoder_phys_cmd *cmd_enc;
> -
> -       cmd_enc =3D to_dpu_encoder_phys_cmd(phys_enc);
> -
>         /* only required for master controller */
>         if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>                 return 0;
> --
> 2.20.1
>

If you are available, would you please review this patch.

BR,
Austin Kim
