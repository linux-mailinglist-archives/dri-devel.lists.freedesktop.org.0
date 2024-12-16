Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DAA9F33EB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B713610E1A3;
	Mon, 16 Dec 2024 15:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k7JCrKe3";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="HtRQvMEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 701 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2024 15:01:55 UTC
Received: from a7-44.smtp-out.eu-west-1.amazonses.com
 (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6575910E1A3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1734360613;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=HTCibcZX4Oqfx4kcfKFkdqBLt2faApGXlyoGFbktpQ8=;
 b=k7JCrKe30VxdJQW0W+SCcY/k8hhDdsvsOdWeEAD0wDqta35ELDWEnXr5TeeNRufd
 bNSI1Eb8rtGBRYwTrlfZrRi/oDKeVBOOSqE7pPmNRo6Sv/zku61xr56xwMAtCGtUwGn
 Lqke26B01OM5nhAC5zHh6CVFfPLnx4uKgw+ZSanWDCpQEn4b+yKj3SXa8rAWG3pQw6w
 UhHNagzyjbgaz4ssLsg9u7Y3ObSvw5WLQ3sCEDjDZ0DxuLhRRJwrgKK6sVOk6vwT76C
 8vI8c1DoZLCbYVuBalQuZMU2FCFiultcpTqlEXWS4VCwyjPPt8K+HhPDODYI4HjO07d
 ibPVbwoj/g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1734360613;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=HTCibcZX4Oqfx4kcfKFkdqBLt2faApGXlyoGFbktpQ8=;
 b=HtRQvMEj9lD6sog2DZHPIlbqo5bGpb1RYpPXQhXKMQeAmV2Db1WlD7zvHQ5x9qWJ
 bLw1nXdM2O4NZnPDQ+9yxWgRHoxz9FjfD7RU0Uul+5b4b584pVGKV4kIrb00ScQYElO
 7MXJbQ2IWOXnGMuUcLXrxf1WM9sBobxoiq7oGWLs=
Message-ID: <01020193cff2c151-dd394f31-4b16-44b4-a101-3db2003051d5-000000@eu-west-1.amazonses.com>
Date: Mon, 16 Dec 2024 14:50:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: Allow clearing HDMI infoframes
To: dri-devel@lists.freedesktop.org
Cc: mripard@kernel.org, kernel@collabora.com, dmitry.baryshkov@linaro.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241202181939.724011-1-derek.foreman@collabora.com>
 <1d60edf3-1977-45cd-af10-e5085518afe0@collabora.com>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <1d60edf3-1977-45cd-af10-e5085518afe0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.16-54.240.7.44
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

Just a ping - is there anything further I need to do here?

On 2024-12-03 03:45, AngeloGioacchino Del Regno wrote:
> Il 02/12/24 19:19, Derek Foreman ha scritto:
>> Our infoframe setting code currently lacks the ability to clear
>> infoframes. For some of the infoframes, we only need to replace them,
>> so if an error occurred when generating a new infoframe we would leave
>> a stale frame instead of clearing the frame.
>>
>> However, the Dynamic Range and Mastering (DRM) infoframe should only
>> be present when displaying HDR content (ie: the HDR_OUTPUT_METADATA blob
>> is set). If we can't clear infoframes, the stale DRM infoframe will
>> remain and we can never set the display back to SDR mode.
>>
>> With this change, we clear infoframes when they can not, or should not,
>> be generated. This fixes switching to an SDR mode from an HDR one.
>>
>> Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
>> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
>
>
