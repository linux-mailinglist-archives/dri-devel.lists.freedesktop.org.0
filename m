Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E27B56C9F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 23:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5A10E038;
	Sun, 14 Sep 2025 21:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j+iiKSjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB03710E038
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 21:43:46 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so482089166b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 14:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757886225; x=1758491025; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4bzEyVhKd0svPYTkAhdSAxpzFEbsr24DOTFI4Wompuc=;
 b=j+iiKSjHq/eVCwElSsEvn+upwcO1z0Kc0UJpWJjNGyMyOUZhMPI4/h7FoWbewvavLO
 7CrrxDeJe8YpF6TyKZJDNEWNfxYfeKdZ1c4UYU9Ny3Huy77cKxNc0KiRPH+y94V4DDxe
 6jP6UxFdI4opx1tOVddZ8NGktTVWWE6XJmoVzAkn5nSe4bQqXeJDDEGTRgwdVccE+PWU
 DuI+lqNhTx9htxfaxDk6bFaYzL1gkNVZCPWVA6Atye54ku5h8QhJAXOGBHJyj90G97/Q
 +S2GemjwgN014LFELboTk5jOdLIoT1gUvCFwfQCCe4Xw9AlSdVUEbLPtpBkwsRCnRC/E
 uniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757886225; x=1758491025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4bzEyVhKd0svPYTkAhdSAxpzFEbsr24DOTFI4Wompuc=;
 b=dO5A6DkImHstG0BmzhRinkzZ/6EzEoSZ2ggfRdstsnQece3NRW9yCm3HGJC8EjCkvF
 m1HnI1YjDpyFB5+g+4XJuOGzHMj3TFqofjDCetXrpI81SS1xczbB8xhr0x71Oi30/Zpm
 SKXQ5HjQis4ggJ9xlBatRwijh4IL2+BVbfr9K5xuS68F0YJcWBKATaQBnR+zeJ1q7xMn
 cmT75MIutputiNd+UC2+Y4vzMkK47yb4rwHIcxkeB5iz2yk1WtoXr7YQIUGOr8gVD9QE
 jJW1yG7Ypamv+0RE0yxkclrIni3pH9jRfLQ2/WUAE3Kos4Pub4xkcZZakagBL3pfJIGJ
 jTyA==
X-Gm-Message-State: AOJu0YyYIJmmRk2Sw5fV4haFPwAJsW5etD/YoK9buniilix6UoHMSitI
 PukIDOUBrXM6luSgnw1kXSPqSRgylQvQ1w0Qi3daLR+BM85fusKnJMyn0CIR6CoXWQFOIWrOsoc
 6Do7joiZFn/sCM9alJT8QwOV3tj+79ZQ=
X-Gm-Gg: ASbGncsI0kePu/R+Gd4mMIkhtgkp6ipj/c+22u0glVn3UGUKlGmhal1uFh2bXI/Q2VS
 a0UN093vh63a3CUK0KKNdMNrTAcv0YVXldbzwwACB7cpEys6Xg+RXnThJkrMywjMg8zfJdhxpMN
 y/G8k+UAib37atYnH0YjtTFGO8YdW75gWktac80DPm6SqiCG1wNwtAfvDh5Hqe8NcT+C97y+e4g
 4Q/wg==
X-Google-Smtp-Source: AGHT+IHaQzvazG+7wQYHXUm8vuT9uqJYOagumqSY0+WsKEnTrCpK5aOOd9QFZkrZEQA3liAqVtxu8QU6wO9W8NYj9aM=
X-Received: by 2002:a17:907:3cd2:b0:b04:6338:c95a with SMTP id
 a640c23a62f3a-b07c3869398mr942915866b.45.1757886225107; Sun, 14 Sep 2025
 14:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
In-Reply-To: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Sep 2025 07:43:32 +1000
X-Gm-Features: AS18NWCgJ1uziGSdZlSGikWWE8M_wyiwsZU-YDThGgfsHnukCZ7Wi-43w5Lp7jI
Message-ID: <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
To: =?UTF-8?Q?Tiago_Martins_Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, simona@ffwll.ch
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

> Questions for Community
> =======================
>
> This issue raises several questions about DisplayID validation approach:
>
> 1. Is this strict validation intentional for all hardware? What are the
>    security or stability reasons for treating checksum errors as fatal?
>
> 2. Are minor checksum variations expected in real-world panels? Is this
>    type of manufacturing variation common?
>
> 3. How should the kernel handle hardware with minor EDID/DisplayID issues?
>    Are there existing mechanisms for such compatibility cases?
>
> 4. What would be the preferred approach for handling this type of
>    compatibility issue? Are there existing precedents or guidelines?
>
> 5. Are other users experiencing similar DisplayID validation failures?
>    Is this an isolated case or part of a broader pattern?

There is code already to ignore EDID checksum for CEA extension
blocks, look for EDID_BLOCK_CHECKSUM, it probably could be extended to
cover displayid blocks,

Otherwise I do wonder how common this is, and whether it should be
quirk per panel or just always do it.

Dave.
