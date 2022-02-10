Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDB4B01A0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 01:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3768F10E700;
	Thu, 10 Feb 2022 00:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D1410E6AD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 00:39:13 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 b12-20020a9d754c000000b0059eb935359eso2718611otl.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 16:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3EibQva733Ukt948OLTo6btkyTLhec3MLRWkEWmaPwg=;
 b=rc/Y/zrgYaQW93Fd3Le8Zv/WbqAW4Boo1Se7y7QMFcY9d9B0yE5F0oCbtBul//Nvt0
 D6F2O/jSZOVeunU+FZY+uxLPlthOxbfHiMA1fhH6aKE9OZE14g8Mib5MKYfwp19t91Fs
 c1syTPWH3o1P/vQjW17A3SAREjjURUETftSNEvh7FszrIt/leobkSMFOvmZaR//zDZi9
 pzxS+EFDRQoJqot8KEuF3LGFNowoRDnXV+NB+ST1nQcm6uLIa6coQkv5Fdz5FClrIS17
 L4NZhynsatWcBEsO25YJs4nmEYNHLFU0WcJ5sAVBuUdnuvDJGUmVXrnNsjevafHdWxL0
 CHsQ==
X-Gm-Message-State: AOAM531zj6sN6kppYJrTfJzi195OIOUzhejVz0rjAK8oZXOA1LcOO+Se
 RbR/Ppp2BGRO8FL98yHreQ==
X-Google-Smtp-Source: ABdhPJxCChio0ovak+VAyXBSpYB+F8cv7odWMUWIQmTPsU6/RvwafuEVhpp5eKU7rVZHTJqHN34+9g==
X-Received: by 2002:a05:6830:43a8:: with SMTP id
 s40mr1995632otv.98.1644453552318; 
 Wed, 09 Feb 2022 16:39:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j9sm7514743otp.23.2022.02.09.16.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 16:39:11 -0800 (PST)
Received: (nullmailer pid 1272329 invoked by uid 1000);
 Thu, 10 Feb 2022 00:39:10 -0000
Date: Wed, 9 Feb 2022 18:39:10 -0600
From: Rob Herring <robh@kernel.org>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH] dt-bindings: ltk050h3146w: replace Heiko Stuebner by
 myself as maintainer
Message-ID: <YgReroGOJQlWjFvt@robh.at.kernel.org>
References: <20220131165439.717713-1-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131165439.717713-1-quentin.schulz@theobroma-systems.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Quentin Schulz <foss+kernel@0leil.net>,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 17:54:39 +0100, quentin.schulz@theobroma-systems.com wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Heiko does not work at Theobroma Systems anymore and the boards using
> those panels are downstream, maintained internally by the company, so
> let's relieve Heiko of maintainership duties.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
