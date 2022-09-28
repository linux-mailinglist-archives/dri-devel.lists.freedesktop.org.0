Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA05ED15F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9E010E1B3;
	Wed, 28 Sep 2022 00:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127210E1B3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:05:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 75C8684DEC;
 Wed, 28 Sep 2022 02:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664323513;
 bh=yjFuUSVAQ91TORyWfIIokh2rQNzAAqfGj2Kgahj4pBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=APs8DfWUAUU14rUz1jGbwAMHub//hTz2x3RZExnE7uhbXYu7pa/GpbhWxGl1GLL+g
 /h1jZwm+zb9RSLyyLQU2hcU+jWFsV1wegXpU44I5WXKXM9y/CkNCI1vVFRNXcVodUq
 f1j3TA2PG/x2x0Fxcw84PltYLszqk450a0958roOWEKqbdxiW9F0JWFdJmGyBqNib7
 kcevXbW7yRO7pR9Y7kxI5sA99B32aTCbQ2l1pgfMdGO+OQvHZdES0k0A5rvnqCe1Sr
 UkHNc57lfBIlyHXASCymmHN0+mFXlofoiM2V0CCNZCzumEbBzRWl2kuucEj4XjKGq/
 kToXLDXz7S3Zg==
Message-ID: <5cf2d35d-7c9a-cce3-7c40-a99ac677deb7@denx.de>
Date: Wed, 28 Sep 2022 02:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220927233821.8007-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 01:38, Laurent Pinchart wrote:
> A couple of the register macro values are incorrectly indented. Fix
> them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Marek Vasut <marex@denx.de>
