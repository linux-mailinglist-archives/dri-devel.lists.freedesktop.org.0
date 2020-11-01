Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C522A1D10
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 11:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930F6EA80;
	Sun,  1 Nov 2020 10:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCF36EA80
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 10:09:14 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t22so5288192plr.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 02:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rcjsrZy5DvOmULvnDe/f1f5jQvmOo2+zzfQSCPFkXZ0=;
 b=OROkIMsal9iMd6fpIBZ3qC0gIW7sdOUmQOxNHUza4XEnFyery9969Pkq8Ov1Wmc2hf
 aDkhoVuP+JqC4mD+gZWdbS5UosJ/Sdd2jE1I43avVmtxBQ/hUvf1Erbohv+4ZzD1dJYe
 ZYGcTs7BWklwX/XWTI74P+vuxKs5A0F/h+A6raMbocpUkrt7ArsTXbcZHBnXOXly/59/
 d4l/1L9demdLD3Mf2QjV8NWt42dGlzb3Kv8vuuiVgSL76vD55TM6oAx/z/y5eLxiK+Vm
 4SZ6Zlt2wOIXS8FTeEUgTOBYTL3wVLGpXHuh88y95eWRWMFaA/leLZi0uY4gkYuawuXg
 Zttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rcjsrZy5DvOmULvnDe/f1f5jQvmOo2+zzfQSCPFkXZ0=;
 b=e86aaAf8zQMk/dJQzYKWNDHush6Mh4mTxgx+DUAsZVDhKmgKh0L8o/N1S9rJ1PdWlX
 C3M0519oOr9cZhDVNwqf/VMu7JdFVqQ0xHYxeBvdkf006MFfUcefImDnbxeHriatgSIY
 PP9l4IL1X2PQVc1GrOhdi0ajUN4U1EiwB36ia+PR9DBnIv+YALbqUHyEAKKrCH+4D5SY
 IYL1iUTDpfzxWfDhQ2mpT3TJ810nfk5bA735Dqme88ZeHl3RuxTtdxVL0SKeXjxjNNnv
 2paApeHjahxXWZjJDllTjHlDyE0JnxB+o51stuLhDvms+EICeRaM+wFHhqRkXS+Nz8aj
 qoeg==
X-Gm-Message-State: AOAM533eRoQiJUPR/mhmw6+zVeqef8z0QKtXdHbm8vS7n0+qrdhB8YAp
 GiwFGWwkhtEiE/O7JKG/Iw==
X-Google-Smtp-Source: ABdhPJwaE9pIQksZGkIW6q7+j7mvxEDqZDHZlnOoKRMjX1g2qc74NloSsMaiwoZbYzqFRg39ZlB37g==
X-Received: by 2002:a17:902:9a4c:b029:d6:a250:ab9f with SMTP id
 x12-20020a1709029a4cb02900d6a250ab9fmr10026293plv.20.1604225354084; 
 Sun, 01 Nov 2020 02:09:14 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id f5sm10041071pgi.86.2020.11.01.02.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 02:09:13 -0800 (PST)
Date: Sun, 1 Nov 2020 05:09:05 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] video/fbdev/core: Mark debug-only variable as
 __maybe_unused
Message-ID: <20201101100905.GA1504836@PWN>
References: <20201021121512.17774-1-tzimmermann@suse.de>
 <20201101094718.GD1166694@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101094718.GD1166694@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 gregkh@linuxfoundation.org, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, jingxiangfeng@huawei.com,
 george.kennedy@oracle.com, Thomas Zimmermann <tzimmermann@suse.de>,
 daniel.vetter@ffwll.ch, yepeilin.cs@gmail.com, natechancellor@gmail.com,
 jirislaby@kernel.org, peda@axentia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Nov 01, 2020 at 10:47:18AM +0100, Sam Ravnborg wrote:
> Hi Thomas.
> 
> On Wed, Oct 21, 2020 at 02:15:12PM +0200, Thomas Zimmermann wrote:
> > Compiling fbcon.c gives
> > 
> > ../drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
> > ../drivers/video/fbdev/core/fbcon.c:3358:7: warning: variable 'pending' set but not used [-Wunused-but-set-variable]
> >  3358 |   int pending = 0;
> >       |       ^~~~~~~
> > 
> > The variable pending is only used for fbcon debugging. It's unused
> > otherwise. Mark it accordingly.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> A better fix would be to replace the few uses of DPRINTK() with
> pr_dbg(). pr_info() is alread in use.
> 
> ofc, the next step would be to replace all prink() with their pr_
> counterparts.
> 
> Peilin, maybe this is one for your nice cleanups in fbcon?

Sure, I will send a patch replacing all printk() except DPRINTK(). Thank
you for the suggestion!

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
