Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E44B33141
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 17:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2C310E198;
	Sun, 24 Aug 2025 15:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="csta5+xB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3876C10E198
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1756049883; x=1756654683; i=deller@gmx.de;
 bh=Y7ymj7pkvyuefsQalEh0ZRXA71H5y2St1ycNm60G7s4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=csta5+xBrqo6JSFor97ARL8CBL/OnX/fg2byk4XLVuA5RNM5mOlposPvjrwHmVvb
 tOpmgUH2XoL8e3qHFo0dC7C25E6kxP+xI0tpjgD8MESVDDtEy5NnFwBXTcXjt7vM+
 Qj/O0dLBUMsAlzslt/ELrESFWFZjufibZHgB8kMYF21T397g6XXEaRqVScu4U0Eot
 vBLWoU2b4awns3epDTnXCWuwx/tsRQUHYd1U1UqEdzcC7V29GSZQP9U2Vwl8TXsFG
 LtNxDL2ixEfL3pXcS1TFmtTRT3cVR7qNjQWk5YPpuNLVajfxqK0bBSCuT3D1wBZgW
 bYVKSNInumX9s+felg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1u9xDs3szq-00cduG; Sun, 24
 Aug 2025 17:38:02 +0200
Message-ID: <9dfa6ee5-b5c5-4acd-a6c6-52979ed0dbaa@gmx.de>
Date: Sun, 24 Aug 2025 17:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Use string choices helpers
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250824152327.2390717-1-chelsyratnawat2001@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250824152327.2390717-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WKMSd1Dakk6gea/aOj4V8yiT1x267JcI8b0R7rf8sGH7WwZ92JM
 qX2+Vx83aA2x7cD9iajI7weGGLqQ8f11zv0cLD1Cs2bgQYI7FrhctnAe7SvdUBNw8oAUNXj
 vSO/hREjNkuh3EaOVTxDL+xppdDy22XG7oIgGdkJG7kJXSk4bb52np90a4lskrPBt/8a1JT
 rlADCHbIUiVMioBsyJH7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/4oNsNuarhY=;2AEE5wTYcQOB3A7Pkr9zoTxijcE
 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
 +8k22qo=
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

On 8/24/25 17:23, Chelsy Ratnawat wrote:
> Use string_choices.h helpers instead of hard-coded strings.
>=20
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>   drivers/video/fbdev/core/fbmon.c    | 7 ++++---
>   drivers/video/fbdev/nvidia/nvidia.c | 3 ++-
>   drivers/video/fbdev/pxafb.c         | 3 ++-
>   3 files changed, 8 insertions(+), 5 deletions(-)

applied.

Thanks!
Helge
