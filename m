Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1012DA2FB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1716E14F;
	Mon, 14 Dec 2020 22:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064B6E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:06:47 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d27so21012452oic.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0/I65MXMkNznaW5LKxsVjR34sG4yDznp7JKf020+wMs=;
 b=qghApQtyjWfAXJwa4Yb+oGHK8edGaAPDzxWgmNd/IyE/EviK9IIumZZm/oTAjoSDRl
 CJfkfjic26UuYdvnzVzjae00irI7TrWhvaN8eYK3EyncFgvwhMStZ65Vut/7SOk/No0l
 4ajasBH6/znlt2PM4CxcaAlsNS5hdP/c3zyPI8nkT+hd2KgqvQtUytWtJlVzPhyMTkg4
 JGR3p3dRgSu3EO8FKA5MrCD5P6YE21Nw9b2S892PdHRUbGd6B5FRIq1IoX0gso+gLfQR
 B0NSjtSQ7slQskrT2rCYrJQccLpwwuSHOsEFgpCYqstKHto3NFlicyZY7fALmiN6nrkb
 qb+w==
X-Gm-Message-State: AOAM531WBJsmdp69RyEvCxPtD7NrA1nzF5G5ukzbgUyx7Klkcv4vSRXh
 356zuuD/PRAfMR3Xc+8fxNknwsxo5Q==
X-Google-Smtp-Source: ABdhPJx+39HYyPsjA6xBoSfU2ve06K7MlTuoJO6hqIby89sUj/Ci9w4qXjJZlysdJqYzOH+JUJHhkA==
X-Received: by 2002:a05:6808:352:: with SMTP id
 j18mr20177974oie.78.1607983606634; 
 Mon, 14 Dec 2020 14:06:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f18sm4632704otf.55.2020.12.14.14.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:06:45 -0800 (PST)
Received: (nullmailer pid 2471687 invoked by uid 1000);
 Mon, 14 Dec 2020 22:06:44 -0000
Date: Mon, 14 Dec 2020 16:06:44 -0600
From: Rob Herring <robh@kernel.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 2/2] dt-bindings: mali-bifrost: Add
 dynamic-power-coefficient
Message-ID: <20201214220644.GA2471636@robh.at.kernel.org>
References: <20201209115143.15321-1-lukasz.luba@arm.com>
 <20201209115143.15321-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209115143.15321-3-lukasz.luba@arm.com>
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

On Wed, 09 Dec 2020 11:51:43 +0000, Lukasz Luba wrote:
> Add a property dynamic-power-coefficient which allows to register Energy
> Model for the Mali Bifrost devices.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
