Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DCAAC9B8
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E39C10E6DF;
	Tue,  6 May 2025 15:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="xQ+5fhAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4861510E6DF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:40:41 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1746546036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gwv48sU9PJ4+7zMEwJ0xKCOMMLiUiKmC1HBLpcwOGag=;
 b=xQ+5fhAcVue/iuF+8Br2AfJk+F2PNrGTIFtgtSGXlv969wK3d7A5JS8CAPN7x83oaZcj98
 Fjgf/tD6zhi22M7GdSK5hnUi2xVCKYcjPxZ9TojP6acImQOMyTBHo8YWcOfSntpWUymZnx
 /M0TCEFPng0lJNhGpqKSOG+t7oDZUkm4TiaLo7e/XUn9Kz9GV0oPL4oBrXuBCXMcFp8sQM
 vpxhdMdu2zG+kzoe0fbODuMiQ2c1RX/8+DvKZ9N2c+hrT5IpQdKUUsdtnStDtV/Wp/ULPp
 SQ1zrqlFWqLZi3jpaui/RZscTMVxLApJrYUeGsmfpHoFZ/yAFokQgICfO2k8NQ==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: pmladek@suse.com, Aditya Garg <gargaditya08@live.com>
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org, 
 andriy.shevchenko@linux.intel.com, apw@canonical.com, asahi@lists.linux.dev, 
 corbet@lwn.net, dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com, 
 geert@linux-m68k.org, joe@perches.com, kees@kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st, 
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org, 
 simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
In-Reply-To: <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3] checkpatch: remove %p4cn
Message-Id: <174654603220.12228.11601081754262000250.b4-ty@rosenzweig.io>
Date: Tue, 06 May 2025 11:40:32 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On Wed, 30 Apr 2025 19:19:08 +0530, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
> 
> 

Applied, thanks!

[1/1] checkpatch: remove %p4cn
      commit: a6c0a91ccb257eaec2aee080df06863ce7601315

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

