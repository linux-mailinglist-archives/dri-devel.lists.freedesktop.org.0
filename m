Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE744D611
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28C76E8E4;
	Thu, 11 Nov 2021 11:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95F6E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:49:20 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id e136so14365047ybc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUxGT3dHAWAr5XFoTA3yomZ+rYzn2/oNkYlfv/AcPaI=;
 b=3vYv7cF57bwf5wfuw7qAGpsYBx/xlBXdhM9gN3K+z8GSVvyF5cVuEC5hKxAMo6QaLd
 R/i7a/ZG5frv9YqhWE4Jv4MbxvfOyFYq8hYUH7+w3Ppanrke0AXjdQVWBPNToqDLlwQh
 39ACNGSyqBR9bIZhrviVdCCIkYpI9K23jZxz3lZzcOILBuXwKYKnnc54W0BlnQkG68gY
 SZhFTNcKDs8Yu8bfJ/B5mZzDVTqObWo3ArwyU4cy2R2c6SC0DVOcGoKTBUjm+LCRPuxF
 NZozgu1ugLBs61cjH1vYTIkupZvw6g6gaTDOUnvCa6y06vpYuCzQso3InEmyl66v0qHA
 RL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUxGT3dHAWAr5XFoTA3yomZ+rYzn2/oNkYlfv/AcPaI=;
 b=wg3+cLRQc1wZRVD1xSAoY4Bz7UOIQHNenDs9lz+mx8AswuQm60hbrheVBcvHKUMF1g
 yhQ4YS8Dus9Meej4Vb5en5bek8BkEbLQRi3Eh+Us65FcqQV5n8cYbEqwCMLNhnhbkbaq
 H9GGgeULmMNZgPh0V/BiiInUKQCkgCHiRyT2gBgkx2uEiWYKRNF52n2J14WUmDbYBxXf
 VLRmLfhDK6bqWWcuFFoPY2NMiyE5n8EnGmO3OK/f4T2c8S1XKNALWde48hCUm03TepHu
 At7E1ItcbNPhAsBkNSCtT4+f0uBUaWnpeYa5r+tE2Hqv4u+jY8aSahnQiv9b/+jZJlEj
 B2zg==
X-Gm-Message-State: AOAM532RHLvFuttJHx7ZRljKHevndkJcrpuucFyjQqTp8kp8LqrpI/1D
 plKFOLd0sGGlbKCmsxiGC8gQ7ngWaP/FZSx6N6HQb67yNIM=
X-Google-Smtp-Source: ABdhPJzAV6irlfmFCu9BGIE+cMKN8YIQmdVtYpqh/FkIJ2xMRFJnfDPINfT2wP3NEjSFkpqSzAvUKuqSs5Gkuqw13Oo=
X-Received: by 2002:a25:bb52:: with SMTP id b18mr8010496ybk.506.1636631359561; 
 Thu, 11 Nov 2021 03:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20211111101049.269349-1-contact@emersion.fr>
In-Reply-To: <20211111101049.269349-1-contact@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Nov 2021 11:49:08 +0000
Message-ID: <CAPj87rMOXqHMHCX4Matz_LqCOvX8BdhqMx+4YfWH0_kiPPFDBw@mail.gmail.com>
Subject: Re: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Nov 2021 at 10:11, Simon Ser <contact@emersion.fr> wrote:
> User-space shouldn't look up the modifier array when the modifier
> flag is missing, but at the moment no docs make this clear (working
> on it). Right now the modifier array is pre-filled with zeroes, aka.
> LINEAR. Instead, pre-fill with INVALID to avoid footguns.
>
> This is a uAPI change, but OTOH any user-space which looks up the
> modifier array without checking the flag is broken already, so
> should be fine.

I don't know of any userspace which this would break.

Acked-by: Daniel Stone <daniels@collabora.com>
