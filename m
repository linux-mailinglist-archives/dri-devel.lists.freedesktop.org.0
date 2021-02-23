Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA48322C2F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BC56E9AB;
	Tue, 23 Feb 2021 14:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Tue, 23 Feb 2021 14:24:52 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CC56E1F9;
 Tue, 23 Feb 2021 14:24:52 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mdvyi-1lnKzS3eCM-00b0aU; Tue, 23 Feb 2021 15:15:24 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 73AB41E01EB;
 Tue, 23 Feb 2021 14:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmzJgTaF5xPP; Tue, 23 Feb 2021 15:15:22 +0100 (CET)
Received: from pflmari.corp.cetitec.com (21-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.21])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 2CA121E01EA;
 Tue, 23 Feb 2021 15:15:22 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Tue, 23 Feb 2021 15:15:21 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDUN+Re/alMVL0Zn@pflmari>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119015415.2511028-2-lyude@redhat.com>
X-Provags-ID: V03:K1:OyqQZwzOO6IF8d6ExZM9WpBmYey37Dqo2pTpIaNdzhHny21aso9
 h9QRW0YUsgsKhN2jbE1zQlEowesa1sbZjl74BpdeCiwCjsHcDZCfjho0irbPPx1/QDzq+K0
 tyMd+mno2hxFag40eKo36u+8W6EfsthzItJotElpVDj3/DHoL1e8MLwPNtqkEISL8uW4s/U
 xQTFFT0qoIwQAZcfUUirA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bnEOmraRsnw=:cTjHY+Sy9eHB6CM5tAfgFb
 2W3nQV6I1HGjGrov4lXLgQIS4PlXTA1rhh8iEPRRpl/S6sN8Iwmzh3pAhQ8BJfeo8pHn1wFWQ
 EqaamcLnwGZl10UMwnE/kHDONfiAzp9b/fgYO1AJxUbzn/OStVeDwXOm8UPKq6Kk4taEaWpdT
 mmsGy6gsIjTo1aCCSdt65vQyS7ikl1A31OT2jj6Z7Hs09LnDTK/47PUQicOfCRsdxZiMVlV6S
 RCutc3d/m0oxpUB0OdBPtSV3nl675z5hgq4rRiL3370hs2MiAAIipa8A94ERrTmpc+1nDsuO+
 s/QqB5JWYPqVcavtlhbGJB9HMOl6LcFYF0ucBb93Ii0dlTPVaRk4QCZMI+8eepOifObk9oLiH
 rOSVx802UWztsEO8C1z8q8Te1lLPhmNu0+jFpw6hlxtKQa36U2y1uKFeuqvtnKASrUWQ+mAq6
 Dee1waM0iA==
X-Mailman-Approved-At: Tue, 23 Feb 2021 14:26:01 +0000
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
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 James Jones <jajones@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude Paul, Tue, Jan 19, 2021 02:54:13 +0100:
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index c6367035970e..5f4f09a601d4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2663,6 +2663,14 @@ nv50_display_create(struct drm_device *dev)
>  	else
>  		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
>  
> +	if (disp->disp->object.oclass >= GK104_DISP) {
> +		dev->mode_config.cursor_width = 256;
> +		dev->mode_config.cursor_height = 256;
> +	} else {
> +		dev->mode_config.cursor_width = 64;
> +		dev->mode_config.cursor_height = 64;
> +	}
> +
>  	/* create crtc objects to represent the hw heads */
>  	if (disp->disp->object.oclass >= GV100_DISP)
>  		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;

This change broke X cursor in my setup, and reverting the commit restores it.

Dell Precision M4800, issue ~2014 with GK106GLM [Quadro K2100M] (rev a1).
libdrm 2.4.91-1 (Debian 10.8 stable).
There are no errors or warnings in Xorg logs nor in the kernel log.

Regards,
Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
