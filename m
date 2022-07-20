Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A057B96A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C19C8F1AC;
	Wed, 20 Jul 2022 15:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5228F1A1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=S4TzN2QwGGFIPf6yd0NbI+BY/9ToE6mosqfhMARTTuw=;
 b=hW0mljlcaonVaYqhI8ZhUM7D9+oZb4V0dcdRapU2QieKUgSD5vdYJBqS/GnbZ6ntG6GlBHhKEBQOk
 aiC9/STBnmbfjTCSLPNpSFpP6fx7OL9ATxmg3/bsBE9WxxBRBs3cG4GDZRDjUwUQSP6aivAyat9IPD
 2F17mZH4a5A2gweiPFfoIqTg5/6nuSpF+B975wZNVA84WeEfVhVMuwY+6DkiE58yw+koNYlBldfpMu
 vVDPpPW+FVzk3NvCt1as+fOfIA66ZiGR3aF6j4X3Fj/4TWpUDQUiLOTEZ/5klR662cVjo6cnzNu+G6
 4SmD1PmjWvlbmbc0h6qUoVi5hJcrV+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=S4TzN2QwGGFIPf6yd0NbI+BY/9ToE6mosqfhMARTTuw=;
 b=/UWa+i8a5IePqP4fhE0Lsdnk8OBI5LFW63Zcu92HEG2/4iKeKhArAHBIERmUjx+SLUnq2q49ZKSFP
 VsYByifDg==
X-HalOne-Cookie: b38db88aab713baeb873c9c0aba4c01aa4661cc4
X-HalOne-ID: 70ad7243-083f-11ed-823f-d0431ea8bb10
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 70ad7243-083f-11ed-823f-d0431ea8bb10;
 Wed, 20 Jul 2022 15:20:08 +0000 (UTC)
Date: Wed, 20 Jul 2022 17:20:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH RESEND 2/2] drm/virtio: kms: use drm managed resources
Message-ID: <YtgdJ5ZQAseMWk37@ravnborg.org>
References: <20220720140214.199492-1-dakr@redhat.com>
 <20220720140214.199492-3-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720140214.199492-3-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Wed, Jul 20, 2022 at 04:02:14PM +0200, Danilo Krummrich wrote:
> Allocate driver structures with drm managed resource allocators in order
> to cleanup/simplify the drm driver .release callback.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

This patch is already applied to drm-misc (drm-misc-next) as
90caf42527a40d09e0eed9fcbca08d757f4fd493

	Sam
