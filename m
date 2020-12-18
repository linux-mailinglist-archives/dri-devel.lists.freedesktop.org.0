Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5F2DEAE0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 22:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBB289C68;
	Fri, 18 Dec 2020 21:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA489C68
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 21:17:47 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id j20so3260985otq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 13:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bA/q6/lytXqC0BX2MijAP++B2hrmWNlRg8ooSs4RlPM=;
 b=K7FX4k9bahNeJf5wmGO8bAp5NqpHGw19AnQCjbeCbaHRIwLcG3+ZI0+6pXqzIyDnZt
 ibKpONNxxg+BbX3q+PK3qx1cSQY2CdLsnhErZohJNczmZNMJSnCXd/ufzjmshuAntOw5
 vciaeN9R4k2AcZB3xEy1hUXEv5T/AJ2TpgXm6Jkvuc6c/sJTVpKNEhEQIhynNql1W3oL
 nDkC+geaoAXQMBpojoN6Un4sCs+cVT+ZCF01nrgabcwrV0xD3D27xLliw1hAPTM8gZPG
 pTxcTyAApaDOenwpg1dl1zHDDJoNc6o4GuIP4/kb2KOmJNpBYa64E/AF/jPHxYsmcME8
 F21A==
X-Gm-Message-State: AOAM533fgKDOFQe5bzJrHgEciivSreJIQ2/wLrdvv1KlMj4QMaICA8HE
 ibr/fGwlcYgoq7+RNVgrvA==
X-Google-Smtp-Source: ABdhPJyoVoLPTGEg/kKZLNBOodRCvkYyVXk5xQ8/x/+uz2Fa5dCMz/ybCZ4YZTqaCGylNMN389z9+A==
X-Received: by 2002:a05:6830:114e:: with SMTP id
 x14mr4208264otq.253.1608326267166; 
 Fri, 18 Dec 2020 13:17:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n11sm461314oij.37.2020.12.18.13.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 13:17:46 -0800 (PST)
Received: (nullmailer pid 2191479 invoked by uid 1000);
 Fri, 18 Dec 2020 21:17:45 -0000
Date: Fri, 18 Dec 2020 15:17:45 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] dt-bindings/display: abt,y030xx067a: Fix binding
Message-ID: <20201218211745.GC2190633@robh.at.kernel.org>
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201217005945.335111-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217005945.335111-1-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Dec 2020 00:59:45 +0000, Paul Cercueil wrote:
> The binding should use "unevaluatedProperties" instead of
> "additionalProperties", since it is a SPI device and may have
> SPI-related Device Tree properties, for instance the "spi-max-frequency"
> property that is present in the example.
> 
> Fixes: e366a644c69d ("dt-bindings: display: Add ABT Y030XX067A panel bindings")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/display/panel/abt,y030xx067a.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
