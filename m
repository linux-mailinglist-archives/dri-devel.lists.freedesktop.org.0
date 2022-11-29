Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B217E63C2ED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 15:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F17510E08A;
	Tue, 29 Nov 2022 14:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1465E10E08A;
 Tue, 29 Nov 2022 14:44:31 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-14279410bf4so17250737fac.8; 
 Tue, 29 Nov 2022 06:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GTT71fzhlAVQrxanQsYv6n1IH/tvy5re3/N8VyfEuuk=;
 b=gdzpsJj/s9xkVg/MfDoGp+K9C13k0tezbx4E77bOWZt2B1LW42rAgO6qMN+XltV0Dr
 KpEJIFvb4S9LHDwDkzIFTdhGNKfDEgowAGSSGLa1N58tJwYVWHj918AwlCyqFqrVKrKe
 mgqRsCJRnX7b2mQdFFoy/6honFmfUf8FvozjJLJkskmbCEAMrttwQQvQaxUVkeV/h1Ah
 N+76Y9ZiGF/lSH22f1j06wGeMqC4Dp2IaArA26/zO85NlbSy2juKCDKHMK6QgfKt0083
 P8jgQKKARms97GDa8CHJYoqZOGapsGylseW10VBJVu/KQ2VnHn4TkLZCuT6/14Qt1Xhm
 nuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTT71fzhlAVQrxanQsYv6n1IH/tvy5re3/N8VyfEuuk=;
 b=LhV6bEXQ9Fgv1ib7tRVUB4oikJEwY5tQ8ppVAlfqdB0oqABWsX+9VysF/HC5qlerAn
 LsjeUL3V/Vm14VvDL0oMzwWY00iior09nhX1C0uB/F1PZZg8gNopPT81Hn1e3i0yqnBW
 71SW1DsFfVR3P+AwCd9UEMMqTffsa74gNIhvXAFI+rGKTJSRn6KnJLp/gOU9u9QZvp4Y
 AZtHCe+cM+0z0bVzkvi2anWOaPNSYlqRA+OIgXEPivLctBBAOKWXI2yc028fhBk81ts9
 gRGmzO38NpdqqesU482s5iook/hzQufXgcNgwC+UcidhC4xeFpsoIUtuOdhvwVOqg1Zn
 HKlg==
X-Gm-Message-State: ANoB5plYfLo+IXHTHJGPKTL2LrlSyAbCW36Yd6C236+dlyH6q+5FGkhs
 bM2HP1vTXuRiOMAkshBDyFHSRVFsJ7/osH78hRuO9wtl
X-Google-Smtp-Source: AA0mqf7ilLd/qqCUgbGPXMZjoiYaX1jIh0rZdDUb5Xh4T3vCc6dLAk1OSaF3skdpF8XOnlFw00xvxu2eJ66ZTHUUscM=
X-Received: by 2002:a05:6870:7a0c:b0:143:8a81:116c with SMTP id
 hf12-20020a0568707a0c00b001438a81116cmr9158747oab.96.1669733070358; Tue, 29
 Nov 2022 06:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
 <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
In-Reply-To: <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Nov 2022 09:44:19 -0500
Message-ID: <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
To: Mikhail Krylov <sqarert@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
>
> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
>
> >>> [excessive quoting removed]
>
> >> So, is there any progress on this issue? I do understand it's not a high
> >> priority one, and today I've checked it on 6.0 kernel, and
> >> unfortunately, it still persists...
> >>
> >> I'm considering writing a patch that will allow user to override
> >> need_dma32/dma_bits setting with a module parameter. I'll have some time
> >> after the New Year for that.
> >>
> >> Is it at all possible that such a patch will be merged into kernel?
> >>
> > On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> > Unless someone familiar with HIMEM can figure out what is going wrong
> > we should just revert the patch.
> >
> > Alex
>
>
> Okay, I was suggesting that mostly because
>
> a) it works for me with dma_bits = 40 (I understand that's what it is
> without the original patch applied);
>
> b) there's a hint of uncertainity on this line
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> saying that for AGP dma_bits = 32 is the safest option, so apparently there are
> setups, unlike mine, where dma_bits = 32 is better than 40.
>
> But I'm in no position to argue, just wanted to make myself clear.
> I'm okay with rebuilding the kernel for my machine until the original
> patch is reverted or any other fix is applied.

What GPU do you have and is it AGP?  If it is AGP, does setting
radeon.agpmode=-1 also fix it?

Alex
