Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ABF634350
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336BD10E432;
	Tue, 22 Nov 2022 18:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22EC10E432
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 18:09:12 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w4so5641073plp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 10:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KRMhYB9UPO2WtEP0UfvsFBZ6e6YdwWgScP76/C9Yycs=;
 b=M+5E7ETSufWPx+E2mZBDiYBpsWvhg9NS+0oud8xN7L+y/ywZzwWx/9Yk/wEeBqhXWv
 7HrtF9k+BVmfh30B3TvMo3srXrtTKrKImB11ADbg1f6WsBv8/+LRwJRqE2Q2ZoycdkUM
 yVYfNaFdBfvZtt0zDSu2yVoH73SydK6cyBkNUXm1Xvd8zNFMJAs2SwlqDJbo++OFjXNf
 yJNhBwgY6ZC8S79K4yR70xw96ZczaPZj9p6nLble4XdItCPmSGZ/FyJbZVjHQ1/2TECb
 4W2ozvOAxBJZkfCy7UCiNbT9O5FjRR1FKuS74TUBYfJMPe0ds2AH3L+N7xW4T2fSVNyO
 J3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRMhYB9UPO2WtEP0UfvsFBZ6e6YdwWgScP76/C9Yycs=;
 b=ya0g//qEUNkGNKueaGA4kAdiBQ5TZDNFJ+rQ+CXEGABKH6jsIGU7g3impZsFhBNKhZ
 n98OSLi8VmR0DvzJRpwrog88ZtlS4aGNRUK8PejNRNUcXClVnlpfwwSK9iYqE5S4ZLOh
 lLrkxy93XqQ1LP+uIq+SMOeDiGqKqayn/3/RigNZx/GWt3HgPLDS44z+npFuWNP9uTRC
 4rwQUNHL/NdYN4vecJ+1ZEuoTJqKAmA7Qc+0Teli8HPsXBgNLdt7gZOZl/wpFCvP+g4H
 845cBXz8ef8u8VYeFcdDsjQ8uitoVGsqS7GDikxbJyAGuN5OL1qYQodO2ZMmjkqOHThk
 /hTg==
X-Gm-Message-State: ANoB5pnq6NFrHI5GBo1HmsJ6keEPGD810meloIdKzQxkpYOAXaWigbip
 U+RrgUvnFyO0ysWqvdobImBvJUZoza6trVNGijk=
X-Google-Smtp-Source: AA0mqf4AGbu14xUfrouQH/rCMsj54a7vqxbpp4i6D4+jiZZqOK8c52s9h5B66FphmMpWdVoYct8FUOYE5AJyW6IBqDc=
X-Received: by 2002:a17:90a:4147:b0:214:2214:869e with SMTP id
 m7-20020a17090a414700b002142214869emr33794590pjg.76.1669140552412; Tue, 22
 Nov 2022 10:09:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669013346.git.Sandor.yu@nxp.com>
 <be4532b834109595b0fbf3562bf072caf2852a01.1669013346.git.Sandor.yu@nxp.com>
In-Reply-To: <be4532b834109595b0fbf3562bf072caf2852a01.1669013346.git.Sandor.yu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Nov 2022 15:08:54 -0300
Message-ID: <CAOMZO5AwwyZofwQNRnamNiLcj74HayNgocKsKx9epNGm8O-8-A@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] drm: bridge: cadence: convert mailbox functions
 to macro functions
To: Sandor Yu <Sandor.yu@nxp.com>
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 jernej.skrabec@gmail.com, kishon@ti.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

On Mon, Nov 21, 2022 at 4:27 AM Sandor Yu <Sandor.yu@nxp.com> wrote:
>
> Mailbox access functions could be share to other mhdp driver and
> HDP-TX HDMI/DP PHY drivers, move those functions to head file
> include/drm/bridge/cdns-mhdp-mailbox.h and convert them to
> macro functions.

What is the reason for converting the functions to macro?
