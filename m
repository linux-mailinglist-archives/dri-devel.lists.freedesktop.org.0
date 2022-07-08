Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A556BE72
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 19:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A0D10E1F3;
	Fri,  8 Jul 2022 17:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC93810E8E4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=zI4MarraFsbD3OuQb74hl5wEqvQu3hk13p+I5oqFys0=;
 b=Is5GgwWzYSuQ9L/wXlSMt07eN+BJg2u59+QiQwmn6TJyzDtFVioIgye5ixOYo/bR2Sxlz7NJnDWvs
 Yjbmo+ypF89+d080MDSjT5WWNZFcYBYuhAp04PsjQKcgzSF3TH8cuT9dYtm1ZC4mNIK/lhbh16H0c0
 5n1ADCvEzQULw+rg6mDV0tuLl5PpG8+oo5M65rf7HFeen4QvAUx/GKRygHKvTe+myu40gPI5If9Xno
 3VeQUOEeSjhpOjNCfAm3zMSWTK/3ldUFEfOKV2g8VqusROCIuHiLTQu0DB9xcGKj610V0kWuapAfHB
 Il8co0pDH8xqLI6uv//L9XbTv0AdzgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=zI4MarraFsbD3OuQb74hl5wEqvQu3hk13p+I5oqFys0=;
 b=elCEYcrlMD7fi+yM6iJPNrf/iFp7tFT33OPs0FXJgfLzovIJLwZu0vnP3M2HMhP78CjcnHdjSTGFr
 tU8Zlo/Dg==
X-HalOne-Cookie: 498f86168f583b284a0f380fbfc52c48acead0ab
X-HalOne-ID: f57c1e0c-fee1-11ec-be7e-d0431ea8bb03
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id f57c1e0c-fee1-11ec-be7e-d0431ea8bb03;
 Fri, 08 Jul 2022 17:18:18 +0000 (UTC)
Date: Fri, 8 Jul 2022 19:18:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 14/14] drm/mgag200: Remove type field from struct
 mga_device
Message-ID: <Yshm2MDdB8v2vc1r@ravnborg.org>
References: <20220708093929.4446-1-tzimmermann@suse.de>
 <20220708093929.4446-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708093929.4446-15-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, airlied@redhat.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 11:39:29AM +0200, Thomas Zimmermann wrote:
> Each model's specific code is located in a separate file. The type
> field in struct mga_device is no unused. Remove it.
s/no/now/
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
