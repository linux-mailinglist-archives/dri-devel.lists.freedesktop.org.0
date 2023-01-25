Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E343467AFCE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC5010E371;
	Wed, 25 Jan 2023 10:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A85E10E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 10:38:06 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4fda31c3351so228360747b3.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=odxE+/0tpdyoRm8qkT42p6042uj773CpM5pTyPAni5g=;
 b=Gk0KIMZLiGWr1Ssc+TpmExGW2squacCg8tqyAtNIBX3nvFXn8i5GiFD396KFi5qJOF
 u+MSWTgm1mplmHP+ytFfTfvNK1bkBH4EZUmPEV4ShC723oiaHrAW1ZCRfZ3F4o2evH1b
 /bet1XoGawqak2cSOdayBMhNRZZSjZAh9/nFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odxE+/0tpdyoRm8qkT42p6042uj773CpM5pTyPAni5g=;
 b=B4hc0ScW8r2txZBbWALEvSmjiChn7ESOlYd5Z9oJwbIJeFh8NfFypY6araBZvXUavh
 /PMYhdFgOOWU4H2bbGnoItpQfWmme4zDSNLmGQjJf7JhSnJbBtLltTlu5WCubwE/4Eni
 IreHOJUB7iB98JjUXomxDuf1m49DAMpY75MW3hNAlqZiSpHNP2BYILRRlOZjhHQwPpen
 u3sEm6vpVthJxOX9I6Ic18ZBq63zLme7Txo8cnqDv6I0YZRlYbIKVE0TTvQiOEZL5KwP
 Zkxrd68wktmtCHo5K9B3zINDssRgWVKSdYSQL6+QFKG5BnpXQr22Jba0PI4PgZXZ3CrJ
 H83A==
X-Gm-Message-State: AO0yUKXTvEjYITNcJoo1HHK6kXMLOXD1G6+weuJZbF22M0t/MpYJK8tC
 PijkK8yj7o83GHv77s4TPv9T0IMgDbHYIZ3D2OYqAA==
X-Google-Smtp-Source: AK7set84nDUF2Ddilsop1Z0UvuPJMppKyWSdyNFlhI/pWiiqqDPbTa3H4PPPLTqvWj0AzBM2pd6P5ooUH9I4IaWJNJk=
X-Received: by 2002:a81:7302:0:b0:506:52b5:94e2 with SMTP id
 o2-20020a817302000000b0050652b594e2mr613326ywc.230.1674643085291; Wed, 25 Jan
 2023 02:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20230124233442.22305-1-rdunlap@infradead.org>
In-Reply-To: <20230124233442.22305-1-rdunlap@infradead.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 16:07:53 +0530
Message-ID: <CAMty3ZDkVZpSnD8HMXLHUjSOimE4eSMYAy2rr6vmB7t-Rk0R5w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Kconfig: fix a spelling mistake
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 5:04 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Correct a spelling mistake (reported by codespell).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> --

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
