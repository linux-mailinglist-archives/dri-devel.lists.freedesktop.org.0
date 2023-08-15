Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E577D4C5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 23:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AB310E18E;
	Tue, 15 Aug 2023 21:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5E910E18E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692133454; x=1692738254; i=deller@gmx.de;
 bh=D62PIGDg7sygKLE/mNfm11BCcwgAlRAB2wYX6/8trYA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NekiG8AO408hQAv7oI4ohAMSod9826A6f2drP4Tnn0bwR21i2CLzBdRaMW4aR7ETSlUXIvd
 UmqrXmfRsK9ppwI5j2vzZI7G2Yc7LRVbEPacl0X9cvM6+K9VdPTWFXx47VUx5kz1HO10V+hkK
 TIS/8r4P85k7FDUBgUUYde7lkiQXhbZ5B6y2ySdkrs9sFTQuM+hk7kOe7LAQhmASsElabGWkJ
 99VaqCvA7ON+n7zU6cYE1HKxeO/eo0W8fCtH8hTrMPG9WP2OJpEo6ARclJZBDXFv8xCW4DY9N
 q4S6DEQtcyMp9IVoXjLAwOscmO8ZaMm5jpZu8S6pYPCcfC3kM9uA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.222]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1qKMLs0SWw-00TAUz; Tue, 15
 Aug 2023 23:04:14 +0200
Message-ID: <e9fd06cb-a3cd-19f9-42e6-9012f06dba63@gmx.de>
Date: Tue, 15 Aug 2023 23:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] video: fbdev: kyro: Remove unused declarations
Content-Language: en-US
To: Yue Haibing <yuehaibing@huawei.com>
References: <20230814140510.42408-1-yuehaibing@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230814140510.42408-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VRIRcyFc33D9WSOQvlU1E3W1RMkVYB+aNmpoJDb3aMqfZUkE3FM
 Iu6dWMVEoQbInyItH8VJOGnRMHhckYmQWx7g6JjAvbJGIaQwN2PqRGtwr/8LlvJBgoIAyCm
 7DPJD5/ZUB5Pjt4jKFZ6s/vfh7z7/hyntiCMbGgsYTsWwwIMj2DDxJ4acfI1NU5cHRZ/mJO
 EEEZNpJBk0yDSTSx9KkOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T269scm5ZNs=;T4DU760QjWoJdBvDiUG9B3l94hy
 kw83i9Vgce7l9V0rk9uDRJRQX9dZSEDiBVGO9tx8eaiOcFTggJgstIAwG4kNPz4s4038VEXjK
 SXsAPZZs0eJqmkbHsaVnCAwka3DVy3cyoNeYUi/m9UgufYm/H56GOQ4iyHAIKvGNfWgE40jZq
 /A3tB8kxuv02h/+h4pSF2u6zCE6Vlv77qBOikJVE6NB5nzpvJutnf1CTjHJjsG9blxkbjbcs6
 iLSGzUfOEMFUzxHUjlLJlAKeWsGSCCYdrssG9z4jxQdYSTsxrPLE5XQCepvrtgI1O15kIT5P7
 r1foJRpnJovf2gJ7WnckrjUH2KVI1zaK6o3e517lIK73wBOKjl+/OEj42+fKBXfxtA1nk62ti
 d2qKzN6B+k5m7UkOiXChz+wLvgbLORqcpswMcCtM8ww8+je8orpCRgkdrwx2sjJuKhHlvMKvQ
 a3oWE7wKYD8+K6MAoDaLZlkD+LA7897XPCaOrqgj0UdCxO16gItBp2414NAiuDVrgbYMcN4ue
 9AdS7U9hB8yVf8DiyU2mkV+YxP2UIy3+6+ueCQ1fz8aChZIcltcuNYvZBAH2H5Wtjhkx6G71q
 ASZmPfUXmQpO7zTJ4oyXuZqBapj8b9+xtnxiGIIkssbZzF7SrHxCQDrkvwuNeFQuwjCULg7ai
 tXsKzVkfo8e/ZEeGvVS0Xpj52B9vAoZd07UpRoSnWt+rkIJfs1ITdiwBy4o0TUfCsSVVD5tP5
 aGDoGeqYMoNhJ+/MngFE7rkA9R1w0HF1J9UK+yKtQiNMKpZEaEprlsUUeLRxsOkNjaIvyInfq
 g8hS15YFWOK+zITBWk8Xozo0+4GVyxOn9YRT7eMEwD6FG2RTqzQYcUEAx0G5VgAd3iP6omk58
 TR22IrpcytJXq1JoAVPLgFw9erSbefJzfIV9B5/mZHQPcQ4LnrskJm14BeVR8dg6hHL2fmjLp
 gxq7N+X/rRuHewtdVa9NB0tde6Y=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/14/23 16:05, Yue Haibing wrote:
> These declarations is never implemented since the beginning of git histo=
ry.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

applied.

Thanks!
Helge

> ---
>   include/video/kyro.h | 12 ------------
>   1 file changed, 12 deletions(-)
>
> diff --git a/include/video/kyro.h b/include/video/kyro.h
> index b958c2e9c915..418eef6c5523 100644
> --- a/include/video/kyro.h
> +++ b/include/video/kyro.h
> @@ -38,18 +38,6 @@ struct kyrofb_info {
>   	int wc_cookie;
>   };
>
> -extern int kyro_dev_init(void);
> -extern void kyro_dev_reset(void);
> -
> -extern unsigned char *kyro_dev_physical_fb_ptr(void);
> -extern unsigned char *kyro_dev_virtual_fb_ptr(void);
> -extern void *kyro_dev_physical_regs_ptr(void);
> -extern void *kyro_dev_virtual_regs_ptr(void);
> -extern unsigned int kyro_dev_fb_size(void);
> -extern unsigned int kyro_dev_regs_size(void);
> -
> -extern u32 kyro_dev_overlay_offset(void);
> -
>   /*
>    * benedict.gaster@superh.com
>    * Added the follow IOCTLS for the creation of overlay services...

