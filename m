Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35547376427
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 12:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DD06E03F;
	Fri,  7 May 2021 10:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CF76E03F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 10:59:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF7F061008;
 Fri,  7 May 2021 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620385191;
 bh=cpVqxoC1cpXrXhppi6Tzpo5T6Gjjru2B/3/Qjj2uCf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FDftllqITBt3j6LJLBjdHzdw7b0lFOIQgzWYoQDFV37l8qMvOEIMgNbkxtciVQqh4
 wLhDsyLkJUN/2uX2yQ5cDl7ebo9OtZf+j7VogLl4J/aGht8/h/A0T0uQX1jeLGhS+C
 8SMNo+D01M+oaNkcf5ie132ee7NT1Jib3mOWP3mTWHwmFz4OU2bFFs2bMIZGNT9ozK
 kTduP0egsoKpV4fMrt/RQpYrelHrtPN5iJi6tBsFDyQwWyjrTOTlkUtCA28cw2ro+i
 CLfsFZw6dtlHcKz/d+4WDlg7lRknLygGh6kDo94woM8sIGB83YbLeDAY229uOUBev/
 nCWIdAT96Lk3Q==
Date: Fri, 7 May 2021 06:59:49 -0400
From: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH AUTOSEL 4.9 08/24] drm/bridge/analogix/anx78xx: Setup
 encoder before registering connector
Message-ID: <YJUdpQBx0pMbIPQG@sashalap>
References: <20210503164252.2854487-1-sashal@kernel.org>
 <20210503164252.2854487-8-sashal@kernel.org>
 <59cd454b3a104a3a469a94be95cc860ced7581bd.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <59cd454b3a104a3a469a94be95cc860ced7581bd.camel@redhat.com>
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
Cc: Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 01:14:10PM -0400, Lyude Paul wrote:
>I would drop this patch for all of the stable kernel versions, it doesn't
>really fix any user reported issues.

Will do, thanks!

-- 
Thanks,
Sasha
