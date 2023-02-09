Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55A690FBB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 18:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DBA10E013;
	Thu,  9 Feb 2023 17:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B4010E0F8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 17:59:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 v18-20020a17090ae99200b00230f079dcd9so6297357pjy.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 09:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r1sHi/E23a5yYsmSD28sY0fyQwDO0i2DVxMae0s0JJ4=;
 b=o05haLPl9IFTnLiAg/ESlz8CztWBcdgK2wygltUQorSKpGgCzbiKdy/mr41/xzAshv
 y0/21lFwlWTvjRcqF+IhmRJHDIUg8JZcVFNobJiaYDr31RUlao8fMn1NdfDlb7qOH7Jv
 VlwAFW1ulaw/3IAJcEapTR2lFj6XfcAgdq8plHVMwsX3eN1JMcQ4k+WXW9MbykE/v9z8
 2s18E6qy2xJrEtIxE69vdC3GxA8cwV4SltaGKf8T54eCbVLwhFgVXQcuhIlnT5GiS0Eo
 gBESZZWoNL4WiwI1A+f3D48A3zVr627PHUVtxDBG2fypuK/dy/6BjRoXm4IBGnLkcCGb
 3hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1sHi/E23a5yYsmSD28sY0fyQwDO0i2DVxMae0s0JJ4=;
 b=h0nPsOVBAXp8bTAGLNEpNhmJJxJiMOXGnPWz6oOe6MBUb/hCv2sLIfXwUwUyknqCez
 9Ypg0Dnv6sKufiAa1wVz9N/V+OKpkx5FNWVvRmDdlfBy5vKCj9V07EDQD/Cm+UR0ad93
 S2MHRp7KislG0sLgI4XWEnvmvqbaZsJ9fyp5GEdWpQ0udYWwnjPiuobaLa/7eEH6P46r
 1CCMDusqlWk1sNJu96pS+PNIHCyERTBm/1Yd/Hagqx89LB5RoAvSgvA7WZd7kUtZCndn
 b/uSM2HQ1KYjK/tOxnFBrHOaG67wlCmE30Feq/+/clpSObzy0kPUcvDhhPlYY8a/z5PO
 RHIw==
X-Gm-Message-State: AO0yUKVUNHYQW1vrjnpznTUWnNqjiUYlbIz6tpBrRsH8oCyAg2FM4oAx
 QxKhG+kYzG/veQCII+qPJtcZYpe6P+Y8rcLacDi4HCPiUY4=
X-Google-Smtp-Source: AK7set86anSvfiXLykDPIZ+7CAlxpnSljgTl7iyZJZnzmy9NbpgqfbpEahUyyxMd04RymwBlbI7P6pE5EGISxlAdHV4=
X-Received: by 2002:a17:90a:7c44:b0:230:8f38:a4ab with SMTP id
 e4-20020a17090a7c4400b002308f38a4abmr1679601pjl.26.1675965567019; Thu, 09 Feb
 2023 09:59:27 -0800 (PST)
MIME-Version: 1.0
References: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
 <CAMxBKG3o_6R7M0gaUHXA5yGgSe6HBWYK25fwF=8mN+JTno9t7Q@mail.gmail.com>
 <CAMxBKG0wDi-XwMZwMHq_DbFXt3pgK-CV-G7iT9BNftiXBoUHzQ@mail.gmail.com>
 <20230209153600.jtj6deqhgfocvwgc@houat>
 <cefe5482-f30f-e5cc-8722-1f60d610f059@redhat.com>
In-Reply-To: <cefe5482-f30f-e5cc-8722-1f60d610f059@redhat.com>
From: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Date: Thu, 9 Feb 2023 17:59:15 +0000
Message-ID: <CAMxBKG2sFu_e4rQ_-ZyJN5+C6YDLMhSoCYgDpaFpBddHZjwwEw@mail.gmail.com>
Subject: Re: drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet
 3 10IGL5
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It certainly is a learning process! Let me try to get things together
properly myself, will be useful in the long run.

Darrell

On Thu, 9 Feb 2023 at 15:53, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/9/23 16:36, Maxime Ripard wrote:
> > Hi,
> >
> > On Wed, Feb 08, 2023 at 07:04:58PM +0000, Darrell Kavanagh wrote:
> >> I've resolved this by adding a matching quirk in
> >> drivers/firmware/efi/sysfb_efi.c - see below.
>
> Right, this is a known issue on Lenovo 2-in-1s with
> the panel mounted 90 degree rotated issue. For some reason
> the efifb info still gives a landscape resolution even though
> the actual resolution really is portrait. This also messes
> up the pitch of the framebuffer leading to the weird corrupted
> looking output you saw.
>
> >> I've resolved this by adding a matching quirk in
> >> drivers/firmware/efi/sysfb_efi.c - see below.
> >>
> >> Are you the right people to be notifying about this?
> >
> > Yes, we are.
> >
> > Howewer, please follow
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
> > In particular, a proper commit log and your Signed-off-By tag is missing.
>
> Are we, do patches to that file go through drm-misc ?  :
>
> [hans@shalem linux]$ scripts/get_maintainer.pl -f drivers/firmware/efi/sysfb_efi.c
> Ard Biesheuvel <ardb@kernel.org> (maintainer:EXTENSIBLE FIRMWARE INTERFACE (EFI))
> linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI))
> linux-kernel@vger.kernel.org (open list)
>
> Either way this should be turned into a proper patch with a proper
> Signed-off-By message as Maxime mentioned.
>
> My offer for the drm_panel_orientation_quirks.c patch to turn it into
> a proper patch for you also extends to this one. If you want that,
> please let me know and again add your Signed-off-by as a standalone
> separate line in your reply so that I can use it for the commit message.
>
> Regards,
>
> Hans
>
>
