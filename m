Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDA3A65F5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 13:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEF489B9E;
	Mon, 14 Jun 2021 11:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8EC89B9E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=KcFtfTYDKfchizoaHzhcPpag/3lWCXtZGfTEBkAln28=; 
 b=IAR2PpNRU9gbvSA4wEMuALD2UeLwdkP+/2ttu3MW187snvbWxTJnKu1XORW9Jgk/MiBLSmTdpzTKCUEykEZd+skjgU2KNQGdXromXRgdo7aVMyoF4+oNsKAmX+8LjzITEQMxWM1cSd6QLAn17QflQbDqkijBFqQ04wmJNb6XFSc4n+B/1PI/9E6Hz5ukQ3pSzEkhVPnhoQgpZAxJzVYjnrft5agHIHsEBMbmZl52+2kjVPEP+FbVGfmMGvnqLIbLUebluF/fc1WiDFYNw84yQhzmO5KYJknes9pzCt24/fZEKyKp47WnlvPGAB++JbajDhHPJy5jMX8GgjJDTpRLJA==;
Received: from [192.168.10.187] by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lsl3T-0002cy-9J; Mon, 14 Jun 2021 13:46:59 +0200
Message-ID: <0d9f83cf132a76b7d4d664d623e88ecef056bf35.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Expose performance counters to userspace
From: "Juan A." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 14 Jun 2021 13:46:58 +0200
In-Reply-To: <20210608111541.461991-1-jasuarez@igalia.com>
References: <20210608111541.461991-1-jasuarez@igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-06-08 at 13:15 +0200, Juan A. Suarez Romero wrote:
> The V3D engine has several hardware performance counters that can of
> interest for userspace performance analysis tools.
> 
> This exposes new ioctls to create and destroy performance monitor
> objects, as well as to query the counter values.
> 
> Each created performance monitor object has an ID that can be attached
> to CL/CSD submissions, so the driver enables the requested counters
> when
> the job is submitted, and updates the performance monitor values when
> the job is done.
> 
> It is up to the user to ensure all the jobs have been finished before
> getting the performance monitor values. It is also up to the user to
> properly synchronize BCL jobs when submitting jobs with different
> performance monitors attached.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Emma Anholt <emma@anholt.net>
> To: dri-devel@lists.freedesktop.org
> Signed-off-by: Juan A. Suarez Romero <jasuarez@igalia.com>


Here is a link to Mesa MR that implements the support in the driver:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10666



	J.A.

