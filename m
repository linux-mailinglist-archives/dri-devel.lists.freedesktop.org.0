Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7C2205B4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D458E6E457;
	Wed, 15 Jul 2020 07:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1E6E82D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 10:30:00 +0000 (UTC)
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06EATuWX001908;
 Tue, 14 Jul 2020 19:29:56 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Tue, 14 Jul 2020 19:29:56 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06EATu7b001905
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 Jul 2020 19:29:56 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [drm/ttm] Memory corruption problem when ttm_tt_init() fails.
To: Gu Jinxiang <gujx@cn.fujitsu.com>
References: <201501212056.ACF39099.FLVMFOHOSQtFOJ@I-love.SAKURA.ne.jp>
 <20200714091305.11255-1-gujx@cn.fujitsu.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <e63d176e-9258-d35e-78be-cad10c470074@i-love.sakura.ne.jp>
Date: Tue, 14 Jul 2020 19:29:56 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714091305.11255-1-gujx@cn.fujitsu.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/07/14 18:13, Gu Jinxiang wrote:
> I've encountered [BUG: unable to handle kernel NULL pointer dereference at] which has call stack like your pattern2.
> And before this happended, I got a lot of memory allocation failure warnings.
> And my kernel is 3.10.0-327.62.1.el7.x86_64.
> 
> Since, you mentioned it may be a bug of drm/tmm. So, I checked drm/ttm for possible patch to fix this problem, but found nothing.
> Could you please tell me is there any progress of this problem that you detected.

I'm not aware of any progress on https://patchwork.kernel.org/patch/5681611/ .
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
