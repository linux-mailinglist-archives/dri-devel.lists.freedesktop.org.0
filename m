Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E5A48E2D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 02:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3818210EBD9;
	Fri, 28 Feb 2025 01:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="P1Es/sOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Fri, 28 Feb 2025 01:49:50 UTC
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A894F10EBD6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 01:49:50 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
 by cmsmtp with ESMTPS
 id nHWEtNzCXXshwnpOct6Y33; Fri, 28 Feb 2025 01:42:34 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id npObt8BYqdTeZnpOct8Tii; Fri, 28 Feb 2025 01:42:34 +0000
X-Authority-Analysis: v=2.4 cv=XZCPzp55 c=1 sm=1 tr=0 ts=67c1148a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=6Vi/Wpy7sgpXGMLew8oZcg==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=7T7KSl7uo7wA:10
 a=iit3rYpcdqjZrRsmSfkA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ml+ZtiSZg6m5QioCesBYuryQ6UN65U0bEw11wXgplw4=; b=P1Es/sOTtmwWfMGk7jz8Crg1oi
 iV3sne7xu/X1QenquevXy7MmUn7PdDXjhR0jfLMM+Kv8PsjW745vcZQNr1aPpG1kOdX+RnX/eD+gY
 eGw471fKtYiZ2u8kc0m8UhlQjI0feDfPPzUgvnxAsTHTs3FrMZGHHVyHaFndq+eWe79gV1W+tRjP2
 r5sbEPr1Bvjs2PP+zWi8kqGswjRjGDOBD7c5TQGf8yskQ6g7AInmRDCdjTC7FlY1CPKb4QDa/+gHu
 7cOaQ/+aPFLnV4Vkl4sdINJIxcUFW5EbvXss2e5NnxQZy+mWUobyJzxoDDQSEGh6QlSai1P/MSvZR
 uKJwmknw==;
Received: from [45.124.203.140] (port=53610 helo=[192.168.0.158])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1tnpOa-00000003AAi-1kQ8;
 Thu, 27 Feb 2025 19:42:33 -0600
Message-ID: <4a6c2392-3200-4e1c-ba5e-236f2e608daa@embeddedor.com>
Date: Fri, 28 Feb 2025 12:12:28 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: Danilo Krummrich <dakr@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z6xjZhHxRp4Bu_SX@kspp>
 <df8b8d59-470f-43e6-a8c2-cc40a4ebe5d6@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <df8b8d59-470f-43e6-a8c2-cc40a4ebe5d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.140
X-Source-L: No
X-Exim-ID: 1tnpOa-00000003AAi-1kQ8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.158]) [45.124.203.140]:53610
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 18
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMBHuIN1r2ApgZjCgw2XmqfLZaZubTP+UI7ZxcNq7ij8ERB24e2KwzK6dJjWUasgsU9REChJuA20+3Pw3a9efEp4mJk8llthTvNhWb5xgma8dd5TMosn
 wyt7amsRmxGW2I23BgD/SqKbjBWlqunsA5Rws6vvm0UjVEfES2AISrNyMqlFXcFsTQ/XFvTQixyYgn8V1OqrHf+pCA+clvczXgMzs5Yz/ET4qZ9h03o+KbaW
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

  > Applied to drm-misc-next, thanks!

Awesome. :)

Thank you, guys.
--
Gustavo

