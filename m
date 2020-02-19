Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1C216422A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAFD6EB89;
	Wed, 19 Feb 2020 10:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EB66EB67;
 Wed, 19 Feb 2020 10:30:59 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b18so23331987oie.2;
 Wed, 19 Feb 2020 02:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FvkhkBjXP3xwonKXIkY4RihP08iRrqR721UJBkfJeTA=;
 b=QdbNF4oP1JheUFF6jnKjuE2ark+pdzzD76z5DfWqzpEG0XgbAC8d1ss4K/3A4FExwT
 YcTr+Zdo/uub05LAkk4NdpfHiTEhry4GGFND2Ftb8gNprzeETIKpSpDoCo7CGxZCPFMN
 RJk8iOHc25mdiJJLor7UJjBgfYW9yGbnHebod4vx+/iv2XpHFcPdZDm8MP7xy6jbq4vr
 om4fhpP9KpUyGGbxtHH1FFyRhYLK+FrR+lcSDazzHomrCECHf3mHDjTQ94A6bN6vD/4f
 kRma2nCbBfdcVLnzDY6uc9oacyrmNv1KwJpe9+mI+IEunlBG9OfbK//sli+qZIW4p1cw
 wJ7A==
X-Gm-Message-State: APjAAAVCFpjTPoszoreOoolJEFp9meiZD57ICiEnvWxWjuTlI8b/U3L2
 Vt3uNwxOZp6V5IEh80O+OnusfD43O2wpFYjO3yc=
X-Google-Smtp-Source: APXvYqyiFJRzLPKkcTXbZ92ixD2SB2MQqGjOS7f+m696AuxASfdlt+S3DyBRmMwQmUieZHK69GTMDoaWwBRuatifNi0=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr4226894oif.54.1582108258523; 
 Wed, 19 Feb 2020 02:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2020 11:30:47 +0100
Message-ID: <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup
 call
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> It's right above the drm_dev_put().
>
> Aside: Another driver with a bit much devm_kzalloc, which should
> probably use drmm_kzalloc instead ...

What's drmm_kzalloc()?
The only references I can find are in this patch series.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
