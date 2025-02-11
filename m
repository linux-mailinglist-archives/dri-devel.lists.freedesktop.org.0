Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D36DA313C9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 19:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E1510E235;
	Tue, 11 Feb 2025 18:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SRCFjsnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0E310E235
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 18:11:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5450abbdce0so2622982e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739297485; x=1739902285;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOR6oCbPNGiKYYmVFz/bRuqX95zBVVFU7pDPu2MtVcg=;
 b=SRCFjsnp35JY1bFkBC0lPZwzy4tjPVDv7jvcpdtZvbggPxgjNTLsZBVxkUdAX5YGf3
 X5ZZ9bgUMGDfJA/WuJ6JJ8qwuTZ60lFBzYkKxBU2qyHgJ0BQ3HSMe1or1xCtsdNL5Qul
 Qv3uIoATZbNzA1zCTqep9sA+Uo3pjd9WYWgYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739297485; x=1739902285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOR6oCbPNGiKYYmVFz/bRuqX95zBVVFU7pDPu2MtVcg=;
 b=We/E8cpboOcTBQr9DspNvuGqNBNhvkHvDpPVeNTrZoTJV1als4cOflLWxbi1VfR4Wz
 YJ4QxWX74KPfG+3arVf+pMNszc6YsDTd/8fJnAqordO86j99e8z/h+o2SIhxRZJAuXpa
 Kn+njx92I77s5JafrBy+Q0b7g211PsV1MnV3KWynTgfUtxmDN15oTNRA6nsoiRcIFOL7
 AIC9OZlo3LQcEBGGgD64puhI0K5OOmFg7LxA/f6SQnmr/teVE6qOfb8lODll3IFqYl6h
 KtTlz7skFnwIkCCe8i9MA7BYyYpehOKKzcDHZIQqnU3C+zAoZbuQPHGV9m80ScSp2zZh
 kVrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTLJdrlL5wdE2KA7yt+IT/Ox9MeqTJhYgX3N2O28M7ofuK8DnlG2wkrWhikOuALUxkrUX1Jt54EwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUgIh+lFsrAKHaUhkP4C6QHplPV1Q7mCuAKrYKgYp1fzf5Kzig
 36RC/tw1pksRzCDoxDpUx2VGy9/c8O7LI3FQYV4pKYI94gtOsjnQP5A1aG5HKpCu5oeRC2Q7pGB
 +Yg==
X-Gm-Gg: ASbGnctJ6zAOVWS4Co3XJVwYdWHtoOYqmol9GdjcINh4EbGHCcMq8boBRqOoVrqBShh
 HHMVIrSgNH+W2Vu+Wp1f1hRapM0Pl/EWl8y6DEv3GBEYY0AXnR+QavgwqJcIU2Bx1X84drJdU/N
 2mzSAmJP6s1zkDjgE1VIpHpDXO6UWJzQghoXaa6os/2teyScQ+8uJbLNQ08+hTpPjJElvW4qAW2
 zj1bxnOnPhWophq8iNMUDyXKVmztPOrvm1HLAXHcrIun4HXEbQwMLPDprl/iipWs2X1R88+P4YR
 ONHggietFQCfusVUUep+w9SupmWL8kkxc7cd2juWbPFbRE9rQJnUOe9feVA=
X-Google-Smtp-Source: AGHT+IF+Hea1zE5DbBkMuRXWkclOyr8RrgZC6UoKLYtaGXCVeGj9oLFkX0nSo//fzqrTwK4KI1Wz+g==
X-Received: by 2002:a05:6512:2203:b0:545:576:cbd5 with SMTP id
 2adb3069b0e04-54511845c33mr1200071e87.1.1739297484781; 
 Tue, 11 Feb 2025 10:11:24 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450c2fd03csm727475e87.236.2025.02.11.10.11.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 10:11:21 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-308edbc368cso25257781fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:11:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPz26kpf0o54icL6ixhbAV2elB+IQyqT5d13X5mFOD2JfmdPvmdWOW6ytiBAgFIWYebZBOApO5B+Q=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3c86:b0:545:d54:2ebe with SMTP id
 2adb3069b0e04-54511876710mr1766395e87.43.1739297479301; Tue, 11 Feb 2025
 10:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20250211014314.94429-1-sre@ring0.de>
In-Reply-To: <20250211014314.94429-1-sre@ring0.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Feb 2025 10:11:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoiHvJLjyUC7djWtxmr=EqVNN_S6-q-d1+NqHK2nPk_A@mail.gmail.com>
X-Gm-Features: AWEUYZlr7-24Rlx1xc75OTjdji6RuHBK7RjYLbxD-SI9lV1I-5r7YXp8G2iQa7A
Message-ID: <CAD=FV=WoiHvJLjyUC7djWtxmr=EqVNN_S6-q-d1+NqHK2nPk_A@mail.gmail.com>
Subject: Re: [PATCH v1] drm/edp-panel: Add panel used by T14s Gen6 Snapdragon
To: Sebastian Reichel <sre@ring0.de>
Cc: Sebastian Reichel <sre@kernel.org>, Johan Hovold <johan@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org, 
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

Hi,

On Mon, Feb 10, 2025 at 5:43=E2=80=AFPM Sebastian Reichel <sre@ring0.de> wr=
ote:
>
> From: Sebastian Reichel <sre@kernel.org>
>
> The Lenovo Thinkpad T14s Gen6 Snapdragon is currently sold with three
> different panel versions: OLED, Low Power IPS or IPS with Touchscreen.
>
> My Low Power IPS version had this panel and the kernel complained
> about not knowing any details.  I don't have any panel documentation,
> but as far as I can see the same timings for the already supported
> CSO panel also work for this one.
>
> The raw EDID is:
>
> 00 ff ff ff ff ff ff 00 0e 6f 13 14 00 00 00 00
> 00 1e 01 04 a5 1e 13 78 03 82 53 a4 55 4d 9b 24
> 0d 51 55 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
> 36 00 2e bd 10 00 00 18 00 00 00 fd 00 30 3c 4a
> 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 45 30 30 37 4a 41 31 2d 32 0a 20 00 8b
>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> Hi,
>
> I'm running my kernels on the laptop as a daily driver with this patch
> for ca. 3 weeks now and haven't noticed any problems. In case they have
> better documentation I added some people in Cc, that have send patches
> for the T14s DT and thus should have at least one of them.
>
> Greetings,
>
> -- Sebastian
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

If someone has better timings or finds problems with these then feel
free to submit a followup, but until then this meets the bar we've
established of at least documenting the EDID and the fact that the
timings are uncertain in the commit message.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/edp-panel: Add panel used by T14s Gen6 Snapdragon
      commit: 50625eab3972e5d37dcf3a250d9e3cdecbd6c13b
