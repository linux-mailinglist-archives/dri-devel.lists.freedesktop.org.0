Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2127470F6CC
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC8610E66D;
	Wed, 24 May 2023 12:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B4110E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 12:45:17 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-517ca8972c5so142125a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684932316; x=1687524316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fQg7SojCw83NDMnJJByptDQfnCAuKoOFAlu1j20Vos=;
 b=SdLR5A8tB3EbaBOoKbQN6vD3E3F0bDBdOEMBYN3hmErA9RoVOxFx7Pl24I+m/h/f6V
 iTL2fUEBj4UtotE2q/+Vx449LVFW8KwvfmSAyMsf2nAxkv2yewAvLyJf9tn+ogaMlFx4
 Sq4fwCESPQqR2FKdetU9ix2IcIF+EKTUwVIoboxdwUx3I6CUDIeQHK6mPEMOjDV4PK1O
 1xTm26X4I0rW1abckYVUkoVL4Ach1CScd2NSIqq+LsrXNBeAx/dKLeKhdwEtIeX3qZ33
 yO21yTZUqyzKJL0QXfJ/d63b83fESU5iyO4e+90AUh44F7HojtEm4Yqk751f3+kmtJIT
 61Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684932316; x=1687524316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fQg7SojCw83NDMnJJByptDQfnCAuKoOFAlu1j20Vos=;
 b=ATyOKvOB5yU0WJY3xs///i2wzEWxZLZF0WnQvoYOC1acwdvxDk39/8xXiBjI+24Y66
 FrCbLOP6cb3XKCzk+V3nmVfJsr/cLNEnhoQC3NgJ5W0xRf3NBdQyUtxfta6dkmIeqiLd
 OlLDVBmqIeMnOJO2VeQrgoSqVpAVs80L58zKUsOMUuSX4s+3wpQHZz98gJr0x/mmGNfF
 E1D6rz0ngECUVpT5QqPmw40W3PAl6bSV6ewTrodsbxFAkYlBRYhMiwYGEftcm658eNlC
 4saDRGBcRN3H99E6sJ6TeylqoKQIxeWzzr2jj0wxfHJg0KtesreG547A+/0MUXy/wQ3t
 6gEw==
X-Gm-Message-State: AC+VfDxSMyQQFbWORZph3o6cS4OaUDzFIGNwvi7aXPoEtwJ3X2CFcK5V
 5XbBpvgjh+9ms4RLsqI9gY4SJ/zfLXNPpvstxQk=
X-Google-Smtp-Source: ACHHUZ6YQdpPG6WJb7zPLg26UU5R8g7bxvRzXEpTmxW8ayWIcH7KTAYa2ton22HY5z6MRHN3glZn5s+c2x3v3k4eX9Y=
X-Received: by 2002:a17:90b:1e05:b0:252:85ab:41d1 with SMTP id
 pg5-20020a17090b1e0500b0025285ab41d1mr19828335pjb.3.1684932316322; Wed, 24
 May 2023 05:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
In-Reply-To: <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 May 2023 09:45:04 -0300
Message-ID: <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
To: Adam Ford <aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On Tue, May 23, 2023 at 8:49=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:

> Inki,
>
> I haven't heard back from you on whether or not you want the bindings
> patch to be included with me resending the series as V7 or if you're
> OK with a single, stand-alone patch.
> Will you let me know?  I have the patch standing by waiting for
> instructions.  If you're not the right person to ask, please let me
> know who the right person is.

Neil has also been collecting samsung-dsim patches. Maybe he can clarify.
