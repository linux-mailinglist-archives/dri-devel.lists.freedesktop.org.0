Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A366E446A16
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4786EAC0;
	Fri,  5 Nov 2021 20:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90846EAA6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ySLsC1EnSHimHBNUlj4wMuCQlyV8d7jeRRm16O5I0YQ=; b=nbyUmWxKe75XmHh/B1M49l+ZYg
 xydu1gbFE1IVOdoZKzlSzVNMrhyuliAV+isL++SJKmBl8FKDNUM0s2TXpNODJzCpTpL9iSboepK/L
 o3rZ4Qu4aDBKukchw8NGmi1eIDpD3B2EuHuAwFV6v9ssLFaG0nHhP5Znp2y1pYotYiH6xBpC/9rXl
 gDbKu4vE8p46AghHSh2Sr+VBHcrbJjfUljZ/omRlQAtYC/xMSlrWiyJ9dCOU7sqXHqKi2qPFQWOeq
 jrYzi+GX8FNcGXn2MPX2yF0q0nSJrQkmjL38649YV0bu1+hHz1IHrkEpxOw8CySv6vD+RQqPYsSyd
 3vEqOCag==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52208
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mj68x-0006pi-OU; Fri, 05 Nov 2021 21:48:59 +0100
Subject: Re: [PATCH v2 1/9] drm/format-helper: Export drm_fb_clip_offset()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <31701408-4e54-58a4-93c9-c946ef2488af@tronnes.org>
Date: Fri, 5 Nov 2021 21:48:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211101141532.26655-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.11.2021 15.15, skrev Thomas Zimmermann:
> Provide a function that computes the offset into a blit destination
> buffer. This will allow to move destination-buffer clipping into the
> format-helper callers.
> 
> v2:
> 	* provide documentation (Sam)
> 	* return 'unsigned int' (Sam, Noralf)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
