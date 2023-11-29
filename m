Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E617FD9AE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5710E57B;
	Wed, 29 Nov 2023 14:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D0310E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:38:47 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-da077db5145so6266666276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701268727; x=1701873527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VitFHUDO7lpbwwEpDiSX9K6mtclW0i9+NRl7WDJQuXM=;
 b=CflZYYwa/wgQzhIHGXI3+TlFWzvvv2UqRl5tQyD/pXr4DCAOfLPN+kbjt095k0hfkV
 gGBudIbMMmUDJzW/ZA9D+9CWPhOlSgl4sHbMQOOPGNPQ0oDpcPazXcXk+fdsARL39CWd
 lr1CZeYEXJi9ynPs7ZZPSNbgmTebJPNsxvhjRH3XA/wxO+NME6bNrDOntvfblTxWs3V5
 rroqxwQ1WPqtDRA4QhkxO6D6IGz4TKxRvHreSievDidzePspBjXvNAk3QjDFqvHOWGxm
 y6mAQRfwGF/0YCqXukmpYbwKI8V7kxDAAQoFUNn5mQQQ7/HJti9F0LH7y7bTXWAUntQG
 /Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701268727; x=1701873527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VitFHUDO7lpbwwEpDiSX9K6mtclW0i9+NRl7WDJQuXM=;
 b=G0wDn5CAs/YR+HWV824zOE23p4RfCBCwpjaRu89/pMzxpBkY5t35Oc8Atl+32S0sOJ
 BXytxvoRkX/ZTWRKPz+O/CJ/71rEGfO854aHZbafaaVBs2ayPu1cl22WwsAdwKVX2mSn
 XB/fWL/FK4Yfj6/5hKDX5OvFY6P7jPc49ZBsnzDEEh8FNwZfyEJT6Gh2wUofvYv8E7Pf
 otBpHe8jqo2UpeaQ4MIAM4MSPjQbsVJEzgjTPHwK6HNRs0+aVJBaFlFfJcP93tXPBAqL
 4lw2VxuSkuJgIExyvOVtKKTXj4/CHz10PYN+EC8LdIN6CW9V2e/+OA8964C63jIm4Idj
 /RFQ==
X-Gm-Message-State: AOJu0YzQvs0MmBXaWLwaXXnZA7C3WiK9eZHQzWh9855wQpsnmiXvrpII
 ArRVzbfeShFYoJIZhnU2Ba0EMASUO1Z5OsV/YjLkOg==
X-Google-Smtp-Source: AGHT+IFn9m5/2pvXGrsuZL1JkkJ7wo07TKiyWdKmwMqkGOMa7/9+521wEHRtk/MN9ZsmYdiUXcwuztNOZ8LxPBTuDFQ=
X-Received: by 2002:a25:fb0b:0:b0:d86:5a8d:6e34 with SMTP id
 j11-20020a25fb0b000000b00d865a8d6e34mr17592236ybe.29.1701268726832; Wed, 29
 Nov 2023 06:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
 <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
 <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
In-Reply-To: <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 15:38:35 +0100
Message-ID: <CACRpkdb1DmH2NJ2nBRtGaB+9Tmbn1tzXafDSpZVxjCFnexz=3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
To: Maxime Ripard <mripard@kernel.org>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, andrzej.hajda@intel.com, tzimmermann@suse.de,
 rafael@kernel.org, Liu Ying <victor.liu@nxp.com>, gregkh@linuxfoundation.org,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 1:32=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
[Me]
> > It is a bigger evil to leave the tree broken than to enforce formal pro=
cess,
> > and it is pretty self-evident. If any of them get annoyed about it we c=
an
> > revert the patch, or both.
>
> Yeah, I definitely understand why you did it, but I don't think it's
> something we would encourage in drm-misc.

Hm OK I guess, it can be debated but no point in debating it either.

> We've discussed it with Sima yesterday, and I think we would even need
> the extra check in dim to make sure that a committer shouldn't do that
> without dim complaining.
(...)
> Sima played a bit with it, and it should be doable to get something
> fairly reliable if you use get_maintainers.pl to retrieve the git tree
> (through scripts/get_maintainer.pl --no-email --no-l --scm) and figuring
> out if only drm.git, drm-intel.git or drm-misc.git is involved.
>
> If it isn't, then we should check that there's the ack of one of the
> maintainers.

So check for any code that is hitting namespaces outside drivers/gpu/*
Documentation/gpu/* or include/[uapi/]drm/* that it is ACKed by the respect=
ive
maintainer for that area of the kernel?

> Could you write a patch to do so?

Patch dim? Well my bash skills are a bit so-so. But I guess I could
learn it. But did you say there is already a prototype?

Yours,
Linus Walleij
