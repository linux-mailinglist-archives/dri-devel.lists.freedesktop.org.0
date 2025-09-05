Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4155B462FB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 21:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0042810EC37;
	Fri,  5 Sep 2025 19:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.b="aXe8Ba8+";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="aFTjsHbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD610EC37
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1757098820;
 x=1757703620; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8+x8qYlJ6YOCtCU6AlXwjgVvVUNmKVQbFdRWmtxYFtM=;
 b=aXe8Ba8+EXOmlohbKSn3PdbgJRATq5rBi0F+b4UiMRrEh/erW9Ec0K0rsIVwcYXpHdN8rbC3rqYNj
 ih2ofQzs5z+va4A3I/VIu8zjRCoqC6s0mkd6FMStP08WXJRSC9Ltv5VFG1AylPRmGkS3SX5y+iIWze
 wyiKetO2T2tnSMCS+GNhJvYz1Oy57UBfUZPqTFcUlEL4asMJKcl40aoW1sh3WZkKznSVAjvMMoftVH
 lACH58bMEgkhd/niu8SqlW/D1BawEsZM8EkbqI9Y3mMDtlJuDMza63EMALJe1to5Yy0QqvGtMKOgHZ
 lAG96mEbVcmUj9qJ61k8b+RqPA0DuUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1757098820;
 x=1757703620; d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8+x8qYlJ6YOCtCU6AlXwjgVvVUNmKVQbFdRWmtxYFtM=;
 b=aFTjsHbHxPEJAbfIEIABcbNISgWWSks4nYGCibeYM2hciTddfN7Yt++HrcCtk8QnDuWSQLOmznphN
 qEyPwaTDg==
X-HalOne-ID: 90ef236e-8a8a-11f0-90a9-f78b1f841584
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 90ef236e-8a8a-11f0-90a9-f78b1f841584;
 Fri, 05 Sep 2025 19:00:20 +0000 (UTC)
Date: Fri, 5 Sep 2025 21:00:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] fbcon: Fix empty lines in fbcon.h
Message-ID: <20250905190018.GC361827@ravnborg.org>
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818104655.235001-2-tzimmermann@suse.de>
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

On Mon, Aug 18, 2025 at 12:36:36PM +0200, Thomas Zimmermann wrote:
> Add and remove empty lines as necessary to fix coding style. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
