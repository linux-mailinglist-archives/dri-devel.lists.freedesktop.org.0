Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BC4E6AA2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 23:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4913A10E5FE;
	Thu, 24 Mar 2022 22:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4BA10E5FE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 22:27:28 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id y142so10936945ybe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 15:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuIx2EfuKCIfA6SZfk0m4A4xmn/XxCz2VsdNSnjLe6A=;
 b=xsJiIbP9s+ofFzxTice7QHI0MJEYU5dlCS54RBfUG2x7ytlH3jCMhH0UIoX6WJXXrd
 o0GggbfRlcbZST72KUa5AlCXV8HrBeeHixpeXd6kY4TZ6u22tAdJ1kW3lKMBxDJdskG0
 yBwPgNOpLmjY2C8ZdJizxMiSmJ6eKaeA2rRP8E8iIwSanfZlWykaUiwRwwjP63Zu5Ekb
 vuenltpeigXG/bTxVAVHn+Jp3QuhIqeC7Q0c9Mc1aJNnzTO+DxNqv5uJMgwJWT/q9dMF
 lk7gQA41OZzhQ3/2UlpnqF/XoP/ld9dJn6FtHWaSB7EN5C/i9v/EErCkdxCPv2atUsE2
 P7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuIx2EfuKCIfA6SZfk0m4A4xmn/XxCz2VsdNSnjLe6A=;
 b=u8xnfqkC6rde4Jrg/qFZm/eet+mTTx/QzR4mHCKBu0ku0jWSISflQmqdUB9P0UC5DZ
 zGyGMlhAy6TsoyxTi1KvY6Cl0lQmMZ+0Yhfj+y5oPtxhK5uk4kyQ0CujO1v0FDwyyqm6
 k3pYw5cKJ+zMxRhzbOrLeYwfs/krIgZQwQmTBgUik98rluq769dJ4fqVu4PKiC+80gNl
 kCNhBXOVIQT0tbeDhDYIbNQTXMQ1Xu5Aa0WEx5ihbkdZfNem1QFnI9ooTcR9iX8iMpM+
 MUg+mpEvKvceleX6b3MFy3JzzUzDXB+r+uTExZ4iMB5NUO1td3Edbx8boRdl55mylwhq
 rZIA==
X-Gm-Message-State: AOAM532HrR2tCWJy/+TEZh3lSnAeZG6uFItc//lqDHF4kCgphvUEDCxY
 NcTQ3go94QLpaInq1qWKbB20fix+G4jwzTs75rzAHryW2tc=
X-Google-Smtp-Source: ABdhPJyWfCUBXAFZEkA3vRwgVeXOfZfmF91xcRYtOHQUBNNwmYHrQxFGtrci1QUJV4Ny7aBxm0uVNqOrZbc1BWGS/8w=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr6907030ybi.492.1648160847410; Thu, 24
 Mar 2022 15:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-2-joel@jms.id.au>
In-Reply-To: <20220304000311.970267-2-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Mar 2022 23:27:16 +0100
Message-ID: <CACRpkdZodEjzm84zd-Xh6ZFsvu5eNGT_ErXHApaH3MwGB00pFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
To: Joel Stanley <joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 4, 2022 at 1:03 AM Joel Stanley <joel@jms.id.au> wrote:

> The example needs updating to match the to be added yaml bindings for
> the gfx node.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied.

Yours,
Linus Walleij
