Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3625F318D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 15:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE4510E1D1;
	Mon,  3 Oct 2022 13:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2FE10E1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 13:56:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c93so5862084edf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HZQujTgwJYtzeQnyb4wklLi7ptB9x6VrWByoPZI0Obk=;
 b=KkR08Z40KwIU2Qm5MVvX5vHCzH7HJCvRDZ35+E6gk3OkyDmfv2ezRdoP9YbVb9r4eM
 m4ypr9EmdKxZ7OJDwYZlunSfH8R4sUphEJ2Yw7JU5eu6iH5gpQQiomZNWi9ONI1I1jRy
 7BeYBta6qUUiWbKupfxYu2+R3xwBRHlaju7iEN//5n2Ofuh8f70OJK6rYrSnfvWWdfao
 Gld/dXdUgDXScGSj2M3aYnH/rQ7UanAXb2eEFPeI+ZNMQVUZWHfRcCh1N7N7tSvQz6RE
 bby42220k0iW4Alqb1efjbKiMNDA0ux274A4N8uyxepUDUnVd1WIImGk4PZ6GcUpJBHw
 2V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HZQujTgwJYtzeQnyb4wklLi7ptB9x6VrWByoPZI0Obk=;
 b=TCgGUEUVaRTlYjlhfRx8X1XajotlgW/3NHJHf7dC8FeGkYV+lNTlAmfmoXIEgoVUNO
 Ccg+eYtUya6rWYzVyKW8aRiFjGah4LDUvpo80LSDUvKS9hltfgRFrebzzZxRbC9BUC/f
 CZN0wz3JuMeWH5J4Bm0tt+nZ1EVQucKFyUkNuBZKoTDvoML3Dgg4s4E9SeTf7idUiCNb
 fxJuk652FtCoVe+xuSxzRBrFB/hUpjqO4gmdoQGq/JcNxZGphH12R3fz9pRlcXLdvY/4
 SwueYt0B7iw/WzhAekTXmQ/1lGHg3Uwt26YUR/fDkFgCDXMVpjEIB/73xrpeYP39/Sh/
 Hapg==
X-Gm-Message-State: ACrzQf1BdQa8VXWH3Pp5ozH59ICyTspCGINOhuH+VwLcQpunfpukRgzV
 6Evv4z2JZjpoL7M9cQsBOBnzM1Ia0sXCjkjnDOegqQ==
X-Google-Smtp-Source: AMsMyM6Z5/o/SGBH8NKp4roTlu7+AecIzzBrgDrFqz1zbyZHISOeVe1aNk/TGnJXz6DRGx+NJY3AnWLiq1KVYf30Gsk=
X-Received: by 2002:a50:eb8f:0:b0:458:482d:43de with SMTP id
 y15-20020a50eb8f000000b00458482d43demr17543175edr.205.1664805380829; Mon, 03
 Oct 2022 06:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142059.2294282-1-yangyingliang@huawei.com>
In-Reply-To: <20220926142059.2294282-1-yangyingliang@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 15:56:09 +0200
Message-ID: <CACRpkdZ0dYWk9UGV41aW+++s=4YmFk90MpXZ9-7Wb+k1t0PBzg@mail.gmail.com>
Subject: Re: [PATCH -next resend] backlight: ktd253: Switch to use
 dev_err_probe() helper
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, lee@kernel.org, daniel.thompson@linaro.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 4:14 PM Yang Yingliang <yangyingliang@huawei.com> wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
