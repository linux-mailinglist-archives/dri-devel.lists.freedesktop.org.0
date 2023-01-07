Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90766117C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 21:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A792A10E0D2;
	Sat,  7 Jan 2023 20:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89EF10E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673122179; bh=YLQN1N9pihHAMf/zPpPhdNCRrp7JZhMqhZrFNGqFCOA=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=WPlK/TzmPkFIKvCTSw0gvRo8HkMakaZ02kRqbma1ZjobJwvMLIGby59M6lE7iE55b
 4a5O7gsRybdrrEDP8l2C5z+scr+WoPZc0Kzge1PGGFQgUrqoA/uxMlKN5kA4+m4mQv
 G2tst9k8cOe8deQBx1uA9lJjv4xLf1WuhZ/bkJ9A=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat,  7 Jan 2023 21:09:38 +0100 (CET)
X-EA-Auth: OKIrZ39R0cxkfSoB8rZ3cbEymhSiYYRsf2Ge4ZAJPNVBogv6yPdBfIWwKDQ+fcdWWcucLzl1+F3zAqBv1n32/7nTHA8/h5BJ
Date: Sun, 8 Jan 2023 01:39:25 +0530
From: Deepak R Varma <drv@mailo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdkfd: Use resource_size() helper function
Message-ID: <Y7nRdaDtptxE8Rwd@ubun2204.myguest.virtualbox.org>
References: <Y6TI1O9adSP/OrnT@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6TI1O9adSP/OrnT@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 02:45:00AM +0530, Deepak R Varma wrote:
> Use the resource_size() function instead of a open coded computation
> resource size. It makes the code more readable.
>
> Issue identified using resource_size.cocci coccinelle semantic patch.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---

Hello,
Requesting a review and feedback on this patch proposal?

Thank you,
./drv



