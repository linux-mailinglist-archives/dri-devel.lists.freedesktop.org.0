Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C982C73BDD9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6BB10E690;
	Fri, 23 Jun 2023 17:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0B10E690;
 Fri, 23 Jun 2023 17:34:32 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1aa291b3fc9so741287fac.0; 
 Fri, 23 Jun 2023 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687541670; x=1690133670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nS07vla6Z4VDTbb2v8uiONE/y3+dsUfJ2mdvXYVnpGo=;
 b=r3+LqWNJapXaQTgcMmErSAmi7nE6X2ZjjEc65henO/IvJmTCngECUMU7yUjolkTPLI
 Rz0O6AFj4K0ioy+5Xnqh4zrSVlhlJTwfnx9t1Adxdn41HJ7siPUeDnSSQ53D6LXdIW86
 KqgDZQ9+DJvSE4Qy4lKb/mlzfbNlhkENqPGLhaC8fTdjzKax/0Ao2bSrjI1k4diKHdM/
 uvQTQah+ma4QXquNa+DK/olibtrb/PuDqcchMjBnlTlePyIOfvaD3JdmVgNr4wVDkGZv
 6YXSwxUH22B+iFnqoZHISqN7SLYlcBIxifkD/xjmk2XiuHrmAMd/cVUCkQ0sLznv1yAE
 cmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687541670; x=1690133670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nS07vla6Z4VDTbb2v8uiONE/y3+dsUfJ2mdvXYVnpGo=;
 b=jbl1JZ95jTLg/DxIiWqpqc3lyL6ZSx7Bm6FWoAQVrTCmkEYun6KRl2n38bzuLvHnzh
 dNzczE24qeQa3ABnD8o/gRqfUp8WLDTw3LwjI80kLhuyR6r5mWiZcGROX7VWSblp7SsW
 qDZ4fD/Tyfqqrlsqdnbwp+u56ZzIkc3SCyz3QLkgQ5aTTDyUissod90gsaqWQmqeEtBB
 m/vlOhE6c+rhWyNK6yV6/sp6w2Il97w1qCOCDB+IdFIbKt8bx4HmZ2dlx3OP7QYmb1Sy
 0VfA3Xe5dWp4j85Fylf8HjxUWcRlIDxkYdYg84tbIbDj7QbX7Kr0dRcuqeiGlyqW7saL
 CuNg==
X-Gm-Message-State: AC+VfDy5mGIpE61qrit466Tfc+KtPRxyRxXrYsTkhFitd6ugS4DNTXmK
 rUcdTFSRZvnP92NfHvrAl4d5sUEwgvNOtUErW8r9CMvS
X-Google-Smtp-Source: ACHHUZ6XLGd6HwFFY22hhq6+Wz2p+wlygKmy5RCReOQGkXc/R+u3NwsvFqRCkJR5K13rCNwdWSwr8GINPEIXdFDasIY=
X-Received: by 2002:a05:6870:3842:b0:1ad:544:f634 with SMTP id
 z2-20020a056870384200b001ad0544f634mr8655702oal.4.1687541670388; Fri, 23 Jun
 2023 10:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230622004226.7177-1-shamrocklee@posteo.net>
In-Reply-To: <20230622004226.7177-1-shamrocklee@posteo.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jun 2023 13:34:19 -0400
Message-ID: <CADnq5_PYWtz6sgutbTc66WAJgKTTgPtG=s=F+geR=74-hNy9ww@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix comment typo
To: Yueh-Shun Li <shamrocklee@posteo.net>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 22, 2023 at 3:32=E2=80=AFAM Yueh-Shun Li <shamrocklee@posteo.ne=
t> wrote:
>
> Spell "transmission" properly.
>
> Found by searching for keyword "tranm".
>
> Signed-off-by: Yueh-Shun Li <shamrocklee@posteo.net>
> ---
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_enc=
oder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
> index 0278bae50a9d..45143459eedd 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
> @@ -154,7 +154,7 @@ static void dcn31_hpo_dp_stream_enc_dp_blank(
>                         VID_STREAM_STATUS, 0,
>                         10, 5000);
>
> -       /* Disable SDP tranmission */
> +       /* Disable SDP transmission */
>         REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
>                         SDP_STREAM_ENABLE, 0);
>
> --
> 2.38.1
>
