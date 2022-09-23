Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A735E7D20
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17C510E07B;
	Fri, 23 Sep 2022 14:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9C10E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:32:44 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z2so514455edi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xTwLqO8cX8Smr2zI4HvNer2tshPwVR5NDDlLtozuMKc=;
 b=fs4tS8nrQy9RSirOwgPb0QfF27CzJpSViwhpvYaErPMIWgpPRd4uS6Pl/XjGckP9+O
 ho/sFqVTR1zzMjus5zbzBoYapH5NCh9Fkuw3z69leEZXIoqR7JwmZik/01NIKOKIbsmU
 FIUSMbQiEtwlGypah9AqwPODH0jl95FGJx3BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xTwLqO8cX8Smr2zI4HvNer2tshPwVR5NDDlLtozuMKc=;
 b=TuiUFyxZcrtOalwh/rEniFp0q7y4FFIKFi4o+kcxKJf3/jC/Btqq/6Y+UNsGpmO9qs
 1SxHLtLS5InYkY9SlapHvIgipqtEAVw7tW2lJ+FO/dJpiRGx9o7VhiVUVgzRINOGje+6
 tadA5hcs3su5nMl9OJsopDpSy8NwQdcZXNoY6GXufSn2iGXcuI+gsqoWgO/ClIGrRlnN
 oiB9U/J4CFvEWw8d9sVGURfkwbmyB6/roMB3R9lnG3lc9v1weawpT5rP3bUb7duSzphY
 Hd7yfBy9EYySTZFdwK/bTmpGhthnc99EJWfngCqpARMl/dMCuILBZlKPcBcLpa9HnYTW
 swSw==
X-Gm-Message-State: ACrzQf3KkaySp+kw9y12F48AwDMs29SlcgLfXNpmeZKJE2dSww/zAmU7
 A2A2uASIpcu7gzxq2v/9Y7tmVz6QIS14qpBt
X-Google-Smtp-Source: AMsMyM5M+u44HhUX0AgNnhhk18KZNqcoxOIs8zRFhCF3nGgtTD5bxFniRc/efQq+zhm3xI9Hr2M9Ow==
X-Received: by 2002:a05:6402:27cf:b0:451:6ccc:4ea0 with SMTP id
 c15-20020a05640227cf00b004516ccc4ea0mr8797154ede.193.1663943563219; 
 Fri, 23 Sep 2022 07:32:43 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 m9-20020a509989000000b0043df042bfc6sm6022293edb.47.2022.09.23.07.32.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:32:42 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id y5so312279wrh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:32:41 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr5622908wra.617.1663943561341; Fri, 23
 Sep 2022 07:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220923053729.301626-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220923053729.301626-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Sep 2022 07:32:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VA+YPgyLn+0EzWbJjUBfbQE2fbNT7PmAhah_B_T_B5TA@mail.gmail.com>
Message-ID: <CAD=FV=VA+YPgyLn+0EzWbJjUBfbQE2fbNT7PmAhah_B_T_B5TA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add INX N116BCN-EA1
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 22, 2022 at 10:37 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the INX - N116BCN-EA1 (HW: C4) panel.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

As with previous trivial patches that just add an entry to this
structure, there's no reason to wait before applying. Pushed to
drm-misc-next:

9f4a57148120 drm/panel-edp: Add INX N116BCN-EA1
