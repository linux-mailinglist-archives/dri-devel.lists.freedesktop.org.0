Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2945A3D9E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 14:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDAC10E5A1;
	Sun, 28 Aug 2022 12:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6346E10E5A1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 12:59:20 +0000 (UTC)
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 27SCxHaq085734;
 Sun, 28 Aug 2022 21:59:17 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Sun, 28 Aug 2022 21:59:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 27SCxFkB085729
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 28 Aug 2022 21:59:17 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <df5e1060-7cb6-77e3-4f2e-9e97ac8693f5@I-love.SAKURA.ne.jp>
Date: Sun, 28 Aug 2022 21:59:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] gpu/drm/bridge/cadence: avoid flush_scheduled_work()
 usage
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <216591bc-28bb-0453-10bb-59e268dff540@I-love.SAKURA.ne.jp>
In-Reply-To: <216591bc-28bb-0453-10bb-59e268dff540@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No response since 2022-06-10. Can somebody take this patch?

On 2022/07/28 10:40, Tetsuo Handa wrote:
> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
> We are on the way for removing all flush_scheduled_work() callers from
> the kernel, and this patch is for removing flush_scheduled_work() call
>  from cadence driver.

