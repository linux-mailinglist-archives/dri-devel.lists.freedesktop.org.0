Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4478B7E329
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DADD10E816;
	Tue, 16 Sep 2025 22:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hDxOMWK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5644D10E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:03:33 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-544c9efb743so1891884e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056612; x=1758661412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0dXITVgbCSbxBrfxo6QtCTx6YlY24kmhjJHsjw5K1k=;
 b=hDxOMWK1YPnXhQnPVnBVAhHYfFM0mfL+nQwghNdhPmLDGOiTQl0j5YRf07DKOHPatR
 YmEdlM62SHTsIDSNlVTJtdpmmGQsABos4SCxTTaptNiKSx4QRkyr3SSZgreVCLE13Ljs
 d2FDxiGeO98+DMgcpZ1nrYwiGIEZ/UoDgz24Mhkw9VwR/pUlHr0fWKvj+zxcZSy3j57/
 cDJA8YYaNWegBisS+OOxmDu4rCz1CeXiaaZmP5wLo8RkLJDjrEhflI3Y7+VLrawr6iYE
 mNgUp1FGp2JtHvUczrTLIY14qGxXYRy0v+nxxBdTuN2TMMoe9XXOtKY+NINtwoNB7CvL
 +X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056612; x=1758661412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0dXITVgbCSbxBrfxo6QtCTx6YlY24kmhjJHsjw5K1k=;
 b=K7mYT14EPdxkQDbgOvl5fB3y3iEvPjuKh85Do4JDzVdu5S3LxfmP1h020VV7etSaZL
 VTOo0FZnHlawCNntO1GpEUTp5oRid1Hl+61zQtZpByN/loo1AbivVdARKt0FS5mtSgu6
 tzgG4aebwDSVubmUKUVCC8F3qppr4NWojWlx4HYRFrRsB9gDbzyFuIzV2TCdmyUYU269
 KDfO5LrQsi/2AjVAFmx/tK6NPdhX2K0+KJ8gXJwCw3TYK2x29kMrxXompW+BTMsxFswL
 a8fQMXq1u4a5khGeBAaqYYKOzJwdBrktbnO3tU4aJjmW66XhTYfniDJjgmVacsnoUaUR
 M8rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9SL6czTtPA1drybCnWDoBmOMzQkG0LTMs/ibDkCdUSnGE9Wls6LavK4yDyKQpf4EJuSppGZ22/Tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfC7dxsFvl0L7cywXc1FQf3s7N55yir5fv6thuaFY4fg07rVXN
 j5fEVmq+X4r8NWMjQ+N+goUVYJw7eGo86xnUL1ScVEr1ZJ1kQmPxKMEl5BbL+j829UIRbZXOhaS
 TdABxHRBx3cRKj6JKTNJydS62iOeqlwE=
X-Gm-Gg: ASbGncv3Da5qOgzVhjs9H2SPv/ecO/DHrM2rDbhSpIp8s6nAlCwtQvY5SXbIgOvMCQr
 Y1bHK/dJri6YRYw1J2txf5AyowHQRnOSAxTgLB8bkm9uQwr3EeDN1gUv9io0tpDEFXOvbwZausI
 B9dIhStI5kN2wDoeOdFSXu/0dEUv4Y6sVAZDv0AsNYGcff847bwCOd7tqbx6ArrkUi6Q0QPkc1Q
 BgsLz/dmuvLZlimdm2AedZmwACzjw==
X-Google-Smtp-Source: AGHT+IFQtjDJJdg2xNwseUwhQKihM75rYX5/lCi3hKIPAIZQBMmRrQBLb8fGXO8jJX1XhSuHopiQoo6saypXCd3uzMM=
X-Received: by 2002:a05:6122:8cd:b0:53f:e51a:9a4b with SMTP id
 71dfb90a1353d-54a16cc2c38mr5877681e0c.10.1758056612104; Tue, 16 Sep 2025
 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250916-chuwi-panel-quirk-v1-1-ec5c6aa5a663@gmail.com>
In-Reply-To: <20250916-chuwi-panel-quirk-v1-1-ec5c6aa5a663@gmail.com>
From: Brett Mastbergen <brett.mastbergen@gmail.com>
Date: Tue, 16 Sep 2025 17:03:21 -0400
X-Gm-Features: AS18NWBeu3sYs4iEYelY4vI74bfAl6r_9rqmoGBXDaecCR4uSp61RCjbC0Dv8NU
Message-ID: <CAOcC6hK++jyPGhTww1CjF+Kf_d_WN3-odDuuHcRzU6z6-YwkeA@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Chuwi
 MiniBook X
To: brett.mastbergen@gmail.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 16 Sep 2025 22:36:40 +0000
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

On Tue, Sep 16, 2025 at 2:25=E2=80=AFPM Brett Mastbergen via B4 Relay
<devnull+brett.mastbergen.gmail.com@kernel.org> wrote:
>
> From: Brett Mastbergen <brett.mastbergen@gmail.com>
>
> This adds a DMI orientation quirk for the Chuwi MiniBook X which
> has a display mounted 90 degrees rotated.
>
> Signed-off-by: Brett Mastbergen <brett.mastbergen@gmail.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
Ah, I see a similar patch was sent for this device about a month ago.
Only difference is I look for the exact vendor string.  Take whichever
is preferable.
https://lore.kernel.org/dri-devel/20250809111200.10086-1-iburaky.dev@gmail.=
com/

Thanks!
