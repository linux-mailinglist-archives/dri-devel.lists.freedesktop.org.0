Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37871FD915
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB686E202;
	Wed, 17 Jun 2020 22:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84FD6E202
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:41:28 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id t8so3939360ilm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ell7jiNP2ad4ewc9/m5zo9VzyaHvMd9lvaN9Obmnl0g=;
 b=qWalkKmTdtfXo4D20Z3gS0+poGdAjjZH+xsSZxhM7y8i2WR5/KEXuQ+MVRA1DS7XXj
 0mqmVviBX3jQCAyn/RiCbNMJKiykvpnWfDJC80TY7mx1PS9Uz2CNp/L8+UPiajU2Zcfm
 KW7EtV1SzzTv5WgIH+O4yEs7a2v+RwNXlhxtCrYFe0EMqFhIG5fcRm1dZYCIUYujxZ8T
 q3aSbgWX0W5dMkiLAR0cKjT3pbsK8Qe+QTcRspdRfPsq3kGHyvuYJpHzBqmXejwers1F
 8z3mNwu3iq5P/SULaLKiY2BmU4R23qH4JTrSKSdVzhNFg85It9DdzO9QHIHd3gtYdNjt
 ukMA==
X-Gm-Message-State: AOAM533OKLfNGLsa+pbtHcW799fWCNYAjP84iypRe3WrzZiq3hZv+Vip
 vE1umplhal6ZsDxIJeF3pht9JXgCAg==
X-Google-Smtp-Source: ABdhPJw0hCI5p++1/CP8eVsgrsWGIaVi/lbypn4bUR7hGreLuUwIR7E32EZlueXTudx7WsXVWKCeSQ==
X-Received: by 2002:a92:1b86:: with SMTP id f6mr1287269ill.9.1592433688369;
 Wed, 17 Jun 2020 15:41:28 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k18sm634053ioj.54.2020.06.17.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:41:27 -0700 (PDT)
Received: (nullmailer pid 2971783 invoked by uid 1000);
 Wed, 17 Jun 2020 22:41:26 -0000
Date: Wed, 17 Jun 2020 16:41:26 -0600
From: Rob Herring <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH RESEND v2 1/4] dt-bindings: display: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
Message-ID: <20200617224126.GA2971729@bogus>
References: <20200612072219.13669-1-matthias.schiffer@ew.tq-group.com>
 <20200612072219.13669-2-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612072219.13669-2-matthias.schiffer@ew.tq-group.com>
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

On Fri, 12 Jun 2020 09:22:16 +0200, Matthias Schiffer wrote:
> Add the CDTech Electronics displays S070PWS19HP-FC21 (7.0" WSVGA) and
> S070SWV29HG-DC44 (7.0" WVGA) to the panel-simple compatible list.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
