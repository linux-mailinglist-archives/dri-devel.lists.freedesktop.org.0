Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0067DEBE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 08:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C2910E3FF;
	Fri, 27 Jan 2023 07:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118110E400
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 07:55:55 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-4a263c4ddbaso57427287b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KvXOXKKiQZRBWlk+/UH5aeqFLgrp/Q8dsArxQepD8po=;
 b=YMLwzdtrOL/jQFgUGP5WdaI+kYSogJPcWWXKRBypcXRrGeS7gQtHHCR3ZeCg5VMRuN
 rkwBpfqxtROGaE27hcNZgrzgxyzE1uXYGCTQF7LpUFBcqJvrBBmuSZeSMwbmSgOt2hsS
 u54SktjVOFVZc2uFRHBiYOVquNskGN369w4WurXfqJYFnqAQ3gEsqOzk1SldFHGSVAkQ
 XkeE/3UKpnlUv4K+EbZnT/NxP3V0GxSrzAx2ZwzMbQJ2EjcfVnc7pEWrcNs05Jsg6f5x
 9GkPWVLHpMVYqB/7LMhgYWqxHFpsrM8+XpBiT24RjqumH9OUdSVbc0QMxdI2D9mRhJWT
 B4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvXOXKKiQZRBWlk+/UH5aeqFLgrp/Q8dsArxQepD8po=;
 b=vZ67bppYjDmFAqXvEXgnE8E7vsEbIM4rS7rpdmLmDqaHhjomQjxU3QZUBsSLrO8VeC
 X18yKB7z1qz2I4pEjBf6gnGIBhLHJ19EK9kfS9/8Czndxqhl6YfUtxQ55Z+RQzSiV3VT
 fbwjmyrP2S4mGiZJiqMQ+V8e8RwECHuWL3m2/xRzQ1DdyC8zxdKBuJMirfqu1HaUvWpf
 MNB1eeXdEA2TkkREnT8Os24SwXE17QufkbQfRypxe09LTaMuGdUcvKsUbZMbFSUFMiB3
 18XD5psqMrQbFuOIuJ1HFCz2q7VGCW0Kg+IcfSHLV/WvE6mYMlpxW76P3cO1fX80BSjW
 RAOw==
X-Gm-Message-State: AFqh2ko0/l3xntDOJtwUjlnyvwJT9rB14GADHYERwEBgDP9cmpT+etIn
 2/O8MoxXVz1Q7IwLpbSvzxJWge3TRpQfGYSrqA8msw==
X-Google-Smtp-Source: AMrXdXse4U9cqOlyNcgIygOMXbyfxyQMZxc1OQjsv3xz7efO9xazS+6V5m1toUF2HYVLQgyU0p/gfv6JliFU9YQaWoI=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3458366ywb.185.1674806154236; Thu, 26
 Jan 2023 23:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123183312.436573-1-jagan@edgeble.ai>
In-Reply-To: <20230123183312.436573-1-jagan@edgeble.ai>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 08:55:43 +0100
Message-ID: <CACRpkda-qxXQE=OtfN0UMwU38E=xhGjY==4YuA4KG=hjfficiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: jadard,jd9365da-h3:
 Add Radxa Display 10HD
To: Jagan Teki <jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 7:33 PM Jagan Teki <jagan@edgeble.ai> wrote:

> Radxa Display 10HD is a family of DSI panels from Radxa that
> uses jd9365da-h3 IC.
>
> Add compatible string for it.
>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

The v2 series all look good to me so I have applied the patches to
drm-misc-next.

Yours,
Linus Walleij
