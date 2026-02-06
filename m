Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAtiMZuyhWmbFQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:21:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B84FBF71
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C73A10E613;
	Fri,  6 Feb 2026 09:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="CJqe5vSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.manjaro.org (mail1.manjaro.org [142.132.176.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541DD10E613
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:21:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 0BCBA41B4A; Fri,  6 Feb 2026 10:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
 t=1770369685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YojMfz3Ugs/7NMma4XPSlNth2z1uxj8Jmj8kTgaV0WM=;
 b=CJqe5vSMiGZD2fr5TmUOHE/R2xiyuXaS+vcF7IJtwWHnQbQlVCeMmzyUbpyoQl25aRuOVw
 V5C3A3Dlon5AFQa4DtStu4E/aq40eWOCcewN6NRBFKLa1M6E3tVPv9Ks3BDVz1ePezNGCc
 YdlGn2y6ksZT0hVPCYfnGA9pgIe8tHHtpBGtkoBB94/bV0ve9cK3dQcU3tDQmUyNeFoMGP
 KGJpwlFZESzRAFUsbPqOS67uIZoPQ9vB45/UhvQ4reejWaqJwi4wdLjGEy/GXj4FvVH/Vi
 XkkBjJTC9jOG8IZkiOLe6EyYpg0fFyEYbrv7vAPVVsuqiuuSe7/zpaAPGH9Kjg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260206084220.543267-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
References: <20260206084220.543267-1-nichen@iscas.ac.cn>
Date: Fri, 06 Feb 2026 10:21:19 +0100
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, damon.ding@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Chen Ni" <nichen@iscas.ac.cn>
MIME-Version: 1.0
Message-ID: <5eac199e-dbe3-3707-4876-f6bf7754f124@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?drm/rockchip=3A?=
 =?utf-8?q?_analogix=5Fdp=3A?= Add missing error check for 
 =?utf-8?q?platform=5Fget=5Fresource()?=
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	DMARC_POLICY_ALLOW(-0.50)[manjaro.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[manjaro.org:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:damon.ding@rock-chips.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:nichen@iscas.ac.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[dsimic@manjaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[rock-chips.com,sntech.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dsimic@manjaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[manjaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 63B84FBF71
X-Rspamd-Action: no action

Hello Chen,

On Friday, February 06, 2026 09:42 CET, Chen Ni <nichen@iscas.ac.cn> wr=
ote:
> Add missing error check for platform=5Fget=5Fresource() return value =
to
> prevent NULL pointer dereference when memory resource is not availabl=
e.
>=20
> Fixes: 718b3bb9c0ab ("drm/rockchip: analogix=5Fdp: Expand device data=
 to support multiple edp display")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c b/driv=
ers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c
> index fdab71d51e2a..3f5be14010c1 100644
> --- a/drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c
> @@ -461,6 +461,8 @@ static int rockchip=5Fdp=5Fprobe(struct platform=5F=
device *pdev)
>  		return -ENOMEM;
> =20
>  	res =3D platform=5Fget=5Fresource(pdev, IORESOURCE=5FMEM, 0);
> +	if (!res)
> +		return -EINVAL;
> =20
>  	i =3D 0;
>  	while (dp=5Fdata[i].reg) {

Thanks for this patch!  It is looking good to me, but I think it should=
 be
propagated into the stable kernels as well.

Please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

