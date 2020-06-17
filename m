Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748A1FD918
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D916EA02;
	Wed, 17 Jun 2020 22:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8A66EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:41:44 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id i1so3909492ils.11
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xlfwwG2vm/RgPye0RWrcVCc+HKgMqaKW+0Ot0JPSfJs=;
 b=sySLP3AcyfXqdrg0DH1f0b4X+Y2fEBiWpq4InVkExwfnM7ECGHxE7odK+Ax3Nc3dP+
 wdGGCOScf2b3007E/ja/eG2TmD3UnEbFxvMeLNjpBXd/3xmY5AjGc2BvwELRcVBfnj7z
 vXW9xpehZfyhHWiZJqFSAorZvvRAsqfaq1kiyvDLRyi36viwb9wCsRxGNwATRUMDF2/1
 i5YwoJRENXQRwO6ZBn8i89vjzfQZQ74IXVuJBdvmyRnn24jMLvE6DUQMfjCnyHRjHzjL
 9AhpXmsh4PT5HGrXcWboga3QXc+42UUvehfU5R6EaWQTLGdwHks7NcpCEik/wVKN3d54
 OMmw==
X-Gm-Message-State: AOAM533AVTj0lTfc+WhgXHJ/s/CrLXXQxTLsf5SAdjWtaAxUKCqAbcco
 mF5u4+GdKEiDNEzcYHcwQg==
X-Google-Smtp-Source: ABdhPJzdEBr14d5Rgh0EtjpCqbK5agDJX2lPwsxyKJHzXxGUsCUQwcc4dbDzsuyamrfKPQAZAUOXGQ==
X-Received: by 2002:a92:5e59:: with SMTP id s86mr1274594ilb.104.1592433703988; 
 Wed, 17 Jun 2020 15:41:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z4sm648964iot.24.2020.06.17.15.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:41:43 -0700 (PDT)
Received: (nullmailer pid 2972301 invoked by uid 1000);
 Wed, 17 Jun 2020 22:41:42 -0000
Date: Wed, 17 Jun 2020 16:41:42 -0600
From: Rob Herring <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH RESEND v2 2/4] dt-bindings: display: simple: add Tianma
 TM070JVHG33
Message-ID: <20200617224142.GA2972272@bogus>
References: <20200612072219.13669-1-matthias.schiffer@ew.tq-group.com>
 <20200612072219.13669-3-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612072219.13669-3-matthias.schiffer@ew.tq-group.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Jun 2020 09:22:17 +0200, Matthias Schiffer wrote:
> Add the Tianma Micro-electronics TM070JVHG33 7.0" WXGA display to the
> panel-simple compatible list.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
