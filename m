Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76EE49C61C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BA710E717;
	Wed, 26 Jan 2022 09:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096710E7D6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 09:18:31 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id j185so10274752vkc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 01:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVQo5xJJ/rNNBYzWD/qigNmjGp1Z3TpstaJHdpdr+7s=;
 b=GsI6lNv+c8eu3g49fCn8o/oZtVVUO1JCjvrNAiJQysXPEWbzuB88tQuwLLUMexIKe/
 IVTFLBKJudc/+3xIUcm/mDOFcxW6qG2LjT5TQCvuuzxfGAgpi1f8ZaIltDeAtNDHoDLn
 KwLnPIys0HNL674gwne/+xxVgq0VnJsqgdTvmFK0IuaAo5uzweefohxyYCyrnVMbHBC/
 TNTzKWf/xGhQrnGK4/wXzh78lpdbO8XTw9laKJcClFsvW/80owUOp1j/LUKL6jVAY+iV
 yOBNMNwMWb3LASrj2pWzPBeU2/33GMCsyEFvzWp/cunf7nKNAoQo00rV3AN40KNjW5E3
 2CrQ==
X-Gm-Message-State: AOAM531LZtS+DLSTLoIpVynCS/qVmcnDBUVpToGLOimb/mIQZCC9QuMB
 TW6CmtUk8maUQM/+FyCSGzf5lc+crdYYbZ1Q
X-Google-Smtp-Source: ABdhPJy6DujJTVdWMcycFtlg7XgmiCWkxDErjHC0+FgSlkTmCMJa3kH7eUlsNmzoF16bGVPQhhcKxQ==
X-Received: by 2002:a05:6122:d84:: with SMTP id
 bc4mr9215482vkb.22.1643188710598; 
 Wed, 26 Jan 2022 01:18:30 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170])
 by smtp.gmail.com with ESMTPSA id u12sm4201154vku.9.2022.01.26.01.18.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 01:18:30 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id m131so13970903vkm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 01:18:30 -0800 (PST)
X-Received: by 2002:a1f:5702:: with SMTP id l2mr9138419vkb.33.1643188710217;
 Wed, 26 Jan 2022 01:18:30 -0800 (PST)
MIME-Version: 1.0
References: <YfBLiUMokw6tLq0O@p100>
In-Reply-To: <YfBLiUMokw6tLq0O@p100>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jan 2022 10:18:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHoa2zGDr3YWa4PDhr+SqEVtdKhh3oeONVv6V1hBxfjQ@mail.gmail.com>
Message-ID: <CAMuHMdWHoa2zGDr3YWa4PDhr+SqEVtdKhh3oeONVv6V1hBxfjQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] fbcon: Add option to enable legacy hardware
 acceleration
To: Helge Deller <deller@gmx.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

Thanks for your patch!

On Wed, Jan 26, 2022 at 8:20 AM Helge Deller <deller@gmx.de> wrote:
> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> enable bitblt and fillrect hardware acceleration in the framebuffer
> console. If disabled, such acceleration will not be used, even if it is
> supported by the graphics hardware driver.

Note that acceleration also includes ypan and ywrap.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
