Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81476344737
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8E589B70;
	Mon, 22 Mar 2021 14:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1443 seconds by postgrey-1.36 at gabe;
 Mon, 22 Mar 2021 14:32:20 UTC
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
 [192.185.51.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D09898E4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:32:20 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id D01D543E8D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:07:12 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id OLD6lU5FVMGeEOLD6lFmDX; Mon, 22 Mar 2021 09:07:12 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cUnSQxPQKJaaBLNa5F4iOd/DRePu6SyoFMhjlo3t0aY=; b=Wdg5z/ykxmBWAAPH5LBsYOWdvx
 RIrc2FuXw3dVtbZlZN4A9qkmNkhbCgiA3ILklNr2NXdL618tZNWK3jvKs5bPZ/bCV+h/LjlhrhJK/
 efaOOvs0P+tafocRNUnC+jmsVDWwgcxgBs2uyLdXgpD6cGDyfS4iwRmhrUEAlBSl2kjYFxLZ97q4z
 0gh8LGx06x8/z2pauN3A1nanrpZn7ts5/9ne0gPn4ybMmO17yhjv+gaxuve6N/vXmFg9XVrYOalQh
 68yIuFtFXnoUQ1kZfjINe+OppzJK0KRNbxSqSyKx3fKBAika7OfMHlrWK/9Q9a2320ebT7BpsRfM9
 BH7llxjg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:55746
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lOLD5-000Q4E-Mq; Mon, 22 Mar 2021 09:07:11 -0500
Subject: Re: [PATCH][next] drm/amd/display: Fix sizeof arguments in
 bw_calcs_init()
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210322125050.GA236782@embeddedor>
 <CY4PR12MB128770E0A2502A3CA0A26650F1659@CY4PR12MB1287.namprd12.prod.outlook.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <408ff15d-81ba-0a0b-113d-96d5cb49a2a6@embeddedor.com>
Date: Mon, 22 Mar 2021 08:07:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CY4PR12MB128770E0A2502A3CA0A26650F1659@CY4PR12MB1287.namprd12.prod.outlook.com>
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
X-Exim-ID: 1lOLD5-000Q4E-Mq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:55746
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/22/21 09:04, Chen, Guchun wrote:
> [AMD Public Use]
> 
> Thanks for your patch, Silva. The issue has been fixed by " a5c6007e20e1 drm/amd/display: fix modprobe failure on vega series".

Great. :)
Good to know this is already fixed.

Thanks!
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
