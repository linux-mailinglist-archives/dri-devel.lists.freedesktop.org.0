Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C426AAD8E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 00:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104AA10E191;
	Sat,  4 Mar 2023 23:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Sat, 04 Mar 2023 23:53:28 UTC
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F8710E191;
 Sat,  4 Mar 2023 23:53:27 +0000 (UTC)
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id 4120D140557;
 Sat,  4 Mar 2023 23:48:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf13.hostedemail.com (Postfix) with ESMTPA id 417882000E; 
 Sat,  4 Mar 2023 23:48:06 +0000 (UTC)
Message-ID: <ed3f46b20241a87f666a92441383e7fa55d9eadb.camel@perches.com>
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
From: Joe Perches <joe@perches.com>
To: Harry Wentland <harry.wentland@amd.com>, Deepak R Varma <drv@mailo.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>
Date: Sat, 04 Mar 2023 15:48:05 -0800
In-Reply-To: <4d670a5c-b680-ba76-a640-88b3d945c0b0@amd.com>
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
 <33ecbe8971bb9c90d72c67d43ca740abac160908.camel@perches.com>
 <Y82GHzOUHgEqTUq7@ubun2204.myguest.virtualbox.org>
 <Y/+z22xM7NNjX8VP@ubun2204.myguest.virtualbox.org>
 <f15b10a8-11f6-6c1f-c94e-71796aad9155@amd.com>
 <4d670a5c-b680-ba76-a640-88b3d945c0b0@amd.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 417882000E
X-Spam-Status: No, score=-0.10
X-Stat-Signature: q9xfrsjk38n5piktq6d4q37fccga1to1
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18QlYeO1+taMT/MFXb64RqiCoEVZ1/Sb8w=
X-HE-Tag: 1677973686-276631
X-HE-Meta: U2FsdGVkX19goUa4EftjyOuJipou1Ylsf6Z1FKTHQoXQEUdS0fJr4OAt8Vl+Sv2/VewZqmxFwEAnAlwEjOMI+A==
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-03-03 at 15:35 -0500, Harry Wentland wrote:
> Actually I was wrong. Too many similar-looking snippets in this
> function made me look at the wrong thing. This change is fine and
> Reviewed-by: Harry Wentland <harry.wentland@amd.com.

So why was the change made in the first place?

Please explain commit 9114b55fabae.

