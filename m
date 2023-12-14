Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540AF8129E4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 09:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D10F10E8F6;
	Thu, 14 Dec 2023 08:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9003B10E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:00:53 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dbcb4747d84so2883986276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 00:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702540852; x=1703145652; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hxvoxrsdJSPbjJs7z8cGp1BRDLR051KEfgQFlaNlMoA=;
 b=qyNDessnf/xN7kF0JV/5plEloLtwXSpHpzJtWIUfChe+fkaANdep13+Bv/u8nLH6Y/
 9eA75IEv7Dp+7QHg3nVqSACmiN6fXc9iO9W0Ap0UtNtN0c+LXN7PMAbAcsJuuLUMYoin
 kRfstop9rIo5b2gyHbLVLBCe0PwnYX9MPJovD5f6o9E430Cp8tZP+GnXtfDhcXXEacH0
 LWAmzou1dUmay+bYngpwZh4HYixvRRPq85vihPKaFH6OC7kUDLmmQUTV+VDFzv4MAguv
 J2OtYBtAXpG7SOFklBIoMZGCoT7luiVaIZkAuv4XjHB/HmOnoBVQOJn7++yTDF+RJ3xX
 ot2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702540852; x=1703145652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxvoxrsdJSPbjJs7z8cGp1BRDLR051KEfgQFlaNlMoA=;
 b=VOTPKy7ojQQFvMjHjT+WPYI2zLMqQPE/dEiyPeQ8N28HjIlwBARwMY5HtiloqrqpYG
 /pMZ0BkVkVVPUTMr9nwUOhxpW00G31y+1tARXuMYd/u2GHMET54zrHArySbgX0+GTPxa
 avgnPxyoKBFf9MX+aaEmKEBcRMPYoFN99HJqJ6iK18g7s2ByE3gxdPsD8Hgv/hqNhDJy
 x5R08wQDC+MzCrwSkRTlejVeUhW27kjrxpxnitL8Qrpu2RQ19lFmd/ULGcne/aS5D6x4
 2LUU8dJmfoC7HZER4jbNYXye/LKIyqQnMntd7WCmBgLI4bFUDvlmAZnzT3KL/AZmcIF4
 oryQ==
X-Gm-Message-State: AOJu0Yx2rkQdh6XS8a3yV+T65ZFJwPaRNpa66j7v5stKuck3YOk+Ou5D
 VBZfqUMxc/ZHG99DxvWXQGnGLqS+E/TDIndgAsUaIw==
X-Google-Smtp-Source: AGHT+IEnRsZCGxPZoaC9TlxZCpwZRrhdgilZbD3aUw2tigkOCiLHSxoK/nVPHCaSKjzElObYgpZcrTxqROsqkKsWfYo=
X-Received: by 2002:a25:e20b:0:b0:db7:dacf:6ff7 with SMTP id
 h11-20020a25e20b000000b00db7dacf6ff7mr6738896ybe.127.1702540852537; Thu, 14
 Dec 2023 00:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20231212160448.883358-1-vignesh.raman@collabora.com>
In-Reply-To: <20231212160448.883358-1-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 10:00:41 +0200
Message-ID: <CAA8EJpro5Hb0yRaxPWzBQBikKjw9JnNVkUuPFvWeXjegzCuxHw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: uprev mesa version: fix kdl commit fetch
To: Vignesh Raman <vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, freedreno@lists.freedesktop.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 18:04, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> build-kdl.sh was doing a `clone --depth 1` of the default branch,
> then checking out a commit that might not be the latest of that
> branch, resulting in container build error.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5efa4d56 fixes
> kdl commit fetch issue. Uprev mesa in drm-ci to fix this.
>
> This commit also updates the kernel tag and adds .never-post-merge-rules
> due to the mesa uprev.
>
> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
