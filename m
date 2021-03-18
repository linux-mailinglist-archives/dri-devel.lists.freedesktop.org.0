Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0EF33FDA7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 04:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0511D6E876;
	Thu, 18 Mar 2021 03:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1344 seconds by postgrey-1.36 at gabe;
 Thu, 18 Mar 2021 03:17:15 UTC
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.148.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E80E6E876
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:17:15 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 3DB002A224D2
 for <dri-devel@lists.freedesktop.org>;
 Wed, 17 Mar 2021 21:54:51 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id MioFl6MUvmJLsMioFlthir; Wed, 17 Mar 2021 21:54:51 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kyaSur+AVF/eZzNQuGBhQHivPm6TStIKn+Qw+aned7E=; b=zGMj/6k3W3aDYn8aL7/lXpG97v
 MC7eBhhc2fBXe2lT/moJp6YmozGaXzd/RV2gqGJw37Eq5pZ7NE/g9T1qA8CSoGCCPl67l9EXsc6rw
 YysFu8SwpD3tqkJG+W5Auj2gXhk9ZqTqBFKZkdkafDSGLRjhMJPzTBhsEOr69oM0O50+AmN/uVmRP
 qOQa9WE0h/RZ/jrayy//uNqRNqZpvuM+TTtjC64O3dC9/KjaaO4cyjNl0AjRTCkdTIyqlQUv50sWf
 /JIp0ruRkXS8B0Jbhic3QbvOBVYuOsbgWc5Sa8wOSkmjHPmMXDVuOmNMT4yuE6vSwxBec6jm3klA8
 XFZ83OPQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:40896
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lMioE-004GQg-Tf; Wed, 17 Mar 2021 21:54:50 -0500
Subject: Re: [PATCH] drivers/video/fbdev:modify 0 to NULL
To: Chunyou Tang <tangchunyou@163.com>
References: <20210318023329.488-1-tangchunyou@163.com>
 <20f1664e-df4c-d085-cb25-1d05e8a793a3@embeddedor.com>
 <20210318104718.00005767@163.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <5202c72d-4246-1a4e-37fa-7caf2d9c1ce3@embeddedor.com>
Date: Wed, 17 Mar 2021 20:54:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318104718.00005767@163.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lMioE-004GQg-Tf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:40896
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tangchunyou@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/17/21 21:47, Chunyou Tang wrote:

> I think "if (info == NULL)" is more intuitive,and there have many
> compare likes "if (info == NULL)" in this file.

In that case, all those instances should be changed to if (!foo), instead.

--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
