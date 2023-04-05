Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E456D81E8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1D210E9EC;
	Wed,  5 Apr 2023 15:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF9110E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:30:36 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id r19so7720297ilj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680708634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEtViaaPGjuALXV+zDvNSJPX33bcrmdyEjKhggGHKVA=;
 b=jzHCjwOwc5g16VEfpkno+HSo7GixfZVbZ5vh359WbzsPKIn4CCxlNwWKTyDkCqIsIK
 Lw4ooHC4Bb5hIPpADQArYfKcMVVxOg5lXKIKG7yBDGmzmDBFg+qllxUU6WwyYtl9z81K
 Vr1C0PVLGvZpaj1OXhEbQRdsnOWfnwkACVAKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680708634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UEtViaaPGjuALXV+zDvNSJPX33bcrmdyEjKhggGHKVA=;
 b=bYtdLExKWibFwv+Uq5IKIbSdfxNoMKx+ZDQyog9wqkQav3ZrZM0E34UGSwrDSq7zh2
 DYB/VGYHljZ8P6JzDPHDUi/yb23DKMaObs6e7Oo5o3WUAsRtTNXxHNS3JaHDFKfkM8ye
 ECgBjH5OojLjyu22TelghtUMgSzehPkvgREfN5mp9VQS74yQMUGJa5CbQnccCra9ywRK
 zir6u5p8Bi5dmR558qFrx0cefp5MLoqyeCAT433mIxYqSGSR9B1Mbjx2Rqtg/LQR3/Hp
 heH0jqFwLZMgO7sc/LPX+hdpQplayug2hFESPRRIXZFFjK0MA6VWUzq2XoXPA4SFPpSk
 /cyA==
X-Gm-Message-State: AAQBX9fOXwU/iV/93pdOm1TEe0Y+VbdJtHNpXIj/K1ZRPJgAmgdYhIwY
 VjOByl/uBNElziLfZGuGc1CqNfUiAKa4au73Whk=
X-Google-Smtp-Source: AKy350YJIrnOXRNk3loB9Kcmdvce9N2Vdtq5YRuFomhQSbeGL9kzTufY2jt8dDjvwAqHI906u8sJQw==
X-Received: by 2002:a92:cecd:0:b0:316:e6e4:570b with SMTP id
 z13-20020a92cecd000000b00316e6e4570bmr4596853ilq.11.1680708634559; 
 Wed, 05 Apr 2023 08:30:34 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54]) by smtp.gmail.com with ESMTPSA id
 8-20020a056e0211a800b00312f2936087sm3943086ilj.63.2023.04.05.08.30.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:30:33 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id bh15so6819778iob.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:30:33 -0700 (PDT)
X-Received: by 2002:a02:8503:0:b0:3a9:75c9:da25 with SMTP id
 g3-20020a028503000000b003a975c9da25mr3385997jai.1.1680708632983; Wed, 05 Apr
 2023 08:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230405100452.44225-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230405100452.44225-1-angelogioacchino.delregno@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Apr 2023 08:30:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UsPG+syxzLvtTaT=kK6mQZ76t5NF5M8B5UiDUDLNSKzg@mail.gmail.com>
Message-ID: <CAD=FV=UsPG+syxzLvtTaT=kK6mQZ76t5NF5M8B5UiDUDLNSKzg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO NE135FBM-N41 v8.1 panel entry
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 5, 2023 at 3:05=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a panel entry with delay_200_500_e50 for the AUO NE135FBM-N41
> version 8.1, found on a number of ACER laptops, including the
> Swift 3 (SF313-52, SF313-53), Chromebook Spin 513 (CP513-2H) and
> others.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

There's not lots of reason to delay landing patches like this, so
pushing to drm-misc-next right away.

a80c882183e3 drm/panel-edp: Add AUO NE135FBM-N41 v8.1 panel entry
