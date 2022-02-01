Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C84A68B4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 00:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8510510E234;
	Tue,  1 Feb 2022 23:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D315810E234
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 23:44:39 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id y23so36465401oia.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 15:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xJ5ww5IowYah3vuOkTM8CuTagH4Jd5vAIL+T4NILP4U=;
 b=hEtk0aXj+MCCQ/fzExyxD7hBzwj4X3fDfQXhY84mzySYD6X0gIn3hdQuDZThXQcVDA
 Kp33NN1ZVJuDjx2gMJ6hHfWJP1NobqEX1gX+E1bPL81jz8qcNec0LVZHFF5hZcrcRw74
 elOuJ03vC7F4wsr/1LSqSngyllEqecc/OIfxKr9Cy/VS78mCTO9TpJCBi1Ccuq0KyHjn
 cNiFNkcjr67MdrAvro7rsz0dF2bKd8W1pcF8KhUegOFSoEe0ITmNochM50r1vweaIAx8
 GlTJhoWafwhzsDEntQgks30IovfDRqmDcmpXXOEf9GymyiAMBIRCDcSFwBhbmL5KVfzv
 K2kw==
X-Gm-Message-State: AOAM531xRx2TrKfggASq/TLxYXtiVAGm5mX6FlRFU6ZM8AEwpvobgB3Y
 bZyPmLxfy32JydqLl602C5OVYEmpiQ==
X-Google-Smtp-Source: ABdhPJze9s7mNLSyDWw1RyySuLSwpCDHLYGjvVviYTYm+PB29dALZWT1UEjiI37xaHSSpMrSmOPzsQ==
X-Received: by 2002:a05:6808:23cc:: with SMTP id
 bq12mr2761135oib.230.1643759079139; 
 Tue, 01 Feb 2022 15:44:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g34sm11925438ooi.48.2022.02.01.15.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:44:38 -0800 (PST)
Received: (nullmailer pid 989022 invoked by uid 1000);
 Tue, 01 Feb 2022 23:44:37 -0000
Date: Tue, 1 Feb 2022 17:44:37 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: sharp,lq101r1sx01: Add compatible
 for LQ101R1SX03
Message-ID: <YfnF5XqvdQ8RpB/O@robh.at.kernel.org>
References: <20220130235945.22746-1-digetx@gmail.com>
 <20220130235945.22746-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130235945.22746-2-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, linux-tegra@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 02:59:43 +0300, Dmitry Osipenko wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> LQ101R1SX03 is compatible with LQ101R1SX01 from software perspective,
> document it. The LQ101R1SX03 is a newer revision of LQ101R1SX01, it has
> minor differences in hardware pins in comparison to the older version.
> The newer version of the panel can be found on Android tablets, like
> ASUS TF701T.
> 
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/panel/sharp,lq101r1sx01.yaml          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
