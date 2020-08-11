Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2D2425D0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CB66E8B5;
	Wed, 12 Aug 2020 07:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25436E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 15:02:16 +0000 (UTC)
Received: from fsav108.sakura.ne.jp (fsav108.sakura.ne.jp [27.133.134.235])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 07BF2AxJ015080;
 Wed, 12 Aug 2020 00:02:10 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav108.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav108.sakura.ne.jp);
 Wed, 12 Aug 2020 00:02:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav108.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 07BF24QW015054
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Wed, 12 Aug 2020 00:02:10 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] vt: defer kfree() of vc_screenbuf in vc_do_resize()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1596034621-4714-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <0c9d8003-ba3f-8f2d-7c5a-56c5ca7db750@i-love.sakura.ne.jp>
 <20200804125831.GA221149@kroah.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <6053bc22-0876-f503-c1b6-3181a70d97de@i-love.sakura.ne.jp>
Date: Wed, 12 Aug 2020 00:02:03 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804125831.GA221149@kroah.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/08/04 21:58, Greg Kroah-Hartman wrote:
> On Tue, Aug 04, 2020 at 08:15:43PM +0900, Tetsuo Handa wrote:
>> Do you think this approach is acceptable? Or, do we need to modify set_origin() ?
>>
> I think what you have here is fine, as cleaning up set_orgin() might be
> hard to do at this point in time.
> 

Seems that there is no comment. Greg, will you pick up this patch?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
