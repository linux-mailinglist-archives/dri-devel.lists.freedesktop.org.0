Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4D317392
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 23:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FB16ED16;
	Wed, 10 Feb 2021 22:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486056ED16
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 22:45:05 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id e5so3417760otb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 14:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NTjPSQnNqlFRAkz0a6xaD4E0SOmzHGZrh2Mkjc0lXfA=;
 b=MYRsKrwwU6hp55ShiAWK35d3AvyvAjS3JWmnwn8bZoC1CeYOBXz4FRgN4xjC8qZT8J
 ZqecJffM9Jom0TvBrF4bj8fs7HL6aLU+L9StHnfExo6ZnX335uokGqz4q2tjHOz2F2o/
 IyzuZU9Ap8SvJRDc04i8qzreMM8TIV6xtQzAlBA0qPcOZtMsFSddBp4rpsPwhT0Vr1Ap
 2ynot86oplZn/jt4oAzefiRfKQFpnH69Tg4UMyE8ZPj/lMHcfvu8t2RO6OEBQOdjZOpQ
 e4PBwkMvhysXnbZo0qytWZh56Gy+F1JsUiy4ZAy4u25HOC1zuO66nI5iiesOFP4j3utQ
 NJTA==
X-Gm-Message-State: AOAM530t4NrZAOdlIH9Hz9nF3ViqQKnf99iqdJjBTRyOvfMDBnnUu0WF
 L/Yap8E4qZUgWVnxCoOymw==
X-Google-Smtp-Source: ABdhPJyPJiR05AIrtKUTCS8xD+LsyHECj9z0LbPXixoaHK1zkj0KdQ/1Cl58xPOLrZ6Vlws8Zi/D8g==
X-Received: by 2002:a05:6830:140a:: with SMTP id
 v10mr3787221otp.355.1612997104577; 
 Wed, 10 Feb 2021 14:45:04 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j25sm379707otn.55.2021.02.10.14.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:45:03 -0800 (PST)
Received: (nullmailer pid 2951110 invoked by uid 1000);
 Wed, 10 Feb 2021 22:45:02 -0000
Date: Wed, 10 Feb 2021 16:45:02 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [RFC/PATCH v2 11/16] dt-bindings: gpu: v3d: Add BCM2711's
 compatible
Message-ID: <20210210224502.GA2951054@robh.at.kernel.org>
References: <20210209125912.3398-1-nsaenzjulienne@suse.de>
 <20210209125912.3398-12-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209125912.3398-12-nsaenzjulienne@suse.de>
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, wahrenst@gmx.net, phil@raspberrypi.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 09 Feb 2021 13:59:07 +0100, Nicolas Saenz Julienne wrote:
> BCM2711, Raspberry Pi 4's SoC, contains a V3D core. So add its specific
> compatible to the bindings.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
