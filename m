Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D225657B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 08:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079AC6E4DD;
	Sat, 29 Aug 2020 06:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83DA6E4DD
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 06:57:12 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z17so818668lfi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AInSrQEdlZdxccbB8jRT9FmBwu+5/tizJtC9ygY1zrg=;
 b=oKtEZT3ydIjglYG9iD8Oxo/HqkSXmTnjVqJejYnbN7EcQj5YIZ1r3CDtf7CxXVR7mJ
 sOT9wOaBzSN9FM2helrqnLHRNXscZbVpz2B9uvybSlhmthPcik7rdw4WaxSDf40dprkp
 T/HT9scOmU0Ao+HVaFTu6DvpGGpDOffdaJByhjSy5zEBcNUCFwE4yd+IKQcpvVEy+Pst
 u9/8yy1HdO5y2K8q6ZXi0Gk5RVUsSjAk5WDjyq7349n11ECFTEachA8Ft4jJbad1hexM
 S3XAXQ0/m04JkmuFLcoC0Mo9IWk3JNcHh+u0lIRuuS7gIrEoWBPlkOa3SS279zPdxqSF
 0xDg==
X-Gm-Message-State: AOAM5326OxxAFa3h6/bx5Qg9+kLctqahHPYVfGvO4f15i2pb1GVJFvcA
 6zptsLimkfF/zERzeX9qSsAvbJe2copW4Q==
X-Google-Smtp-Source: ABdhPJyP2sQPwargWOVQa+AlMrwuGqOMsrTAnqciLuHXpsoF6D4ZqhBkhwcu+7zygKvrUzOaLSeVuA==
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr1014347lfq.70.1598684231272; 
 Fri, 28 Aug 2020 23:57:11 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id c8sm394966lfh.67.2020.08.28.23.57.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 23:57:10 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id w25so1214532ljo.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 23:57:10 -0700 (PDT)
X-Received: by 2002:a2e:9719:: with SMTP id r25mr1028830lji.75.1598684230756; 
 Fri, 28 Aug 2020 23:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200728134810.883457-1-maxime@cerno.tech>
In-Reply-To: <20200728134810.883457-1-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 29 Aug 2020 14:56:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65y+Sdt9YGAV=jBv7KVT9s9ZO9aDe+oD=yfEB_Xsm-wiQ@mail.gmail.com>
Message-ID: <CAGb2v65y+Sdt9YGAV=jBv7KVT9s9ZO9aDe+oD=yfEB_Xsm-wiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sun4i: backend: Support alpha property on lowest
 plane
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 9:48 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Unlike what we previously thought, only the per-pixel alpha is broken on
> the lowest plane and the per-plane alpha isn't. Remove the check on the
> alpha property being set on the lowest plane to reject a mode.
>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Fixes: dcf496a6a608 ("drm/sun4i: sun4i: Introduce a quirk for lowest plane alpha support")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

once the build break is fixed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
