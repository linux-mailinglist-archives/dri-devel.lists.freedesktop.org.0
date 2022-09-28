Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C385ED87B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C1510E37F;
	Wed, 28 Sep 2022 09:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974110E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:11:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98FD5B8200E;
 Wed, 28 Sep 2022 09:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AF1C433B5;
 Wed, 28 Sep 2022 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664356271;
 bh=8Ac9VJN6hOMB54pgc7YGs5fVvmhr+G9YDpSL6A6INKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E9rMLE75Qeuy2XefhgL+hBKG9WjxQcu7vrQtSKX1f+hELVtlHEzJiTVidCQJ+GbDI
 SmH5RevcaH1zUEahuTe1kWhfbFy8Isecx10Z2aVtp+vnftbXu4U3ZMaj/H8GJ1Pfu3
 GsclsmIdyu3vpgq3tFdKa5YsjtQ8UibA7BchbIvTtXCvS4o3vx5s8QiyXH86G+scuf
 cYDFyn7WSaUSxrEV06K9r/v/bnozMoHOhP86DmrvHQqUAiJSTIFuHjfyaE55mdCaq0
 mgwmAVfuP2kMhu+gJKgH4btCnnumtrGGKRdux9+TDgjpWb1jD/gFnyBKLmWNebPpem
 YLbl1LKn+qPuQ==
Date: Wed, 28 Sep 2022 10:11:06 +0100
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH -next v3] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
Message-ID: <YzQPqjinYYAZdcR+@google.com>
References: <20220927033138.1945842-1-yangyingliang@huawei.com>
 <YzLW6zo/7k031jzi@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzLW6zo/7k031jzi@maple.lan>
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Sep 2022, Daniel Thompson wrote:

> On Tue, Sep 27, 2022 at 11:31:38AM +0800, Yang Yingliang wrote:
> > In the probe path, dev_err() can be replaced with dev_err_probe()
> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs. It's more simple in error path.
> >
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


The original patch is not in my inbox.

Was I missed from the original mail?

-- 
Lee Jones [李琼斯]
