Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFF83C38A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 14:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC74110E27F;
	Thu, 25 Jan 2024 13:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891DA10E27F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:23:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C220FCE27FE;
 Thu, 25 Jan 2024 13:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AA8C433C7;
 Thu, 25 Jan 2024 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706188998;
 bh=RTrUkGFlhHDqssknlVEh2NOMXjB2QBjHYkzy/Jg4Als=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pBL/JisbmdvDKYuIIgfc3Rxlu0CdWJJHW2gI65zuEtIaOMFAF+ooxCr44jOyb2IDS
 GYsDdA0BDzY3u8HIz/yyBCPMLVudOMU/Sw4teA0waV1+6AXY/sdydC/Fe4xwF1Spm8
 HjWrWwtdQuX48da9V3uwPdFBFmHWghGljjP3Xd9vxe0oaiSjA/MJxLcsjziKobjYJp
 oa4JZUJXO6K/cENGl5Od70HQZzQOx6zaz70imtkt9XdsKDbSKQOetrdUn4WKRF+Jh7
 qzG8uMKVZrzE9sMDoiXaEZTE4NWBkOQS3e380xIG0yv6sLkOa4TKEPFH6OBDzc1gIE
 dOqTEli/QhAug==
From: Lee Jones <lee@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>
References: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] backlight: hx8357: Fix potential NULL
 pointer dereference
Message-Id: <170618899680.1460445.7138651116963022324.b4-ty@kernel.org>
Date: Thu, 25 Jan 2024 13:23:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 Jan 2024 16:39:21 +0200, Andy Shevchenko wrote:
> The "im" pins are optional. Add missing check in the hx8357_probe().
> 
> 

Applied, thanks!

[1/1] backlight: hx8357: Fix potential NULL pointer dereference
      commit: 3b75d271e161e22aff8171940a77510d2fb2ad6f

--
Lee Jones [李琼斯]

