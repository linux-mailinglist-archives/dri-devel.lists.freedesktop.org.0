Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A25B7590
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DFD10E401;
	Tue, 13 Sep 2022 15:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81CD10E401
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:49:50 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-12803ac8113so33216229fac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 08:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=foJlUv46n5lMMNs0Q7Ku0d9gdElPGgCZVFMlT7KuK+0=;
 b=F6EKa86J84YDsZwGOdP3lBNsHuJXrbTIPhnfiBccWAY7byvbpZjCzEMb8enrpFVyI6
 R0ailMIkNoDvtGKXqFyK/YnBYyOORnMuHJ0XuYrQFT1YmsDtyfKicQcE28GMkZYa70n2
 NIQCVqEjng6GzQeBuE4sEHaLKYGNi5SRz0q63SYNDLp6DXLxQPgK3Uitjj7QkOC393Rz
 qMWgXfWwfEMpkIr6dHO+68JmQMp3Vj9ncPaxoemg+tFLr73qPCmsRmV+Ic/Au7SMEen1
 MUSV2Y1cqxgzPasuorYd2c2V2dHhp/rWxpWMgPRdy4UOeLq8Lw7j9p42E5djOwiq+gs6
 m9LQ==
X-Gm-Message-State: ACgBeo30M2lE5IMtERuUC6/rFAN3KH+4NcyT2BoNjRyjRbylUHIMu37X
 X2IwABW7aWgYfFdqCzkSRg==
X-Google-Smtp-Source: AA6agR5LcWq3PN8/sz4CVvMmxOD9DMkwOlFV5vk5dDsbNSIRxxJomOiY9hpH3d6NqB/OpbsyDe6VBw==
X-Received: by 2002:a05:6870:1601:b0:101:5e61:d8ee with SMTP id
 b1-20020a056870160100b001015e61d8eemr2121147oae.244.1663084190070; 
 Tue, 13 Sep 2022 08:49:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w8-20020a9d5388000000b00616e2d2204csm6069481otg.21.2022.09.13.08.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 08:49:49 -0700 (PDT)
Received: (nullmailer pid 3799539 invoked by uid 1000);
 Tue, 13 Sep 2022 15:49:48 -0000
Date: Tue, 13 Sep 2022 10:49:48 -0500
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings: Add byteswap order to
 chrontel ch7033"
Message-ID: <20220913154948.GA3793808-robh@kernel.org>
References: <20220912113856.817188-1-robert.foss@linaro.org>
 <20220912113856.817188-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912113856.817188-2-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, airlied@linux.ie, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dianders@chromium.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 01:38:57PM +0200, Robert Foss wrote:
> As reported by Laurent in response to this commit[1], this functionality should
> not be implemented using the devicetree, because of this let's revert this series
> for now.
> 
> This reverts commit a4be71430c76eca43679e8485085c230afa84460.
> 
> [1] https://lore.kernel.org/all/20220902153906.31000-2-macroalpha82@gmail.com/
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 -------------
>  1 file changed, 13 deletions(-)

In the future, can you wait for a DT maintainer review.

For the revert:

Acked-by: Rob Herring <robh@kernel.org>

Rob
