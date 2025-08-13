Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BCB24017
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 07:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F00810E05F;
	Wed, 13 Aug 2025 05:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="I3ZFenF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 13 Aug 2025 05:19:53 UTC
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DBD10E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 05:19:53 +0000 (UTC)
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
 by cmsmtp with ESMTPS
 id m2ejuvEJJ5wATm3n3uMCCd; Wed, 13 Aug 2025 05:12:45 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id m3n2uWuxoXZDSm3n2uuhfh; Wed, 13 Aug 2025 05:12:44 +0000
X-Authority-Analysis: v=2.4 cv=SdD3duRu c=1 sm=1 tr=0 ts=689c1ecc
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=R1XpmoYe2GHAZdAE2O7VqQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=7T7KSl7uo7wA:10
 a=1ml3npyrcYbOIoRaIsMA:9 a=QEXdDO2ut3YA:10 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8CHxB1Wtr3Lygs//ada2Fd8yg7mcVvvMNOvlWGSBdN4=; b=I3ZFenF/oSKFdznfXcmVkwDLWH
 jpYuyLFZB/s3kjtkIinOMc6T0qePM+SdCTNDr4vrY9+ffKlxUYYZYaLdOCzNtMF4/brQeOpXIRPuN
 AdZPXWP84dS1Mrhx77NS1c4wmAq8E4QkbwtdzmE/C9692L6HjslLXtKGgJD4FVTjWFxnxgmPYIN+k
 k3LEoWTAbLtowaHrayu2E2gmh/kUS2tYFR+ATad0/BzNOjp5JWrtYUD0Cd1fY6vymUoq7rlrV8O6c
 5Jvfu4fif+ZZYkfJc9N80vKfl7BOm3eAOeJxe7vkMSYrfPMdGmnEbn/ZQ18gzJdHV3SunW4eDbIsD
 5WHOj5Hg==;
Received: from oni-27.109.98-104.oninet.ne.jp ([27.109.98.104]:38110
 helo=[192.168.0.175])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1um3n1-00000002TtW-1RYw;
 Wed, 13 Aug 2025 00:12:43 -0500
Message-ID: <d43dac3e-122d-4c16-9c1e-760eac91b8da@embeddedor.com>
Date: Wed, 13 Aug 2025 14:12:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z678TNhCbTk363Tw@kspp>
 <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
 <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
 <CADnq5_M5Jv4A5CXAKY2Qd-dhrfmecnauRtVY_ghSsut7i=KNww@mail.gmail.com>
 <d07b4edc-6048-4c10-b8ac-dcccd5a932d3@embeddedor.com>
Content-Language: en-US
In-Reply-To: <d07b4edc-6048-4c10-b8ac-dcccd5a932d3@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 27.109.98.104
X-Source-L: No
X-Exim-ID: 1um3n1-00000002TtW-1RYw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: oni-27.109.98-104.oninet.ne.jp ([192.168.0.175])
 [27.109.98.104]:38110
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOITzAXKNgdIvCN3eUn41/MZLTqByFQI4tYu9QNLl99oVAHqbuvXeFqtXjBe1bL58RzwN4sdl9GVxSvZi2szXBGC1ArhJBQaP/pgtQPuS8jCYyxWLwJP
 fWrx528Yirf68xMWnWYcLmlAXlVoWvD9liRNTlL2yRd8FlQtV8oeCJvTHvD1ji5dtdvvw2uw5U3cPzWFwzX8C8J/n/ZqJzp0cavGhCjXUHq0bDJluSNpgPi1
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

Hi!

On 22/04/25 23:58, Gustavo A. R. Silva wrote:
> 
> 
> On 16/04/25 09:04, Alex Deucher wrote:
>> Can you resend, I can't seem to find the original emails.
>> Additionally, all of the NISLANDS structures are unused in amdgpu, so
>> those could be removed.

I'm taking a look at this, and it seems that those NISLANDS structs are actually
needed in amdgpu code. For instance, `struct si_power_info` contains a member
of the type of `struct ni_power_info`, and this latter struct contains a
member of the type of `NISLANDS_SMC_STATETABLE`, thus `NISLANDS_SMC_SWSTATE`
and `NISLANDS_SMC_HW_PERFORMANCE_LEVEL` are needed, and so on.

So, it seems that all those structs should stay. What do you think?

Thanks!
-Gustavo
