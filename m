Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE81A7A8A7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65E610E2C6;
	Thu,  3 Apr 2025 17:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="f8hniX71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta034.useast.a.cloudfilter.net (unknown [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6C10E256
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:35:06 +0000 (UTC)
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
 by cmsmtp with ESMTPS
 id 0EYXuS0OQXshw0OSvuluFQ; Thu, 03 Apr 2025 17:34:58 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 0OSuu9OMn1vNy0OSvu4ieA; Thu, 03 Apr 2025 17:34:57 +0000
X-Authority-Analysis: v=2.4 cv=VMQWnMPX c=1 sm=1 tr=0 ts=67eec6c1
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10
 a=AwQk-W9g5lI6dlRaMUIA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+/sPqbGOxBMdM7Zey0dI8Kpexl+RXW3F/uu+lKz95U=; b=f8hniX71WgPZO1+E0lnTSk3xBQ
 iLjc6NftmI9B7ejNFC9yV655NLm+rGZjHzJeAqSQGpl46kB9TAFV5ZpgwMPXhhtZrfnb7jQMxS0bj
 saYdBslAnFmGXU/rU5upDh4WKckMmhCXzmrlfvZ40hv1VX4w9KOj4Ex8ZMfhi49fdZig9KoW+8Dwh
 vo7OCycgb+DD2AiU86f/S/BmiuNM7sk2Dv2ZURuBguiT0wOE9eyd5/hM4egvm5yySw2byf80FhCJF
 L+PgTNwjSgf28N8gtg+7oQWciHaB2kNO5pZ5O9XXLEeyR15kcjb3FWdp5/T3Upm5BOKeEIzoKGrK2
 9pxaiv1w==;
Received: from [201.172.174.147] (port=55110 helo=[192.168.15.6])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1u0OSu-00000000rpG-17It;
 Thu, 03 Apr 2025 12:34:56 -0500
Message-ID: <08f9d29f-9676-4c92-adfa-32368637f392@embeddedor.com>
Date: Thu, 3 Apr 2025 11:34:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][next] drm/nouveau: disp: Avoid
 -Wflex-array-member-not-at-end warning
To: Danilo Krummrich <dakr@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <Z-2zI55Qf88jTfNK@kspp> <Z-6xwS3qXIyxE05G@pollux>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Z-6xwS3qXIyxE05G@pollux>
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
X-Exim-ID: 1u0OSu-00000000rpG-17It
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [201.172.174.147]:55110
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG2R0rThr55Cntql9yrh8bqQnjKr3whhHTBPo/AdL6xjHJPi83ALtvAX05HVYmn84VRJ7mfcEy0WjW546ay+8GHNn6/ehheHjUbQbwXnz41otfMgVGPj
 O6xXoZXz9PZHgU8HkHka2LyeAQeKJ+hA8bH45eohTLsBxD1inYpeclFh5ScFiN7q483DCuJbsz++PayCumXu8s9WTRNEv4jVOJDIRy5oM5U5+1dQlgSoJUy4
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


> Applied this one (as well as the svm and fence one) to drm-misc-next, thanks!

Awesome. :)

Thanks!
--
Gustavo
