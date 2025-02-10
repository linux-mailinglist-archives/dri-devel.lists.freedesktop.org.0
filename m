Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8BA2F201
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FCC10E5A0;
	Mon, 10 Feb 2025 15:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U8RpOGR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A104210E5A0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:47:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5439e331cceso5119090e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739202422; x=1739807222;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rx7DL2mRJJgqnbpzuR2yiwWaIRwibqF7+lfnuzIg90=;
 b=U8RpOGR0gJbMqlyk4Ip8xMUzwtYS6aCjXHiAG4CAE0+aOcBenj+OrjCdNROPEHud6j
 p78TkuaWGIoE9H65iTz4nat9irnEa2NZHGoaYhZhXlmgp/fT9uBRRjD2E4stJEaIv8xX
 q51GRhINR0lua0QrsAJENq4UylPyvz2otYD6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739202422; x=1739807222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rx7DL2mRJJgqnbpzuR2yiwWaIRwibqF7+lfnuzIg90=;
 b=pnWclvcu4o50VqrU7UAtRmosOGyoa2gxBPW/8wJuWcIvX4Tvqs6PtcJUBMTuW36WnG
 7BPH6jJROgjinapB1RYb6JR4l3s6Ulgpa4da+1zh4po05xLW5uJt+2EaO3/x8mjfzdGE
 i4+OoZvtYJ33S5bwz7IrQWwO4LyEzN3KzqqACYhXd3bSBiFRMI5b8GmW9xVnuAThruk7
 V1kqGItIj1Nww9zrJnLVIOcGKiIPGZMS+DOP+25zyrgxhUN5UpsMsW8LAoh3dZO5YU6S
 4zt89awK9d/W4ufKYrj0Wfizq8chnD4V2ma87o247eL+Ctr9UFk6cPYIgu3HR2oHceAp
 nKUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoQo6yJdSJcqmeROecqEEC9TZtmaZ0869AEe1/5QYh0LVBclBPNgo+tI51ZfP1d6LU4EizV+b5CvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn2te6FZCVE3D6Qopb6oWDIyX7ZUofRA53Xs2pqiJyz+nnJJrB
 Rm+HEDUqBqkbxapd9s8Mew65tPwBzRJSHWt91qgPIpqPj9uFJN/yl8lsYnJoToY57rHZoCDTv0N
 z5A==
X-Gm-Gg: ASbGnctnI99GJCLy8Np9O+hJbjrpvzfJnbp2WV9YG3FMYAUg7YLh9DTM68a+VdqFnX5
 Jl6jH2aoRTfOHmDjSgUL0lDtIZgDPhAtWLhwWce4VVqJ83pMfSUDzhzR1bIMsZBfQ17ixFP3ApR
 cz2wmPHWbiIwGA45Wh6r0nUCuefKFbVmclMPCARhkic/poq7LedN32GQ7wbnK1sBw1cZC5TYHa2
 HJdbbPvHpOFm5Vjo21ZpykdKLQqj6dDlBX++g04Dv+qZVRfryA1WtWYpXLY3Ny2hX4HIP6XwFGU
 pJNdWeYvyBDVMzEAEXYCHO8MJ7ycXJ25z6EKcZD/j/zggZ00UNZFpno=
X-Google-Smtp-Source: AGHT+IHKZVnTdrbcQUYeg3Axs2ULDaadIUlGi2AzqlvkMqPRdcbbHGe0h+rQAhodNMnrQrO0vVOI0g==
X-Received: by 2002:a05:6512:238d:b0:544:1451:fa06 with SMTP id
 2adb3069b0e04-54414aa815dmr3850857e87.28.1739202421779; 
 Mon, 10 Feb 2025 07:47:01 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053eb2dsm1274084e87.28.2025.02.10.07.47.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 07:47:01 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5439e331cceso5119053e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:47:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUc/XasUps9h22hb2ssC9N2+/aj9adSlLOW+ZAV9IGXq1UsGQ2Xi0nq1frbGIEZmNdTRKjg77cmFCY=@lists.freedesktop.org
X-Received: by 2002:a05:651c:893:b0:307:2aea:5594 with SMTP id
 38308e7fff4ca-307e57f2535mr53532361fa.18.1739202028559; Mon, 10 Feb 2025
 07:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
In-Reply-To: <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:40:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X2q2J_43Ree-cLQ-RCwXzxE7cODES+AmViyYBR-hXQRA@mail.gmail.com>
X-Gm-Features: AWEUYZkSR7Z9h_YcNYa44xtc55wxfsCFbVFhQKoqztzeXbjM-amo7wQcXqSqImE
Message-ID: <CAD=FV=X2q2J_43Ree-cLQ-RCwXzxE7cODES+AmViyYBR-hXQRA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/panel: panel-himax-hx83102: support for
 starry-2082109qfh040022-50e MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Sat, Feb 8, 2025 at 12:25=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > The starry-2082109qfh040022-50e is a 10.95" TFT panel. The MIPI control=
ler
> > on this panel is the same as the other panels here, so add this panel t=
o
> > this driver.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 142 ++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[3/3] drm/panel: panel-himax-hx83102: support for
starry-2082109qfh040022-50e MIPI-DSI panel
      commit: 1b80b2101d7b433718a21a9e7d413e066bf8aec6
