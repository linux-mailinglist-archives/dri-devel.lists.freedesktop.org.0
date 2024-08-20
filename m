Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678BF9580E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B7F10E516;
	Tue, 20 Aug 2024 08:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="lGTNWx2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A731D10E513;
 Tue, 20 Aug 2024 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ytGC/cPv2axqOpYGQV9hvopSGlgOUVWarCK8N1gO5is=; b=l
 GTNWx2xiqkAIsrUYD3Hp4Wua3iLOeSnEmczr8IF+B2o5S44brMVR2dUrOXzwMpBL2Gisn70mkOp/Q
 7PIKoQrmSMFm/lP57JYix0+RiwcogECYlRM4EVZeUgAMOHifW/c7n+Yn92FIOVKsR0A4f/4EYC9pQ
 3RnLUIqLLvWPpqSwlO/iGAOudm1vK5UQpNcLTsJG4tUhtSd6n8gARVLUavnk+07DPX9LWRhK552kO
 NbnNXrn72UUu5i5qn8EccdQoeczeBx0Va2p8bfWIVlMEObX0NO5Td9fUd6ID1pI5U0ldLizx572a2
 lFF+HH+eqrlnarRC9aa6ppQfWyO4bXZ2w==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=53618)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1sgKCG-00AwsL-Uc;
 Tue, 20 Aug 2024 10:26:32 +0200
Message-ID: <3f09f6c4-3f70-467e-9ad8-9b555f63ed80@tronnes.org>
Date: Tue, 20 Aug 2024 10:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/86] drm/repaper: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-38-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240816125408.310253-38-tzimmermann@suse.de>
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



On 8/16/24 14:23, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
