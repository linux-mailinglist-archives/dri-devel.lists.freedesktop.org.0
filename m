Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6A366101
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 22:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8796E8D0;
	Tue, 20 Apr 2021 20:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1279 seconds by postgrey-1.36 at gabe;
 Tue, 20 Apr 2021 20:34:37 UTC
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B64D6E8CE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 20:34:37 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id BDAC8385388A
 for <dri-devel@lists.freedesktop.org>;
 Tue, 20 Apr 2021 15:13:09 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id Ywk9ldkGS1cHeYwk9llXW3; Tue, 20 Apr 2021 15:13:09 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1fOHam2GJOKqFUkq+F9aeoxkYYxs2U3zMsh1o6JNHM=; b=dZdP5Iyg5PJOgOkuq2sJ5SFxVz
 04h8Ux9GMpcC0ua/1fsFuN3v/eG/HuEo/At8PJww3tcQSo+sQIhaQBUt9QU8Ujl+MSZAfdlpRs/ws
 QUgFJMsFeLF7f1NmvOMP/xpoitu8NBiLoEvV/f/mn5Jbu+Ccyp9Ej585ijX1dPfl26Ut026W0StqO
 VGYqyrcK5OZQcfEyOwYVouZ4A+4p8HJ/+JlvdlEZ1YLci2ow+RzJQnwCs/eR8VNbs/K6ps9ctaDzw
 LHoBlS4LXB2K5nzkMlf+kZucggRZ1KRy7xWsHpHt3qOM/mZmf6I1t8ROi/1/6kkS5hIKkl3405JnI
 QEwt64Qw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:48972
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lYwk6-002kkZ-1L; Tue, 20 Apr 2021 15:13:06 -0500
Subject: Re: [PATCH RESEND][next] drm/nouveau/therm: Fix fall-through warnings
 for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210305095807.GA142125@embeddedor>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <af4363d5-982d-3168-21aa-921c65f35554@embeddedor.com>
Date: Tue, 20 Apr 2021 15:13:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305095807.GA142125@embeddedor>
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
X-Exim-ID: 1lYwk6-002kkZ-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:48972
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 88
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 3/5/21 03:58, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> index 2b031d4eaeb6..684aff7437ee 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> @@ -41,6 +41,7 @@ pwm_info(struct nvkm_therm *therm, int line)
>  		default:
>  			break;
>  		}
> +		break;
>  	default:
>  		break;
>  	}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
