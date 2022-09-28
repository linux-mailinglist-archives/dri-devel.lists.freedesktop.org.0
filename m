Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A6F5ED25D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 03:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B181210E1FB;
	Wed, 28 Sep 2022 01:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4710E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 01:00:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BD27C847FF;
 Wed, 28 Sep 2022 03:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664326837;
 bh=jLHIKM5w32IlX+aS4cv0A8XANmGXuUR6Irz87FvI2Lw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lnL7MEnJU4e8F5PztnlsherauuLVD5cq65lxdyeQ5+oGTVrHPRgzR/WEmKtBCvlLq
 LJJxompRBB3bhlzeOgah0Fm+z//YszQCEYgWzqd8MwL6lrglL4W1WWjcGLn7oMtyJS
 n8qOgWqpp83zIPSuLuuRvyZ68ZcixK1VE7P88jL6d/+qv1K+bTzf2Rm45Mnq7XIk2z
 YkBHyWaU+mwRGoMaMfQRoq3dXxlk9ixirRDXgwLPQzSmYtZsITWhuXnevTLy4cEBHE
 4RdgXtRYjLqwL9KPU1isSO5tCw2NN+uzEGVHOcGnGG2MpGJNzkflXVXKB8oOirAj61
 2y0BgqA/A1wPw==
Message-ID: <04bc0fde-530a-a6ac-63f7-2d48b53e25e0@denx.de>
Date: Wed, 28 Sep 2022 03:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/4] drm: lcdif: Don't use BIT() for multi-bit register
 fields
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-3-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220928005812.21060-3-laurent.pinchart@ideasonboard.com>
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

On 9/28/22 02:58, Laurent Pinchart wrote:
> The BIT() macro is meant to represent a single bit. Don't use it for
> values of register fields that span multiple bits.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Marek Vasut <marex@denx.de>
