Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A24B58AE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8C8876A;
	Mon, 14 Feb 2022 17:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6863A10E258
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 17:38:56 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 124so20263646ybn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn6pV9zr7Y/HfRsxvJAInmjq54QbtdPj0RXX0Okyrk4=;
 b=EBDcE93JVDHCmCw9qrdUcmvIQzBJjyUwD7fn1+GwStxogaP2u1MpX5ILriuk6jdn2a
 H6QDWolci+D/lOiOOCQNb9YZPP7NXq9WolVe/6G7XqHqeHuRnQ7Wu+Ty7C8g8vwOE/un
 m0DJEjL0mXIcxFxlzzHYd7ziHU/YlTUx4xnNH8F9keNDVvqMNV/g47KfDldt/G2WXx+o
 +GDIPzh2XzqftTGjVs6g5fitl0dwhCCJQb5i/HWPKZn5dqOs6gtKvXyXdvafMNjKRLqV
 BAroGLQAEX7uERraGbi7EvcLYyyBWJ2rEwvwhCxBP5FRurs/GSHr+ceny/Hw/D3C58u3
 e7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn6pV9zr7Y/HfRsxvJAInmjq54QbtdPj0RXX0Okyrk4=;
 b=bzJ/vOU0z2FI4sZt3zOokvSF4dXykXlthT7SjV5HyTnljTu3kd5xc+zEpPpT1EQahE
 BxptTtbCdjF+RiI13X2eQY/9kWsFmI0EoVfL4qQoE3gi3ZoFvBa3k9quDDy7K7fZ2Lt2
 7CURThuoL6GWQWMnR8p/A1XE26dqk/Xhn4mJAllAXhUe+vewHBaw3kaovErJQyyO+qVZ
 9eJAxKNr8obLA3Dn96K3VbseOVRArPIOde2AnHRGwxc5xjMUB56tLe+JX1n3Ndlmabtg
 pP9kGqhCmbvzbQlmTnm6C2ECCqawlAGQBKCMfxe50dKrz4HCbNzjqM+W+bXUuQ9HEVrx
 Y4Jg==
X-Gm-Message-State: AOAM532ruqq7MXfTeWgOs8A+clyB1kMpP6cMBnw3hqwpMEJk5ajXILF2
 aN39ynjTZrgAastnaHq2NGyUdsEr3QJIQ4cKx/W+lg==
X-Google-Smtp-Source: ABdhPJzGaFahdaS9OnnivDBgzQhJSbtRiZO6xabYT+mvz3LNDNMr4zN7qlSTQ3PGiHjgQpWre/4gtNLu+fT9GjPv+rs=
X-Received: by 2002:a81:34d0:: with SMTP id b199mr779268ywa.385.1644860335419; 
 Mon, 14 Feb 2022 09:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
 <5ca70986-d6a5-7c3e-b876-40e970805775@arm.com>
In-Reply-To: <5ca70986-d6a5-7c3e-b876-40e970805775@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 14 Feb 2022 17:38:43 +0000
Message-ID: <CAPj87rNwh28GYv_CoQGB2UCqfP8A=ORiem5Z+Vev=u6WZ7YQRw@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: Add arm,mali-valhall compatible
To: Steven Price <steven.price@arm.com>
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 16:23, Steven Price <steven.price@arm.com> wrote:
> On 11/02/2022 20:27, alyssa.rosenzweig@collabora.com wrote:
> > From the kernel's perspective, pre-CSF Valhall is more or less
> > compatible with Bifrost, although they differ to userspace. Add a
> > compatible for Valhall to the existing Bifrost bindings documentation.
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 63a08f3f321d..48aeabd2ed68 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - rockchip,px30-mali
> >            - rockchip,rk3568-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > +      - const: arm,mali-valhall # Mali Valhall GPU model/revision is fully discoverable
>
> It might be worth spelling out here that this is *pre-CSF* Valhall. I'm
> pretty sure we're going to need different bindings for CSF GPUs.

Good point - maybe either make it arm,mali-valhall-jm then?

Cheers,
Daniel
