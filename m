Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U+60Na+5gmlVZQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 04:14:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A72E1320
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 04:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FF210E6B0;
	Wed,  4 Feb 2026 03:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="biMzNVnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156B210E6B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 03:14:51 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8850aa5b56so1009382466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 19:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770174888; x=1770779688;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spvVm3utSaXlCulNoTDoJeOsRoNvhaQvT7+fwTkOGHY=;
 b=biMzNVnGG7vIjLTOL9SN1d9Hbam6VrmK5sJHYCRkxOquLoBJ3jmiFaum1xObpg6STW
 kWw72/JW6KzDXn5c6uhfPdg9MtQWyBc5h1EC15vkfub3eoUUV4/bmY1TeF5USLuH4rAa
 7YfzOde2iN1zJY6kuwlsmypbSpYfoJJWOm3yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770174888; x=1770779688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=spvVm3utSaXlCulNoTDoJeOsRoNvhaQvT7+fwTkOGHY=;
 b=e20Hoarlf1CrgX4hZeZ3E2+u85ODNrRf8IMYUBsBUcDlNUp7Irh4F8G+smSkuo0bC4
 w7HmVS3lkabEifTMiXqnzSK3laONZTZwATmtJdUx4bs7bNP5D7MJKzPCt07eRTkHFdFI
 iOh2k26CkQHNK5ymm5i71EMXtDj4G4/F47EFwDpg+UZQSH7tiYcqJjACxe/DGz9FppQk
 2uXPJOG6Oysdpp6qGV7mdEYG8mX3ab1IhH5qazWBF5dC4qOXEfaIjcgyJqTR97hLkpaL
 QvQDVeJP/C105nB3NT8g3SYoiK3LV9oufep3aR94/eScVj1935dTPhzK2RzZBZkzIb+p
 sgxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdGSJbiGdx88BWyHtsaBjK9gZ7h7rH3Bd/4vt92cR4zrWi8uWxh8NCHOO0mGlOLbimsius1sKE72Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyZn1AwvkYEW0ekzFS0xv+EWafHkxT6X9jcXWgSW6tU2y/0kW/
 r/nMvd9/BNnSWBDVtMMbvnISN4l96V+wHGqzn1OpL2zWLzHuoYMegPPuSqtz2Lt6GQWL6HfKD+8
 9Na0h7g==
X-Gm-Gg: AZuq6aLur+tyVtldFBdJ7Ya9VUzfAIZMzvKnnpxPLrvSxdhLPLSvLNaoFeVgdfvXyEg
 baSX2SdsqJpj7buRFUF6E7KhN+uZar7eSELNckpU8ChG2X5II627fs8bAxvXCf16lUy/em1DtMX
 lm7/GXkg/bGEH6wB7V/IIOiTUeFSiCw9v8pyJJcBL+dz6Er7nfztc6FrXhfYXmikq9XVUCjly9R
 zyleeXjjtn0mPIBgyZhBBltFbkQUR+eyI7Xaz9f1PiEcmhDilaMDe39Axs1UUgKQfs3o45puhij
 jLRorcswKxdy8QF984pZfo3N4Jo5RJdKxDLUuxlTVkOIqnshuRvbLOr1K5hRRkQpQqTHxDJI7UM
 FOLpJMmfFctrPYszdXuBO7GUnLvTlU7VYjP87RPHUYUKd+Qwi48VmZYtHkRgmlVaK5IjxXY8uaR
 KVgSsDSrUFdUdwk/O8ZEo0CENQEdM4xuN/9TWkBegMJos1xkQDHQ==
X-Received: by 2002:a17:907:84c:b0:b87:6:3727 with SMTP id
 a640c23a62f3a-b8e9f4041femr87179166b.48.1770174887573; 
 Tue, 03 Feb 2026 19:14:47 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8ea001ea7dsm70359866b.47.2026.02.03.19.14.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 19:14:46 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so54920795e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 19:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVpIxa+KlFVz9xLv/xAcCNJR/h8y5wajAHbSxvi3CuFtlDK66WOUuoOomWp9mKTDKcSidyNgUKub0=@lists.freedesktop.org
X-Received: by 2002:a05:600c:1394:b0:480:53ce:45d3 with SMTP id
 5b1f17b1804b1-4830e987c69mr19804665e9.18.1770174885492; Tue, 03 Feb 2026
 19:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20260203044605.5890-1-chintanlike@gmail.com>
In-Reply-To: <20260203044605.5890-1-chintanlike@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Feb 2026 19:14:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U=+CvY2qPGWWwsde0a-OQuqk55QG_HqWSPCKZ-TP8Huw@mail.gmail.com>
X-Gm-Features: AZwV_Qjh9w2mtu2cEop0QSfRhPsqslKVXboQnfaFmF5BZRwEOU3oETTHvzfykRc
Message-ID: <CAD=FV=U=+CvY2qPGWWwsde0a-OQuqk55QG_HqWSPCKZ-TP8Huw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: jdi-lt070me05000: Use MIPI DSI multi
 functions
To: Chintan Patel <chintanlike@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chintanlike@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 37A72E1320
X-Rspamd-Action: no action

Hi,

On Mon, Feb 2, 2026 at 8:46=E2=80=AFPM Chintan Patel <chintanlike@gmail.com=
> wrote:
>
> Convert to the non-deprecated mipi_dsi_*_multi() helpers per the TODO
> list. This reduces boilerplate error checking while providing proper
> error accumulation.
>
> Use mipi_dsi_msleep() and mipi_dsi_usleep_range() macros for delays.
> Replace mdelay(10) and mdelay(20) with mipi_dsi_usleep_range() calls
> using tighter slop (10-11ms and 20-21ms respectively) since these
> functions aren't run often and don't need large timing windows.
>
> In jdi_panel_off(), reset the error context between display_off and
> enter_sleep_mode to preserve the original behavior of continuing power-do=
wn
> even if display_off fails. This ensures enter_sleep_mode executes before
> GPIO/regulator control, which is critical for proper power sequencing.
>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>
> Changes in v2:
> - Replaced mdelay() with mipi_dsi_usleep_range() for timing (tighter boun=
ds per review)
> - Switched to mipi_dsi_generic_write_seq_multi() for cleaner varargs synt=
ax
> - Applied lowercase hex notation per kernel style guide
> - Added error accumulator reset in jdi_panel_off() to preserve power-down=
 behavior
> - Kept final msleep(100) outside multi context for safety
>
>  .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 105 ++++--------------
>  1 file changed, 24 insertions(+), 81 deletions(-)

This looks nice to me now, and I think it's a nice improvement to the drive=
r.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll put it in my queue and plan to land it next week unless someone
beats me to it or has additional comments.

-Doug
