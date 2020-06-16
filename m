Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CF11FB5E3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 17:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8CB6E8E6;
	Tue, 16 Jun 2020 15:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23466E8E6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 15:18:09 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g129so11655638vsc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xv3r9xVZE/z08H/lpNAQcKBaapLWN1RljKJjRWmfzRw=;
 b=rw+dVMYn6f6+KLvQb3iYi85DcJHhVFuLG0GHauRerkjdgcEiAwl2vWzPnaSp9w/Lub
 pyA5aLGN2vEt2c/EX46yGMtBmbq6ExJ220twblr8Fwna2WN7EbZJX8SN0fgzVEjpcLFs
 W1rTNssCBW7jmqOyvraZRx4DEhFbLSuJRaZKYIcQS6OI5M2XQ/Op5GiERxLS2Z68cCCY
 dZBXKMOUSBlo2z9GN4510iz+BRnLFcR/AAZp60mLqB8nMYol3cg/EUyRBRNBmGDOs7sR
 T7wpgEMNeF6zkrP16GlVv12BC91urw3hQENra5ycgjOUDsZc/hwny7lg93E8xQ883Yao
 b7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xv3r9xVZE/z08H/lpNAQcKBaapLWN1RljKJjRWmfzRw=;
 b=SD5yeLAl5umRgL4lAnSK66n71dnH/6xiwpRfL/MVrC6tV2lhGVm9zrCGQUUa4Fx0UC
 nBidNVUHOFX2DXSCJhBOzeOahw3h3p2mTX4hyBJ3oVvvGog/opGmxtiR+iUqZl8EAdcA
 Z/A58dALF3CGBNUWcv1Q8WmCkTen3DvshsCcfmFX2JEEYv5JEKr5cpCHTxixSlchTbUW
 DdNEw7vHm6obNcd6+VYUUO0Ig83JsJ+BfVpwu0bweGaQ+WodIUBPzEaqCiHM99yP2SDn
 yN8n8r85when8XSXMd+t5Ov3SuPtZ3O0/8Gq9+MMQDwCqQErgfKzEoQfNE6KyNzuLVmK
 m5ow==
X-Gm-Message-State: AOAM530YlIOPCRempgM7uVrFSISqmmj9hacqlrRzz3zUARVtJOITl64w
 9kNdO+7RVyTxGXYntAuVZf8DV3tdlbsdBPTVU3Y=
X-Google-Smtp-Source: ABdhPJyknOggw5QjsW/WMV95VP/gQCi7OG+jud39vFfQChbZ+1fcqarK6PWJixt7S2hR5AQ/2O2Zc2dindrgsQO+ccQ=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr2062351vsj.186.1592320688819; 
 Tue, 16 Jun 2020 08:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200616142630.20129-1-tzimmermann@suse.de>
In-Reply-To: <20200616142630.20129-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 16:14:27 +0100
Message-ID: <CACvgo52NY98wQ4Pm3LozSmdewQf_ftX4cYZbx=t6=s9CNE27kA@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, 16 Jun 2020 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The original modesetting code set MISC to 0x2d, which is <hpgoddev>,
> <clksel> and <ioaddsel>
>
> With the conversion to atomic modesetting, <rammapen> accidentally
> got enabled as well. Revert this change and initialize MISC with a
> constant value of <hgoddev> and <ioaddsel>. The <clksel> bits are set
> in mga_crtc_set_plls(), sync flags are set in mgag200_set_mode_regs().
>

Let's keep the remove (restoring original functionality) and rename
(cosmetics) separate patches. The read has also disappeared, which
should be safe although might be better on it's own.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
