Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E25300685
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 16:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74CC6E9FB;
	Fri, 22 Jan 2021 15:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601BF6E9FB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 15:06:19 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id w8so6295237oie.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 07:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a+tNIRPFsQZNo0iJpQuhv55n/0RmSsDH8TXaDaa4xLk=;
 b=E9c6HhNXdbxO1gKFQ+YKrhEVmcc+pk1EcnBE69YSiQLtrZktBs1hmc9Wli5OvQspHA
 yNPXP/B8g7XSlh1EjTeTwaY/szZvMRADUIpCAABagh/8CnVZc0eCu0RXEmPUTOBNrFok
 iUsl48u5ObjxT+JdUFwdr9b5JAXeQIYFObFyIILWVERylAGF07RMPss0Hh7y+zTw1Nce
 HlHQckkzmqwVjqgmVqvlbwcsMPNrUQU15RVQjv26XYIs+q804lMtmgrLHjU5HZpW2GLj
 2n9nOFrMAicgkaOEo7FBB4TeTV7EooxNV1IgD2uf60ToY4sGoxXOttovhS8Uw4Mk8qov
 aUzQ==
X-Gm-Message-State: AOAM532ZoMdsOJQj8vqjiBO0oXAwCnYy1pJwAdfEff0+EXQ39pJWiN+s
 yv8CAgFtItExIg3UTk9ARA==
X-Google-Smtp-Source: ABdhPJzr/xDORwzWodRvwYpOAr5mW3eIufe+a+D0WslquHp50TAZWeIpBw3IeBAgAhoX/1hhqBjiyA==
X-Received: by 2002:aca:cc03:: with SMTP id c3mr3354569oig.137.1611327978719; 
 Fri, 22 Jan 2021 07:06:18 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i126sm1717121oif.22.2021.01.22.07.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:06:17 -0800 (PST)
Received: (nullmailer pid 788624 invoked by uid 1000);
 Fri, 22 Jan 2021 15:06:15 -0000
Date: Fri, 22 Jan 2021 09:06:15 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/3] dt-bindings: display: Convert mxsfb DT bindings
 to YAML
Message-ID: <20210122150615.GA750442@robh.at.kernel.org>
References: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Martin Kepplinger <martin.kepplinger@puri.sm>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 16, 2021 at 12:23:01AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series has previously been posted as part of "[PATCH v2 0/7]
> drm: mxsfb: Allow overriding bus width". I've split the DT bindings
> conversion to a separate series as I believe they're ready, and Martin
> has a patch that he would like to submit to the bindings.
> 
> All the patches have been acked, and changes to v2 are minor. Rob, could
> you take this through your tree ?

Better to go thru drm-misc-next given other changes coming, so I applied 
the series there.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
