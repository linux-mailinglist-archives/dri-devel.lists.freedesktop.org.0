Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2A5F3422
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 19:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AC010E244;
	Mon,  3 Oct 2022 17:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [IPv6:2001:690:2100:1::15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F27210E244
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 17:06:14 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D1F66600877D;
 Mon,  3 Oct 2022 18:06:11 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id FPiKoMBdFlg5; Mon,  3 Oct 2022 18:06:09 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id DC6C06008807;
 Mon,  3 Oct 2022 18:06:08 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664816769;
 bh=j/vj94Hq8GqMHbVdpKQEiPA9nY5yaiwfjKz3Fu0wWLY=;
 h=Date:From:Cc:Subject:References:In-Reply-To;
 b=ax+GMRclLYMO8Tzb5hxg6a5/MDlCg+JJ7XkUtOGkdl9udTaN4IcOxM1OcItJ9mjts
 4Y0lflRj4SnNGY/PIUOapXFUwvoRoVQkBgfC6amciG4Hdp3QFB/7EyC4QlQSrG+MWe
 O9yleHu/dpohpOAxFlQE58x/4tLvpfXMf7WNdxKg=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B8741360094;
 Mon,  3 Oct 2022 18:06:06 +0100 (WEST)
Date: Mon, 3 Oct 2022 18:06:34 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Message-ID: <20221003170634.56jibls3xjxiiulg@wslaptop>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
 <efa2f644-0a1d-00f7-970c-f17ceb0cc550@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa2f644-0a1d-00f7-970c-f17ceb0cc550@linaro.org>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 12:49:31PM +0200, Krzysztof Kozlowski wrote:
> > +  ts-reset-gpios:
> > +    maxItems: 1
> > +    description: |
> > +      Specifier for a GPIO connected to the touchscreen reset control signal.
> > +      The reset signal is active low.
> 
> Isn't touchscreen a separate (input) device?

Hello, thank you for the feedback.

According to the downstream kernel's log, it seems like the panel and
the touchscreen controller are considered to be embedded in the same unit
(for example in [1]), with the touch input being transmitted via HID-over-I2C,
and since I did not find any reset gpio handling in that driver I opted to
include this reset here, unless there is a better way of going about this.

Best regards,

Diogo

[1]: https://android.googlesource.com/kernel/tegra/+/bca61c34db9f72113af058f53eeb9fbd5e69a1d0
