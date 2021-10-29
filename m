Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A0A43F3F1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 02:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E3A89F41;
	Fri, 29 Oct 2021 00:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C936F89F41
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 00:32:30 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v7so19969055ybq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 17:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4rK7ePU1L8BO2CXlI///OizKJOHVxbXh2HYaDi5fhnE=;
 b=3Kg0JHw/gVUtOe1e46PFedKHqB/LFaC8cS1IsLcmSxfhlykJ96GUmxhxuDwTQ6ikZC
 5Tcr3r1HZDYeGuEScywkgZaE1A6YzJWgoEYt0opg7AvMwnQ6IcTNQTX4i0HgDtoIJeNn
 1+HEUjuu32/nTy2Voj1eMX9obmPX2g6OSQzO30HE/eDGltHGfq3dvn6Cn0cOBxU+GSOR
 Uwl0gofuIgQplb6XYz5v0gTrkK/J//p5vc7fsAhGRSdErx5MJZjduozzC13tYfs1rAgU
 B1h8n2hF4eOio4kB4ULfeIFeTfQtz+cPxrzrLWptTdMAvAJKMpuvuRChiIaTFtHVApY1
 xsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4rK7ePU1L8BO2CXlI///OizKJOHVxbXh2HYaDi5fhnE=;
 b=fC6WcMYicHIGwm2gKMre7f5QnAd7fIsvJJlR/BqLESwMk09aqoMYWnylz8B3SgXVwV
 FrYrkcg6G9fFrzQwGUaI0gZRxTt71nrJBmkJN43CE/oUgX/Q7faLHgU3RpwMDGp4d3LS
 gmg7BaHyGgS2LNkESTR/OYMAjSUPOddgR1VhCUja9ziKnrrcq3Je1iaaVQk4uOfsgaf+
 PVb7iGVgskEbc1W6AUPgqspAPFNdKTIUAbkXgZIDY6xtcovk8U+YAgUkcVc1wTNNsl2F
 aX6hV57/PopSPc1QBsHH7glIADI5oZW8owAAPqDAgj3URetVX1MFeGDbLCix1HymqnXS
 xxaA==
X-Gm-Message-State: AOAM532xOeEpPvgGyyExqHIVBQ0HofaEkbSDb2ZsqgghikVFmTzX7Fkl
 7UWxZxCrFC/VyPps0u+z/4Nha78dzDJvn2axHviaJg==
X-Google-Smtp-Source: ABdhPJxxNmD9KbPNT7tb4+hn5QP6aGL9UVcW4q9klXnAKEepY1canGkwLCL6taqj7A7KCYYcw6E0yRvgBx2DtjzM0Ho=
X-Received: by 2002:a25:bb52:: with SMTP id b18mr8697712ybk.506.1635467549746; 
 Thu, 28 Oct 2021 17:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211028213446.955338-1-olvaffe@gmail.com>
In-Reply-To: <20211028213446.955338-1-olvaffe@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Oct 2021 01:32:18 +0100
Message-ID: <CAPj87rNJFNK6nrM5LkMQ2E_FdQFtu1eCveXwgdPBqNA5R+U6Lw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add reviewers for virtio-gpu
To: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, 
 Gurchetan Singh <gurchetansingh@chromium.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Oct 2021 at 22:35, Chia-I Wu <olvaffe@gmail.com> wrote:
> Add Gurchetan Singh and me as reviewers for virtio-gpu.

Acked-by: Daniel Stone <daniels@collabora.com>
