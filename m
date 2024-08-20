Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575B9580E5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDF410E509;
	Tue, 20 Aug 2024 08:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="YrnmVLJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87510E508;
 Tue, 20 Aug 2024 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xU9l13/aA5SHhmFyVSJGQyddk2bPNASZGQftMa2HXP0=; b=Y
 rnmVLJL5SmJuj6bublW36FMI7B4AZbNTc6LSsLnDgK9f1G5wp0RPwvb1uAZOygS3g/W5ZCWYNGBCn
 N8sPmtwpXI6lZnRt2IE+RKQ4JUpXW3+bZX2lbm6TmhC9mfVOM3Kopa/xeVj2yA231GDlt01mELk2y
 SBJN4gyPlUMtx6ZQL+wOHgr6CZykhDfWN2GURhv59WkGsZhTjwXatcfQDMCZVXNKNE8BjMoRZqS73
 UNGZRqxwuNMNPZhvB260tZsQpxNM7P4I8V98beDwOUA66LFGZ28ezF/dqmvoM4h3buHpNJF96kOKp
 nBf+9F7hdW6+1SfQd4TmX3KaKP9sp9/RQ==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=38876)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1sgKBq-00AwdO-0Q;
 Tue, 20 Aug 2024 10:26:06 +0200
Message-ID: <e7301e01-7dec-4990-8b8e-b1b7d556b6f7@tronnes.org>
Date: Tue, 20 Aug 2024 10:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/86] drm/panel-mipi-dbi: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, noralf@tronnes.org
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-33-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240816125408.310253-33-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 8/16/24 14:22, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
