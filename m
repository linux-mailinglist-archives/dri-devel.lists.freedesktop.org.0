Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF402402AF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8DD89C21;
	Mon, 10 Aug 2020 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36506EA28
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 20:22:48 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id p191so1651957ybg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CsGAzF1cPgjR5U2chybR/34PsTJZMXTV2eRl8YfPD/g=;
 b=aTGkunXdWv1XHYI57lxGJXPFaz0e9RMIT43sZbSptStj4uUtfgtVeVKhoKm1aywWJd
 CMy9SpsonlKx9gVBxOPzrM4p5q19Pjfe08RRZPvpUTGOZ+jRzx/s53Vy9b9WMzoTWbrW
 m0DSH8NIMKZ+8++c1ih0D3/Rm0y9NJbCYoIrEjfFEriurpXmLSN3lH7FMjZAvi8xT2xf
 yc2S/EfsMvJZXcfR13n8DVj0iaBLKGpcqEB/xlZDTFgm0gTrIMRaBrVrASs3t0eiALQ1
 7YjSXltn5r+3EBQXl1n01c+hgCKmNPzaJGgh22o7VAqM9+IZ1TzqdH+3ZpwKkLb0AFt2
 8siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CsGAzF1cPgjR5U2chybR/34PsTJZMXTV2eRl8YfPD/g=;
 b=bjHF3g2pZYCCkKP1d4XowZ6zLLrzx82SWRqpKnndPPV2DNZKEk+/YcEjBR2qbwI1Ql
 IgOe7ejMRzVJqP7AqlAU56pBCRBy7bmXk4XnbEe23xF1VwoZfiHi6gjvPA1XmbrZKek/
 TwkR8d3VFIPiHJRA29aqerRxwnlBXrVQkQomvvuSISOGJRtj9we21Zyv+gA0ClnwWg5N
 oYN5SfI6w8y3zYVdmSY3uJA7Ru4oPlGuJs9G8fDYhYYHxa4ga+wJAqixO+gkcezBK+dn
 7QlCbg3xBcFxEYrgP8IXtO7s0omQnCVMVKMSUuPqiN1FEnVWOjCL2m8cvJbaHn8rut29
 kBiQ==
X-Gm-Message-State: AOAM530cbQa4I9Aq3EhUBXD79gf8iMEZ+cddTkNZ8eSqrVph5sQQ+fDg
 1A0KptO16magOb2CIiT1AcQ92Lms0phYQam3pts=
X-Google-Smtp-Source: ABdhPJwro+0RDRj67NhZBXu85V+P8xPYUdbMBmG8V8i6WiFWj6fPvyOCHkdl7DUTqRWkp6fxPWe3n2K+0Ky96+ge5to=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr2520053ybv.401.1596831768018; 
 Fri, 07 Aug 2020 13:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com>
In-Reply-To: <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 7 Aug 2020 21:22:21 +0100
Message-ID: <CA+V-a8snp3EUFRuMHLxVhnc=zPq-LaQL8du7LgGcswi+6NthLQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sergei,

Thank you for the review.

On Fri, Aug 7, 2020 at 8:48 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> Hello!
>
> On 8/7/20 8:49 PM, Lad Prabhakar wrote:
>
> > Add du node to r8a7742 SoC DT. Boards that want to enable the DU
>
>   Both "du" and "DU" on a single line? :-)
>
Argh my bad.

Cheers,
Prabhakar

> > need to specify the output topology.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> [...]
>
> MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
