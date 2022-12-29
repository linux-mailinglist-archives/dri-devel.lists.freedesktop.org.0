Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3F659205
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 22:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C08010E048;
	Thu, 29 Dec 2022 21:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADC510E048
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 21:11:01 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id o66so18063478oia.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ytpOR5QKWww4Z2Cv85ErUsWgiGHeMk8+Lk2wYOFtAtw=;
 b=xbFD/xyyvlgiwXtsMAxGjOb+jsXVwyc4HW4hneMivB6velLE6QyBbjxoUe8EUeuLlJ
 86104vtAl7L3T3sWLVR2Ak49fVJd/web83caPH64VqDtv90t9YEhfVMx//GTpSFNNqVF
 fLmtNqSSxqKdr06gi2BFgfHePwCu9VtkHnsJ1eOKIF7jfv1o6vXmislXFnuKy42DTxqu
 g2TyFNqdzuDvE1NlTLXrEjxO0BGZJ5Llk8jHSTMP54OcQeX9pImEc4R7cymQMtOqDTi/
 eKq9Yawt+2eU4AoXTezethraApb1YAYj6Pw4PPkeHCJBn41e8kLdgFwvyd9pcU+pWQBp
 Ag5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytpOR5QKWww4Z2Cv85ErUsWgiGHeMk8+Lk2wYOFtAtw=;
 b=dbbUHasueRqPKfJmG8Jy5pdvaz8ubPfIATdHicqfrNbF7PLCDCMt3ITZ58J1R1R0ZV
 WPH/uAV6C1qZmAp4HfcI6HI33+E94ZEzLTkI+Rv7NrFRXKHQPRCzPsBmPDlpHsBdGQE+
 EF7eZZwmRBI+V9r4dGHx0RNhLqgAq/h82eHhYgqzF++FcVktHV1HOGzsM4sKUfgcqHDs
 RKoMOjNo2w8YZ+Cl3c+W8nHlIAQwqpdcYICs1ZRMJxcSWfUNFQXcqcNmt6PZLNfgmcVH
 HgQV8oxN4exFmmX2RvZql27f3V/XQqIl5N7ivs3eetn0iReedcY1uIHsvyQaHz2AWxsY
 IgDw==
X-Gm-Message-State: AFqh2koewy29o5r2Yph6WVbv5em8rEtTzj08qA0S9uYWzp5z6q+4bJTv
 bokqXcnzJBA/6bHZZSpjOz/dqRxckUv09jO2QWAtGA==
X-Google-Smtp-Source: AMrXdXvmYVRVuctXWIBSVhNIR2w3Wbao95qnogH453MhyUTn81jk1LWCyFZbpRJUL5cnYYT094MnX3RBubSmKHxwWQM=
X-Received: by 2002:aca:3dd7:0:b0:35b:8358:aed4 with SMTP id
 k206-20020aca3dd7000000b0035b8358aed4mr1552718oia.291.1672348260189; Thu, 29
 Dec 2022 13:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20221215185211.1560736-1-macroalpha82@gmail.com>
 <20221215185211.1560736-2-macroalpha82@gmail.com>
In-Reply-To: <20221215185211.1560736-2-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Dec 2022 22:12:54 +0100
Message-ID: <CACRpkdYR1VOwHjUo-NKZgTuMnx5GUUtUjKYbAg0sZXy0064LNg@mail.gmail.com>
Subject: Re: [PATCH V6 1/4] drm: of: Add drm_of_get_dsi_bus helper function
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 7:52 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add helper function to find DSI host for devices where DSI panel is not
> a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> official Raspberry Pi touchscreen display).
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

The kernel test robot is complaining because the stub isn't compiling,
because of a copy-paste error (superfluous semicolon).

If you fix this up and resend I think we are ready with the patches!

Yours,
Linus Walleij
