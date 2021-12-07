Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3D46C4B1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87596E969;
	Tue,  7 Dec 2021 20:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC74D6E969
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:32:55 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso418269ots.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=314Swo2giBxC8EAz4uaaC4iyUFE8uIac74Qo/PcmRic=;
 b=Bish7fYT0SecYJYlMq97DsVOApYwKCCL3vs3Pc+nHmrubKW10JIU38QUPpXhRNwy4b
 Hlr52u6TL4XJWH0spJ4NljN4o4mnqpTvdErcFyDrLeR72wMCLJ1I0cFeI5fZyFh93e2a
 8y/qkhbQVjwpZC6T/bzb8uP12cexFLOmDqfLsicr8DRk1p31Aq+NwbVXZ0pXS1J9Rt++
 E1BWbmJCCihyLe3NSMMqayGS0+i0/ZX0Film2c8yImv89M6yWf2qlx2nIWbq6zyaSjgo
 EEh7iDLOFrDMGN7bKQl5LIwTpyIb+tKQ4CdGLQfFnbtnd9IwitUawc3rEWCOKCmqREmE
 bhgQ==
X-Gm-Message-State: AOAM530QDZ47kB6d+WhQevIdP92PblJMbiQjeR64nIq6sEA3DCDy2HGO
 hqWEKK9ZNcQ7Zu60TswmZg==
X-Google-Smtp-Source: ABdhPJwmwqyWszM7wAkHKCXFeC9992SwWhCxDr+taxAFXXrkLvZu46vQNX5neqr6hql5wgb3jZ/RxQ==
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr37943969otu.151.1638909174916; 
 Tue, 07 Dec 2021 12:32:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o6sm141750oou.41.2021.12.07.12.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:32:53 -0800 (PST)
Received: (nullmailer pid 781221 invoked by uid 1000);
 Tue, 07 Dec 2021 20:32:52 -0000
Date: Tue, 7 Dec 2021 14:32:52 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: Add Team Source Display Technology
 vendor prefix
Message-ID: <Ya/E9B3HNR9UI+nX@robh.at.kernel.org>
References: <20211127031909.283383-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127031909.283383-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Nov 2021 04:19:07 +0100, Marek Vasut wrote:
> Add vendor prefix for Team Source Display Technology Co., Ltd.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> NOTE: All the documentation abbreviates the company name as TSD,
>       but that vendor prefix is already taken.
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
