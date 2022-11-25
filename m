Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8BA638E6E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 17:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DA510E132;
	Fri, 25 Nov 2022 16:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97AE10E126
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YyU3CsZN3VIPCxR2xQMhdwjH7aczqev3rWZKhu5I+FI=; b=N+anZv+Ss/hU3nRlUZ5RdaQOnK
 43fWgeac1hdwiukqTr3afraDYLuoLLTEHHc8RlsIHp9xxDUKAv+sYEHXEVo2omPw/eiqHV8uzZI7X
 XPrOBFS82cTr4h9Zbm1DPKYfrGZGW+UUX343Y7wYrS2nyExxj1bc4U/YJxnmsoOYi6QGfA3sXEiNx
 h9KS/skAFNC+CKiNsh2YTVY+2Uow5SlBWLVT+nnZoa3KVRJQxC2uhTXYh/64V/03mqGrkk0GrSc8x
 i3OYCnGjLg3B30kxrFNM0OIHifOztH3+JXnGuEjFvfTON4WlIJWs2RFPNCRQmzWf6cMEwlSlo5GPL
 eBPGFzLw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=63913)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oybp4-0002lx-Tu; Fri, 25 Nov 2022 17:45:06 +0100
Message-ID: <04aabba7-8404-bf4f-29ce-5107ecf8ff72@tronnes.org>
Date: Fri, 25 Nov 2022 17:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/8] drm/simple-kms: Remove
 drm_gem_simple_display_pipe_prepare_fb()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-2-tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> The helper drm_gem_simple_display_pipe_prepare_fb() is simple-KMS'
> default implementation for prepare_fb. Remove the call from drivers
> that set it explicitly. Then inline the helper into the only caller
> within simple-kms helpers and remove . No functional changes.
> 
> Simple-KMS drivers that implement the prepare_fb callback should call
> drm_gem_plane_helper_prepare_fb() directly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
