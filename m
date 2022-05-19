Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43C52CF33
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0855111B19E;
	Thu, 19 May 2022 09:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8311B19E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652952015;
 bh=zpK7qmEuxYge/gUsHgQmO3AEd42zsCHNUQv8iJ6JeEY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=CdNeUfReA6WbMSCQHTQ2eEMhitppc/U+OoAgYQcLmFSoqHXS+ELByIPIFHeqTua4H
 86g0YuhyyFdZNHHXKSDDe1hTFMqaIoi74GHPiheB4NRKiNtruAbCOWHfUDV7+uEkXE
 cGiCU+ZZ2uLOSUPn850M2oniTL4rCwQz2ivmzhO8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.7]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1o42w60SBR-00Eg37; Thu, 19
 May 2022 11:20:15 +0200
Message-ID: <bf122ee3-1af8-b4d9-bf1d-828bec24deae@gmx.de>
Date: Thu, 19 May 2022 11:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] omapfb: simplify the return expression of
 dsi_init_pll_data()
Content-Language: en-US
To: cgel.zte@gmail.com
References: <20220429054751.3851851-1-chi.minghao@zte.com.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220429054751.3851851-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P6UDANQEdedYY9HQw8mDtHj4tEHpfK3Hz3gS/vJ4zFANaeOZfBg
 rHQWB6oCiIq454K6hkK61A3uQOM1MFDWoHJsLtHjcnPW4y3au4MNxXa4aXaNhNFxXrxh1+g
 SzlazJW7FE+ldMnjAbijY97ajC2YQRqby43w6AMPwiqoyCyGK5Tlsr/T1+mSI7vg4Srw1j3
 6OBebPhwGkn3/maaQwH7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i77wvuez/cA=:u3+HeHHbFME606UA3zpR/7
 o29/5sSUmesHBsO64UA4uq9UzRjpx1xj6asdAhYs+QJ9YqDG3J+nCcHsK4NwFXofV9L1XjhxS
 Ex4mQpY8xZEqkat2DD/KhFNLHGdDNX6UkLvpyNyNuKwoAwsSGvHhA/+C6Lh0TISOsb6896NMV
 CEaYg+y+Z44vpQ2r6F80eXDjkbOgg0BcYWheI7lojRreDQxOsqS1Ze0/pE9s1UKCg4GCxTdbf
 m7Lq1dkLz3W+4z6ta/ucAXnolny3fWwLoNZ0AVQfaVnC/0ztRT44jgAVen76vrHAfi+eGfD4p
 EYMSQYQk7KyurFB05E+n8wrt1aEAbbuY0N9JpobsU/EKZLwINGcRuCyqgek3AC0ZPDfSM+krb
 R3yJL8TvXkubgxuMHmpcZU4QSXgR931z9YCqUkssy6eLPqkqKTl1SiGucwvp78kXsaypLxVhI
 r0QOsZdehMBtzb/o3S3olb4M7xEgm51jrlqgzxVOL5roml9m3DUIyZ2yncT4XtuFC9bNzxq1k
 CJGbZCgqSblYFzatsulvhwwIcHge4msLh5xJCpOiNh1h/2YNpXiAPbNzJ20zoUKJa3pM+zwbY
 QYhXwziVRg4BFY72gGTnUcmY5MLMAOGNCSnrUWAi5mamFH9yh7R2gBHV0VYZlOjgLJmY1CdqG
 8bx8f4np7iAcFAgmiF/JeMkQtWvNQYqnfVmqqFJiFP5gwPABzk3vm/B46tahdj+wmPYdLkwCD
 j+WTpTybKFn0VJJDJiMy5tOEYIO0QOHp5JXYrUD9St/Jr+VeH9UDykzZrk2U23meSXPH4TMHB
 rbv8n5saozb4MK85eZjcG/3JlXQ0N3KKCCI19a4sFxhxrBkxYvsJRyjnCirCnN/d12icztqYJ
 q5SE/2osGEalyaHvNc0sI3Kr7Xv0d2fHRc4DXCh2Hegmf+tPoC2wQI6C6FZtpNEPY/jKCDhOj
 NjcAtm45OlFPF09/qBVpk/+/MR2+wmvy8mAVHq1aGqC9jdqN5wuf4mvdo3t0f7Lx2tc9EVhyJ
 lwCujmIt/e9hjA8mjnlw3U8QThiqgn9yAhxd+NIRFDUIXmI+tqlnVo+UZwdKGPlfTqMoBV2Xg
 zYFPdy6zeMgTyAfiMQ50/EtEcYJOAd0RoAoh2A0T3htwXiO6+j2WCCIsA==
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 07:47, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

I've applied both of your omapfb patches to the fbdev tree.

Thanks!
Helge


> ---
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c b/drivers/v=
ideo/fbdev/omap2/omapfb/dss/hdmi_pll.c
> index c5f89129dcdd..531b36d2232b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
> @@ -173,7 +173,6 @@ static int dsi_init_pll_data(struct platform_device =
*pdev, struct hdmi_pll_data
>  {
>  	struct dss_pll *pll =3D &hpll->pll;
>  	struct clk *clk;
> -	int r;
>
>  	clk =3D devm_clk_get(&pdev->dev, "sys_clk");
>  	if (IS_ERR(clk)) {
> @@ -203,12 +202,7 @@ static int dsi_init_pll_data(struct platform_device=
 *pdev, struct hdmi_pll_data
>  	}
>
>  	pll->ops =3D &dsi_pll_ops;
> -
> -	r =3D dss_pll_register(pll);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return dss_pll_register(pll);
>  }
>
>  int hdmi_pll_init(struct platform_device *pdev, struct hdmi_pll_data *p=
ll,

