Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F525FC10
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA836E47B;
	Mon,  7 Sep 2020 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD9C6E149
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:11:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b19so14992812lji.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4x3b3Gg53/QoChOehhMF0HfM7H2Z3AdxYrpI7W1n9qE=;
 b=Md1mHM1kyVpP0mk0VYqAYn4fVEwETn8IrrU57eD9JgwPSCvRGvuR4z7iXsKq/ff7Z9
 BfxXgAhw2qtM6coqRxOf3hLvgManA7O6UZ5PlVSimFIylom5zXMI5/HCs4QWc0nDICQm
 H5jLTG/FW9+nzqXE3BP8IhcJ2qSBOy4QYmtzaIVoSmj7MzIre+u2C+N+ayY6+Oao3l2Y
 9uZO/kAEga6Vlqwk/0R23sFack6m6FXyESjHrsimE4sHgHlFxtz6ks6FQeC1un8Gjx+k
 qMd+L3G7H2eaf4uryLfFtmIBHyTHDOtZYwTBeY9pMRb2R87JtyweHej5v6eNvrGTaQR1
 IpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4x3b3Gg53/QoChOehhMF0HfM7H2Z3AdxYrpI7W1n9qE=;
 b=WyBGecNeM+zr8Igr1p8c0J/pkLfco3pB/q48XfH9d/benJnq1WArBW0jex7J2rhBUy
 +zcXmA0KW3kzJmehatDS6MvTXkKrepujEVBrtyEPKoWLO8+gdS1fQ3ZIjLVB3VoAfnVj
 G1HAEJr8qPn1N6404HvHbDwf/Sw8SpwQGofxoaJtFpKIn8ng8+j7YaP4mZjIIKN1y3Xo
 aZXMYwlHIdr+Oq/CLgsjYMIjcFC76sW0luOrB1Be7jYqJY4wT3HH80rfoN2QLmj6Er7R
 o6gnC+iB7whHTVN86PEFEOJfkEftffyy7l5wYE1cjb1ypYLW6qyBzI5pD+OcPy4qCkOL
 cKnQ==
X-Gm-Message-State: AOAM532l5xcu7vwpAUsu9jLqe/D0Fcaj43Xr5lQj/3wXyFmMFmHQkYRN
 PT8KS4Wnam1PUPCAyim7iOCuQeXxeKoUIA==
X-Google-Smtp-Source: ABdhPJxloq4EW+hzTQXi0U2oQmgMwFgecmA1KwBfS3QQnusRm/qLZRha65WS4RBSHkMjDTN1iTT34Q==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr9537858ljc.323.1599466283823; 
 Mon, 07 Sep 2020 01:11:23 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276?
 ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
 by smtp.gmail.com with ESMTPSA id n21sm6422769ljc.89.2020.09.07.01.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:11:23 -0700 (PDT)
Subject: Re: [PATCH 4/9] arm64: dts: renesas: r8a77961: Add FCP device nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87mu2270se.wl-kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <45210ed5-bc34-990f-b92f-0ec5aadd2488@gmail.com>
Date: Mon, 7 Sep 2020 11:11:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87mu2270se.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.09.2020 5:58, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds FCP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.

    Was tested?

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
