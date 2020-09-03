Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE625C537
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 17:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DF6E190;
	Thu,  3 Sep 2020 15:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B1A6E190
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 15:25:17 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E863208CA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599146717;
 bh=f3U7ASbVqHoINyjVgQ54NfsvbWfunAHGWhDtFw6uEcY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c063w8imevxLfowa1GOqJNf4nwV4prVK9zMHqAhuaZs3iExgbuAWY65/snmP4ySuj
 F+LfwU0aEpMs5MMhj1I2wJ7kEOvYN6xAmfEFk6/anfkxjQPyXTLt2QDEK+DWnKq8Oq
 Vm0mPfUe7Y/CbzzEAzm6Kl+3SOT3RKConrbUTmEQ=
Received: by mail-ot1-f53.google.com with SMTP id c10so3025107otm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 08:25:17 -0700 (PDT)
X-Gm-Message-State: AOAM533IwlBGuoBC2JQF2QlRMJafeQjAW3BwTDqp6s5TXDTIinqrLQCM
 CXsVg73OsmatRTPh3GzL5fBDeCTg5CFXTxKpog==
X-Google-Smtp-Source: ABdhPJzXjy+69tf3xQkfYZ4SALE7mZxLKgQkVsN+qODC/aOmNuTSKjaYiWjkWkla+tgVnuSeEGz3EWI0pYzILh4sYW4=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr2025135otp.129.1599146716464; 
 Thu, 03 Sep 2020 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200830084021.18572-1-krzk@kernel.org>
In-Reply-To: <20200830084021.18572-1-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 3 Sep 2020 09:25:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com>
Message-ID: <CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: arm,
 mali-utgard: Use unevaluatedProperties
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 30, 2020 at 2:40 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Additional properties or nodes actually might appear (e.g. operating
> points table) so use unevaluatedProperties to fix dtbs_check warnings
> like:
>
>   arch/arm/boot/dts/exynos4210-i9100.dt.yaml: gpu@13000000:
>     'opp_table' does not match any of the regexes: 'pinctrl-[0-9]+'

When unevaluatedProperties support is actually implemented (there's a
prototype), this will still be a warning. You need to document any
additional properties/nodes.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
