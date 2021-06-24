Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93833B2D63
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DE16EA4E;
	Thu, 24 Jun 2021 11:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99976EA38;
 Thu, 24 Jun 2021 11:12:21 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id w21so13298785qkb.9;
 Thu, 24 Jun 2021 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k+PQoGzK5k0xQDN3o5YLT/0h7qzxEyjd8atmtNMJgng=;
 b=lo7q2YdddQntHGPiQgiTNrkv3B0MWAKS+lWfrtrffuz/uTC9N6WCqvRgkkkzCoEcS4
 u9NjYgeqxVt8IxV/JQgJ0PjTiaf6+lsRnzBdLdc4R2xo8munKtiv8eUvRTTEw9qLQ/PC
 0k6FyzU6PdWmSaXx4jIExLu10yqomT8+FayJdet8E+J3BbazfwCsZJk25YafzWz2uWX0
 O8CEhJrZgX2DBWJfvC558XLurUpWidqYbiHysN+H+fMGhMFCyAKP/jL5HotsIIrZiQsC
 wZJISsYMyOFErnH/HcqAbb87UVUIE74fd8oPL5Rj1NklQUKlWyl3IjQOGya6XqSJ3Xu0
 SJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k+PQoGzK5k0xQDN3o5YLT/0h7qzxEyjd8atmtNMJgng=;
 b=lFmOVN7QOMxfTvd2Ipi5TU0UcoqAoM0Rgj6r81D3g4uuivyEbUGeqqQc5RvdY5Orh+
 VzUzvv2gkkDf86nmmoRP9LGRLCfov9oT0BEhr1R+rsS9rlnm+t84HoZRBfzq7lcjlJFC
 5BWDVPp1VALDb6q9masa8pTBzqeD5gUHj/MFGiB0kFAT3W5cfG2QUsz7lCTUPQcCBT1+
 8EFmaIH02XcgJvViNjyqDF7baW+QdMy0DWjgazaO7eKCrYWB3oDJrl5P983E9AxR3B+n
 Q/Lvzu7uTGkyqNSGKkh5tvvddrlIA4DlmqlRDb47KHa6/ZE3YEwh4hJ6GAw3FrZsbj7u
 xBNw==
X-Gm-Message-State: AOAM531sMQxFbdEBvHXZJjzv1FYyOJBRg4DcsydVzZuJJ1fsGlbxu8n7
 KYbV1yvECRiYPA5SpO5E5g06JcKfPTJ5mYIt1qc=
X-Google-Smtp-Source: ABdhPJzeRC6j2Oc7sg5GmcmXtWjyJtGeIpThJ1VunlW4FboliOLUVPNIjJM3JxzT5BAqM0V8RsvDfnxJBGI7/SEcuwA=
X-Received: by 2002:a37:4388:: with SMTP id q130mr4959694qka.460.1624533140892; 
 Thu, 24 Jun 2021 04:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210624105337.296520-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210624105337.296520-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 24 Jun 2021 12:11:54 +0100
Message-ID: <CAM0jSHMJFgL0Ttv+MGPAD=62CTRK3-F4eVi=J8Q0K9FH5-GKrA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Reinstate the mmap ioctl for some platforms
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021 at 11:53, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Reinstate the mmap ioctl for all current integrated platforms.
> The intention was really to have it disabled for discrete graphics
> where we enforce a single mmap mode.
>
> Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
