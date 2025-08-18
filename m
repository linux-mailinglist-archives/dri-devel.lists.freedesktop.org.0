Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27601B29BFE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 10:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6073410E3E6;
	Mon, 18 Aug 2025 08:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MpHYspAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E20810E3F7;
 Mon, 18 Aug 2025 08:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 674415C5B0E;
 Mon, 18 Aug 2025 08:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D0CC4CEEB;
 Mon, 18 Aug 2025 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755505446;
 bh=oHe8L6AJ1HN36OrIi1UFNdMX8VNWXSRddHimq5CZjsQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MpHYspAzfcqUFGH9LU2mLKVPXtjQbW+njzf0JVMQ+IFJrXikO/Jkn8jcUWtD7SZjT
 xy1d4rUPAvp/ahldzFLNaLepm0HHfpgp+S01zniBRz9sxgnsX8KF4M8lelArs9G70n
 OcqZ8sEoJy0psmJbYv1vOvVzR7Vf/oKhXvrQrbrpkTsIkPfj/NQGAKS2HCukxYeoxk
 bibNys36behl8ImQvodAXJ3fbwL8MJWlJoKyxYd3UGaS2G++aJb1ZhatS4TO7HsnJ0
 ivrgiCPtKTEs9pfHj4X9DZQna25troV18QONGEBbYUkDBKZR73lbWy2N7Oc9bBW5NF
 cFGWCEMRBXKcg==
Message-ID: <cce242b2-dd21-446f-80f9-7f501aa15725@kernel.org>
Date: Mon, 18 Aug 2025 10:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Javier Garcia <rampxxxx@gmail.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250818123853.51aa3bc4@canb.auug.org.au>
 <aKLAc27XGAadB8n5@archie.me>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aKLAc27XGAadB8n5@archie.me>
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

On 8/18/25 7:56 AM, Bagas Sanjaya wrote:
> Danilo, can you please drop my commit (and kept Javier's one)?

I think yours is in drm-msm-fixes, which I don't maintain.

@Rob: Can you drop it please?
