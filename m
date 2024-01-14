Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310B82D0EB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 15:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE7B10E183;
	Sun, 14 Jan 2024 14:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C1E10E079;
 Sun, 14 Jan 2024 14:34:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DDD86CE021B;
 Sun, 14 Jan 2024 14:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AF5C433F1;
 Sun, 14 Jan 2024 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705242846;
 bh=EszImnKYJnEnKFk1wt073gthk8M6xM7ENBGQn/T0edM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YRArPb4RPBK5ot3z0ZMSvwVELOPnXJAKuuuJj9y66aWMPRrNCtvXuxwYfTIi7G5eD
 C1FHSsamBbHNJeu3dMT/fYJXcbaTcofAAP6gYcV3adLquCsCXqxQs0kse1ALhluIIO
 It0E4jdkX8FSI78tOaSAy8mv2M1JIXUv2sXPZVxRBuTxxQabC8jwuOnjv+fAgm/jxE
 h9sqSe+9jF4gkFSBFm1a3sLN6iVmiX9WTU33xgknss7HFnQF1gXfY3ohSJIInIgTTL
 9hhF/Fl5RUTeIWp8ucrBo4SeNSfQnlWN6wAvvq4nJH5aj/9BZGtY4CVmfFqAQCR4cC
 N4P5HOW9L59sA==
Date: Sun, 14 Jan 2024 09:34:05 -0500
From: Sasha Levin <sashal@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH AUTOSEL 6.1 5/5] nouveau: fix disp disabling with GSP
Message-ID: <ZaPw3WAmT2OwHY98@sashalap>
References: <20240108122823.2090312-1-sashal@kernel.org>
 <20240108122823.2090312-5-sashal@kernel.org>
 <CAMwc25rAm1ndSiofWMMmQ1BeB0XxBvsHpcvaDKXUwEZp72iwEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMwc25rAm1ndSiofWMMmQ1BeB0XxBvsHpcvaDKXUwEZp72iwEA@mail.gmail.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dakr@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 06:51:25AM +1000, David Airlie wrote:
>NAK for backporting this to anything, it is just a fix for 6.7

Dropped it from everywhere, thanks!

-- 
Thanks,
Sasha
