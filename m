Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604886914C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 14:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95210E6F0;
	Tue, 27 Feb 2024 13:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="Cg4NfOZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8E710E541;
 Tue, 27 Feb 2024 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=ZgGnPyp+t6CDuIJOxG2eFF8f52fwW7PChDnQXlWlBiU=;
 t=1709039123; x=1709471123; b=Cg4NfOZ07MPQPcntNyUtqqPnhm2nUjyCsrerychcHi96f0n
 xLxjMW5e+JM87f2dDIc1fBO7nRbGXeUroRebLkW/RpzaI7EWEMqpvRRICYjHTGgQXyuQzrmA7TI//
 qH+pvsHzxuTkJv9kh6Ft0QTNZXo4HOq0c5IvFZ/iQIQZlaRxK+H23RLfuuR/H4/bs9jxN1uHuFuNM
 FJwSO8cp0yAt+MEfHoG3iAhktnHaOyWJQlu/IumhGgPpxQESPSdfi4ZWTv+ao42qFtujly9e6V2cv
 iOXzZ7vGF49D731UC4BStppr5aqedYkml0CxsSVZJ1mb+0jyNcahMYegEc2+dP/A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rex96-0008H6-RV; Tue, 27 Feb 2024 14:05:20 +0100
Message-ID: <8c444bff-99ae-410a-9c8f-96ec6d3ae2e3@leemhuis.info>
Date: Tue, 27 Feb 2024 14:05:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm: VT console DisplayPort regression in 6.8-rc1
Content-Language: en-US, de-DE
To: Johan Hovold <johan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <Zd3YPGmrprxv-N-O@hovoldconsulting.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <Zd3YPGmrprxv-N-O@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1709039123;
 f703608c; 
X-HE-SMSGID: 1rex96-0008H6-RV
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[send with a reduced set of recipients, we all get enough mail already]

On 27.02.24 13:40, Johan Hovold wrote:
> 
> Since 6.8-rc1 the VT console is no longer mirrored on an external
> display on coldplug or hotplug on the Lenovo ThinkPad X13s.
>

Thx for the report!

> I've previously reported this here:
> 
> 	https://gitlab.freedesktop.org/drm/msm/-/issues/50

Then let's tell regzbot about is as well, in case the ticket comes back
to life now:

#regzbot duplicate: https://gitlab.freedesktop.org/drm/msm/-/issues/50

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
