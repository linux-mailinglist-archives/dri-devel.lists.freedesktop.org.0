Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D398F6DD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 21:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7510E8EA;
	Thu,  3 Oct 2024 19:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="KpKctKFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C6D10E0EE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 19:14:03 +0000 (UTC)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
 by cmsmtp with ESMTPS
 id wGVMsAC06nNFGwRH0sHFx5; Thu, 03 Oct 2024 19:14:02 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id wRGzsLMfyky5UwRGzstOjy; Thu, 03 Oct 2024 19:14:01 +0000
X-Authority-Analysis: v=2.4 cv=Cum5cG4D c=1 sm=1 tr=0 ts=66feecf9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=7T7KSl7uo7wA:10
 a=BXEf9FEPToR6foY5dqUA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pMJywXUdYNAihC5TeN69Uh5MH5fG8t9KLIBI2MlI90=; b=KpKctKFK35P0YCMvSWT+sDdjBR
 S49MB/OwSRxhMHyKQzkm4mLkOY0yZHshVfRBf0AY0BFViLUNC08SO8w1jXjl7y+0KzB9DFdj+vbPw
 MmAGihM9RAA3YEMgGTcd6+ilQw5AKaai3h7xjfPDQQ0ANcVxXAWYkKGPpfBUM5W8wS7WdRRQ+pdAc
 JFL8R+8EWyIaw5eu45YKh8hS06cB2Yt3X2bLkTkyT5ftdpfv9Xabi3y9V9qnMIqbx9R4ZJz8hSJMu
 MMJz5IZDwQvgp7IakU5sBGIJJ9upuZllwauGX34r35lvqfIaVqM9mFR5YjNBwQUhj/nWlsq4RQm+o
 wEU8h5Uw==;
Received: from [201.172.174.147] (port=34444 helo=[192.168.15.5])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1swRGy-001ha2-1j;
 Thu, 03 Oct 2024 14:14:00 -0500
Message-ID: <a276cecb-ae71-4ae2-8c9b-362403dbc367@embeddedor.com>
Date: Thu, 3 Oct 2024 13:13:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: Avoid -Wflex-array-member-not-at-end
 warning
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZsZLFS1CsHkKjw+C@elsanto>
 <ef5a8e6d-cb97-4872-901c-cf4bbec23be6@embeddedor.com>
 <30530165-0ea9-4f02-9d8c-e8abc9eda5a7@kernel.org>
 <035ae74b-5df5-493f-9835-02c1c30ccfcc@kernel.org>
 <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
 <e9a05386-54d8-4a18-8b16-4e871de094a4@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <e9a05386-54d8-4a18-8b16-4e871de094a4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1swRGy-001ha2-1j
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.174.147]:34444
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP7L9+q1nWmZaL71Sh4+MQKYDSSS5Gk5rfzgKBPcfFAiPRVHpx3/rSAFZqGmXmrfPrD2cngMLdB3ia3zGTEuX4XVEVmNdJ1HlD4BlxNsjefNEYBKIhZ1
 e4Km3KOwquxp7ILMzVpc1HnBzoCqD0rGBf6AZaNX6eAoRDzkt6aKFLa7mqtRhES2Bw2ziHcIgsIA+awUCzpb617vZFwGG9l6sNwdpcWZdYbxSR1o+PEAaD0Q
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


> 
> Yes, it's not great, but I think it's better than having the length in two
> places.

Agreed. I'll respin. :)

Thanks
--
Gustavo
