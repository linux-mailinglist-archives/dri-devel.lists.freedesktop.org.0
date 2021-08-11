Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6E3E98C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 21:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EA189CF4;
	Wed, 11 Aug 2021 19:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8C589AC9;
 Wed, 11 Aug 2021 19:29:15 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so4667143otu.8; 
 Wed, 11 Aug 2021 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cItHMKJVxWFQWZ7rI24FO7YfKCVa/vam+UV+c07Up1o=;
 b=iWEAazlRiGBVCeST1c1e7cLPlTN8E0/DRTC+Bhae5/qa0DJidHsFfDDZICR1xh2jqW
 a9giG76Vp4DmKoBcyDzT/XI2QJOwCBM+LldPNoSwSv9V6dyl2g4Ju5J/p3uaT27bHeJS
 7Ug5gjCJwR0WRWBRcwvV8l7p4L8zlYv3h3lyzb0KFwexwxjy+aes7cDy6Cj7HNTle0Ko
 Oidg8E6/qB9NhurNGGum5OQdqdcqoio5jJpAHKp3E/r6LZSw1x4/j7aalzBhhtvDlxMs
 Dz4HQYeIk6TqwJl28LXMiooX/d8gG3vCQxCwbndVa901PhdMtsMSjh14+EUhqGYSzK39
 OHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cItHMKJVxWFQWZ7rI24FO7YfKCVa/vam+UV+c07Up1o=;
 b=Mm2CKPervzn06QKLDtJTeIhvrqjgagLULAr64cMJPVT/wubTFHr7fbU5pvSSvnwJ9d
 KP5PryrlKZpbw2YqKLmlhvhkYhBgcrxaFUjdZ5ryjdZsk3BlafKf40k5D211TkX98QAU
 Rfkv9Tl/kASUAs9oYE+elN5Ms+jbdso/E6tlWd7dxtvtdPYGr6xx7578dDehhJrh168a
 jU+4//Tn0U+U20OMr5FxOQbuDT8vjzbDOGSHD/W8LGzoAPeNcT0MDA2uAUnXMw0rhVx6
 rtEZAASJuSPIggsmvKbaWIp6BU+FimMUtei0wMPOUUv2nGex+gyRruIeBtDep8uZeDLo
 HJDQ==
X-Gm-Message-State: AOAM533DYfLDXar1FCt3SDVxKciiBc7Vn/jhkYJ+0wJgW9xhOUsBFVHH
 SB0dh+BP57QHaW/D49GEgyp2FifPaBrUHVnvDlc=
X-Google-Smtp-Source: ABdhPJw8P2BEPyaHP96Yjy6S2wYbnIXwHhEmGm+qPmLkxNgYmZbqrkYjLD6Sd8KRIlva1aL6GA+e0zObqJ+5qV00IUE=
X-Received: by 2002:a05:6830:1e78:: with SMTP id
 m24mr418330otr.23.1628710154710; 
 Wed, 11 Aug 2021 12:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210811191104.21919-1-Ramesh.Errabolu@amd.com>
In-Reply-To: <20210811191104.21919-1-Ramesh.Errabolu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Aug 2021 15:29:03 -0400
Message-ID: <CADnq5_OVA1fB5x6=CGrd_5O-i=P7snmoJaTyauF2RKuWjc8Gog@mail.gmail.com>
Subject: Re: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA
To: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 11, 2021 at 3:11 PM Ramesh Errabolu <Ramesh.Errabolu@amd.com> wrote:
>
> Current implementation will disallow P2P DMA if the participating
> devices belong to different root complexes. Implementation allows
> this default behavior to be overridden for whitelisted devices. The
> patch adds an AMD host bridge to be whitelisted

Why do we need this?  cpu_supports_p2pdma() should return true for all
AMD Zen CPUs.

Alex

>
> Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
> ---
>  drivers/pci/p2pdma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 196382630363..7003bb9faf23 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -305,6 +305,8 @@ static const struct pci_p2pdma_whitelist_entry {
>         {PCI_VENDOR_ID_INTEL,   0x2032, 0},
>         {PCI_VENDOR_ID_INTEL,   0x2033, 0},
>         {PCI_VENDOR_ID_INTEL,   0x2020, 0},
> +       /* AMD Host Bridge Devices */
> +       {PCI_VENDOR_ID_AMD,     0x1480, 0},
>         {}
>  };
>
> --
> 2.31.1
>
