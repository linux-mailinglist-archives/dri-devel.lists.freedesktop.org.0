Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11AB8A23F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BCE10E140;
	Fri, 19 Sep 2025 15:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BH1vSPHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D474710E241
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TtiocbE2CXcYIT/JLqBHM+XTq6g309gf+MILFiHPel4=; b=BH1vSPHJBy8GAG8bDvsdSGs27f
 f79cYWZviKIm9GfG+QBwb3peluoEbpITz+eRIeqG5TQPX2zNBY9rzaPdlK6ediPqX4Wmziyg47j8Q
 /wt8y8AdPKRNAQz2z7GO46+FtplwOQx2lLv2xXjsepArbR0YDWo8Og9f/KxjxtmsWQxSl+cKpwS0X
 w3FpkPxAJQ+dKCuy8FWskTvpqpQhnu899qeBoahCYTr5uMsFQu1odIh9ElKvqWmlp+4KSGlzD0E1q
 gNegLbA5ExD3G9nbY6yAqvOzg+2qjIdMdaiE8UpV1mSqsZyrZh4S4FpXG1SJH3b6OY0edanJ+PtNq
 +R1irL6g==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uzcad-00E8Va-Jl; Fri, 19 Sep 2025 16:59:59 +0200
Message-ID: <314960ec-1f38-4e7e-bf28-e461827a303e@igalia.com>
Date: Fri, 19 Sep 2025 15:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Question on ttm resource manager compatible and intersects callbacks
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

I have noticed that the (bo) size arguments to those is unused by half 
of the drivers, and that there is also ttm_resource->size. The latter 
also looks mostly equal to the bo size, unless on some driver path the 
resource can end up larger than the bo? Would it matter?

Anyway, overall question is whether there is scope to remove the 
explicit size from those callbacks.

Thanks,

Tvrtko

