Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B1A782A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C55C10E0F0;
	Tue,  1 Apr 2025 19:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="AXaidp3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335F610E0F0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743534734; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=h4W51Kp9TYp3/hubl+pXq6brywk/RNHzca7dOGszEkOBVsd3laJ9Viii84/6EEs1WqGmld9sKlDx29g/2ZG+hobxsjmOvq4b1u59Y0u5S65eY/RKWD1FbwY/Vyuoy5QOxyB65N4XF5cgx1mBSNn2+QZr7BpIMtcgpqFjF+/g5NU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743534734;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PbAVbbtn4nkBDdDi/36gTKmdg2f/TMrBf3VtHNjV5rs=; 
 b=m5p9GhHjRAiAFx3hUKdbJQcL5FjbjfL+/rjEOfQ1gTsc+Xz6LLnM6VPPUa2LCMRk4mRYcUM1HqVaEpeYxXiR0Csq4JVWJ8BgkZzm2D0yRs4DEr457/Vq6dakNagpj0TgsAydLUm1M1kJPNnV8BDltqlVL73L6UAobFgcmUDKj58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743534734; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PbAVbbtn4nkBDdDi/36gTKmdg2f/TMrBf3VtHNjV5rs=;
 b=AXaidp3Ea8r9RDl2Zg2yrG6MM0Iu9sdNhRs0G16HP4KwcVAI1PYQ1dn48+n77k8Y
 AGWGxMYemRCNqwmSHss0GisPpDzloJgJJbdLWZwCwRzTRp1sNqGiEC+OCVKlV+Mj2GV
 y6he5FQN1w7CvpA2pbN/+AJ7oDF3rf4HhrR8OCz8=
Received: by mx.zohomail.com with SMTPS id 1743534731442578.0386605740838;
 Tue, 1 Apr 2025 12:12:11 -0700 (PDT)
Message-ID: <cdb67b5f-8591-4fd8-a9c1-abd36ff5a08d@collabora.com>
Date: Tue, 1 Apr 2025 22:12:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] MAINTAINERS: Add Dmitry Osipenko as drm/virtio
 co-maintainer
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20250401130151.2238772-1-dmitry.osipenko@collabora.com>
 <l2ndn2jo2swv4unuc5r7fm3of6w3teyytpqfpgcvkdwnp3fubc@ect2rh2ikmhn>
 <CAAfnVBkMMVQVXeS9Bo=bkXQs1wG2xHMWBCwxjHxPbLkBU2upbA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVBkMMVQVXeS9Bo=bkXQs1wG2xHMWBCwxjHxPbLkBU2upbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 4/1/25 17:34, Gurchetan Singh wrote:
> On Tue, Apr 1, 2025 at 7:25 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
>> On Tue, Apr 01, 2025 at 04:01:51PM +0300, Dmitry Osipenko wrote:
>>> I was helping to co-maintain VirtIO-GPU driver in drm-misc with
>>> permission from Gerd Hoffmann for past 2 years and would like to
>>> receive new patches directly into my inbox. Add myself as co-maintainer.
>>>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>>
> Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
> 

Thanks, all! Applied to misc-next

-- 
Best regards,
Dmitry
