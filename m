Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D398F669
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E1410E24C;
	Thu,  3 Oct 2024 18:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="ZX8ulK4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF41410E24C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 18:44:14 +0000 (UTC)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
 by cmsmtp with ESMTPS
 id wOXesCM7LnNFGwQoAsGzBY; Thu, 03 Oct 2024 18:44:14 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id wQo8syZ9yGNqBwQo8seDWj; Thu, 03 Oct 2024 18:44:13 +0000
X-Authority-Analysis: v=2.4 cv=cqidkU4i c=1 sm=1 tr=0 ts=66fee5fd
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=7T7KSl7uo7wA:10
 a=3ekAXG7pR4iCrxVh9jYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eG7vV+8gxRB0uOsVEnr4E3TpXwHK9kPrxrRSBnOYWJo=; b=ZX8ulK4olZsrBtpjFw0YOFlYQF
 KwzCQxQ/jBPwZjQfqN/k6BSQ15Xe5fNh0L6SW7Kjqv9vrOqQ4C8VN2odtyqU+eUcGp+QvMaxK+i5t
 5v61MJC8PGxcoQXTOvOu7yu0lr/NDyLiXzNb8mJkUz5PELJ+pjh2EMOGprQ0S/34K1gJmKq2972lw
 saF8/LzyNF0bmDjS2WYftdRtmo/W3/h1cfFD1oY0W+MYtqMdH4jCEwHsgfuPsDbNj6LRnNdaNqAML
 fkhpL/M/hFOy6BkjQwFhLgFkiYxJmmXTfkDXMblfRrekZxwBhE5flkCOQFwzeRWDxc3ADytbQQNrz
 tfI9jFmQ==;
Received: from [201.172.174.147] (port=46111 helo=[192.168.15.5])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1swQo7-00192x-2f;
 Thu, 03 Oct 2024 13:44:11 -0500
Message-ID: <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
Date: Thu, 3 Oct 2024 12:44:09 -0600
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
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <035ae74b-5df5-493f-9835-02c1c30ccfcc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1swQo7-00192x-2f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.174.147]:46111
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIYOoH2SqeONJ1toJe112z2kH0Ytt8ez4ozVfbMCGNqSQ8aTxFCVBhV4McUpbSpp7o0yB0Fl5s0KH2ZcS4I3fMiQMC93wFqj0Rx40gLYOHaM4cNdde6V
 Lfl7FJNnbh/3XcDsCVjMv9pRWH/JEycmqLfttdc508T4jIUEPn3TCdBnh7bakj9o8PNRf7uwcgZsT+OxeUaduTzP2BmdiuKIUK3k7SCY7je47SSeasKeMEgP
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



On 03/10/24 12:36, Danilo Krummrich wrote:
> On 9/13/24 12:23 PM, Danilo Krummrich wrote:
>> Hi,
>>
>> On 9/13/24 10:09 AM, Gustavo A. R. Silva wrote:
>>> Hi all,
>>>
>>> Friendly ping: who can take this, please? 🙂
>>
>> Usually, that's me. But I thought you might want to send a v2 based on Kees'
>> comments?
> 
> Do you plan to follow up on this? I'd prefer if we could get rid of the open-
> coded "17". So, maybe just go with the define until we have something like
> STACK_FLEX_COUNT()?

Do you mean the following define...?

nv50_hdmi_enable(...)
{
...
#define data_len    17
     DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, data_len);
...rest of function...
#undef data_len
}

Thanks
--
Gustavo
