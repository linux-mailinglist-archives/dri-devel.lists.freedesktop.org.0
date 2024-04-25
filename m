Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0808B24DE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2411A539;
	Thu, 25 Apr 2024 15:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rbythsld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0089411A539
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:17:07 +0000 (UTC)
Message-ID: <f418cf10-ad19-4483-96a3-46b5d0630160@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714058225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATs7kGNU7MX+/Quk4OUyTr0R55wWS//nri6UrNWeeWc=;
 b=rbythsldaxvF0hDSi1Cqu5f4ezVwrIeFeVv55JXP54HbOWzC3dP45CEWw/QcBw8X31HSrD
 7PUBgDZmp8nrr8xmSCQm2QVfyWyM0JeGag2oKydLlix6I4jWv39qlHQO2eiMWaUsxArmfz
 +Jl3KkMq4t+Ho1Sf1XCICGzocXQH4gk=
Date: Thu, 25 Apr 2024 11:17:00 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/13] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240423171859.3953024-1-sean.anderson@linux.dev>
 <848aabf8-aec7-4a14-8f1d-c40f76d025fe@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <848aabf8-aec7-4a14-8f1d-c40f76d025fe@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 4/24/24 14:54, Tomi Valkeinen wrote:
> Hi Sean,
> 
> On 23/04/2024 20:18, Sean Anderson wrote:
>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>> that's done, it adds debugfs support. The intent is to enable compliance
>> testing or to help debug signal-integrity issues.
>>
>> Last time I discussed converting the HPD work(s) to a threaded IRQ. I
>> did not end up doing that for this series since the steps would be
>>
>> - Add locking
>> - Move link retraining to a work function
>> - Harden the IRQ
>> - Merge the works into a threaded IRQ (omitted)
>>
>> Which with the exception of the final step is the same as leaving those
>> works as-is. Conversion to a threaded IRQ can be done as a follow-up.
> 
> If it's ok to you, I'd like to pick the first four patches to drm-misc already.

Fine by me.

--Sean

