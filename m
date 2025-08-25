Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9BB344B3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537910E4DB;
	Mon, 25 Aug 2025 14:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hVYuWiFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE3C10E4DB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:55:30 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55f3ec52a42so2034197e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756133729; x=1756738529;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZltQqa1JiPaVTEAokUCgaMM7517JDy9kaVACznP6Mg=;
 b=hVYuWiFLFAJNEp+o1HjHc+8ViL5x+jgL/nUmzX/0D2a1Arqx6z1XocfSK941BkBoZZ
 7M2W90kWGqJz9urOo03gfxv8wPuZSzJp526tVDcjF9/0QOfGrdHCC4iAli0ga2QIbRNT
 Ln7swiQeZKx8Ev61A0Jy9qAofYO0ZBbl26/PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756133729; x=1756738529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZltQqa1JiPaVTEAokUCgaMM7517JDy9kaVACznP6Mg=;
 b=NuUB2ZvUYiKTrA+Ab0LGS1C5qyzan3NWC9PBu5O98D7UFaJSssa2l0ug0eyMFsgdTO
 aivmKvItU80pHrFkCIal1bQhW4pXgUYJeJeSGGiTA5lWCIPHS8jd+U9TJU3k6JpzIc7y
 8QKQcRPpWomocDdq60IJMRFGVqDT8h+2oLIR3I51vEKs06CLN+zuWwnIziCxdOAZzy96
 xPj1aYlsKN1V1UEhaDVVi+mtyDX/WZ03g6oKULEUaTjhLqZD4fr/37RjsgW2J3ReSUtJ
 oLkPBDpiIE8/6jndTSpDxga2YvDX/S26A838IA+FI4MeO9GXX/RiLRI2LSjImqZNl4tf
 +esQ==
X-Gm-Message-State: AOJu0YxsiHLIfAbaXgbL2EoS2JDzQ2zhBw+HfbMAo4858HnDUDcbMyxH
 fwwgroO3hnzMcbhAs8nU4Gu4dFso1WHnasdDnKPEPGEeuVoeDAG525JXWv0ip0ez4un/BQsogDt
 6RCHeXMNhiYESGGJgowqsARRlv8HhUrnCnKnKeIph
X-Gm-Gg: ASbGncvDX7Xu0oGa1riv2J0u4rbdb8LkUXUOFan9fiLmJNVMLwgdmMso6R4z3bfSeii
 scB78LQNM871yQBHED0WZLuklpoiX8MT2sM9Cnhieird5vedawS8tcQo9aiT0Q3XOJnmXrW4EIW
 AuvMcZART7u9/Ky0GYWhAA4apeGTtiqvfI3kBWNSNXEzBJngR6R22QUBEL3U/bZvydHeAzISC2w
 ghFHl8d1Q==
X-Google-Smtp-Source: AGHT+IEZpeoTDTSsArwCzl1l1l/wwXdnUcf5tNDKdV7KZZc7u29Ae3NIxjZuKBLSH1BoqzL03/Y6m1XaPeFnfadFQPw=
X-Received: by 2002:a05:6512:12c4:b0:55f:43ab:b214 with SMTP id
 2adb3069b0e04-55f43abb552mr1458116e87.15.1756133728719; Mon, 25 Aug 2025
 07:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250821175613.14717-1-ebiggers@kernel.org>
In-Reply-To: <20250821175613.14717-1-ebiggers@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Aug 2025 16:55:17 +0200
X-Gm-Features: Ac12FXxjKOcBiTNpPdKXqoqBJ4orKCURYaKZfX9c6jF45-S8ShurjJD2-s3Vx6s
Message-ID: <CAGXv+5FxXcJxfCUcX2SY-agbi-sr+btXq2-sDx6quwGF2vu8ew@mail.gmail.com>
Subject: Re: [PATCH drm-next v2] drm/bridge: it6505: Use SHA-1 library instead
 of crypto_shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-crypto@vger.kernel.org
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

On Thu, Aug 21, 2025 at 7:56=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> Instead of using the "sha1" crypto_shash, simply call the sha1() library
> function.  This is simpler and faster.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
