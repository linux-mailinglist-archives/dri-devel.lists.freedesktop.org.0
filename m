Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2D487AB5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 17:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA29311AE7A;
	Fri,  7 Jan 2022 16:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3829311AE7A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 16:49:25 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b22so5629286pfb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 08:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZL1IIh8N/t+BHnGrZngRI4Wu6PnsS/ETq8DSWtn9LP4=;
 b=lDsXRzHX0unihRR38tpYXG3DBR5q6h2qwjl3lyjgNQJfWFRlIO/oVy35ifLLPTvBI7
 W4Tg5Esz1Nx5Z4HrkQ7wDiKw2HOG0SNYDJ4U3pNbtyEYAZyhZNvhZjq4hcJZRn9tbKB5
 9HRC1pgUllGCrOR1XHry7tj/NXmSn8GbnmsxQTuPTeT4FNAIUu37lBo8A9ueglsRZ/Nl
 03uCT1mQtpQ4/Du8E6umy/2IPKW+WCagwtD9ws4wHg+gPA8RN0nPdtCfn08bhenyCSfQ
 /e1+KymevWezVqY+KBCozHepPRhZyJPoSGCyIb3ZFFbZOdOwx3BQA4V7pAK4SkaVWAML
 U0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZL1IIh8N/t+BHnGrZngRI4Wu6PnsS/ETq8DSWtn9LP4=;
 b=N+LZyp5wTk+QtbxEAveuRRYmrfxX7AhDh6JM2php7A9N1TrpWIgp180itpywDG9kEh
 iP2tlr6jySTVET3vPZTOkvTHxNvbsg27pPddp7FrD9aMVzq4hcjpnQUWcU+6eAHLrlnm
 H9GbO31kEYNov8JebDebrPP+Ya0HqtXwSlLDgcJDaIEUp2Apaos5vnogpcqfGGQbO8n9
 x+DjBt03VWgnJTr/T85x6rueVIIaxH0/wTwKRHILRoP1i+G+O+von0ebUdmimRezz1h+
 VRbriZyx8y5Iyqk938jqoy0vylTiDn+TKAttmOrFvvEXVT06nz7gi19l/vfz3wvQdMkg
 i4wg==
X-Gm-Message-State: AOAM533Yzi4mXVT3QR9jZqatTDlM1K0RIx8WlTWZWAE6n83eGb3bUoMp
 y39rcVXP2YuOER99JQyoBUFKz2sXkFF6v5vX121NBw==
X-Google-Smtp-Source: ABdhPJwKGOGLxY2N6H+C08ShsFe8lUGDHnLP2XOgjBuMBWnlTkNVzmG7RqGrOD4ylj9vZ/VhKTvpCxGk9u3qYdu2EQ4=
X-Received: by 2002:a63:414:: with SMTP id 20mr56480887pge.178.1641574164830; 
 Fri, 07 Jan 2022 08:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20220106100127.1862702-1-xji@analogixsemi.com>
 <20220106100127.1862702-2-xji@analogixsemi.com>
In-Reply-To: <20220106100127.1862702-2-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 7 Jan 2022 17:49:13 +0100
Message-ID: <CAG3jFyvPD075x_N1V_S39NvMUUNkSbBUQrO65naGJG_kzniDwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: anx7625: add HDCP support
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 bliang@analogixsemi.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series and this patch looks good to me. I'll hold off a few days
before merging this in order to give Andrzej some time to have a
second look.
