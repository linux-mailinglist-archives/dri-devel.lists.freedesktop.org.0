Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA2A1BFA0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 01:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D38110E17C;
	Sat, 25 Jan 2025 00:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="iQxWnDTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84C910E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 00:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=qEzN7yyCU0bNMKiE6R5scslvJiSaVNoAUlJ8u2u4dc4=; b=iQxWnDTlDplcMNPo
 a+F3I99pQFYCrKiBRJhQH/1G1fiVfGVOUXXhLqOQpSMFFH5rQFh55YkljJ5RS83WJn2jeEUtAa50l
 F7Tf/xq+Sruz3UVhW8vysGbCbCxhSjUZ4GNmEjMndD4QxGu2BGX7y0sFuyVPh6VLuY3PkBncN1kwY
 zzAehrjG/ElRdqjHRfV/Pm5A+6uSMp+nlDC4i3KZyhoJvhhamuri/Iq8pOwh0ABigOHidGcpwTO3I
 UdlPqAvXxtQ7z2Yzl10VvI066nodwwkt8sooA8JsMy5gh5Qed5OcMpG7zGkEvmZugYmqMG7RSyVTr
 xIskBwCg98MuDoyKfw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tbTwO-00Bwo6-05;
 Sat, 25 Jan 2025 00:22:24 +0000
Date: Sat, 25 Jan 2025 00:22:23 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: anitha.chrisanthus@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/kmb: Remove unused const and defines
Message-ID: <Z5Quv1uNCsi_-YyX@gallifrey>
References: <20250125001353.223974-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250125001353.223974-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:21:36 up 261 days, 11:35,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

Note Edmund's address doesn't work:
 --->
A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  edmund.j.dea@intel.com
    host mgamail.eglb.intel.com [192.198.163.19]
    SMTP error from remote mail server after RCPT TO:<edmund.j.dea@intel.com>:
    550 #5.1.0 Address rejected.
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
