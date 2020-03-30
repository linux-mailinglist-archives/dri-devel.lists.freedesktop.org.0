Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E31197B3F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 13:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACE56E265;
	Mon, 30 Mar 2020 11:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2711F6E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:52:11 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j188so13878733lfj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUxAOgz8NXHq1Pf5is4saO0kcIUnQRpCo7D1rQX9etA=;
 b=RvTFD7FfX+RF2ea4gaF0j0B2FI534aB0tSVvis0sLeVy4mJcjjSl4QzkrKQxQrs/Lc
 HnSvgz2uPVhL0YBxzkToXX0ETdvrkXkTatxWl5GYZ3Et+xaXK4x9aPAdTDpdFdBHu3LF
 PMXP9o1RYCtkWmFsczRDmvIF/BzwpyQjLk2sSc3ltABf097AdbHhRrcgijhcCicFh6aR
 T0JGsIhIFKx7DyT2mBRoaK6iaHLQKAK+gC/Vv15Z5kpoiAku3KSocHewLR2j8Fd3QtvF
 t0OOgv/I94yviCfCMx7/4Wv5e9qp/KbKw9qXFzvEADHzUn0Nfjrt2u4S0sjQoIEyB6Mz
 8r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUxAOgz8NXHq1Pf5is4saO0kcIUnQRpCo7D1rQX9etA=;
 b=kIRXviazlIqyLiBmmtW1t42lcgSvAjewTyVJ19Yqb19F/C3LFSnjEz7OCFYTccPeA5
 KszoQEMXC08Y1p2B5Q/+uf5TSMf02G767I6br990OvXfauEwS1h2PPAVPyeLCh4WJ8cg
 Yg25SJQW9Y0XiA0sblLOS8T4qrFhsa19lDQw9YK14VKoJ5CdXJtcRvLfV2LScl9x0aFT
 qzaw4BJKNk5ZZVrd4ysCZozjDk6AaeZqt28uVFgJMgtfqoPPrt5x1XkeLE26yRth3XXD
 BKhHzvdNBaNaytFCwSYZHq63GbBX7nmOjMRGjKAWHOJQUOmIotzIiC+Jceu/+rGhF9yz
 JDgA==
X-Gm-Message-State: AGi0PubZ2vS6vPdewUEJnxxOKLmAWy2sN/Auf826+gst6YlweZE81O03
 erB3jpEBv5J7DMCeI0ePdwFw8gbcDkWz9JGrC7c=
X-Google-Smtp-Source: APiQypIs6reaMQbUKLAdY3KvxuAlR9R0M+IDM0rH838tBggLkO5g/vojQtpptaZ+TdidZCUDxI0stG9ysPseXJpdgfM=
X-Received: by 2002:a19:4cc3:: with SMTP id z186mr7582516lfa.69.1585569129458; 
 Mon, 30 Mar 2020 04:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-6-adrian.ratiu@collabora.com>
In-Reply-To: <20200330113542.181752-6-adrian.ratiu@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Mar 2020 08:52:00 -0300
Message-ID: <CAOMZO5CKr7hSUFtb9b05rpRtpp9mb9ZyeSVqqiDXvppHJEWu5w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] dt-bindings: display: add i.MX6 MIPI DSI host
 controller doc
To: Adrian Ratiu <adrian.ratiu@collabora.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 8:35 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:

> +        panel@0 {
> +            compatible = "sharp,ls032b3sx01";
> +            reg = <0>;
> +            reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
> +            ports {
> +                port@0 {

There is a unit address here without a corresponding reg property.
This gives warning with 'make dt_binding_check'
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
