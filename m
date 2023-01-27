Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD467F246
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 00:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83B10E12C;
	Fri, 27 Jan 2023 23:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23C010E12C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 23:34:22 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4a263c4ddbaso88136337b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+Jf9gPQcuONbyyIfKwZS6qgil0Po3FmNgoYTswamp8w=;
 b=P9OXzUtB95wUG2jX9Z/GfTHNtKe5uEivH0y6eVLqSptouwRjQNMoZRepuopUINopW8
 mVf4omYpp2U83cCLZw0pd7puqqRiJZq6U4zMLKkGxRwdL5yY5uaYJmlLPmTbuiyDwxFp
 Elwc8RQAqr+rITaTPU/ztSzDeP2w6PqPbq5AP0o1LDd/KTPJQz2YTmQZEyRZeYiFrY6r
 V2fPM4W0TOJKtowpppi18Tp3XBFoBB1W4RLSWbUF8c5jpNTS2ABLaI53eZMFXoB1i0Rg
 r597/98cxBytlFp81ciWaLuVMrt1bhHH6CUDzsvCo9lGwR4STCoXOTsha4HvGaGJZHUo
 dI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Jf9gPQcuONbyyIfKwZS6qgil0Po3FmNgoYTswamp8w=;
 b=E/VvUFrDMwwYb0wsXzlv0nhmdMOTxFNsrvhLSeCBM83rS2N1nPh35pL80aaWS76gdy
 U1CgsFGyZwbadXbHu6p71yVSuibYqeGhPtTF7+61rDO79Nh/BW3KO0XXdow6gypClHsn
 iQN/8PP4zDL2HKm0K4dQhORrm6Npqc7nYzyrwBOUttzaJRXjsE6F79WjNLgBd6Ea1zGj
 ZFLbgWX/sSsTczX8z3WggnnXp06oFM2U8Dj9CU+NW1DhON0vnoBV3jn/RIcCaCQMk/G/
 4QBqYOAKFuywju0eY80ITHJdu5C3Xo/u8HALUioIqdD/9jHA0r3rD9A73sUS0CCLZMnI
 wntw==
X-Gm-Message-State: AFqh2kr06WyDbdO4QzJVmcnnWs58e52rLyT7GRFLUlfPrGq8xe31CeaL
 l+Q5fOfgd41jnC8LaLsSeBl+a3Oge6DWzxXFXDk=
X-Google-Smtp-Source: AMrXdXtsbknBljmjrRQyST05iJH+o9YmK8+LgIHwaozpv6bESvAOyj+ktKaSvM4kTTDo5FMnsCj2U//zDVPPODSrVeM=
X-Received: by 2002:a81:4f81:0:b0:502:92ae:5123 with SMTP id
 d123-20020a814f81000000b0050292ae5123mr3030315ywb.99.1674862461547; Fri, 27
 Jan 2023 15:34:21 -0800 (PST)
MIME-Version: 1.0
From: lepton <ytht.net@gmail.com>
Date: Fri, 27 Jan 2023 15:34:10 -0800
Message-ID: <CALqoU4y37QuMj_QCpmq42G=-sK-fhkZhx63pD3WOjQrYyWS7Og@mail.gmail.com>
Subject: What happened to basic prime support of bochs driver?
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

It seems in the latest kernel, there is no PRIME support for bochs-drm
driver, I've found that you have an old CL which adds basic prime
support to it.

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1893205.html

Do you remember why it finally doesn't go through?

Thanks!
