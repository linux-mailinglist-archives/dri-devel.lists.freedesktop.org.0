Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1F175627
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2402E6E124;
	Mon,  2 Mar 2020 08:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536B96E124
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 08:42:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a10so2597713ljp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g29XyuwOKIs/sEqqYbL4oYNrFf9RHLiVPNCz/UCehWQ=;
 b=e/pUlbcQmcm0oyU3Y02zwylI4JrIeXc779uRry4j8hsXzctEL1xDwKZ72PpcJERVpR
 JMdOrU3ejtO0UqlSL4L7q72XGFWKL6mCkYBaz191Astmalsh4dpNWXmfq82ObYeNs4xE
 LaSyWROJ/uo9K3VFd//AHUI+H7f8SJJaxM4uCpmgB0Nn9Isw5WsIKHNUQvYaiHli7v0H
 12bebEYKkd04dwjWcG2JCGtlj3x3g2qpMBT/3cWbQSHNBZCgZ+1tx1MAF7BJc8u05UJR
 Xa9qrJfOfzPWu8FlGhcWZrNSYhC3knLoUA6Uuo0Q0LXre0ggFjj1RFTyNtJoj+PJZPp9
 9Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g29XyuwOKIs/sEqqYbL4oYNrFf9RHLiVPNCz/UCehWQ=;
 b=cP/8E7OMGHV1ymVNLFn87IqVldifJdgspCFaOMMbCg4C3ocdTwK6u/NPoLorrMexuW
 WZTtkfG/OLSy+bOjEsTfK+cZTXkCuuWnyaVuBD8ZBvcoFLWQHM6U7IJF388AxA6RsOPZ
 p5yQkOkJDqJRgcAO/ZjbbKW8tuJ2KpiuvpHuAo9Kj9JT2b4slpnGQkq3BMn5Qr5FFClO
 jihoZHkvccRPhT22Rp9f+I32GHeEWEdlOxFT7+fHClxClhAZUxGwI2lBpwBRfjVqwlom
 GKmsIi9k+lF0wm1uvy1a4/g60SBjQA3U3NjxeyILBhXgfx0PpPCVWs6ugQ1wvo9yK04f
 XG+g==
X-Gm-Message-State: ANhLgQ3QGA7vmcssoXz+Bcf9H8dtMxYu8HbOP45FLXUggPcXxoAbO0cP
 87n7BzXZrsrQnbjTIRAFY48ADZtEmj8dhy20pS2gLw==
X-Google-Smtp-Source: ADFU+vt1Kci8gmkDhxlBgMDvyCvVWOL0VcOHJ/mrOCVqKw9mApHmYjif5ezTZ7tN8fRIiZstU7VWpvTxnPc4wH/TCqM=
X-Received: by 2002:a05:651c:2049:: with SMTP id
 t9mr10777873ljo.39.1583138550738; 
 Mon, 02 Mar 2020 00:42:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582913973.git.hns@goldelico.com>
 <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
In-Reply-To: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Mar 2020 09:42:19 +0100
Message-ID: <CACRpkdaP59S1uzGVKTHkJAyv_jSs6GQY1KBxgfrvmPq2c74iGg@mail.gmail.com>
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 kernel@pyra-handheld.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Andi Kleen <ak@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> From: Paul Boddie <paul@boddie.org.uk>
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch applied to the pinctrl tree, it should be fine to merge the rest
of the patches in another tree since there are no compile-time
dependencies.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
