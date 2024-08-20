Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB49580E0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4110E507;
	Tue, 20 Aug 2024 08:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="gLriQE4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C8F10E0A7;
 Tue, 20 Aug 2024 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xU9l13/aA5SHhmFyVSJGQyddk2bPNASZGQftMa2HXP0=; b=g
 LriQE4k8WHcyv8YKGGQd7s9TTH9Yf5CrvOEFALmjXKqFvDFeFo9qpGXMqfYEJMHmM+io0DFLPldlG
 /svx54JCDjpS0Go9Iylq1ruittcajxmJtHY1EnDjzbtfSTPEDRgVYkvl6ZcP4AjO0lxx17K8Nhp2O
 WFxHqdn4Ay01Ch0Us7GlGepl7mDLXvkg/1hKtjk4ZJm7c+DZroBFCc/hUlBqdOolp+mfm84W1/1r+
 cOQUfinj/zaH/4L4FcZOnNhdS79+f258vAwUHnw8rhwEMZAeSkpc+3ki4HalBJcbBGVvHhkuA4Pye
 00XD13zIHwEtriiQCobLSSPXKXak7o/lg==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=60166)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1sgKBO-00AwN5-Ql;
 Tue, 20 Aug 2024 10:25:38 +0200
Message-ID: <871d7010-39bd-47b1-aea7-b1b6d39b5103@tronnes.org>
Date: Tue, 20 Aug 2024 10:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/86] drm/mi0283qt: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, noralf@tronnes.org
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-29-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240816125408.310253-29-tzimmermann@suse.de>
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
