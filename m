Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB58C1105
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533AF10EA16;
	Thu,  9 May 2024 14:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cL4gUzED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9410EA16
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:12:09 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-439b1c72676so388221cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715263928; x=1715868728;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKYgk1K/0ztKVNzQLQfhwN4cnvKJTriQx0hD8c+rjW8=;
 b=cL4gUzEDuXDJJgZErr8fqJNxkqDyaUKNr9+4uvqn+SFyAB/GGCEUcCbPH21ILwdkiR
 Qx44tOHOb8Lj/YNLfgoUKirr9XVFfwF0Zb8BF23vkcF/En34NWmW82anMKH+hig3Dpa0
 pPHMcxka8goGs0E0I7G27zBzogrfwkAB/gp+0W32BY6SSRXi1apSQmTfRxJtiifnEuPW
 rBTSJr86S1XIwdQdTJfgzpPu8qPoutLVlTRSN+rZFdLia2mAOHgXKDRPLxyxEK1vNF1L
 8fOQ206T89XZZwmr6ySaA2StLZjKop7dbgfXQZHDvE63P0kbrdYoI3043/Zu/Hx1Bh6x
 COZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263928; x=1715868728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lKYgk1K/0ztKVNzQLQfhwN4cnvKJTriQx0hD8c+rjW8=;
 b=MA14W6ZRCL+AcahIoyTeVJr5KPkOLV3GqH6Khi27ZaJ5LCMWLi8AQjnIPsbMOHScz/
 Ie/2en03EI5qD/nvXGnbWnTARyGgcA6Fx2gEJ4Cuz5iTa0Nfmfdjw2OahkbAQsrDNZo5
 lyTYBPLUnl0kNqFQtnOFqtoHE7xz9JWxorv6Mj5fF++ULfDQs3ih7KOBHX1A14bEYVo7
 Ij6b3JuQLA9bcFLZumFhK7O2rZiFUYl8nJ579Js1y2HtNICZT/r778j+vaJDugrKhMXL
 BXsy7wXfswmEtCLCOdRBWFg/puwqmtwNeNSA2V1rR5/eYC2Rg17eRsEf6ScUxj7jVoJj
 aJ3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6rAPtiRnq9zoE7TLWkbS6EfetW4MhIvDuNiV9u0GFf/3EkrI6XMwFb53o12uX9cph/GEbWfqE9Kb0zHExmFIFBG66mUrR4AJX/9IUUV51
X-Gm-Message-State: AOJu0Yy3JuYJs5nWU/JgHrT4XHJafOxen71PsuExtR1Vl4FKW8u+1bZx
 zeNeTFNGKB0U8JAfOwJ2TrKCkiiN9D4OH25odFTSJQyvxB8aGMZQ5rneZFdzymep+AoJGl3F+mM
 LraQM/vV7HYbRcCXZVPX1uflKR7DNLM+zuNOo
X-Google-Smtp-Source: AGHT+IFvuSQcG22Ig7DeauYZsrwsp+uIqjXGQRfJ1VPnduyNbUdPF39bvdjed/XkNswMRuYX8cDshnhVQDZ7qNQZMCY=
X-Received: by 2002:a05:622a:580b:b0:43a:b977:d611 with SMTP id
 d75a77b69052e-43def960973mr4096621cf.24.1715263928208; Thu, 09 May 2024
 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240509083453.14073-1-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240509083453.14073-1-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 9 May 2024 07:11:52 -0700
Message-ID: <CAD=FV=VfBXjgYTzNEj+szHX9-wGig9XUFVt+CkG6mXzHwZjduw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add starry bindings and driver
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 9, 2024 at 1:35=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Add bindings and driver for starry.
> ---
> Modifications between V1 and V2:
> Kconfig and Makefile configurations added for starry driver
>
> ---
>
> Zhaoxiong Lv (2):
>   dt-bindings: display: panel: Add Starry-er88577 support
>   drm/panel: starry: add new panel driver
>
>  .../display/panel/starry,er88577.yaml         |  59 +++
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-starry-er88577.c  | 444 ++++++++++++++++++
>  4 files changed, 513 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/starr=
y,er88577.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-starry-er88577.c

I don't think anyone is going to look at this series since it's not
taking into account previous feedback. Please talk to Cong Yang (CCed)
who is also working at Huaquin and is also sending MIPI panel patches.
Hopefully he should be able to pre-review your patches with you so
that you can learn from what he learned. If for some reason you are
unable to work with Cong Yang then let me know and we can figure out
the next steps here.

-Doug
