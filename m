Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F97B9CAB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1368210E16E;
	Thu,  5 Oct 2023 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8B410E1ED
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grd0e2XsCuK+bksXu1Qk59x25lpmhYvCQDBfsFQkC6Q=; b=lIGNeEIVwGw44qparR1qVba0M8
 CdocpW4r2FJbmrsjQtQ6ZXDOyf3htTVDGa8+BvgDVQcMA4OlHDviBBOtrAa2K4TkXEruHin6+yLMO
 I5WdsSDT7VxoDxEWWhHa0yuxmn7NORLWVVnJaknQSwUdZKYVXGOM+oMsoMDmhVJIu5g3jSzVfmEI4
 wybc3NPgarrO2Y6f9WKyVcNHPc3ObtxY2dJVi8mzaI8PP0I6KohudRk6oZkx8y7X2slKYl53tkxho
 TQbavdERMqWuyxJcsSjAuQZq+Cw7rdNQEZQRgkeiwdqrEfB8TGliXbCF8Lswc+LK2tARM1aX5cBLk
 5yS5G/ww==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=33000)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qoM7x-005gCW-PO;
 Thu, 05 Oct 2023 13:02:45 +0200
Message-ID: <4bf8dd01-5052-fef3-1fa3-85f5d7328701@tronnes.org>
Date: Thu, 5 Oct 2023 13:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/7] drm/atomic-helper: Add format-conversion state to
 shadow-plane state
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20231005090520.16511-3-tzimmermann@suse.de>
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
Cc: noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/5/23 11:04, Thomas Zimmermann wrote:
> Store an instance of struct drm_format_conv_state in the shadow-plane
> state struct drm_shadow_plane_state. Many drivers with shadow planes
> use DRM's format helpers to copy or convert the framebuffer data to
> backing storage in the scanout buffer. The shadow plane provides the
> necessary state and manages the conversion's intermediate buffer memory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
