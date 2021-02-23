Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65778322FFA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1146E84F;
	Tue, 23 Feb 2021 17:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2596E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:52:51 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hs11so35930719ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3e0aYpV14pI3DkzUD+0/oFSBOLMg1Ivs66TyYBGy8PE=;
 b=R3Phspw8uQcUxbMDTOtO5F2rckpTRhhIphLisE6O0MX3PtBtYtqAueqDtLJhVHc44M
 l3pVhsm/4PKhWy3HvyKvKaBDT7Zy3V7+q2kCMIrhtA+BWn1+puhx2Q/o3OCLv2tjzPvA
 idhPwfmFse7Njck8COyJRkVmJh7Z2vPuDGanTl62UPClAbEdqWNj1BSlNWS9fEJcj2KD
 +4AalXbZVpCUlG6WCf3ca0dz0C0pbSuxyxBHWL9ix5vEmWCo6AOBONbehossCIp/sjEZ
 ek9P43sK0i3pvyc2vqHyVuUzaDc15HfRKRqVXJW+FBuzW+Oo//KIFW2VSG9TzKNgk63H
 H0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3e0aYpV14pI3DkzUD+0/oFSBOLMg1Ivs66TyYBGy8PE=;
 b=O2N7jMD1fq0xSF6Bmyl2xkVHDTnWiApCNC93HJbY2TWZ0J+RemQjwIyHE226jI7hKm
 JKG3GDvJgNIDp8BY42GTz2g5/zTMKAig+NOTCZORtD/QV6+s0mKkrlUpCH1fP4jDZ5xc
 QsD4Pni2wrWJqXbl/9gFJ1s3YsKEBE+jb0aOofeQtui9DZGB3DFimKJw7b9xAZSsU+Yn
 SVV1Ts+LTPtngTMKrn4Q+VjqC1Fq/OeFVs2iXOuj39QQ9XdHGnCOs7NW1MPw0LSY60bO
 q817lESOV1ZBGTPnIFTKU90BeMgXMcRtZYa1YteC1MJUSiIe2nHYd/o+taMTEF9nYa/3
 fa5A==
X-Gm-Message-State: AOAM533EkRiWHT9olYQZUKMcKWRhsqMTcBkCouRAzacFCQyXujZuBbL9
 eYJjduTGYhiZf+BlXKLJ6Jnf7UMK39nmMKGqMO0=
X-Google-Smtp-Source: ABdhPJz3m6xwrsiPKRp3CKZo56Cxu8+plxzlCzPSXiLDRGmyLowTJcZU2JHcr2/W5eqTqavEWBRG+FPeezv8lw1mZ+0=
X-Received: by 2002:a17:906:72d7:: with SMTP id
 m23mr13634474ejl.430.1614102770111; 
 Tue, 23 Feb 2021 09:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
 <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
 <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
 <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
In-Reply-To: <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Tue, 23 Feb 2021 18:52:38 +0100
Message-ID: <CAEsyxyjQgAqfoVtHvq4z0okOh57+73nkh62cCixP96pW2LdV2w@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: Simon Ser <contact@emersion.fr>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 10:14 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, February 10th, 2021 at 10:04 PM, Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>
> > Ping!
>
> I now understand the problem better.
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> I'll push to drm-misc-next in a few days if no-one complains. Ping me
> again if I forget.

Hi Simon,

ping! :)

thanks,
-mario
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
