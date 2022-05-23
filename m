Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED5530B1F
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 10:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9C10F0B2;
	Mon, 23 May 2022 08:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE8610F0B2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 08:47:37 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id i1so12486253plg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEAer1lH79NsmLj4b5VqaXj4C4eVbt1HjEg0g160lbI=;
 b=RS52x6K8aaLtOUtyjhbX8/n06RZFlA/wnY/b4ugsdTB6rtCdZNckdrk+q+PSnDp/uZ
 MjG1OsdMd4/vIVIN5q6m7rKNQ/a1CdmZgAQdbJ5gpUkv3ofEKhjnO4mgukUkChGYjA/P
 uMjO+HEad9Siw0Zm62i+OiFRZDeIHIqhh8Ot1gDONcYgr4ueUcVKSMz4mnKNf6tNg6C3
 8LAr2AATJlQLUzy3JhVDcvclNIsILd0ntm6IiXWS2XC1viFsYaNp1UDPViaiiXerHJ2b
 BXe/iGOFtx3mDNvlwCSQFPatzSB8frjs2paelFNTBZZRIuOp6trWVAcZ5pN0+4g12+Tm
 Ls8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEAer1lH79NsmLj4b5VqaXj4C4eVbt1HjEg0g160lbI=;
 b=suYdoSIk2k/l+aRClYGELc9jsXQ3SQHeVXcmaWXD/pSpLmizbFnpWR7H2kps+x/Ezt
 iSYj466SecZwiNU4I/qdKrOVYwVaPlHm2aHEwHPQjOThBxTJOvvk6rYzRreq7eFj8JUq
 KZo+Oxc34splMMRaAdjvMAefOYtcNQXL+ALmys3DsC+xr06lWSdIjpyFR95ZZNpC9Lom
 ah+q6g5xqNSGBLCNLE0tmNT5Ow9u7/PUl2r2rAKAH5BqK0Vf1OcCanRZws0/MrIVJTTQ
 L2fiIfA9Y8qQqrJpGsMuCY4vKBVGMjKLQ/+gURH/iPoyRyBeIEFvBM33MweXJE4EziCY
 15aw==
X-Gm-Message-State: AOAM533cevn76gTycI9ed00weoQRwRp59p7OGEzs+VYx6eFh2p8rvvhP
 kPOq9S2tqYMHDjX9XFUFVEZD6CfTcVoPO3NmDyaQAA==
X-Google-Smtp-Source: ABdhPJzq974GhyP1VI37htI/dS8x/+HyuWBzEzGCeT91yupIDi7F6pNhNwu6DXsKfT1W5hbpCB6kxmFzxG3qbFRdaJY=
X-Received: by 2002:a17:902:ead4:b0:162:13e1:33f7 with SMTP id
 p20-20020a170902ead400b0016213e133f7mr7949190pld.21.1653295657262; Mon, 23
 May 2022 01:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
 <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
 <CAG3jFyvTim7P_y2G1Br5j3Pwz4KzvRjWgci_qQ3m_YW=3Bog8A@mail.gmail.com>
 <CAKMK7uFHyYTnGtP+vCzo2Uan90DW-QZpPFPn5S9bQ5aPiY=qzA@mail.gmail.com>
 <CAKMK7uHFGsPMZf2SUF4HDXo3XuOLjP3-DLfyp=gB2qpKR964Eg@mail.gmail.com>
 <20220523031324.GA3738288@anxtwsw-Precision-3640-Tower>
 <CAGXv+5EHghwSV+9Www9RvG74PkC7=AQuwn6sVG=cvCni-iwCyQ@mail.gmail.com>
 <CAG3jFysJLoQ2DMYw0oOfbQM3ifBmAhNLMxjPDEt12jq8sKCcSg@mail.gmail.com>
In-Reply-To: <CAG3jFysJLoQ2DMYw0oOfbQM3ifBmAhNLMxjPDEt12jq8sKCcSg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 10:47:26 +0200
Message-ID: <CAG3jFytVe3S4J4NzNVt5xkE-pM7+3e2cuUhe_vv1bETCpkbV=w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 bliang@analogixsemi.com, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://lore.kernel.org/all/20220523084615.13510-1-robert.foss@linaro.org/
