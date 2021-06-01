Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D8397CF5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 01:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112D6EB2F;
	Tue,  1 Jun 2021 23:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.54.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569496EB2F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 23:18:49 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 26CA3400E0C9A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 17:43:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id oDJalbcXWDedfoDJalgjTH; Tue, 01 Jun 2021 17:56:50 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R2HquvGjn56KztXhaP1kfmdCBWzUVbxxQVncCbBwj70=; b=tILX86ska22+Sj6DlfjIb2xVoD
 p14G1IEBdmkyOdX6JjBs+EjBqcf8OdrorvklYI2EqP8K6DDl1AepLzCgnCL0MeTXLfTMREaHVFO/t
 ObVT6//1XlCk9qxffbZdYJVE6cX2qNMBK6FJlLX/P2gkGwOpVJMBz5Mxs1qomt6Cc7iw6G3zXhWXv
 358G9ad/nBBuBqKPEeZmabADNwLqIDHKlGxADZSqJrfOE30Bx1WCMbraf7yW21JdQI7Pa2kIBWpnv
 m2WcXJBpZphiPYxb8GQb5NgiGoSuKHc/pQrbtASWY0Jh0I3X7hWlclMi9lfmUukAAGden9hpjcWJI
 Q+SGNkdg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:53072
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1loDJX-000ur5-Ax; Tue, 01 Jun 2021 17:56:47 -0500
Subject: Re: [PATCH RESEND][next] drm/nouveau/clk: Fix fall-through warnings
 for Clang
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210305095609.GA141907@embeddedor>
 <b42a6c20-e70d-c56a-795a-072ecc772bf2@embeddedor.com>
Message-ID: <2aaf5382-3907-ac2a-ebff-a33b308aaf7d@embeddedor.com>
Date: Tue, 1 Jun 2021 17:57:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b42a6c20-e70d-c56a-795a-072ecc772bf2@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1loDJX-000ur5-Ax
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:53072
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 28
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Friendly second ping: who can take this?

I can add this to my -next branch for 5.14 if you don't mind.

JFYI: We had thousands of these sorts of warnings and now we are down
to just 23 in linux-next. This is one of those last remaining warnings.

Thanks
--
Gustavo

On 4/20/21 15:13, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this, please?
> 
> Thanks
> --
> Gustavo
> 
> On 3/5/21 03:56, Gustavo A. R. Silva wrote:
>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
>> by explicitly adding a break statement instead of letting the code fall
>> through to the next case.
>>
>> Link: https://github.com/KSPP/linux/issues/115
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
>> index 83067763c0ec..e1d31c62f9ec 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
>> @@ -313,6 +313,7 @@ nv50_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
>>  		default:
>>  			break;
>>  		}
>> +		break;
>>  	default:
>>  		break;
>>  	}
>>
