Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF50484892
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 20:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55310E28F;
	Tue,  4 Jan 2022 19:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD5810E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 19:30:52 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 n3-20020a4a3443000000b002dad63979b8so10648354oof.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 11:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x6oTUGdVMYVlx3kPQnsirJ5Muw7/LAKbeRVwxFrXPhU=;
 b=6VJMN0b/VQWvr8KVHSnGUhgrdsyXjtSdyoScLAjLV9F+2Q7NrF3PlzSakx1AkwfLiA
 PkQxhcdjwEZ7mEuK1nX+inBmomX7Cf1xMDftTrOtP6PbPEbHy8QLbGxPSv4l9eOR+rSj
 5zM7KzdJcDbFEs3eXTA2y2nO/QJEBcxDdFYISPuK9NYhe8pu5mGHKf8Ud1XtBrsX+d4Q
 XY4ZOyEOPgAa7g/zDD2+bBmjZDgpBblQEDsPLXNhiRNp9VWv4xSysjRkQKvWjjBey973
 OaK41e0TxkvyeLXr7DpHw0AfEaRr3NbV0bhjEeZD9xgCKjGfR37KWwt5KMWDf6STvyf/
 r62A==
X-Gm-Message-State: AOAM533z0l8YaJApMt0uw356V1FG42or4SIt3SIXxCG3iTurxJtwoq4r
 Boqnrcg9kVa1C0MwrMNJFw==
X-Google-Smtp-Source: ABdhPJy/F9td3Y40SsPIPS/CN2xe8T9tWHG4c9TN4+qb1gyaJoMCQxrDqFPgBBE7Cqc+rYXClm06Yg==
X-Received: by 2002:a4a:acca:: with SMTP id c10mr32313145oon.1.1641324651351; 
 Tue, 04 Jan 2022 11:30:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q14sm7859548ood.28.2022.01.04.11.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 11:30:50 -0800 (PST)
Received: (nullmailer pid 1268827 invoked by uid 1000);
 Tue, 04 Jan 2022 19:30:50 -0000
Date: Tue, 4 Jan 2022 13:30:50 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: simple: Add Multi-Inno Technology
 MI0700S4T-6 panel
Message-ID: <YdSgau/AnEpaHebI@robh.at.kernel.org>
References: <20211222133200.6586-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222133200.6586-1-marex@denx.de>
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

On Wed, 22 Dec 2021 14:32:00 +0100, Marek Vasut wrote:
> Add Multi-Inno Technology MI0700S4T-6 7" 800x480 DPI panel
> compatible string.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
