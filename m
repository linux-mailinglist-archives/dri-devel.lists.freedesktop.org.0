Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3B56746
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70E66E37F;
	Wed, 26 Jun 2019 10:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F387B6E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:58:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 205so1704894ljj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBnSNkpp1XS13FbQfXNNjthLGvaxRDnVZe4G6iUXAtU=;
 b=hqZ5IboL1CBoZbK0Recp630B2wAy78fFz0ulcfgLHVBE0n0p2bZwwiiukA3Q0QuND/
 l7Pc0TZYcRn3qsUDxoKcS0hQhZWxZz78u0UFhX4jMu65uKGFLJoYfa0I/O6Nueambzn7
 WczwgrVKGWSMWriXMaqzxV9PLOiXg52956Z9isoAUHPZmlU2nscfVsGY1AUDC1Ok2jG4
 ks2QxTOnrJe9UdP/aZxv7M78tVf0pVQ4DDvb0dTC+hPIsTNu7wXfPCMjco4nQKpwf3+j
 CFuVT9lu7qBlMjnAZgvcvtChEu7OglyLpDwwU9icCeBBsG1LM6N1zVmSkO3s5Q1AYClA
 jwSA==
X-Gm-Message-State: APjAAAWknihJGKVPckQdAQA2PtwjV7n0a4YByUu3toW8xbWEIjTyc5TS
 RsK85IYqoqVdGEXkGjmoq5aQt1lsAxZQrB17Su4=
X-Google-Smtp-Source: APXvYqxgoOFc17kD7+phBGYs9B/nP1o8ns/3dGiVnoxKpmtsSjv06Im4LhGmDTJDnuu5JdispKhyHp6RMeFmjrm7eYo=
X-Received: by 2002:a2e:8650:: with SMTP id i16mr2529260ljj.178.1561546729355; 
 Wed, 26 Jun 2019 03:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
 <1561544420-15572-2-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1561544420-15572-2-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Jun 2019 07:58:39 -0300
Message-ID: <CAOMZO5AKOgcRcyOyz71MyHY5VbGF2OCSdVfREwoNPrVk8rbVAA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add support for
 Raydium RM67191 panel
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vBnSNkpp1XS13FbQfXNNjthLGvaxRDnVZe4G6iUXAtU=;
 b=GaqgAuFEfvv3hBS0MaU6uk4aVJXr6o+2pG+er+XZSrXJmKaX1hSvGbNyogXUrcLE1F
 8uPyzO20cWhgn+6ogJWZGBUDgM/+hmdodS2rGfiJw+hYmHysEcAjmj6xP3Fee5JK8Emq
 loi84Jm74kjpfhji/XqX0xwnoCYYdgWSjGLQq8wzHtt2nSe0/KvZ6HHheCZpk8jL9kN5
 ePK310T6x5hfCUeiiB+CAwL2vR/E5Nd3/aRMdJydETRe0FPBo9xfRQRHMxYNWqCI5m8P
 pUZHLmizbJuiS5WGXpaGO86UWbuiqs23zbiILID8Ga3NGnYbkerHBO9gQa2OE40nmKrC
 g3Rw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNzoyMSBBTSBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hp
cmFzQG54cC5jb20+IHdyb3RlOgo+Cj4gQWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9y
IFJheWRpdW0gUk02NzE5MSBEU0kgcGFuZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hp
cmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KClJldmlld2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
