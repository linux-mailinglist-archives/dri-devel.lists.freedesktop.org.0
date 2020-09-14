Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D5268C91
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4186E1F8;
	Mon, 14 Sep 2020 13:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224666E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:52:27 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id n25so18729675ljj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=c9D+Q8Uy3AWNEA9u1NFLMhTFgLxO2wnJeTRWamS6O8g=;
 b=Qpdh7TMVvKMpzPr79g0Mp4vpGTfdW1bjQbEXnBfjKsKPjYD7WOqBJBB9lxOwBL9f76
 OswVj9msJ8aIIRkYLMHhcIescJvf7aj5YrTLKr0iPEiiXp9rF90WpOwMCl4GFR91Gq0K
 5sd1kSKZ3YoCoxmSTrXxvkV1PiLScN9tkmi0oRokyM9K/gNKbVgFDRyRvzBf/lswEboR
 QU6wPjq94Aj+2aWCnpewlHNN6imVSAiPpCYgsC0hAAd+Upz21U8cheziwUWXUeVw0zUG
 9Fy6hQnXbUXNNOG9XcsqoIgSK4FqBgOyZqvvYCQdbx8MBSpbH/5bvmVDYnsHFQCIG274
 pOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=c9D+Q8Uy3AWNEA9u1NFLMhTFgLxO2wnJeTRWamS6O8g=;
 b=oA2J9OU/bxpa9YjHZRTUmuisx1mQk5QoDCiN/uW/OJYfP/YaBX76tkrURQzHKLkilB
 /mcREHo2TwxcAOir8+SyCfHXO09A89TNMEwr01DBdb4mxowaiHjA6h/YpoDSzXvhUd1B
 cLtTvNE3LTMQJ6pfKeDu8iRQTXn7ngJi6ViEnyhP7zOhcZY6pQGpJU7Nf1TKZK/dFj8H
 6NCh/KS3o9XWtm8l4Zf3INBcX0BWDxPnnJ49h8avGAFrZwqHyGQxc0sTYaeruRwFcn8H
 0GrAmgF02jWDUSwtwed5JqworBJRJIAXCTqERnnQM3CRhmmrGCbDADt6uEcbqLAfSQ+r
 5Qdg==
X-Gm-Message-State: AOAM532xn4HjjAKE5snYpuTEj+d9nkZXhRlnvQN32oWkCIH3HB/jyB+a
 3fp74E3TRx4qA2WdUhA5FKurCfbyhXJl6kbVvtHqxyEBfFQ=
X-Google-Smtp-Source: ABdhPJxaTSWAR6DfdhNekDg3fHO+AP6Z9CFC6fDkhvTUsY1B4H2a5MD3pc47o3F3g+TEXwXL/FPPedp00rms1eStUeQ=
X-Received: by 2002:a2e:9ed5:: with SMTP id h21mr4758928ljk.178.1600091545412; 
 Mon, 14 Sep 2020 06:52:25 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Sep 2020 10:52:14 -0300
Message-ID: <CAOMZO5B-gDH93SakoGOYmKCLwh-JPuiePm53nru-zvx8MPd9tA@mail.gmail.com>
Subject: imx8m: Failed to attach bridge
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>
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
Cc: Robert Chiras <robert.chiras@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin and Guido,

I am trying to get MIPI DSI panel to work on an imx8mq-evk board.

Here are the changes I did against linux-next 20200914 following what
was done on imx8mq-librem5-devkit.dts:
https://pastebin.com/raw/GXazRyNx

The config I am using is this one:
https://pastebin.com/raw/UGAjTQyg

This is what I see in dmesg:

[    1.666974] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe]
*ERROR* failed to attach bridge: -517
[    1.667309] sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO
[    1.675977] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517
[    1.689620] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe]
*ERROR* failed to attach bridge: -517
[    1.692019] mmc0: SDHCI controller on 30b40000.mmc [30b40000.mmc] using ADMA
[    1.698606] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517
[    1.711321] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
[    1.721418] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe]
*ERROR* failed to attach bridge: -517
[    1.730422] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517

Any ideas as to what I am missing?

Thanks,

Fabio Estevam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
