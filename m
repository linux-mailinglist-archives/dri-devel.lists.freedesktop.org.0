Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9B5F0D31
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5158610ED18;
	Fri, 30 Sep 2022 14:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D7A10ED18
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:14:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F0DCB82779
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBDFC433B5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664547285;
 bh=7UnwSXOB6shKfCQHM7L0KOwifPttNCBnzJ2w0rnlzK0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EKgvh2WZQOLQHVQIJMdTU8+8dMdHbNnxgBm2yxJJF21w2sXsPGKzJqrbrz1iEI+TP
 kKU45+mkYZWfm4i9TrM+lH5B9Z3YJfGPKp+LXwFIdUR4lpN3s7y5Xceu8eyp1fBayX
 qqXvlzGcxE2VW8Ejau/TQAFjzypKn8fZiM5P3B4B4pEdsfBrccSMz3GY5IY26lSZJq
 x+GvtVlfcrmC9c2UKuxtKbRs6lsX5hBfniQqdDb32wzRz1InTjv/8SSoLl0yBbCGlU
 XE7gVW881cFrgaZVwo6TJXSGRZPL3G98dVY65QqgcUKZ96SSi0oUlpwteRhITKxhJC
 geig+OOOWZpWw==
Received: by mail-ua1-f43.google.com with SMTP id z14so1758443uam.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 07:14:45 -0700 (PDT)
X-Gm-Message-State: ACrzQf34ZtQ7KSRSejMOm0XWS2c534gCpsg3YsUFx53Rs86bhTVk5q8N
 2ZNt/heaQaUPznwuMf4w2xWDgSeRPFYTGetoWw==
X-Google-Smtp-Source: AMsMyM6tmbeGs8WAbsagouNnCGeikv0UgHuHEpeJ7scOJRA6OHmQzWBNHAz3+EbsX5QLTinYFxLw9PZO5FxxSogzzL8=
X-Received: by 2002:a9f:29a3:0:b0:3d6:4c6f:9d92 with SMTP id
 s32-20020a9f29a3000000b003d64c6f9d92mr1117022uas.43.1664547284059; Fri, 30
 Sep 2022 07:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220930132842.23421-1-r-ravikumar@ti.com>
 <20220930132842.23421-2-r-ravikumar@ti.com>
In-Reply-To: <20220930132842.23421-2-r-ravikumar@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Sep 2022 09:14:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVhAJ6TFNtndDtUX1FukuQorvm_o0eKK_CE6ANsPob1g@mail.gmail.com>
Message-ID: <CAL_JsqJVhAJ6TFNtndDtUX1FukuQorvm_o0eKK_CE6ANsPob1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: dp-connector: Fix the property name for
 dp pwr
To: Rahul T R <r-ravikumar@ti.com>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, kristo@kernel.org,
 tomi.valkeinen@ideasonboard.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 8:29 AM Rahul T R <r-ravikumar@ti.com> wrote:
>
> Property name for DisplayPort regulator is not matching in
> the binding and the driver implementation. Fix the same
> in the binding
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reported-by: Nishanth Menon <nm@ti.com>
> ---
>  .../devicetree/bindings/display/connector/dp-connector.yaml     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. The binding is correct.

Are you confused that the regulator framework appends '-supply' for you?

Rob
