Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA1A60F5D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7A110E9BE;
	Fri, 14 Mar 2025 10:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e+wh/Cix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED7F10E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:54:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97744A433BB;
 Fri, 14 Mar 2025 10:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2254C4CEE3;
 Fri, 14 Mar 2025 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741949644;
 bh=8NNryJWTUOCQzMS4ZaWhtqLjPfoJIF72hF/ysBqBc/g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e+wh/CixHJLA91AOqmSSKYc2TYYwFuRt7ltPSG4SDCadsdpgyw8QtROWYfL9moVjB
 yUb3oad4GUPrG8Wr2vFK2Jh/uDhquL09kkDao77mLH2tnSiDivcfDf+HDiasZaov1D
 jdkdPWjuWSz8smftOgmd3q5bdAkykUoZoNAcNOTVqS1ZTaN9u6gouErliPHIkGAj0d
 kcRNHKdl7EU6VpSeQbJ0zhpMXxd8tZQpu5Plw12fbZdpN0EH0ROImX3BSI3VNUQlr1
 3pIfCnEQtkFPLLYXhijLQ49pIy//zXnAJQFivgPsx0JCjkTqbELa5OVEe0YzjX/uc/
 DJuvnXmcJAp3Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, 
 WangYuli <wangyuli@uniontech.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
 niecheng1@uniontech.com, guanwentao@uniontech.com, 
 chenlinxuan@uniontech.com
In-Reply-To: <8FC39A4DC2529591+20250310045636.14329-1-wangyuli@uniontech.com>
References: <8FC39A4DC2529591+20250310045636.14329-1-wangyuli@uniontech.com>
Subject: Re: (subset) [PATCH] backlight: tdo24m: Eliminate redundant whitespace
Message-Id: <174194964167.3972884.12889540713439282921.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 10:54:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Mar 2025 12:56:36 +0800, WangYuli wrote:
> The description for CONFIG_LCD_TDO24M has redundant whitespace.
> Trim it to keep the code tidy.
> 
> 

Applied, thanks!

[1/1] backlight: tdo24m: Eliminate redundant whitespace
      commit: c9fe785857fdfc780d49b60b5bb77ca21a51411b

--
Lee Jones [李琼斯]

