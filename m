Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3F62E6A0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A9110E68A;
	Thu, 17 Nov 2022 21:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B2010E68A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:15:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i10so8293848ejg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QtRibc0jfvWRzr3zxWRcvkUmcozMC6ScLHF+VtqaDfs=;
 b=Egpl7harq1z/ThqqQTXWRBPLNrlqdIkIpsvtE5n/qqbnpOsNKNIC7H79qLQ20AsthE
 KFYPPdXYhFMHeFfwMysLQUcAKTPog9IWST+4eO7zJLc4vCw+oz9JGmuih9ouhw7SJ3SI
 bZ6I8zJN1gqh9IXG8OR9YNipLVgFHF3pztO4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QtRibc0jfvWRzr3zxWRcvkUmcozMC6ScLHF+VtqaDfs=;
 b=fn5Pv+BD2HWspcA9X2wyA4jrNy0eTrjyiO+4eswKU7STfAOrNRheDuryCAw9FAKCJr
 qiIrjNWfTTNWwd9SXyFGEupyKr7OK079kg9RKZNpxf77R+or80HqYFiHn9pBuZYCH3BU
 04T9hHWTQ1mwTgLvoU0KzfZkZKoFG9ATDMdJFd755ZYlJV6jFlCxrG389F1J/x5I2HxA
 29kEi4PTMO3eFjOwS9qPGFvp4aGqjBrR3yJxXr/PrSTpMHvWFox7xKnTYM9VEMtoZka/
 blv6sM7l57Cd4g/CaRB4FXezJMJH+zEJL4UzUW9OWZvDVP8a6eXEY5GN+AnmHOKdL8sM
 V/bg==
X-Gm-Message-State: ANoB5pnR135Fp3Ldxq9fpl2dcjxstNFSiLwARymsFSLajSBhKCtzPoA0
 YN78mmFVZo3Q8BGIcGIyBijy0uynRhD1Pylu
X-Google-Smtp-Source: AA0mqf5xAKmkBnZy4eav2Yp7BCFtrPnR6p4I92J1O7MQevrqAo2GYtqRKPvhOopIKFWcQirAseQEvA==
X-Received: by 2002:a17:907:378:b0:7ad:db82:d071 with SMTP id
 rs24-20020a170907037800b007addb82d071mr3812688ejb.200.1668719710862; 
 Thu, 17 Nov 2022 13:15:10 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 e24-20020a170906315800b0078d793e7927sm847477eje.4.2022.11.17.13.15.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 13:15:09 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id a14so5972558wru.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:15:09 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr2590182wrj.583.1668719709264; Thu, 17
 Nov 2022 13:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.4.If6153da69ec4bc9e83d5f095ef6e6b07283940a5@changeid>
In-Reply-To: <20221117133655.4.If6153da69ec4bc9e83d5f095ef6e6b07283940a5@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 13:14:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VvhzEgjQidvF3DVokNyiQ1hRkqGShCoNbM5ytma3gZYQ@mail.gmail.com>
Message-ID: <CAD=FV=VvhzEgjQidvF3DVokNyiQ1hRkqGShCoNbM5ytma3gZYQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge/parade-ps8640: Extend autosuspend
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
>
> Same change as done for panel-samsung-atna33xc20. Extend the autosuspend
> delay to avoid oscillating between power status during boot.
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This seems fine to me. Not 100% sure what changed in the probing /
booting to make it need 2 seconds now, but this really shouldn't cause
any issues and it's nice to avoid those slow power cycles.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
