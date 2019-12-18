Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6C1254C0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 22:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5E66EA83;
	Wed, 18 Dec 2019 21:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9DD6EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 21:33:58 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b8so1973646oiy.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 13:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c0tGiynpJxULvbwlFBguiy9u5rn02fPkRpWLO+m4eBo=;
 b=SsGWPC9gamU6Xu3TtEGi6EWGUMYvyRu7ErGCvWUlYbIg2oN90yZ9ABVWBvK3qSjlB5
 Zexd/EJGKpbcMuIvbgjAQRpJaEigC7Rp6X3dKMaWwEDnFHwXv9oJlv1uw9m8peXN6V5f
 gqKFD8a8EhciJZHmxHSyxrrTttkj1LtDsMRLZT63PgtutVQdpWxFeEFNtXGvlo3uiUhA
 JE3/80cqnQZ2wQRoIfDGozAkqN1FiUypLFwB/h44EoXflsBz5MnMyjXtWFVbM1a71iVd
 avYN5VCJbRebgJNxCD7v68O3/7oSLOiu13dwD3XVEZqlQBhYgS0iL5TeHB6CLcmQO6Qb
 4e5w==
X-Gm-Message-State: APjAAAUzBZTq1iZ76j82dfuBMQtWQoVoBoY5YfTCf/ecNMoloKmE070n
 E+nG24Rd/6RdhTislf1qwA==
X-Google-Smtp-Source: APXvYqxmyvq1VjUYfL1bqfUpq5hpKOG655pjgo7UmbqoYPvSmp241AOklCyO+pXoVFU1SEl7e/iRSg==
X-Received: by 2002:aca:3256:: with SMTP id y83mr1573796oiy.58.1576704838146; 
 Wed, 18 Dec 2019 13:33:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a65sm1248253otb.68.2019.12.18.13.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 13:33:57 -0800 (PST)
Date: Wed, 18 Dec 2019 15:33:57 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 1/3] dt-bindings: Add vendor prefix for Xinpeng
 Technology
Message-ID: <20191218213357.GA25585@bogus>
References: <20191217222906.19943-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217222906.19943-1-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 23:29:04 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Shenzhen Xinpeng Technology Co., Ltd produces for example display panels.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
