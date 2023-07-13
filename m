Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EAC752379
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6F810E6D2;
	Thu, 13 Jul 2023 13:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C9F10E6D2;
 Thu, 13 Jul 2023 13:21:46 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-56584266c41so557094eaf.2; 
 Thu, 13 Jul 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689254505; x=1691846505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMl5dn5Xz12gXOMX3oC+kNdFlWhzCPfH45LFdGwDg+c=;
 b=eshePJRxBGfoEbxv/HATy/LbMrzsCDpyAiPdPWKP2+7M1zJL3N5KwDGRakUw3RzP4p
 q0Cnwz0fdaQ+HyxVhl+a/PdVIYgV40UvVYeo6oku2ew3IT0bTt6UYAHjOIS6Vb6t9Mla
 Zj8EL/FlPFPvHB5g71aE7gFP3zFqlG9d7Fbu8m/nhV/T9INJD8alH0sgU2iXPleyzim5
 lINS3JcD7J0TOIOFW4pf/x8/SEpIIASy3dTyyqXfKshxdSJS0TlF/u7bPTHA+oWf2AYl
 SPCY6gZL7ykEOqi+bfIKlTKf4FRPiV/L6IcHOgev/4QAZK/gwKYWQ5RBFTfBsMThGpXg
 EmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689254505; x=1691846505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMl5dn5Xz12gXOMX3oC+kNdFlWhzCPfH45LFdGwDg+c=;
 b=bbRyokNQ9nAHoR51R3mwP27mPi+qCIyG9jKndpc6x6nWge8XOHoZkrOOTm+zN8wjUU
 BiSMuo7f3TCLpR/CeK3Jbwl53X7WvSz9b2dY5S0aLsXLBQUa5zFNwTEQ27+HxX3uJlf/
 X99xiX/z2Onibk3maqQU5+jLrhROrE8mgmx+/GODefGildJ0mYFL5mBofW2Mze4pL0p9
 I4Y4ZuNc76Ga8OdDgyXV1CFVK04lpi5FZT5Ny9kSPCDTnGGGua5ONXYj7ECgTzwZ6Yzy
 GVNzODbkgBN2F4Jaqg/bVmd//ifdGgFh2FLNhFIadIuP0XYS2yo90YSXIhzzwIMPQF4h
 /OCw==
X-Gm-Message-State: ABy/qLaXIKtR+N1lcmjBwEocdthcDbwT10asnwFBE/5AxJz5eUkCCiGS
 gSVbAiZgGF22hhc2B292LYqX/WN1FlaPfil2ypQ=
X-Google-Smtp-Source: APBJJlG+0WtfiM+r2sXZzO6HNFK4R91MA9ooy29hXDBdzlOr5q/1lWHuWptQzwph8RqHPwzWZYnIoYS2ozC9kDF6TM8=
X-Received: by 2002:a05:6358:428e:b0:135:5934:2bba with SMTP id
 s14-20020a056358428e00b0013559342bbamr2356344rwc.8.1689254505432; Thu, 13 Jul
 2023 06:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230713130338.31086-1-tzimmermann@suse.de>
 <20230713130338.31086-19-tzimmermann@suse.de>
In-Reply-To: <20230713130338.31086-19-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Jul 2023 15:21:34 +0200
Message-ID: <CANiq72mbLmMKph8aiz4apNF9n3MtVO-nhM9rEWYApZbSVAO9Qw@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] fbdev: Document that framebuffer_alloc() returns
 zero'ed data
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 3:03=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Most fbdev drivers depend on framebuffer_alloc() to initialize the
> allocated memory to 0. Document this guarantee.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>

Thanks for sending this! Maybe this would be best earlier in the
series, so that later patches make more sense (since they use the
guarantee), but it is not a big deal.

> + * aligned to sizeof(long). Both, the instance of struct fb_info and
> + * the driver private data, are cleared to zero.

I think both commas may be best omitted (but I am not a native speaker).

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
