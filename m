Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514954988C7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 19:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACCC10E5B7;
	Mon, 24 Jan 2022 18:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD5D10E3D1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 18:51:12 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id l1so30959963uap.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8n04RRQ8nE0niJsTycmRfUY892P4sQ+KhPXgYoCzt8o=;
 b=Dnpuldm687NW8Z3FqEI+XvRsualSLeL/IhUO9p2dBRPjffDKcRNDnvkCYkLuE6fHm0
 yPP3llCxVPTJZU4FKzAA+EXSSUBuydGFU4FouFuzEFiL5ZptUT9UitedygIwyvzhDvqC
 +nIGyLVzBajv/ywPddxUnFd3qIvnsx4D9LcLTZc8C7APgDa5gWONNHWlHwf7Uclk15u/
 MPvDJ79Xqr+boJwIVuNxGXlZt7NGB5IDtqkwmgcnQWosDXSmjaAJ9H928fVtXRQl8mki
 /+9QmSE0mhHZPfwO2ceieYGkTIZmSPmDOlJ8oklHlYVv1bxIAegk06c4XmFMfqC+iIP+
 ZtJA==
X-Gm-Message-State: AOAM533Y5KQriWC3ZFVTT0K14c5EC29uyaXxSVSE77l6zC0/VKjaAzG0
 UNWkVMaR5aSuTAS3Vz/xyrVRJE//zMqfiA==
X-Google-Smtp-Source: ABdhPJxoWrbLEO4BOrz5kAj44bx70kZfZnh6FfBOpR90ypNHSYkdhSKyxl+GdfGIaPcJz5MGziMHaw==
X-Received: by 2002:ab0:7c5c:: with SMTP id d28mr5896607uaw.123.1643050271212; 
 Mon, 24 Jan 2022 10:51:11 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id m82sm3024712vkm.29.2022.01.24.10.51.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:51:10 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id l1so30959864uap.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:51:10 -0800 (PST)
X-Received: by 2002:a9f:3d89:: with SMTP id c9mr6321567uai.78.1643050270149;
 Mon, 24 Jan 2022 10:51:10 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
 <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
 <CAKMK7uEOFg3z2btFERQ5XBQ7hqex6bXCb9X=SdwCjeLfX_SdFw@mail.gmail.com>
 <CAMuHMdVjv1+UNeXkCBE+80tdtLuNg=5d6N12hNLgJdaS-jxERg@mail.gmail.com>
 <CAKMK7uEwDdaR7kDVi9Oah0w8qFEoAywp_wj2eH7DtttVD2L00A@mail.gmail.com>
In-Reply-To: <CAKMK7uEwDdaR7kDVi9Oah0w8qFEoAywp_wj2eH7DtttVD2L00A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 19:50:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUyHEExOCtH-hKh0HmZzadmfZaR=vAVYJkTvphfzs3Xiw@mail.gmail.com>
Message-ID: <CAMuHMdUyHEExOCtH-hKh0HmZzadmfZaR=vAVYJkTvphfzs3Xiw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Daniel Vetter <daniel@ffwll.ch>
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
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, Jan 20, 2022 at 1:33 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> But reading code&docs is too hard I guess, safer to assume it's just
> broken and not supported.

I confirm there's lots of documentation (and even more code ;-),
which is always great!
But both are intimidating to me, and most of the documentation covers
features I'm not interested in, as they're only applicable to fancy
modern truecolor 3D-capable multi-buffer and multi-head hardware, while
what I am looking for is usually not documented.  E.g. I had a hard
time to discover how color look-up tables work (gamma_{store,size}!),
as this is not covered in https://docs.kernel.org/gpu/index.html,
and none of the tinydrm drivers support CLUT modes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
