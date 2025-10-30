Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CFC22B19
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 00:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6147610EA7D;
	Thu, 30 Oct 2025 23:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SHpzjuxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F97310EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 23:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761866435; x=1762471235; i=deller@gmx.de;
 bh=h1Ifo04kG17YGRhg2zouY+Rd3bSjyu7nrCVDgdZ+rbA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SHpzjuxejSnlLW5LLCYSRGTVyyQvggFSB4psZDXM7Q9v5n2WZILwPiORlK+aNSk0
 LMpYjMJquiFX4EVKZgJRBu+YhjXW8ZzlJXb068f/PThXnf99dc13EZ79JlEgVtHHB
 G0/5l2NhlN1ySa6k0HdgFkI6PrfsLBL0odijqEOweoB+lLaQb/lDIYEJZjmgVBg+G
 n0UY9GS0rt2C8gcuDluvYGjAXNwEt362MPs65VucYN5m8u+iPSjKoA0rvCdTIqNCr
 Mn9Ge4UEALzbz/eyKGJnaJHZDgU8GoaZvR55RcDunlnyUNcn16V8RV6We+rdizRie
 G0diqSVqXxMuD//w8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.209]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzT4-1vdpuB2eeS-00Lfgb; Fri, 31
 Oct 2025 00:20:35 +0100
Message-ID: <eb8bc92d-0b00-4ad2-81e4-904f39ea7ddf@gmx.de>
Date: Fri, 31 Oct 2025 00:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev/vesafb: Use dev_* fn's instead printk.
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251028185021.2758401-1-rampxxxx@gmail.com>
 <20251030200723.2788931-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251030200723.2788931-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:15jIQYM+05S3WFvXOc2Ph/+oayBJLlHrXB+AphGtJaHSIK3+AZS
 oUmNZaqsYR0D6WiRpvlL4iryEPbQelggwBTb88CQm3rKY3ulhgndXBtTutGjB+9biV53E0B
 5p2Lr61VQ3HItnDv2IneTRNIL+sA9yurG7ftA8ms6qb0T/kQWOAIB0knKcieoL62HcUWB2Y
 JuqBqCDpdByyVefgmLhuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rsg19AIRZV8=;ulqvwrrv5R3dsuKA0GBFJaAzA7d
 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
 ezGkNRjY3SvGFVfcl9D2PfzZTs=
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

On 10/30/25 21:07, Javier Garcia wrote:
> - Family dev_* fn's will show device name, giving extra info to logs.
> - Delete the prefix `vesafb:` from msg strings, not needed now.
>=20
> [    0.981825] vesa-framebuffer vesa-framebuffer.0: scrolling: redraw
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
> v1 -> v2:
>        * Fix checkpatch.pl messages, thanks Helge Deller.
>        * v1 https://lore.kernel.org/lkml/20251028185021.2758401-1-rampxx=
xx@gmail.com/
>=20
>   drivers/video/fbdev/vesafb.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

applied.

Thanks!
Helge
