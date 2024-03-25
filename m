Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4542988B483
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 23:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D55310EB38;
	Mon, 25 Mar 2024 22:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Xhg4hAB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37BB10EB38
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 22:50:41 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-430c4d0408eso28800181cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711407039; x=1712011839;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yawrovRasVBRHceCsqRRDcxsuqGTGGt+XKEa9F3SZL8=;
 b=Xhg4hAB6i+sYK6hPrwKEyinBAJy9Vvw5nYmA4yO4kQMn8WnVZ9af2MLe5JQiOBzzol
 mxnC6Bl9cy7Np0M08QWLLVVvJkHM0NsM+EaqTn0ctx4Ts46+pvHky4cr49ly4IHUb/Gu
 +GAnwFdDe0fefroRUNixg2LKICi9BArw+3MQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711407039; x=1712011839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yawrovRasVBRHceCsqRRDcxsuqGTGGt+XKEa9F3SZL8=;
 b=ec8rRYsLfCyfFChAJwiF6hP2NgT+PIwFr4rk6lyFaMGy/HQgbtGKl+8EEm22pEmXdm
 3/qVP/NUyz5Mr9lCL3XKLKPV9PykmsGbbuNgNtki+291lhh2ufI10zEeaHRBCipwDIT7
 1Wv5IOTd+WrV2tI5+5kUu92kTb9KEX1EaaEOukhI/m91x7joz8C8Ns/Sx33Bw4zkGLqo
 6+yAcc5EdWwDigocQXn9rshkougRT5+h64ny6V5JRBDgyErTOgX2ALaEp+oEEkzStmFH
 I2Y0ekwsVWuo+3oHhXQp7bOu6Y3yCoLEOwnd9kakvjloBOjLjJQlOHaKX+rL0gmzlynS
 WWpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2EbwGqtZ3CxYnCjY7c+jmaye2/gnsrxRhQLL66rqxbI1S/XaF9zVRUDoRyWTpvVS385MVW2z22Z7chZ49+11y8BjXzA3z8fl743zRnfdC
X-Gm-Message-State: AOJu0Yxzok8vyLDO7I3op77LHCPdP7BF6AdA0P+Lc9+0kCcwLXhJZ5PM
 487O1V6/Th8ZtYSJQFmw0xtE1SWfmcEpyJfRs2NTVMNft3TCeoDLcXkjS5MDPU46CkZJb9TqRFc
 =
X-Google-Smtp-Source: AGHT+IFZJT3MrErZWsRGysHjrqdjCuIRveTXqOtjMZMSBHSXExOZQuKOALKKN/DxLVzRlOCauLoLAA==
X-Received: by 2002:a05:622a:215:b0:431:3772:888f with SMTP id
 b21-20020a05622a021500b004313772888fmr9387945qtx.63.1711407038635; 
 Mon, 25 Mar 2024 15:50:38 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 bc13-20020a05622a1ccd00b004309b22265asm3039387qtb.75.2024.03.25.15.50.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 15:50:37 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-431347c6c99so51361cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:50:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZbRq+9Wz9P2xmyPC6fAUv7RN4Kho+dItmZ0+L8m0vKGwkZ9q4IIOQlPVJLpahwTaok87xY6ElfCPVamHfbgdC6Kz4jhbJXnKE9Ua3gaRl
X-Received: by 2002:a05:622a:22a5:b0:431:3887:ace6 with SMTP id
 ay37-20020a05622a22a500b004313887ace6mr57851qtb.26.1711407037327; Mon, 25 Mar
 2024 15:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240325125901.2524752-1-treapking@chromium.org>
In-Reply-To: <20240325125901.2524752-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 15:50:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcYZEpOkKL=7EsPKvo-Adfwx8kqrZWPJuwjk5TyTHGvQ@mail.gmail.com>
Message-ID: <CAD=FV=WcYZEpOkKL=7EsPKvo-Adfwx8kqrZWPJuwjk5TyTHGvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO B120XAN01.0
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, dri-devel@lists.freedesktop.org
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

On Mon, Mar 25, 2024 at 5:59=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add support for the AUO B120XAN01.0 panel.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Looks fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Applied to drm-misc-next:

1864c45deb77 drm/panel-edp: Add AUO B120XAN01.0
