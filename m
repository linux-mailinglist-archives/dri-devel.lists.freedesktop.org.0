Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B196EF4C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 14:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8C910E2BA;
	Wed, 26 Apr 2023 12:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801B110E2BA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 12:54:52 +0000 (UTC)
Received: from [192.168.100.4] (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 05F3766031F7;
 Wed, 26 Apr 2023 13:54:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682513690;
 bh=yOsGY1q1xwneL+HoDqmYZo9WFj0lUI0fY5zTMUuKoqo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LcqCDzeywUl4RiXg3rWUAkEIbQpNhLbxD08MdTbr8mv1OjhA0tbt6eA+RTSJl36Hu
 tuWqrc7Ee3INemyJ7sLlemt1njwCpPXp2HwY5KWXeTXhyEAaqV0uzO4k3R53X9eEx/
 w5AXSextls/Hn0RenKOEgYSEVMVoBw7rPBTUB1esSscoltBTEP4orPsk6j0kEoxj9N
 6QlfZn/+YLWg1IK+GnZMSCoi97Mums/WuTfNR5H6PZYAMvrghiD5RYR9lufPqNwRBW
 AppXQuwADeGF3HuHi4/hQKDKuylHYls96DdScOvvqHEsnaL1JTE78noH8lutVKX5r/
 IlbBovRoe3eXA==
Message-ID: <a2239e16-31e8-3163-b349-8fc3328f33ed@collabora.com>
Date: Wed, 26 Apr 2023 15:54:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] drm/vkms: Add support for multiple pipes
Content-Language: en-US
To: Brandon Ross Pollack <brpol@chromium.org>, yixie@chromium.org
References: <20230425073012.11036-1-marius.vlad@collabora.com>
 <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
From: Marius Vlad <marius.vlad@collabora.com>
In-Reply-To: <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, tzimmermann@suse.de,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brandon, Xie,

Thanks for reaching out, and for the heads-up. I need to take a closer 
look, but by glancing over it, using configFS would be really awesome. 
Think we could really benefit from having that in our CI and being able 
to customize the entire pipeline. I'm totally for that.

It looks like it requires some infra work so I guess landing that might 
require quite a bit of time. Not sure if there are recent updates for it.

My changes are quite trivial and much more focused on just having 
multiple virtual displays, so IDK, I've submitted a version that seems 
to work, so I guess others should or would decide if we should drop mine 
and focus on the configFS series, or we should go with configFS as a 
follow-up. Would have liked to get something in the tree so we can at 
least have something to work with.

Thoughts on the matter on how should we go about it?

On 4/26/23 05:06, Brandon Ross Pollack wrote:
> We're doing/planning on doing similar or related work here at chromium.
> 
> https://patchwork.kernel.org/project/dri-devel/list/?series=662676&submitter=&state=&q=&delegate=&archive=both <https://patchwork.kernel.org/project/dri-devel/list/?series=662676&submitter=&state=&q=&delegate=&archive=both>
> 
> Here's the stuff we have now (we're currently rebasing and touching it 
> up, myself and @Yi Xie <mailto:yixie@google.com> will be taking over 
> this work.
> 
> Our plans are to add configFS changes and DRI VKMS changes to be able to 
> add and remove virtual displays at runtime (among other things needed 
> for our own testing purposes for our Exo wayland implementation).
> 
> We're still learning how this all works and comes together, but it is 
> worth letting you know "us too"
> 
> We can chat more and see where we overlap and can learn from each other :)
> 
> On Tue, Apr 25, 2023 at 4:30 PM Marius Vlad <marius.vlad@collabora.com 
> <mailto:marius.vlad@collabora.com>> wrote:
> 
>     With multiple pipe available we can perform management of outputs at
>     a more granular level, such that we're able to turn off or on several
>     outputs at a time, or combinations that arise from doing that.
> 
>     The Weston project use VKMS when running its test suite in CI, and we
>     have now uses cases which would need to ability to set-up the outputs
>     DPMS/state individually, rather than globally -- which would affect all
>     outputs. This an attempt on fixing that by giving the possibility to
>     create more than one pipe, and thus allowing to run tests that could
>     exercise code paths in the compositor related to management of outputs.
> 
>     v3:
>        - Apply the series against drm-misc-next (Maíra Canal)
>        - Add a lower range check to avoid passing negative values to
>        max_pipes (Maíra Canal)
> 
>     v2:
>        - Replace 'outputs' with 'pipes' as to use the proper terminology
>          (Thomas Zimmermann, Maíra Canal)
>        - Fixed passing wrong possible_crtc bitmask when initializing the
>          write back connector which address kms_writeback failure (Maíra
>     Canal)
>        - Add a feat. note about moving overlay planes between CRTCs
>     (Melissa Wen)
> 
>     Marius Vlad (3):
>        vkms: Pass the correct bitmask for possible crtcs
>        vkms: Add support for multiple pipes
>        Documentation/gpu/vkms.rst: Added a note about plane migration
> 
>       Documentation/gpu/vkms.rst            |  5 +++--
>       drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>       drivers/gpu/drm/vkms/vkms_drv.c       | 31 +++++++++++++++++++++------
>       drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++++---
>       drivers/gpu/drm/vkms/vkms_output.c    |  7 +++---
>       drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++-----------
>       6 files changed, 53 insertions(+), 29 deletions(-)
> 
>     -- 
>     2.39.2
> 
