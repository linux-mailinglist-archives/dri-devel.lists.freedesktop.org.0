Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03A204BA0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D07B6E960;
	Tue, 23 Jun 2020 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738956E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 13:40:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u25so9667009lfm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DKCkItewvHrTs2k8QFit3hIhI+zhzJPCW7qZry58T7E=;
 b=RHDGDdA6XvMPld+h8oVQ8VGqWtamUH9IP3s5O0umg3aViAetdlw9ndoFXIJpIjBlLi
 iS67pOYWOuahjaNkD93Ma4eRoyUP/EMuQU7KNAH50Awf2qeT4sbcw4HVr6lL3NCvOpBH
 c/KFSklOKmoi/e8uwKH3MOhkHM21xI7TqEllbeP13qKBbESFXswZwdHMOuEbWWlSgIAR
 rnjWYNQ3KIh/jU6bgNWOwTRZD0Uyakw/hnTIQ2UtKLwtlaO9F7+rfy89z2csJxhs/sOu
 jiDSp+ODov/6TyAfZLeVUJ1TNKrtpYd7B9+x2MBh/dsPXRDqfWU0aABpr9T4Kc32excw
 EyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKCkItewvHrTs2k8QFit3hIhI+zhzJPCW7qZry58T7E=;
 b=aB+BW/6EgLMu7dTvKSn8XZWfUu6Apto46zh4cTM3eJckJKJkjVHMuSi6QR+4a0aRI4
 /UMJow++ZxDeANeodzt/XclA4l2z/6K69m6JYLZHiVXEMh1J6QhkrMxUlKc289Fgwsum
 dARDr9pOysXl+qNDKwZwjA/Ojrjmy//Rt1LUIS/Z96x7QAVHeaN9AivojvmSkhJsZYc3
 W6Fe/PXlYmgXTYQo061PAS0gw0hMvNH+CeVI0j2930FdDkfXwSsn7yDdpDCkrE/vbamc
 oGsO4WewsVmewsgvt3uXKI/VIoTmrqJOQ5kFXnpxqW5eEfWOjsBnzrtJzlXM/59CIvGl
 voZg==
X-Gm-Message-State: AOAM531dKCejSoZAYGi4jXc7TaJUEzS+SybEfajf9jLJr2iWWwOEwQTT
 uwdjfa4C/NMtbsENZS86BkM=
X-Google-Smtp-Source: ABdhPJyPdQDJrLqZNuusxWqg0pbI3BD5XgSX18Loo0iV3cZZRStbBPxOt63+mnY4/gAitUUv+Fa2VA==
X-Received: by 2002:a19:4285:: with SMTP id p127mr9320654lfa.74.1592833243786; 
 Mon, 22 Jun 2020 06:40:43 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id s18sm3183832ljj.63.2020.06.22.06.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 06:40:43 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] drm/panel-simple: Correct EDT ET057090DHU
 connector type
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-2-digetx@gmail.com>
 <20200621222922.GA25355@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0974c58b-71e8-623e-cb04-d19a5167a30c@gmail.com>
Date: Mon, 22 Jun 2020 16:40:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200621222922.GA25355@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMDYuMjAyMCAwMToyOSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBNb24sIEp1biAyMiwgMjAy
MCBhdCAwMToyNzo0MUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoZSBFRFQg
RVQwNTcwOTBESFUgcGFuZWwgaGFzIGEgRFBJIGNvbm5lY3RvciBhbmQgbm90IExWRFMuIFRoaXMg
cGF0Y2gKPj4gY29ycmVjdHMgdGhlIHBhbmVsJ3MgZGVzY3JpcHRpb24uCj4+Cj4+IFJlcG9ydGVk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
Cj4+IEZpeGVzOiA5NGYwNzkxN2ViZTggKCJkcm0vcGFuZWwtc2ltcGxlOiBBZGQgbWlzc2luZyBj
b25uZWN0b3IgdHlwZSBmb3Igc29tZSBwYW5lbHMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkg
T3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KClRoYW5rIHlvdSEgOikK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
