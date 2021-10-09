Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25150427771
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 06:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B6F6E122;
	Sat,  9 Oct 2021 04:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Sat, 09 Oct 2021 04:51:26 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB706E122
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 04:51:26 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4HRCD149mdzBD;
 Sat,  9 Oct 2021 06:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1633754722; bh=Al+d/dwu71Q5HoylR3UebWD0GQaPId+64C/tD/x2YQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jFCkbVP0VfQ/BHVuHi9ZYoge27n8XkONTxxdvdPLzq8Gi/CcweU4F23N8GJq/1kI/
 n3sV9GAvGLOfnrz/j8pc0NI3jpV9MKyjvwPZR9I5knrvElk5HjcZ6HJ9nVOVKDGwrO
 shzhW1X6a/mBFG0MYNoDP6t0ICYexozbthxhFQW7dzVz8WcWkWMkpCQXuRIryU8gIy
 /dEK3n74/cpTr1p1hEZGDBhnbu6b6ybzyhgZwDW2EvOxfcJPHxnmwsoVgQ18UeIS0o
 WbJIkwTKRygjcjpbwbBh6XnnU86M4iv8Tqx4FAiCZtPFMEE7dASV3uOGhSDn5Ta2QB
 lf+v+zzxLSk4w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sat, 9 Oct 2021 06:45:17 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/6] lib/scatterlist: Add contiguous DMA chunks helpers
Message-ID: <YWEeXZOPslG0v7N2@qmqm.qmqm.pl>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
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

On Thu, Sep 16, 2021 at 11:43:59AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add a few helpers to count the number of contiguous DMA chunks found in
> an SG table. This is useful to determine whether or not a mapping can be
> used by drivers whose devices need contiguous memory.
[...]

Is the counting of all blocks necessary if all to be checked is whether
there is more than one continuous block?

Best Regards
Micha³ Miros³aw
