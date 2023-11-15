Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A07EBCDC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 06:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBDC10E4A8;
	Wed, 15 Nov 2023 05:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net
 [46.105.59.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1649C10E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:52:56 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.143.175])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 6E5FA28AB1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:52:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-p7h5p (unknown [10.109.156.181])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B9F281FE33;
 Wed, 15 Nov 2023 05:52:52 +0000 (UTC)
Received: from RCM-web6.webmail.mail.ovh.net ([151.80.29.20])
 by ghost-submission-6684bf9d7b-p7h5p with ESMTPSA
 id KK+VK7RcVGUPGyAA34RSKA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 15 Nov 2023 05:52:52 +0000
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 07:52:52 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: fix NULL dereference
In-Reply-To: <689f3862-09d5-448d-b418-fd52d7288106@amd.com>
References: <20231114152751.30167-1-jose.pekkarinen@foxhound.fi>
 <689f3862-09d5-448d-b418-fd52d7288106@amd.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <87904eedaf4170e2302450eaa27f57d0@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 45.151.167.10
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6680527099856594625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefhedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpgeehrdduhedurdduieejrddutddpudehuddrkedtrddvledrvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
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
Cc: Wayne.Lin@amd.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, srinivasan.shanmugam@amd.com, mikita.lipski@amd.com,
 christian.koenig@amd.com, linux-kernel-mentees@lists.linux.dev,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-14 23:01, Hamza Mahfooz wrote:
> On 11/14/23 10:27, José Pekkarinen wrote:
>> The following patch will fix a minor issue where a debug message is
>> referencing an struct that has just being checked whether is null or
>> not. This has been noticed by using coccinelle, in the following 
>> output:
>> 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:540:25-29: 
>> ERROR: aconnector is NULL but dereferenced.
>> 
>> Fixes: 5d72e247e58c9 ("drm/amd/display: switch DC over to the new DRM 
>> logging macros")
> 
> You only need the first 12 characters of the hash here. I have fixed it
> for you and applied the patch in this case. But, in the future please
> test your patches against `./scripts/checkpatch.pl` before submitting
> them.

     Oops! Sorry I didn't notice! Thanks!

     José.
