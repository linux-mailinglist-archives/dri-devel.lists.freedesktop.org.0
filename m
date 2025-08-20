Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B0B2E0D9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 17:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13F10E77F;
	Wed, 20 Aug 2025 15:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="h6nmcErL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A76910E77F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 15:25:19 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b4746fd4793so2921665a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755703517; x=1756308317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkmFWE7tq6b3ya/7cYC7Eh1qJoGwKmH4XG/rocLbBXU=;
 b=h6nmcErLDkAcudjai7j23DgF1Lsr9pjVO25vMBzi5Fp6fznHJ8dVZt/UzuEPsQ1UE9
 v0vPtIGXo99y+a4HfjfzKM0AT78l7rUt8BwfewiDUa1JpNDmru27CekZMiN3acL6SW/2
 RJOqzPwjLIe0H5NL4qa1NO9IxZfr7rUNOW4hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755703517; x=1756308317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkmFWE7tq6b3ya/7cYC7Eh1qJoGwKmH4XG/rocLbBXU=;
 b=DVMMuQrN9CNUump/7BYHK4JOrqUV2WxIl++j6Mom772f6WgX5yAuy9KNUZW+zjVkRx
 TLoLjy6BWN6QpgvSFL0OilZhndTwndhYSr/6St0h4F3VdrJALxdhOlf9FNqN4wAxLeF4
 1AvyOwOc3feY8jIcQiRn+f6M7xyo7idaLIWs03UjNeIDgkeaFMn+sNo3aM2sBl7yJBA8
 4gTJVl0VNjTkyPPR4jgUq7nNIcwVoSll97/Ady2uYwLYtrrdDmfkzuJO5GLeN2xyj2os
 TTTezsD0QJV1dY8ueDF0MGLEK4upkD+5rR9sjwE9JKhGxk31YZz81gApLDnF74EA19Y1
 jm4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYQexlmYwFeMDMDUWsEEVPShkl0YBu4nG3nrU0dEubs5d+65zA1InD9sdvsNwy5PqFtr0Cqa8XrIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzigXjbUw0qHDSCwqT70n2w6iyaEWqQGHfjb6MJRT+8jV4qWJZF
 MsWeOkZJgEjKu6kBx1W0dx1MMCJwaL6LEuw9QxykXJyXckEYgN9TE4PBP8SIA9sD7pK2VqKu82w
 EjsLrhA==
X-Gm-Gg: ASbGncsPjD1hsQ4iLoCVFxpU1OLRdBfVPfEzsu8Rls3H8BoV3gTNLLbclMUYV1xfsE0
 iNvFzJ3+YCeAg8MnxHOq1kT5aeHeTT1Eq9dkwyJw+Td1wc4loCFpgWKD2DhVQYoYMqUEwm6n6na
 JXsXjkthUKTpJR9TmyFBMIszB7K49siCCBVR/pWXEbowilKWuZ+IapuV4Q9q4YqPe/43mzNqU+1
 Ef3uoEA1WqduLALCqekBayo7fNizClNNInxrcRv+otqxHpTqRdnff3tLR/+DRTgfItcxHQHkJgU
 NqjdEnPPKFTatov7b8qL2ZAh7NQZgfE4z65AKbtqf5ECcV0QH4J5Nu1ieLYsfnui1qbeWu4K9eo
 UkVQ8qZlWg3PuxUs5SP3r9sibThzyj8bN8W4RLa8Shm0twKiqNh7BruVJUpYpY91Blw==
X-Google-Smtp-Source: AGHT+IH1xRVKqPMJ3FlJriA5zGwAyUAcbB4sBkNwR6I+v58//ICZ5XkgXxJQCvqyyTWyDKZxRQ2s+A==
X-Received: by 2002:a17:903:11d0:b0:23f:adfa:3a63 with SMTP id
 d9443c01a7336-245ef1122camr35215895ad.16.1755703517506; 
 Wed, 20 Aug 2025 08:25:17 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed374f81sm29900025ad.55.2025.08.20.08.25.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 08:25:15 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso1671872a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:25:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXPdlX0yH2lzB2ypSv8aC6FuzXpEJIfLqyaItHJ54o6Twvdr56Bz3ifujzsF61/8gGmJsD4G+gBgw=@lists.freedesktop.org
X-Received: by 2002:a17:902:ccd2:b0:245:f7f3:6759 with SMTP id
 d9443c01a7336-245f7f36a54mr17614605ad.50.1755703515111; Wed, 20 Aug 2025
 08:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250812082135.3351172-1-fshao@chromium.org>
 <20250812082135.3351172-3-fshao@chromium.org>
In-Reply-To: <20250812082135.3351172-3-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Aug 2025 08:25:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4y10ejoYKkK+sd4YbtqqaYgXYNf1YAKdK6NodcH=EAw@mail.gmail.com>
X-Gm-Features: Ac12FXxDFSB6mln8t-OwH89VVYymkhP85lC13PmFNjLgZsgGO3Gu1KDH09QT8WQ
Message-ID: <CAD=FV=X4y10ejoYKkK+sd4YbtqqaYgXYNf1YAKdK6NodcH=EAw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm/bridge: anx7625: register content protect
 property
To: Fei Shao <fshao@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Aug 12, 2025 at 1:23=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> From: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Set the `support_hdcp` bit to enable the connector to register content
> protection during initialization.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> ---
>
> Changes in v8:
> - rebase on top of next-20250731
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[2/2] drm/bridge: anx7625: register content protect property
      commit: 043d9c6928b010be7902a01b5cdfa7d754535b1a
