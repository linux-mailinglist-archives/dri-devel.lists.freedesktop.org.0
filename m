Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309ED3D1255
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CBA6E8A4;
	Wed, 21 Jul 2021 15:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06E56E8A4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:25:52 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id j1so3476873ljo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xckMM9Tu26bVm9gqyCNY1MGUGN3Qaszr+FzlAESNzMA=;
 b=eSU9MbeBtqh0ImoTj3LluGIqTdeLKtItr8n9VxYIrTolTXkxQpU/EFyYdljI9JaB70
 +9Bcz4BR52iSkML0lE67T3whTt8p+lFs1IfODgIuop5Ehh3RQ132UZ9swvMTWVIK1Jeq
 uCm+PMMIFxbF5vcpEWWMXhNw4uTOt6bMSbV0/oKrxTPQE7cqaVLt6232a5F9AkoDGLp2
 enaUopnKRZQojRwfUIn5aWoUDI4eK0jDzw4+k8qbde/TTI+QzOXQr9zK+TJcmm3XMr+9
 sNxS3JtwA8eGnysNB62jT8EQEuBS/R7+ftgm5VqnLf2N3Jf+OI+ny+ur3f6VQfGSTYDD
 C3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xckMM9Tu26bVm9gqyCNY1MGUGN3Qaszr+FzlAESNzMA=;
 b=iVCyXPkh9VgnpPFrAK3QEjexP5Ad0vsiiGUquGe92jjOngQl1M1GCkZR0gyOk+0zKa
 i5Rd0oC+UwAlaHIOXjde8lrgePpOmTVXSpz5LSwmfM0xmMSBO/sOZWi0Ws9LXBgbTTnt
 bP8q8xYQnM+xnPa+X2MlMik3dOAeZwWpfheRGJOjydWSNsUtYGYe0wbXF2JQtTARQ7gd
 K8Eycbi8GgpoLbYp7L/sQjXBG3q1wpzSgC+Y4mZ26LAMnliHyet+Qm63i4CItn0PgRhi
 qdZQjziGt464Y0lARLjI7z9AmepWZNqqrflhDa98hO3Yn3/7quwjuOZhPah3REDg+TXI
 vZMA==
X-Gm-Message-State: AOAM530g+S2ue9EwqnhmRjwjOgoLLTFw/i6Kv881ZGXK+cIpAUNAuxl3
 1eXkWx9sWLfkDv2sVgt6UqFSrCpWrCrLtANsM9jbsA==
X-Google-Smtp-Source: ABdhPJyQ4PqAi4leKhIckpDLCukfDHRUX6TresLWbGLPPfwtZyAM7ptNaW/ixp8Uyr4PKSeh4/Rki+iTlqBZamhbGks=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr31949079lji.200.1626881151364; 
 Wed, 21 Jul 2021 08:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210715113636.1139465-1-linus.walleij@linaro.org>
 <YPgxDc+ASOvozxB6@google.com>
In-Reply-To: <YPgxDc+ASOvozxB6@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 17:25:40 +0200
Message-ID: <CACRpkdadn6Jghc4jFOT9BP_c+C7ZsMJ-P4nmZBrk9Sg_aWazrA@mail.gmail.com>
Subject: Re: [PATCH v4] backlight: ktd253: Stabilize backlight
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, newbyte@disroot.org,
 Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:

> How loudly will you shout if I submit this for v5.15-rc1?

It's cool, the users (PostmarketOS) have the patch applied externally anyway.

Yours,
Linus Walleij
