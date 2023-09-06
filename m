Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E009793457
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 06:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C1910E207;
	Wed,  6 Sep 2023 04:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-219.mta0.migadu.com (out-219.mta0.migadu.com
 [91.218.175.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6D510E572
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 04:14:15 +0000 (UTC)
Message-ID: <eccd1d51-68f5-2bd8-890e-6d7c422abce6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693973653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReUbfyeD3q8qKsZb9bv3mQc4hrhuGmFA0TdHPFwtCxA=;
 b=v516R8djVSQGBsC8dKVonWQw8LG8OnWSMj1zPxIIlXE12/9RexGW4MGevXucxjR0rNJrmV
 3BtBSLSs7/GM22h6yWJqwC6ViryP4klO1hhy4Sx/M0r1YrJ5F0rWpvqi2nfUBshaG1o+Kr
 NPnzupOYzec1IsJJ9tzGoxXDJhFy538=
Date: Wed, 6 Sep 2023 12:14:01 +0800
MIME-Version: 1.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 suijingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/9/5 23:05, Thomas Zimmermann wrote:
> You might have found a bug in the ast driver. Ast has means to detect 
> if the device has been POSTed and maybe do that. If this doesn't work 
> correctly, it needs a fix.
>
That sounds fine.

The bug is not a big deal, I'm just take it as an example and report it to you.
But a real fix can be complex, because there are quite a lot of servers
ship with ASpeed BMC hardware.

Honestly I don't have the time fix it on formal way.
I have already tons patches in pending and I will focus on solve VGAARB related problem.


Because I want to test your patch occasionally.
So this series is useful for myself at corner cases.

