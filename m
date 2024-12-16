Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE99F311E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817210E677;
	Mon, 16 Dec 2024 13:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="URZgcvOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06EB10E66D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 13:06:19 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4679eacf2c5so39326191cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 05:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1734354379; x=1734959179;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wfiIlfNISL7LxmEo4PkSBvNVf6zI03QBaUXQpOsHzBk=;
 b=URZgcvOwFkN/E8OuT9EfAKzDtlI3vc5X5isIaPcHj3o2PZjyT+nKvC7nTMG8wjTif1
 um4I0Mg1stxRHlqWgwZ2XS+RP8dFwhwS2nevpuBMTX/YuD/bRb1WMd9XqcvJcxin+fD/
 JJZlJmRm300Yr+9RBrPx9fNlt5UkMAtT1wiW7P2Lz+pHoztEBkQX01sI72jA8gHL5UWn
 mrczAwql10wMldUa6eRfW+CLpPj/VzgOKpmBkR/TMy5jEB9eHAzunkAwV0SS+xD2mHHS
 Y12HHF0VT0VyyWa12cMIPffRuwFhwwrN9NYaJV5zo5Hhus9u8O4SslihpTZtCmcTaqtn
 AKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734354379; x=1734959179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wfiIlfNISL7LxmEo4PkSBvNVf6zI03QBaUXQpOsHzBk=;
 b=bSedrxZPPozAZs6IbvSmC6YwKcdqz1eBRG/uKWN3oLijekodfgFHuTMivcxeeKu0q8
 ZdweiyjmbmIoRX6HU6ClTGidhMSd/gnUF6kiMfMPGZfAZdHQYtRyOV75tWyYGkCKGHAN
 U0spg8eIk7uIIW7isKhjoLtYfEXqjMfKT+Bs78+i/1SSQTtQjPUukbZIBmezWedXfSGH
 yF2j7MvAwcamq7vmsvVriYGOCJRFdXW7RbnIYgPgXkNca10dHv61b1aijBZfk+vVVDsf
 6arZJge1rhctCZmy/l1tLZpI7HqVh1K6xCyAVQQz2M/+WA1qee+g6mOmw1cRxLrnaTqc
 4pqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMOWfVKoE8GnhMgyYRnyZt/ibze9rzPs85Tco9Ae1JORcd5dPp4zlL7C5saOGyWb2u7fE5N+R379c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1uHUMW9k4W+qd5OkXqL6PI5Yx8d1j/d/6/RX9rwpK82+Beznl
 C28DLzZyvBrWrATmf5/jC02nSxnRgLRoR4J7RbpLY6mJbKw0n1/jsR+kRyi0mVMa4N0dL+qDkRv
 xvdNB4d435uh6qhYe3Yx5FmcYIDz2Ab+eJU1LWw==
X-Gm-Gg: ASbGnctjVgXZ5NRhHagSvD7gyiIHTRtAKueUwCaL6LeGnPbOiR3XAZABIkrCYo1XPLB
 4tlIRbgSYKoda09O/x+RAlF/iNV/RwlcmssBo
X-Google-Smtp-Source: AGHT+IE9Cnqk1RFA303SJ/sEM1uxY2IdUkOrI2lN1tMljvUXQswUAevS43+NhsG6LahpLoL3T6y4Oj0/rJaBAzD6y9Y=
X-Received: by 2002:a05:622a:454:b0:467:45b7:c498 with SMTP id
 d75a77b69052e-467a577b4c5mr198761341cf.20.1734354378718; Mon, 16 Dec 2024
 05:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20241214081719.3330518-1-andyshrk@163.com>
 <20241214081719.3330518-9-andyshrk@163.com>
In-Reply-To: <20241214081719.3330518-9-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 16 Dec 2024 13:06:07 +0000
Message-ID: <CAPj87rOjqZdyht2y8MK7gVyk_eqEzk1Sy0DcxFtQRuhrHQ_oxA@mail.gmail.com>
Subject: Re: [PATCH v6 08/16] drm/rockchip: vop2: Support 32x8 superblock afbc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
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

Hi Andy,

On Sat, 14 Dec 2024 at 08:18, Andy Yan <andyshrk@163.com> wrote:
> This is the only afbc format supported by the upcoming
> VOP for rk3576.
>
> Add support for it.

Out of interest, how was this tested? There is no 32x8 modifier in the
format list in format_modifiers_afbc[], so it seems like it shouldn't
be possible to get a 32x8 buffer on a plane at all.

You can use the drm_info utility from
https://gitlab.freedesktop.org/emersion/drm_info to validate that the
list of supported formats/modifiers for each plane matches your
expectation.

Cheers,
Daniel
