Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA813792A4
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 17:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3EA6E4A7;
	Mon, 10 May 2021 15:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056E76E4A7;
 Mon, 10 May 2021 15:26:20 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id b25so10886096oic.0;
 Mon, 10 May 2021 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKb19RbJtddT9ixiaDJEd8lwiTEBJP0932RguN39+5w=;
 b=DN5VlvIzv2g9pN3rZ3NKCDlekbYySLhe/345TmwLE6f4Ue27NTu9IBhPFBLr9IaIdp
 z4Zv7LzGdz4jlFYWm6fMGoZ7E8Bp7Q3gbA4NwITHmOGmb7bVjIZUqOoW/h4sy9iC3WJ6
 z4zxnILaTCBvcRn04n77bWpzO+pJ5J4xvbALUbLoo25WVLrHdyXePrAUj/P2A4bQ1Nzj
 nfzvdu2lN5xCZZmVkEk2fCzh8oWxvjprHyhXUtYiso/TnUJ3t9USHJHvbzc3Q9goIYH1
 lkfU6sVWEMBZWptG8R/usnz+NxOg3E5m9FubEpR09knIBMHcF7pUvZBANGlZPst+vOCo
 /yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKb19RbJtddT9ixiaDJEd8lwiTEBJP0932RguN39+5w=;
 b=BiBxYixmH9Q1Fnta6Q4GDr0HVv0SSA2RJW/ZN1WvXUI+VGipqJ4KYmekFIjZPjPg7r
 K1PLcL/UemNHNzqapCqbJESLa021viDeowH6XsH/KaDUovoqtmIB8NY2w5AQNIKhjIb6
 PEFkksrwWcxtA9mY58POHTfUI3OFsY0JN4+NsMisVHNQAJMt3UM75qi8zkDJdJRI+YsK
 szis/vR3QQ+n3jlOaCm9L/HzjCn45pNbVqPRPY4f43wgHXMpspoHNJhdzMvO/r/sV3hK
 E8+KJ4B3OJfBE/VJmsuL9Lu3yJ0AvSREdh7ckFNqw5NQvhSXAWpCzLP/d50Mlq7+/k6D
 F8Bg==
X-Gm-Message-State: AOAM533sxxRYAY3wP5j0jM2j+xjshXNvb1/ssMFltt6ocP39BLizwgVk
 qUV13xtkSLspn6DtOg0VykRBZqGp0IKe6TfJOXo=
X-Google-Smtp-Source: ABdhPJzCSRFYLLVUuC5sQQX2WXHyV1S5ZaJ9vjN9QEEuHySuJRNPNM6lWwqjm5FEw2QcIvsAelWNDKhsqEnDR1wI5ls=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr24901330oif.5.1620660379373; 
 Mon, 10 May 2021 08:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-3-robdclark@gmail.com>
 <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
In-Reply-To: <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 11:26:08 -0400
Message-ID: <CADnq5_OYRP5EE3GOdY6HyTcJuLxXw5V7X9fTTw+QMrKs6cjcvw@mail.gmail.com>
Subject: Re: Tested
To: houdek.ryan@fex-emu.org
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
Cc: robdclark@chromium.org, freedreno <freedreno@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 yaohongbo@huawei.com, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 swboyd@chromium.org, Qinglang Miao <miaoqinglang@huawei.com>,
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, what patch are you referring to?

Alex

On Mon, May 10, 2021 at 4:04 AM <houdek.ryan@fex-emu.org> wrote:
>
> I have tested this on my end and it resolves the 120hz problem.
>
> Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>
