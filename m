Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58395A0C413
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 22:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039E610E7F6;
	Mon, 13 Jan 2025 21:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fper8PUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9EB10E7F6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 21:48:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49646A410D7;
 Mon, 13 Jan 2025 21:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B0AC4CED6;
 Mon, 13 Jan 2025 21:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736804899;
 bh=vsfyc46Z0PnrAXppERmVKpnnK/HWNH6QS4zNaQkHg8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fper8PUFVzjqrG3pWSoxFTsemVLwlQB32PFKfTuXo5tA/sLNmyeX8imTrtusYsARk
 TyyRxiLt8m89jJwaSyikjfNSdMPvCqJShqv76bUHL2MS8MMpyRsuZnYlbr6DYyu0jv
 LtRpaVC0R4va2IduVCLeYqhOZKTiIKEMmOOU5ZJncyy39HDct/YBjiMO3EcXD++8dJ
 nsyOSBoLSwjDT+RrGsZjesKw5MOYJL1lawbl3ncR57UH1jXI1zt6nDDNzRzOLFQUaS
 w39x4pW93tmTSZ4TRhcAfvo19P4HofSFQYOIi6YMBDJekLIMO48ex5gKv3DWbQCz5V
 MtW+rUE8uMjew==
Date: Mon, 13 Jan 2025 16:48:17 -0500
From: Sasha Levin <sashal@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <Z4WKIbVzo8d-nln3@lappy>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 10:44:41AM +1000, Dave Airlie wrote:
>Pretty sure we've explained how a few times now, not sure we can do much more.
>
>If you see a commit with a cherry-pick link in it and don't have any
>sight on that commit in Linus's tree, ignore the cherry-pick link in
>it, assume it's a future placeholder for that commit id. You could if
>you wanted to store that info somewhere, but there shouldn't be a
>need.
>
>When the initial commit enters during the next merge window, you look
>for that subject or commit id in the stable tree already, if it
>exists, dump the latest Linus patch on the floor, it's already in
>stable your job is done.

We can't rely too heavily on the subject line. Consider the following two
very different commits that have the same subject line:

	3119668c0e0a ("drm/amd/display: avoid disable otg when dig was disabled")
	218784049f4b ("drm/amd/display: avoid disable otg when dig was disabled")

Now, if a new commit lands and it has the following "Fixes:" tag:

	Fixes: abcdef12345 ("drm/amd/display: avoid disable otg when dig was disabled")

Does it refer to one of the older commits? Or a new commit that will
show up during the merge window?

Or... What happens if a new commit with the very same subject line shows
up, and it has a cherry-pick link that points to a completely different
commit that is not in the tree yet? :)

But just in general, there are so many odd combinations of commits where
trying to follow the suggestion you've made will just break...

Something like these two identical commits which are not tagged for stable:

	21afc872fbc2 ("drm/amd/display: Add monitor patch for specific eDP")
	3d71a8726e05 ("drm/amd/display: Add monitor patch for specific eDP")

And the following two identical ones which are tagged for stable:

	b7cdccc6a849 ("drm/amd/display: Add monitor patch for specific eDP")
	04a59c547575 ("drm/amd/display: Add monitor patch for specific eDP")

-- 
Thanks,
Sasha
