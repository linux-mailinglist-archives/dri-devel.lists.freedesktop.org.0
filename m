Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC14C1E35
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 23:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F8410EF1D;
	Wed, 23 Feb 2022 22:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E92710EF1D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 22:06:43 +0000 (UTC)
Received: from fsav116.sakura.ne.jp (fsav116.sakura.ne.jp [27.133.134.243])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 21NM6YoW077606;
 Thu, 24 Feb 2022 07:06:34 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav116.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp);
 Thu, 24 Feb 2022 07:06:34 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav116.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 21NM6VT6077592
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 24 Feb 2022 07:06:34 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <99c94cb1-4191-23e0-abaa-cd2158a1bc89@I-love.SAKURA.ne.jp>
Date: Thu, 24 Feb 2022 07:06:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] workqueue: Warn flush attempt using system-wide
 workqueues
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
References: <71d6f14e-46af-cc5a-bc70-af1cdc6de8d5@acm.org>
 <309c86b7-2a4c-1332-585f-7bcd59cfd762@I-love.SAKURA.ne.jp>
 <aa2bf24e-981a-a811-c5d8-a75f0b8f693a@acm.org>
 <2959649d-cfbc-bdf2-02ac-053b8e7af030@I-love.SAKURA.ne.jp>
 <YgnQGZWT/n3VAITX@slm.duckdns.org>
 <8ebd003c-f748-69b4-3a4f-fb80a3f39d36@I-love.SAKURA.ne.jp>
 <YgqSsuSN5C7StvKx@slm.duckdns.org>
 <2f887679-c783-bf18-a2aa-aa9a709bfb38@I-love.SAKURA.ne.jp>
 <CGME20220223212048eucas1p1fab5e35ff398eff57808a8f1125dd15f@eucas1p1.samsung.com>
 <4e5fe60d-abbb-6e73-b8cc-c3e1a314fbce@samsung.com>
 <Yhaop3T53bHo7v2I@slm.duckdns.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Yhaop3T53bHo7v2I@slm.duckdns.org>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>, jgg@ziepe.ca,
 Haakon Bugge <haakon.bugge@oracle.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/02/24 6:35, Tejun Heo wrote:
> Tetsuo, can you please revert the patch? The patch is incorrect in that it's
> triggering also on work item flushes, not just workqueue flushes.

OK. I removed these patches from my tree.
