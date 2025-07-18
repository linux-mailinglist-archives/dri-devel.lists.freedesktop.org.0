Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45731B0A4E1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 15:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEBA10E9C3;
	Fri, 18 Jul 2025 13:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lMnSJBlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2ACB10E9C2;
 Fri, 18 Jul 2025 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AwU7bt8MAvt9UXAndNFX+doc5wRh0645T3vY748a7p8=; b=lMnSJBlWkX8FSxQuOMoUSOKkbl
 7ChAXCwspgLSj7A56x+UI07xXtZUXgV8HRhCZ1U55csorv1oFe9zvobtBoQg/1qIWpqzTgylXLICC
 2WpJEI145+nu6ovJxSCOtVS8AHGsQfP0Aw/gg8T6YxsBQIGjxTnbRtjkqbd+dw87rneNcPAj0Qv7X
 A0wyX/7mJWG7QUzVGM1pzz3Vk+n98oqwPPK5Cd14jMKT2FwquCkbh1BFU2ZXr10jwo90ciK6B1dqP
 xj35hTdz5sQoEkwb5yrlVJj2bARF785hE6VwI4Y5SSjd1bqL0RufYubd2X3F1zvGbbaZaq1MgFsoW
 N74Gpvsg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucksP-000a1q-4B; Fri, 18 Jul 2025 15:11:49 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1ucksM-00Ae9x-M1; Fri, 18 Jul 2025 15:11:48 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail with esmtp (Exim 4.96) (envelope-from <mwen@igalia.com>)
 id 1ucksM-00FOx5-0J; Fri, 18 Jul 2025 15:11:46 +0200
MIME-Version: 1.0
Date: Fri, 18 Jul 2025 12:11:46 -0100
From: Melissa Wen <mwen@igalia.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 airlied@gmail.com, simona@ffwll.ch, "Hung, Alex" <Alex.Hung@amd.com>, "Liu,
 Charlene" <Charlene.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
In-Reply-To: <8d859c5f-2551-4624-a9b8-a816f1809feb@linux.dev>
References: <20250717143738.84722-1-mwen@igalia.com>
 <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
 <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
 <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
 <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
 <67169725b87e02cc8fdc19be5fc7df59@igalia.com>
 <CAD9O9Dq=dAsMs5a3VzgSvLwfuYYhkARDFBXyWUy+yktEZv5WbQ@mail.gmail.com>
 <bdfc8786-d4b8-4391-a4d4-c5fe06020802@igalia.com>
 <CAD9O9DqxJQyAJM=po4yDbAC=hHK2pi12qTVYeb+ar_GenGpMnw@mail.gmail.com>
 <478eb8175779f03a399f7d933614e14c@igalia.com>
 <8d859c5f-2551-4624-a9b8-a816f1809feb@linux.dev>
Message-ID: <801d0d97e7cdd1eb3b845347ccb5ddbf@igalia.com>
X-Sender: mwen@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --
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

On 18-07-2025 00:51, Matthew Schwartz wrote:
[...]
> 
> Sure, going to use my Legion Go S w/ Z2 Go for this (DCN 3.1.2). All
> of these are from amd-staging-drm-next with AMD_PRIVATE_COLOR=y.
> 
> DTN log from Hades II with MangoHud enabled:
> https://gist.github.com/matte-schwartz/0c290ffe99bdb4f0d7369ee8817d1145
> 
> DTN log from Hades II with MangoHud disabled:
> https://gist.github.com/matte-schwartz/3e2867e192ec9742ec545d2c5dd3096a
> 
> drm_info from Hades II with MangoHud enabled:
> https://gist.github.com/matte-schwartz/456684fc60f7e84173ee2f42de4b774b
> 
> drm_info from Hades II with MangoHud disabled:
> https://gist.github.com/matte-schwartz/6b635fa584d033234b435667f5d2c153
> 

Hey Matthew,

Thanks for the logs.
There is actually a difference between your hw and Steam Deck in terms
of pipe split.
With your hw, there is no pipe split in both scenarios. However, on
Steam Deck with MangoHud disabled, we can see the split (2 planes):

HUBP:  format  addr_hi  width  height  rot  mir  sw_mode  dcc_en 
blank_en  clock_en  ttu_dis  underflow   min_ttu_vblank       qos_low_wm
     qos_high_wm
[ 0]:      8h      f4h   1280     400   3h   0h      1bh       1        
0         1        0         0h           36.562            0.000       
   33.854
[ 1]:      8h      f4h   1280     400   3h   0h      1bh       1        
0         1        0         0h           36.562            0.000       
   33.854
[ 2]:      8h      f4h   1280     400   3h   0h      1bh       1        
0         1        0         0h           36.562            0.000       
   33.854
[ 3]:      8h      f4h   1280     400   3h   0h      1bh       1        
0         1        0         0h           36.562            0.000       
   33.854

For completion, this is the DTN log of Steam Deck with MangoHud enabled
(3 planes, no pipe split):

HUBP:  format  addr_hi  width  height  rot  mir  sw_mode  dcc_en 
blank_en  clock_en  ttu_dis  underflow   min_ttu_vblank       qos_low_wm
     qos_high_wm
[ 0]:      8h      f4h   1280     800   3h   0h      1bh       1        
0         1        0         0h           44.708            0.000       
   33.854
[ 1]:      0h       0h      0       0   0h   0h       0h       0        
0         0        0         0h            0.000            0.000       
    0.000
[ 2]:      8h      f4h   1280     800   3h   0h      1bh       1        
0         1        0         0h           44.708            0.000       
   33.854
[ 3]:      8h      f4h   1280     800   3h   0h      1bh       1        
0         1        0         0h           44.708            0.000       
   33.854

I couldn't find a pipe-split policy specific for 3.1.2, but I guess it
follows the 3.1 Dynamic policy, that is the same of the Steam Deck:

drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c:863:    
.pipe_split_policy = MPC_SPLIT_DYNAMIC,
drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c:883:  
.pipe_split_policy = MPC_SPLIT_DYNAMIC,
drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c:863:  
.pipe_split_policy = MPC_SPLIT_DYNAMIC,
drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c:858:  
.pipe_split_policy = MPC_SPLIT_DYNAMIC,

I remember that we have discussed about the possibility of workaround
those glitches by avoiding pipe split (and then we would avoid the
"split" transition), right?

In short, there is a chance that you are not seeing those glitches
because there are no changes in the pipe split when transitioning
between 1-2 overlay planes in your hw, but the split happens on steam
deck for some reasons. I don't know how the driver decides whether or
not to split pipes.

That said, if AMD prefers to go with an exception for steam deck, better
if this situation is documented.

Steam Deck still needs the clear_update_flags() because it uses plane
color caps and therefore sets multiple update flags, and some glitches
appear when transitioning from 2 planes (with pipe split) to 3 planes
(no pipe split). It might be related to minimal transition machinery.

Thank you for all inputs.

Melissa
