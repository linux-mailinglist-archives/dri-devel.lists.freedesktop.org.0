Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A5BEDFC5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D17F10E18B;
	Sun, 19 Oct 2025 07:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F8E10E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 07:44:21 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-37777912136so31405821fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 00:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760859857; x=1761464657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDyEXvhcMjHGVLUO7kySkl3Qfnll/RHQf72z6TXt0us=;
 b=ZIqBsiC2D6iWKYc7xbxshowH6Ct3Q/X88MVceqC57j0laoy9YliVckaKDJNvu5OZpI
 XVSbn9rbk6Ao750EZzIa4VeIGCCKOYRkRTciWyGxdY4mrhaMoNQS88PzfvcTEyR+Pg1c
 KI0tP36ou/G2k3EzvVJvj2JKa6FqFSNqJ6SvtNQzmXB4VZEqA9PssNX8oZcDzFd19GRx
 xgddvlnkExIZvwL/DoVLKXoh4oOKkg2txFBgCPosA3zslC14FCbMfw3RiL5eW7cJQQUZ
 e3Tu5o8b3mwUU0RWyW4toCjDeVRfSW8bdHNr5SIjT6zuvdxVW/i63eKYn4mhW5UYz4q0
 Gojg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH30quMgAT2gB6/1DLQ2N686DZ3Mj24y2dbW3/a98zBRxP3hO3dcF0OZ5AxC5iQ+ervBi63O0Ef3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoPICordlq7EnJcfZ/X0edPw9cQsmi0nZFjN+HT66DuSef+3Y7
 pnS45sZjvaHyt/hW+WUP8y9P3RjDfPzjk7XHpOjlAqGrP/4lOeyJoOhyKvViP0GA
X-Gm-Gg: ASbGncs8E/hYdqcCw9APU6laU+BY+m/zTdl2VWAekX1KK6+BA4fApk9fTLKxavPDahJ
 Doxdniyyed7kG5o01VVXvu6Y3ts2tK7OpIUFsKCOdaRBjuEnAjc2HDuT1ufz5Swlxa+aK+K8CrC
 vQxs98hWsE5vP9Yw7A24pXDnwFig9G6xRoXR/8lV1jwMhG8MHEC0KCKyBlEfBOWJ1Xv6/Ba1O1k
 9aaSqtuuZ9XxmkYhNwkILFPEiwL+6IX0PmXwoHU4fOCNYQQ75FS0XrR7jGDs8p7yaIE4lzLrhsD
 DlwLPlEBS6TN0SwVENOtDV8thCX04meiYEdIFmX/40L1a8oHZ6208c00Ncg7IAW0jGr12af8H6n
 vEimkPfBo2udyoKOyZN9jxH/6nXZN9gih4rDAhzjHhneiXEpljoDM7iBmvG30iew1GbE19YSI/P
 xuJeHl1eoZoSGAnGxlDllNz3ZUJcnkwXPmYXMv/Mg=
X-Google-Smtp-Source: AGHT+IHlyioTTOmCcAYm5w9nB+M5X8WQvEFByHKUJJrLVLJBE83arNPgI5t691XiVfHOb3YyVIlG3w==
X-Received: by 2002:a05:651c:1593:b0:36d:114b:52e2 with SMTP id
 38308e7fff4ca-37797a5c134mr28502661fa.34.1760859857178; 
 Sun, 19 Oct 2025 00:44:17 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a966d73dsm11658801fa.54.2025.10.19.00.44.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 00:44:17 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5797c8612b4so5116354e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 00:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPjhrJemDPMybEoeOUUi37OYLYzjST3TneNuHQe8baRSl42hOHV6qglhcwcjmvGsroU+lQY/Yh6Lw=@lists.freedesktop.org
X-Received: by 2002:a2e:9a0d:0:b0:362:b98f:edec with SMTP id
 38308e7fff4ca-37797a28204mr31528471fa.23.1760859856735; Sun, 19 Oct 2025
 00:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-4-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:44:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v64QDvw_rQN3v+zPLp8YBcfQBZvOBenKQQ__g7P=kLkucw@mail.gmail.com>
X-Gm-Features: AS18NWA8cc21pStw1TYls77Vg9dX4gj_1oPuVNMT5dpbk_Fef3dnnMNukJyo070
Message-ID: <CAGb2v64QDvw_rQN3v+zPLp8YBcfQBZvOBenKQQ__g7P=kLkucw@mail.gmail.com>
Subject: Re: [PATCH 03/30] drm/sun4i: de2: Initialize layer fields earlier
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> drm_universal_plane_init() can already call some callbacks, like
> format_mod_supported, during initialization. Because of that, fields
> should be initialized beforehand.

I think fields should always be initialized before any structure is
passed off to another function.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
