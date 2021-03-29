Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773034CCC0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 11:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3116E247;
	Mon, 29 Mar 2021 09:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2046E247;
 Mon, 29 Mar 2021 09:09:55 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id CD847C800A0;
 Mon, 29 Mar 2021 11:09:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ki6XT0AJc8FW; Mon, 29 Mar 2021 11:09:53 +0200 (CEST)
Received: from [IPv6:2003:e3:7f0c:2000:5d6d:82a3:925f:9a84]
 (p200300E37f0C20005D6D82a3925F9A84.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f0c:2000:5d6d:82a3:925f:9a84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 8F59FC8009C;
 Mon, 29 Mar 2021 11:09:53 +0200 (CEST)
Subject: Re: Color mode exposed to user space?
To: Pekka Paalanen <ppaalanen@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <e557c681-4218-dbe3-4e92-f6eaf352b614@tuxedocomputers.com>
 <CADnq5_N9AqX=Lx=yVKCFQahREFT6SCER17KMbZyw-iQ2wnTVqA@mail.gmail.com>
 <20210329110926.2a479842@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <91a4f611-d6d3-3eda-7d65-b70fe8f0c575@tuxedocomputers.com>
Date: Mon, 29 Mar 2021 11:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329110926.2a479842@eldfell>
Content-Language: en-US
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Thu, 25 Mar 2021 12:12:09 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
>> + dri-devel
>>
>> I don't think it's currently exposed anywhere.
>>
>> Alex
>>
>> On Wed, Mar 24, 2021 at 5:11 AM Werner Sembach <wse@tuxedocomputers.com> wrote:
>>> Hello,
>>>
>>> is the information which color mode is currently in used for a display (RGB, YCbCr444, or YCbCr420) exposed to user space somewhere?
>>>
>>> If no: Where would be the best place to put code to expose it to sysfs?
> Hi,
>
> a very good question. Wayland compositors implementing color management
> will be interested to know this, and even better, to explicitly control
> this.
>
> See e.g. Color Calibration Auditing System notes in
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467 .
>
>
> Thanks,
> pq

@Alex Deucher thanks for the info.

@pq Related bugtracker tickets for reference:
https://gitlab.freedesktop.org/drm/amd/-/issues/476
https://gitlab.freedesktop.org/drm/amd/-/issues/1541
https://gitlab.freedesktop.org/drm/amd/-/issues/1548
I'm coding something up for the last one atm.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
