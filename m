Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA65D8AAA04
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2665E10FDFC;
	Fri, 19 Apr 2024 08:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="veuXmFZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403CF10FDFC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:24:24 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so1755603276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713515063; x=1714119863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCzS/qvMhK/byAneszHl9MP3i5FRyHGeEIQ13eLW1T8=;
 b=veuXmFZf4D/PezEsSu6+DWkEcQpFhc31jEe9iqjEfzXNUfulEwhTuoWwtqx9JNxgmw
 nLS3J7YM7W/E9Hjn0Y/rH8i1oR2Ad4cMJMmTd/bf84K7F6mVrWQuQEVDKw/M6flXB/hc
 frteTBuewQpAzVRYM/5fDsfO06bXrXJxhPzBpvg3y6+odLvPQvi3qSlxMJ2cPf5g3pCU
 4AFjqXJxPtfopM42AtWK886rdjtJjR2oH+WYa2W0bUR+8gKx2b2wFsjzIHG73Q7WA0et
 1UwVqcIQYqOHVL7gjqOK0vMlEWGyD8f/Wy1JUq/9G4TT2tsL15XnYmCDSgEUywD0Z9S5
 kYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713515063; x=1714119863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCzS/qvMhK/byAneszHl9MP3i5FRyHGeEIQ13eLW1T8=;
 b=xTlxS6wXCQEseM+sdBAWqTvst869PGyoOYe4ms4U/Md5kNPsSj2PC4edrwL0qM9JQ1
 g/6TO8bZqN8pEetmwaBk6mbbTCE9BYsDAAhbxdkahO1TN44Ou/vK6eKEx8Z8O2WFgAkJ
 LmdL94GT225vcX25lVpSconfhGujrstNWHl6l4QYq//2BEE9ER9AfU/GuNqX8lbIRWI9
 eB5Epa5k9cudvo3+tLlUT4Q2uABAN+Ht/OStUbx83YS6UqWPJt9b6fppk/w6X78hyca9
 Q3LGyGefROMW07rIfFjfBlM8pXOpXm3ynzcKaXd7pay84Yvff93Mw2ZtMjbwqO5b63cT
 ruLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqwoyFAS3IfqYmp+k6R0fDbX+9gSnnvOEAiS1SxMTVXPpvazQw2OczUYryF0lMWux+wpHFeqzyDhhXEIkTP/h+XGg8DY13uSBuJkdrr3/I
X-Gm-Message-State: AOJu0YymjUgJxQAj23twGsseORxpo8ch9CMSfzA/X9HekYaRA7lyH+uc
 sbG7c2itL3aymhqohS09ekln/X01kG9uVsvUKVr9bo8dnSdx5fQyAnYuhG9UhhDhZytanzfWP6L
 +kCCKDfWzI/NWOUOyr5Lta8gnsRESuoUi6hOIiw==
X-Google-Smtp-Source: AGHT+IH8xdOIGbu8q88iGajALNt+h5zvKeE4NEGt5cnzEzv4jCMV9NcRrIBvOGiggDc7Gp8qucf/wW4qeD/6x5ywM+Q=
X-Received: by 2002:a25:dc05:0:b0:dc6:dd80:430e with SMTP id
 y5-20020a25dc05000000b00dc6dd80430emr1205866ybe.27.1713515063262; Fri, 19 Apr
 2024 01:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
 <CACRpkdYtM=5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jhhkGxV59Q@mail.gmail.com>
 <CAHwB_NLfaQWhFSbZ2ASmYgXJaVOTrjac3F0hyCJdwTTo-zHJrQ@mail.gmail.com>
 <CACRpkdYoM40RZyjTxLwDNta2+uV31_zzoj7XrXqhyyqrDtd5zQ@mail.gmail.com>
 <CAHwB_N+39-kTcNX91JvNGM4HEJ_ZArKt2Vs61g-OR-Mz6akocw@mail.gmail.com>
In-Reply-To: <CAHwB_N+39-kTcNX91JvNGM4HEJ_ZArKt2Vs61g-OR-Mz6akocw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 10:24:11 +0200
Message-ID: <CACRpkdbzYZAS0=zBQJUC4CB2wj4s1h6n6aSAZQvdMV95r3zRUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: boe-tv101wum-nl6: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Doug Anderson <dianders@chromium.org>, sam@ravnborg.org,
 neil.armstrong@linaro.org, 
 daniel@ffwll.ch, airlied@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
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

On Fri, Apr 19, 2024 at 2:48=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> > Use one driver, use different compatible strings for the different
> > panels and use the corresponding sequence for each panel
> > selected by compatible string.
>
> I mean add starry_himax83102_j02, boe_nv110wum and ivo_t109nw41
> together to make a separate driver and break out boe-tv101wum-nl6 ,
> because they belong to the same controller.

Aha OK sorry for my misunderstanding!

We are all in agreement.

Yours,
Linus Walleij
