Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8B97A2A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 14:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6210E363;
	Mon, 16 Sep 2024 12:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="echudXlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de
 [129.70.45.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5870A10E364
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1726491506;
 bh=xN5mmjcCpHBK9DyxsmdP/tUgRnYkamPvNBmf0U77C7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=echudXlO8miH2TOw9Z5GQW+uMBfWfL3DvRDhPZ79ibl+f2Q0Vde+TzTgtHAjb03Va
 63tqmlS/HHezkWMcItLR8WvhVJecZjOoKH+vl4TbcBcd5EdYMtGxo216F0Xgruetf/
 d89zB5rNpzChJVpcEduuvhy6KkVXhXf2yCHTDmxToowM1uuCZ3oNgAWDXb6nto88/p
 QvetRQGa5btOh1K9918O45vLA+9qEJvjuhNIt4Kc28QwEJXBiCPQCVDrltxorVsUB4
 yVvbxAVYOlJb49V8lqKkjTjUeJIxgu+6lVYeZHicqJh31PXOwSjfjWOiXlHq7WGvJg
 GT7Lq7+bVN9OQ==
Received: from [192.168.0.106]
 (dslb-088-074-203-146.088.074.pools.vodafone-ip.de [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 5AC2A2080C;
 Mon, 16 Sep 2024 14:58:25 +0200 (CEST)
Message-ID: <4d69172b-dd12-433c-a030-3d48f2716e0a@math.uni-bielefeld.de>
Date: Mon, 16 Sep 2024 14:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
References: <20240916141517.3ef8b349@canb.auug.org.au>
Content-Language: en-US
From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Autocrypt: addr=tjakobi@math.uni-bielefeld.de; keydata=
 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
 JRHWPGCL3BhOxQ==
In-Reply-To: <20240916141517.3ef8b349@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/16/24 06:15, Stephen Rothwell wrote:

> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>    drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
>
> between commit:
>
>    e835d5144f5e ("drm/amd/display: Avoid race between dcn35_set_drr() and dc_state_destruct()")
>
> from Linus' tree and commit:
>
>    be7a6a517164 ("drm/amd/display: Check stream pointer is initialized before accessing")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
On close inspection it might be worthwhile to take the same precautions 
that we now take with tg, also with pipe_ctx[i]->stream.

@Alex: What do you think?

With best wishes,
Tobias

