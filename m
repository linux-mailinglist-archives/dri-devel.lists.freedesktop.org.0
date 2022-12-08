Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092206473A8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 16:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2697A10E4B8;
	Thu,  8 Dec 2022 15:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0156F10E4C0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 15:56:50 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id b16so2205842yba.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nNbwJFAlGhXnPKmcAOIi55uZWbH1qgYvnKQXwakNIPw=;
 b=OtKZsJHp4f/6i/PNOp+PEAVAYiTIdnw5cPT1i0lT8HXk+FreBS0X0s09lUuWX5UNA0
 jxfgch+LuVeS9wqwZokx5t49v24qWFC3SPeJdYm5pmmA8O6O02eKIFzAUDAMmJ3MVxu7
 1emz23Zy66CrUgoPxR7X7/22m0FCRIF6mOd/9QnZpiJw03urdpnmJDXm6zR5VAyNNGM3
 rsSuV5D1JVYsGzZmpcdJl88xbeXK/rJ0obzYaTKU7bEov9dtXUeRFoT15ydvIgMW5ls/
 oONvlTIHLrELe6oRbvd2w/+k64l5Y4VFhpUY6xKnjNjONAmn7RrqIiia90dZDrmN7DEF
 2wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nNbwJFAlGhXnPKmcAOIi55uZWbH1qgYvnKQXwakNIPw=;
 b=We562QBCEuEX4otTKlkkhFuSzYB4nRuQXeuBIbt7ub3hjN6yRMUVEIzzfE07ArQ4/T
 lJGVygFzBM7uGqJ694UYYEsJHpRIfJvj3mDXogsMHy9aDsdOpVL2Av0tf3bxx/9aQqtB
 Ae72qdQjxCIQEqpbYqkgGvde2oTw3J5tB8wzzHbG5X7e3mh+sK/SvmLXCYDSDuH4yN1y
 Vzm3EJq9AKmwp1roDRzPAYVjBxTPiZLURlSwxBy3j9p0S9T9skPpzw7oxXjaaDe+qu4h
 9qUiYk2PhmpYyfPnaTbPDz6n5KX4aH62r5HCfU5ruoVtqI3lXz+mhk1zBHeAB/UizznD
 iUBQ==
X-Gm-Message-State: ANoB5pnuCpbbTEgFMhtKppN3ziJNWGnrdWNg+UG/bGoJ4XIwbQL/Rb6R
 HPZKfdH0N6IwfZSNrHUo3tlaN3gXVYwEs7NOSKY=
X-Google-Smtp-Source: AA0mqf4t+fSdbhBYMFfnQclz52AAwfcD7MYbIW0Z7LhUtgOT6RcKd/q4AIaKxk8cB+6SC3Hf2NTuTwHMJB1QBthNf58=
X-Received: by 2002:a25:e648:0:b0:6f2:bad:1be7 with SMTP id
 d69-20020a25e648000000b006f20bad1be7mr61909972ybh.84.1670515010175; Thu, 08
 Dec 2022 07:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20221203093700.34608-1-cai.huoqing@linux.dev>
In-Reply-To: <20221203093700.34608-1-cai.huoqing@linux.dev>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 8 Dec 2022 15:56:38 +0000
Message-ID: <CACvgo53VRfHFjffgrr=sNL4Xfvy1m+usymbeP=xx559yzTXymg@mail.gmail.com>
Subject: Re: [PATCH linux-next v2 00/10] drm: Remove some obsolete
 drivers(tdfx, mga, i810, savage, r128, sis, via)
To: Cai Huoqing <cai.huoqing@linux.dev>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 tzimmermann@suse.de, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 3 Dec 2022 at 09:45, Cai Huoqing <cai.huoqing@linux.dev> wrote:
>
> Commit 399516ab0fee ("MAINTAINERS: Add a bunch of legacy (UMS) DRM drivers")
> marked these drivers obsolete 7 years ago.

As the author of said patch - calling them obsolete was a bad decision
on my part.
They are effectively orphan with no maintainer and no other driver(s)
that provide the same, or equivalent functionality.

As a DRM newcomer I would recommend sticking to smaller and more
tangible tasks. The TODO list has plenty of varying complexity.

[1] https://www.kernel.org/doc/html/latest/gpu/todo.html
