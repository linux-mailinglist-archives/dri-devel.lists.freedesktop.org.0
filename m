Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BD6D721D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 03:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073EF10E094;
	Wed,  5 Apr 2023 01:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A11510E818
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 01:43:37 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d22so14208182iow.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680659016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwpFUC847/YFt/XfpeQoDJ4SxIEry2tnTeuETvaZGB8=;
 b=kxh9ZACpSPv9wiPQEq+Rau+iIjjh23SMvvzm/E89O97Lu0X8m0ZJUekQlfXg45YYiK
 Rcj1tmS/7d2NuAXOUQM1tAzt/Xt5Cfi9Fv8l7eqlYHG27QuDI++wznv/7hVQhFnxVVFd
 jAssVRAkytmfCRDzXjAFwmGufHKcj+tNyjBj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680659016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwpFUC847/YFt/XfpeQoDJ4SxIEry2tnTeuETvaZGB8=;
 b=MVF2MwnFy3pqrFOOPCiur1n7cuJKFu0Lqjbd3UTZ0PShwzwpbU2WCk3d7RKGYxe8au
 OSYCuX/g3AZkhmMnKLx+Qber08n2nu0pSrl1j0YzKNayMCNkXzKt6CV9WpmjvHjdW/Sp
 uFQziuX/UqMK76kXks+KmJmhcah97DWJgcvxKbYRy+qtR4KgG+1db/JSHIcajjSK7Rfv
 mPR8VxQ0scTtkynPiFPDzq4/BVGE8hY2T/7YToYZKpgU+Yvhe7g10ahRt9aqXvsRF1hJ
 8d1gKnKHaoCCDw+SW646DJbGaI4Ge0Seyu0aJOTYl6iJZI93hF0PTunlIp6FHAWgl+NT
 AD8w==
X-Gm-Message-State: AAQBX9cD087pdhRt+4h49UKuEd1mAFSEFXr7x4bFUneggWOfZ3vmrEFe
 x++uM+PmzTpi2O4yadSvZHmseR6NP6QBSqHHv2I=
X-Google-Smtp-Source: AKy350Z/c8n10QNPADBtS350qB+BkiWSJwLkcEzdsfrxvtRd0A0kyJfle3A+L4W7t1s18JVmdUL/gg==
X-Received: by 2002:a6b:ef18:0:b0:75c:3b4a:d13f with SMTP id
 k24-20020a6bef18000000b0075c3b4ad13fmr3388174ioh.14.1680659016097; 
 Tue, 04 Apr 2023 18:43:36 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d9a87000000b0073fd8ca79c6sm3745664iom.9.2023.04.04.18.43.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 18:43:34 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id j6so18049972ilr.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 18:43:33 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d9a:b0:325:dd36:7451 with SMTP id
 h26-20020a056e021d9a00b00325dd367451mr2720800ila.1.1680659013319; Tue, 04 Apr
 2023 18:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Apr 2023 18:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XV4yjUb2ufQZjOTYsgFXE0Ghnor3f8FCSdpV_pcZd1yg@mail.gmail.com>
Message-ID: <CAD=FV=XV4yjUb2ufQZjOTYsgFXE0Ghnor3f8FCSdpV_pcZd1yg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 31, 2023 at 6:59=E2=80=AFAM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> While in virtual terminal mode with PSR enabled, there will be
> no atomic commits triggered without dirty_fb being set. This
> will create a notion of no screen update. Allow atomic commit
> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
> and shows update on the screen.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)

I can confirm that this patch plus patch #2 fixes the typing problems
seen on VT2 on a Chromebook using PSR.

Tested-by: Douglas Anderson <dianders@chromium.org>


-Doug
