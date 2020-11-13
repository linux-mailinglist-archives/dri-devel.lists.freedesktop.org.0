Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700622B15C5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 07:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5856E3C6;
	Fri, 13 Nov 2020 06:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FA26E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 06:11:11 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id oq3so11645157ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 22:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DptdZzMyxdE05cUSx10TqnOAYaGhDOro7iEYn4TKuBE=;
 b=aZDMzhtpTjY/rySHTZUR/bWYegnTX3To2m/e5aKWucOPNxNZZ2Q2wFo30bS7bR0Rrg
 EOHqsgPZELKsFfNG57v0IpcXD2Zwqlk0iejeMGPzapyCLYApzk5eJs827zF9fM0rnWGC
 UTjQ9YRq5Eo/0Ujp2y1FyMx5lmx8WpJW6pC1+W8pmOd+hmjwGFuuvreI5Dzn3GS6hrkF
 V6mi2nYEIVMuANoTy5CwuKr0F9GLe/EbxiG2pB5mTjHpnrtXT0/IQkvlFINODI9pmMfi
 jZAA/wOQVr9vV+88FrEblnpNb3m/xrgbaseq3ABmiCNi8wkRaeFlmmezUSDgLLjWFaju
 pHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DptdZzMyxdE05cUSx10TqnOAYaGhDOro7iEYn4TKuBE=;
 b=hgVB/JVDRE76vMraL4UIQrspdNzmc0yIzpo/1Rm146IKN/H7Ojc+E6JUSNZp7wieY6
 cAN7D0OzJSU6TCvmFy0nR0V2Ar9VK535X7BDsoVSZxMYE9MM2c3vUqwoFMB8DNDCjEZ9
 77PNyZS9c2vZj3dDuiOZ51eK/U5iXQi5wY9F/9j3djCPWUDZRRw7sqR7i6pdDrmSDYep
 cVTIerzQRWjCAsQflXxjv4tPL7H8MAX2ICdywEjJ9xpQHlh4gcJYwn08ogbOSS3wtZJ4
 5SuiwQf6ZpflOGsTp0wjWfT4j7bRHv5SaO87eA4jxjMZ4uE2akldjL6Y0VpOlwNpFM0l
 koRA==
X-Gm-Message-State: AOAM532S2ymbnRQSD0udDsCsj6h+tD8RyLOf0s4B+Ut5QE3Dh8NDjrAG
 2L1OsXU33I08vF+1staagrzJbIL8zP0/8gmRDSw=
X-Google-Smtp-Source: ABdhPJzk7c4GmHRw4i3mpm/VpIrMuaYxRvp9jfP+t15kRTZZzDmadnPQ0+ARk9+P8Apx1cvqJUMslhC3cbLDz9YXL1M=
X-Received: by 2002:a17:906:4145:: with SMTP id
 l5mr469026ejk.317.1605247870110; 
 Thu, 12 Nov 2020 22:11:10 -0800 (PST)
MIME-Version: 1.0
References: <CACAvsv5D9p78MNN0OxVeRZxN8LDqcadJEGUEFCgWJQ6+_rjPuw@mail.gmail.com>
In-Reply-To: <CACAvsv5D9p78MNN0OxVeRZxN8LDqcadJEGUEFCgWJQ6+_rjPuw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Nov 2020 16:10:58 +1000
Message-ID: <CAPM=9tw0+w20aXTS76cQSBXFSzbzNHxS_nKg266pmP1subBGag@mail.gmail.com>
Subject: Re: [PULL] nouveau-fixes 5.10
To: Ben Skeggs <skeggsb@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Nov 2020 at 14:12, Ben Skeggs <skeggsb@gmail.com> wrote:
>
> The following changes since commit 512bce50a41c528fa15c4c014293e7bebf018658:
>
>   Merge v5.10-rc3 into drm-next (2020-11-10 14:36:36 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/skeggsb/linux linux-5.10
>
> for you to fetch changes up to f67e5ecab785631cf7f776533432ba5aba06615a:
>
>   drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50
> (2020-11-12 14:09:45 +1000)

Are these fixes for next or for fixes, since they are on a next base,
I didn't want to assume anything, if they are for v5.10 please base
them on v5.10-rc3 directly.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
