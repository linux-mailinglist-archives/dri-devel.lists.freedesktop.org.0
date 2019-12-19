Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E277E126E0E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 20:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292E76E3CE;
	Thu, 19 Dec 2019 19:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EAE6E3CE;
 Thu, 19 Dec 2019 19:39:03 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF46C227BF;
 Thu, 19 Dec 2019 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576784343;
 bh=uJm4jvux9MuuNbHKtwxAPbxkxjWoPXqWjllj1M32RjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZbLazEACfPBAOHrYpCHQeXom0uBE7xt9sHfwefIGotmi/OGyzl2JI8metT64wkYBK
 sKQ7XcHenPRlDV7RVBc31L/OBklaSENRaH8Umi2qZLdJFeL8D8aoNiXwMUjMlVL+TU
 pTc3j2CjLiUe9Lj7HhBTMHSWjfpu4NxyGitKs+fs=
Date: Thu, 19 Dec 2019 14:39:01 -0500
From: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.4 143/350] drm/nouveau: Resume hotplug
 interrupts earlier
Message-ID: <20191219193901.GO17708@sasha-vm>
References: <20191210210735.9077-1-sashal@kernel.org>
 <20191210210735.9077-104-sashal@kernel.org>
 <90e9126b9692ce6a1b0fcd85a4d0327bf818e58a.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90e9126b9692ce6a1b0fcd85a4d0327bf818e58a.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Juston Li <juston.li@intel.com>,
 nouveau@lists.freedesktop.org, Harry Wentland <hwentlan@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 04:29:54PM -0500, Lyude Paul wrote:
>huh? Not sure how this got put in the stable queue, but this probably should
>be dropped. this was prepatory work for some MST functionality that got added
>recently, not a fix.

Dropped, thanks!

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
