Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F462E697
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92710E687;
	Thu, 17 Nov 2022 21:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E65110E67D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:14:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gv23so8329270ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aF8JxdLtTASZYbRwTOvQQ3h3yTGLTSFoOZwDuKEGvsc=;
 b=k5bfU/FU++6BmZmHkQMUXu5Kot7Hl/rDFqOCHLY8IxEm+9CPNDP2+ANk117ugKxB4H
 3nEelaQHz+nLFpc/riAPNIIUpsBDZe7HcGoGlo9e9MTTns9wkMypUwtV6Z8+QxPJgQJk
 0HD3LhpA18BdKR6yhgAzC6vL8sTT3J9unWOo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aF8JxdLtTASZYbRwTOvQQ3h3yTGLTSFoOZwDuKEGvsc=;
 b=NAO8aUOhSdPSIr2gqLGDquycjXExM75S/ADWaY+0AUh/VXlTDv9qEG8kZPml/ih+L7
 p6PeFtJNAVDWffQimDbVeJRQEu/m3M00jZKVQpEsH94addlrmTfpmSOANH8i0fDP04Ss
 K9gEANOao3mc/YDBTDhndFRi9jGXxsAliyzMdfPM5IT7xkhK6lJ3F3Z/5GYg5aXLGRjA
 ME6VXItTQZVXJ0aOPJQRxBvzSilfyZrRUhY6/xk1xMbplasYcSXh/XJVZMhs2600bSzH
 pT/q/iGH6emIBQ3vc7JX1ykk3cOzZyWa7PJsMS0xKRwouvOuAhyxX8IVWcG+a19UmeeD
 ELiw==
X-Gm-Message-State: ANoB5pm+PpvyaQ/mmroKfVgRRFt2f/TMW7nJ3ukYNc5SuDn0Nq5Eu0mY
 D69XI79OrnWmar3yY4wu4vUt+Sije+ZCo8QB
X-Google-Smtp-Source: AA0mqf62jN2jOK3dJ2VFFIm2QnI+T15HORdjz9z1ucjQnFVWgdbFtLgJ2d4pKgio54vwggy7xdqkcA==
X-Received: by 2002:a17:907:918d:b0:78d:2eea:28c7 with SMTP id
 bp13-20020a170907918d00b0078d2eea28c7mr3644937ejb.266.1668719697340; 
 Thu, 17 Nov 2022 13:14:57 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 p21-20020a17090664d500b0078d9c2c8250sm832778ejn.84.2022.11.17.13.14.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 13:14:56 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id w14so5946304wru.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:14:56 -0800 (PST)
X-Received: by 2002:adf:d085:0:b0:241:b3d6:d6a0 with SMTP id
 y5-20020adfd085000000b00241b3d6d6a0mr2618473wrh.617.1668719696222; Thu, 17
 Nov 2022 13:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.2.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
In-Reply-To: <20221117133655.2.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 13:14:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XzzS-kygLun7u7XMDVqLdtBtxfhdHP0YFQo4TxCTPkSA@mail.gmail.com>
Message-ID: <CAD=FV=XzzS-kygLun7u7XMDVqLdtBtxfhdHP0YFQo4TxCTPkSA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel-samsung-atna33xc20: Use ktime_get_boottime
 for delays
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
>
> ktime_get_boottime continues while the device is suspended. This change
> ensures that the resume path will not be delayed if the power off delay
> has already been met while the device is suspended
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

You could have carried over from v1 [1]:

...which I guess also means that technically this series should have
been marked v2, but not a huge deal.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20221110145102.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid
