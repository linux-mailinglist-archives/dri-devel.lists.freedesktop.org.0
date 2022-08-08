Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713EF58CE31
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 21:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4D910F99F;
	Mon,  8 Aug 2022 18:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5821129F2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nKOYwTZZ65PdC0VRg8e7/XcVp9WooaOm9vxXz1gbBFY=;
 b=TPNGyBac1foa0UsoTE2jesNt3TKqB0NjUSjiOPFkwRSVcuPUXhcTLw2j7GK93EB+AaMsubEdfYmQF
 Q7jbVl/39o+P7VSFclUc6T+NzGmSzepkeGXc5Sp179ml9eQYpSbjnVlot8wjwrYEdDfM4phv4eg4o+
 ebami4unKo1SDCZIUg7RmahVjzrQSYYXWEKgI10Ileh8UmaECUfSvT8dTw+1nBE0hF74gSj3YzN3+m
 9gTXTGCu5dYP4wByI4GmLhmbF6yOJ3B11HBf5sw6EwKiGstRA6GXkOtkm9i/tXfm/+elJGGfuhcE5U
 O7raIrlydTSJvFLiDFiIrVA8Kg9WI4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nKOYwTZZ65PdC0VRg8e7/XcVp9WooaOm9vxXz1gbBFY=;
 b=MYuJxJSxPDzJ3Xr6Z3WUQ1u/AVjKDX+tGJZADa81fil8E7oUKAEZnSnxRqRBhTjTDmMcIsJwi6SaD
 RtY5qSlBA==
X-HalOne-Cookie: 3967e1364f7fe32ed1414702d454dd7963b225bd
X-HalOne-ID: c7bed67f-174a-11ed-be82-d0431ea8bb03
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c7bed67f-174a-11ed-be82-d0431ea8bb03;
 Mon, 08 Aug 2022 18:49:06 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:49:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/14] drm/format-helper: Rename parameter vmap to src
Message-ID: <YvFaoYvcfC016JRF@ravnborg.org>
References: <20220808125406.20752-1-tzimmermann@suse.de>
 <20220808125406.20752-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-15-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Aug 08, 2022 at 02:54:06PM +0200, Thomas Zimmermann wrote:
> The name the parameter vmap to src in all functions. The parameter
> contains the locations of the source data and the new name says that.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, this helped in readability!
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
