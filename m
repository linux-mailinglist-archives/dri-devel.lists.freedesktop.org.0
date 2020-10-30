Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EEB29FFD0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AD26ECFB;
	Fri, 30 Oct 2020 08:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn
 [202.108.3.17])
 by gabe.freedesktop.org (Postfix) with SMTP id D2BA86E935
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 02:34:39 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([103.193.190.174])
 by sina.com with ESMTP
 id 5F9B7BB900032D97; Fri, 30 Oct 2020 10:34:35 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 45875249283506
From: Hillf Danton <hdanton@sina.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v4 5/7] dma-buf: system_heap: Allocate higher order pages
 if available
Date: Fri, 30 Oct 2020 10:34:27 +0800
Message-Id: <20201030023427.3078-1-hdanton@sina.com>
In-Reply-To: <n>
References: <n>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 12:34:51 -0700 John Stultz wrote:
> 
> As for your comment on HPAGE_PMD_ORDER (9 on arm64/arm) and
> PAGE_ALLOC_COSTLY_ORDER(3), I'm not totally sure I understand your
> question? Are you suggesting those values would be more natural orders
> to choose from?

The numbers, 9 and 3, are not magic themselves but under the mm diretory
they draw more attentions than others do. Sometimes it would take two
minutes for me to work out that HPAGE_PMD_ORDER does not mean 1MiB, on
platforms like arm64 or not.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
