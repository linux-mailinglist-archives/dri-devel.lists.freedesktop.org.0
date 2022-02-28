Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644704C7673
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8176D10E1E7;
	Mon, 28 Feb 2022 18:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208D10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:04:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v21so16743588wrv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VaJ7vYxiYDppNFuFvcEyYJgrljTaiSuZmK98Y+vY7wA=;
 b=obM0ggc5iSG7+04jAJpVvM5h8etlFLjmoe4ZZzOTzBcDwFsuhkVO6s1roPpWq1YY2e
 w4zuUXbjfJz1VoC3A662BS3NzR0t1zoJoMYFf2e5luAQqjP3126oAW+Zg0g2q/ZdFwWk
 e+HkxNtaNf8rwIpVk2O8pm66muF7nUj5YcB1tdSePCn7gdQ9Fqh8jWHTYcBXQoj9dcJo
 ZesQnXxaL2zja28D99QyC50dHVtYWGDCHSXVRUgFZ9JymjrBnrMRLkajEZwCaMW+gUBN
 awKBE4/e8bAG7z25vJGrzkGIRgvmewZY4NOINQ5RAonQJlzElctNPnRmdia/W70r7N0E
 o2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VaJ7vYxiYDppNFuFvcEyYJgrljTaiSuZmK98Y+vY7wA=;
 b=b7ILy+ZupH9k9y/1UJGK1b5FKFUOrwj5MzRxDAXyCJF+LhaFPgVHRaxFr3FQXIBrBh
 SrLl7qFEMGjmu0TMv/30pYFFsFQcmEoofvZTDOECVsPeFfK/WATeg3dk5MF2ht6Qn1O0
 +hxAKO0EsmayTrG+udpIXSTek5y2TMskYWOe7ToB2g6hNeiwbwgIYoHnT36z3lWgQhLY
 R0LmhjBKySt7iu8F6oJFGGZqlV2KjQYXNMp5vRFAizfQ+s3GogLymcL5oYGuSQGRitvt
 xPdWruSPi/TsT3ojfrxRZnjYUzG0wPuz+ipxlEdl8U9C5BGthWZvY31LDLwHqOtsTj11
 KmSQ==
X-Gm-Message-State: AOAM5301pqsymUmYMOSNNYA7UE3TPSBvcvXgOaf54SfA6AC7Y9/Rpoas
 yptEt6R4aWLgv/Y5RuCOeCM=
X-Google-Smtp-Source: ABdhPJz81jTbv3NaGz+ja9PXaKPd0Fkk+Zfd69cpLTOt2pT1n5NhmnRVNBauIgQZyRJh5mxeY3fULA==
X-Received: by 2002:adf:dd12:0:b0:1ea:9398:8f4f with SMTP id
 a18-20020adfdd12000000b001ea93988f4fmr15899502wrm.458.1646071472587; 
 Mon, 28 Feb 2022 10:04:32 -0800 (PST)
Received: from elementary ([94.73.33.246]) by smtp.gmail.com with ESMTPSA id
 m6-20020a5d56c6000000b001edb64e69cdsm11208628wrw.15.2022.02.28.10.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:04:32 -0800 (PST)
Date: Mon, 28 Feb 2022 19:04:30 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: switch to devm_drm_of_get_bridge
Message-ID: <20220228180430.GA14803@elementary>
References: <20220221073757.12181-1-jose.exposito89@gmail.com>
 <20220221085619.bqyr2etq4xjjqa4p@houat>
 <YhOCRQhDClgsBAtV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhOCRQhDClgsBAtV@pendragon.ideasonboard.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 02:15:01PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 21, 2022 at 09:56:19AM +0100, Maxime Ripard wrote:
> > I guess lvds->panel can be removed from the rcar_lvds struct as well?
> 
> It's used in rcar_lvds_get_lvds_mode() though, so this patch introduces
> a regression.

True, my bad. Sorry about that.
