Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C5CFC333
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 07:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D959B10E00B;
	Wed,  7 Jan 2026 06:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="l4kevgBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jan 2026 06:42:44 UTC
Received: from omta036.useast.a.cloudfilter.net
 (omta036.useast.a.cloudfilter.net [44.202.169.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E0910E00B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 06:42:44 +0000 (UTC)
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
 by cmsmtp with ESMTPS
 id dLYgvpFrUKXDJdN8qv2Ows; Wed, 07 Jan 2026 06:35:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id dN8pvVFThV6WMdN8qvdaD1; Wed, 07 Jan 2026 06:35:36 +0000
X-Authority-Analysis: v=2.4 cv=E//Npbdl c=1 sm=1 tr=0 ts=695dfeb8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Aea70ojWhvW6xI+oM0giEQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=0GjfSR-a_gbzBSTCPL8A:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b61X3jZlNTO3XN8ImRNF8VeXxeNII79YjBB4Nfpnz6I=; b=l4kevgByUnt+MnUp1PWZPYh+Ej
 GogpXA0x4KEirmi1SRHjzg7R2rWbOlUNVZv2MkUsephPC3PXaAi72eTErLIeBusmenntGC1OdPjjy
 Igi6sGc5j/b4MYzpg0VSivUKiH0LQsFkK1V3nH+Y4zamhICOdm3u7xoGfh/ceadFaee3zLp1qr950
 P0ye8BDFX5OvuMjBW/Tk+z1TEYbpxGkLRi8ro3gXmL1OZYz2J8MWa3vs4nn2CkCxXGB/17MdJRSJx
 nafW+1rPJqAwr2G05Aj0bTMpoyhfKa0bYGL8fZa6GSrqwQscf4ToTWzO7IKPNnijY7uztlRl0F4be
 jm0haj1A==;
Received: from flh4-122-130-137-161.osk.mesh.ad.jp ([122.130.137.161]:45860
 helo=[10.221.196.44])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1vdN8p-00000003Gyh-0fE5;
 Wed, 07 Jan 2026 00:35:35 -0600
Message-ID: <69342e4a-3a2f-4fa4-a7a9-76d05a15e985@embeddedor.com>
Date: Wed, 7 Jan 2026 15:35:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
To: Kees Cook <kees@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <aJ17oxJYcqqr3946@kspp>
 <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
 <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
 <202601061220.EDD0476@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202601061220.EDD0476@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 122.130.137.161
X-Source-L: No
X-Exim-ID: 1vdN8p-00000003Gyh-0fE5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-122-130-137-161.osk.mesh.ad.jp ([10.221.196.44])
 [122.130.137.161]:45860
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOAsY+sjWDCXVBD2/emPFUdmX6HDvMoA9dB88myRurJzDnusFyxxetuS0N+bVjDC9NmhN3WYLrD8VbIhx3OA4K3M85/ZvobGZMIGdQxgQlxNu2TDhj3Y
 tKWkW/2mAH9Q3FwVgm6fOb/cpAt0+IVxpfDgFBvDUcv/YN8SsW+wzPufnSayhBRy9gwbJSdKRIBlbLHwyw+fXfP/JbT7NYqJLe0A3isPp1jE8F/r+Zeq5SLo
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



On 1/7/26 05:21, Kees Cook wrote:
> On Tue, Jan 06, 2026 at 09:14:36PM +0100, Danilo Krummrich wrote:
>> On 1/6/26 7:08 AM, Gustavo A. R. Silva wrote:
>>> Friendly ping: who can take this, please?
>> For some reason this patch wasn't tagged for applying in my inbox -- seems like
>> it slipped through.
>>
>> I was about to pick it up, but recognized just in time that Kees already took it
>> through his hardening tree.
> 
> Ah great!
> 
>> Sorry for the delay; thanks Kees for picking it up. Even though already applied,
>> please consider this patch:
>>
>> 	Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> Thanks! I had figured it was slipping through the cracks so I snagged
> it. I'll add your Ack. :) If you'd rather take it, just say the word and
> I can drop it from my tree.

Thank you both!

-Gustavo
