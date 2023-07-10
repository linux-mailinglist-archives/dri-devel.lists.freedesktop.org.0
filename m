Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0874CE4F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3110E1DB;
	Mon, 10 Jul 2023 07:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F7110E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:26:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-314172bac25so3948174f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688973973; x=1691565973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0MpIFr8CBbAEE/ZVXXqmsOCs9taRKCqLSnP5eop8lso=;
 b=HjBV7kkA1W03Pe16OX8LLr78TyBLdU2DPqs4casG4EsnahbaEAGvByNXW56iQ1EwRv
 DW717tc0GpqXElkLC9R23fxb9NHa8RAc7NesGR83ZI1bLviuRJSMxbeSSVCvACUaEbsR
 axiuxBuKboPmiBt6nA9Q/uZ4UbdMtxAqKFHN/NAjggP36nTWxtXXyKsudp/3/Uab7RgH
 zvNWB/0NBP1vLjJOySbXZfTIOrdANDo+AS88kN+z2MV18DGxadGpNma5FSSYexGwV4ik
 VMTYlsWfI+ITz2v5vzThhrRBr9neUFdxVWoJDF4CNeUBE0u/2keQ/JFp0vrAn2kll3ou
 NFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688973973; x=1691565973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MpIFr8CBbAEE/ZVXXqmsOCs9taRKCqLSnP5eop8lso=;
 b=GgtCJjMPEyo/UpGZiEyCZJRxhdrqfuCBQQZivjHVedLmdwX4+GfeNKC9K22ulvlYTw
 rG7ysqtKnVwBGy9EmwvRACGneC+0WkLPDHwexFDW9WkXB1clFjvJabyrqC/YfTlkiv/t
 2ErozgVaH1q9WUrGCpK5TVbuq4UnY7QgORFMvngdw32Zn81s/oJxfTySuu8woLmohUkZ
 s3VRy5Pxq7TfRXX5MaPXyPOywBFa8S4x+jx632yEzE0xvTutUn1ZByDZiRBBGnLyhKqB
 z5YYzNwnBHJFbPqRaU6rMfFCv2TOQLtlR3HAtyVCQCvEfX6OEI3yj8NFymSwvkyhdSlV
 CQbQ==
X-Gm-Message-State: ABy/qLaFOb4KwusbabtIWKAA945lwUJx0ZbZikPxK51agV2u5gpvOmfk
 /Blh2FN14R6AmYcs201Z4bw0bA==
X-Google-Smtp-Source: APBJJlH+arxF6hEmagBTDTI0C6x76IzZztJ+6PfnbP11P5phlAB60JPJrDNLhIYH5Ny6OpPtOpEnjw==
X-Received: by 2002:a5d:5683:0:b0:314:c9c:94dd with SMTP id
 f3-20020a5d5683000000b003140c9c94ddmr9936361wrv.20.1688973972858; 
 Mon, 10 Jul 2023 00:26:12 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 d8-20020adff848000000b0031128382ed0sm10857934wrq.83.2023.07.10.00.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 00:26:11 -0700 (PDT)
Date: Mon, 10 Jul 2023 10:26:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [drm-misc:drm-misc-next 2/3]
 drivers/gpu/drm/loongson/lsdc_plane.c:199
 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before
 check 'state' (see line 180)
Message-ID: <d152ccb2-555f-4954-aec2-71ced694fda2@kadam.mountain>
References: <ff8f09e7-d8c3-4b02-ae76-47dbac830cdb@kadam.mountain>
 <cfaa947b-0388-2464-6379-8b7ac2c57757@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfaa947b-0388-2464-6379-8b7ac2c57757@loongson.cn>
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
Cc: oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev,
 dri-devel@lists.freedesktop.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 03:02:05PM +0800, suijingfeng wrote:
> Hi,
> 
> 
> Thanks for testing,
> 
> What do you means about tell me this?
> 
> I means that would you like to help fixing this warning?
> 
> Or otherwise, I will fix this someday.
> 

These are automated emails from the kbuild (zero day) bot.  I just look
them over and hit forward.

regards,
dan carpenter

