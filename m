Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22412DA2FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FD66E0C6;
	Mon, 14 Dec 2020 22:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A8C6E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:06:36 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o11so17362007ote.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gXv4HROgVl0dhhrn9g+dOuGByfC8qbNmedPTBmNYR4=;
 b=b4//QKqUuavJudn/gJMEv8ao2KsOL1sKNkkGWguj3NVaxPgIV3f3oyZNhiC/dNMGwY
 OnkPrXlIKXH647EXwq3rpyoCWfHjZaGXYK16mtEoUb15K3IlBqo3DY9Po+jujLOTTDZj
 OEZZQoujCjiUWN2fuFSIUwFFdmdId/Tc61lhdMhoFitT6Y5J4j3TPk2xjYT2vZbaekjf
 SsrOqX86Reuj4Toeuo84JIVlvb9IrKXnXSiqtAp25eJ12+yU94PovUeIA2VoV7n4r6cT
 f2KZDkK/a8o/bwVhH3fHUpfeSKgAymiQ6c+jO7cioTa4N+NhfyE2+o5qi1BROP84o9lU
 7OeQ==
X-Gm-Message-State: AOAM5328kiAUhyx6gHevrmOnGgMg/fAwk5OP+brZjEQkNxaDKbTvaBZ0
 5IhPoZEjGkTRasXi1x3dJ6EAdGFWgw==
X-Google-Smtp-Source: ABdhPJx1oK3i8zmC3LbXs0Tik3rezauqHLakbhVM/cgMMHuTFfWDNadaL1RC+zRxmmvGlt7BYMKuyA==
X-Received: by 2002:a9d:2043:: with SMTP id n61mr20683296ota.254.1607983596226; 
 Mon, 14 Dec 2020 14:06:36 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m21sm4213726oos.28.2020.12.14.14.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:06:34 -0800 (PST)
Received: (nullmailer pid 2471293 invoked by uid 1000);
 Mon, 14 Dec 2020 22:06:34 -0000
Date: Mon, 14 Dec 2020 16:06:34 -0600
From: Rob Herring <robh@kernel.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: mali-midgard: Add
 dynamic-power-coefficient
Message-ID: <20201214220634.GA2471238@robh.at.kernel.org>
References: <20201209115143.15321-1-lukasz.luba@arm.com>
 <20201209115143.15321-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209115143.15321-2-lukasz.luba@arm.com>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Dec 2020 11:51:42 +0000, Lukasz Luba wrote:
> Add a property dynamic-power-coefficient which allows to register Energy
> Model for the Mali Midgard devices.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  .../bindings/gpu/arm,mali-midgard.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
