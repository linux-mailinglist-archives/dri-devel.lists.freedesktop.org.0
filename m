Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABC288C7F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591EE6ED16;
	Fri,  9 Oct 2020 15:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C206ED16
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:23:58 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a15so10009044ljk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wUN+BhQr2Eta8Yd9jiPJ+JMdhJa3A/naA3AYrAu0GCA=;
 b=uTOMERuKyfEfKr7sFyF63jNZBb6M8QlVcKIhjborurE6SFwSl6uuOy9RtrZGNRX5LY
 ZCo2M08V4rukWMmVmV5bQ0k4RKoeZzT5xfVRxuY0E2Qh41YA1rNKEDIpwQ6ZhPsEg6lr
 CfUeIDj725I49Ik2tcaDFPFIN+9NWIpSiMZ9iWsXRLZMIZflSVNfjr8RsYUkPDbRxzWY
 btikMMt9M2+pksBGc0NqaJZRs3URxTmYSLmdIyzhUdHfK/badlq/I3OvW62FZFqK/a0j
 k+IqoQcxSsaIJdJPv9Skvz4TRz87lfqbR9W1+3PhXCYmMMET1LEjOFJxh/Ib7YNuuSGe
 MvMg==
X-Gm-Message-State: AOAM533j77uIbnL2wC85ZkP4k5PqGXCuhYVnZnUTbSB8kLW7V938KfaJ
 qiL9+MOf1Qo/iMMW1NXuWoIh01JRVSOgxw==
X-Google-Smtp-Source: ABdhPJznqqnrmKqQmPSNUWOVe4a0JtnNilvlhit9ppAT7dnt+/RjJEAlZozoPO6GkpuHDpklcUcsGQ==
X-Received: by 2002:a2e:9797:: with SMTP id y23mr380874lji.208.1602257036360; 
 Fri, 09 Oct 2020 08:23:56 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id t19sm1574831ljk.67.2020.10.09.08.23.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 08:23:55 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id c141so4468140lfg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:23:55 -0700 (PDT)
X-Received: by 2002:a19:e55:: with SMTP id 82mr4166824lfo.571.1602257035395;
 Fri, 09 Oct 2020 08:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
 <8e63e9092f0fa4690a3fe6d21edd613b1f9c6874.1601910923.git-series.maxime@cerno.tech>
In-Reply-To: <8e63e9092f0fa4690a3fe6d21edd613b1f9c6874.1601910923.git-series.maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 9 Oct 2020 23:23:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v656fPmEqQyuXgYf+9q+ybMWotgtbThTxKZosE7v_XCELw@mail.gmail.com>
Message-ID: <CAGb2v656fPmEqQyuXgYf+9q+ybMWotgtbThTxKZosE7v_XCELw@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 4/6] drm/sun4i: tcon: Support the LVDS Dual-Link
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 11:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The A20 and other SoC with two TCONs (A31, R40, etc.) can use its second
> TCON as the secondary LVDS link in a dual-link setup, with the TCON0 being
> the main link. Extend a bit the parsing code to leverage the DRM dual-link
> code, register only the LVDS output on the primary TCON, and add the needed
> bits to setup the TCON properly.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

But I suppose you might need to change the DT property name.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
