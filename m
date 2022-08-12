Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920E5914D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 19:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326CD8E9E8;
	Fri, 12 Aug 2022 17:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9AB2BAAB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DBNdtOCw0LSYm0ZFIR59vVL/UMB0LcrTuUEDdG9dGAk=;
 b=ujthIcqej4LObWRrCsw5IWIWnE8n1H0dYnjVlpz4voLm33xuBKadG5guUbAd/gAwrcCnVfvOOC0i8
 NTEdgn3f11VIPzNIyeZlKUnLp4F1NymNTUyEan5RHZOuxwoKHHHF+I0pi5KSm/oIucmWrB6UnKTOI3
 OAYSD9ERPuTqhCPqe5FPxCH24NMPb8kx9y4ZMc5kYsHmJmtmVlcgtwHP7gk+5vwpfD5YtVSr31YYcH
 KQ0prRvTcwABIVUeF7XwgWI1g7ygJdysm9YkKRJOihIj3Te2eSmbE0FrVjg6qquB24gEi+GAb2z2DY
 KP08oA7FmmsbdQySK9MJhCmItz9QJNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DBNdtOCw0LSYm0ZFIR59vVL/UMB0LcrTuUEDdG9dGAk=;
 b=rNCRxNM3gFjY1CjnZyOQr+Siy3c+7vaVtLmBwJHnm/iNOu08YALyEhKMbNsaj5rZAPDI1ylYlCBzF
 laKV5sJDQ==
X-HalOne-Cookie: 86752c2dd7620a1c2b98c62bc5a16f4f32505b9c
X-HalOne-ID: 0f6569d0-1a65-11ed-be83-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0f6569d0-1a65-11ed-be83-d0431ea8bb03;
 Fri, 12 Aug 2022 17:34:47 +0000 (UTC)
Date: Fri, 12 Aug 2022 19:34:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] drm/probe-helper: Add
 drm_crtc_helper_mode_valid_static()
Message-ID: <YvaPNTYDZOrVMWND@ravnborg.org>
References: <20220810112053.19547-1-tzimmermann@suse.de>
 <20220810112053.19547-3-tzimmermann@suse.de>
 <YvQGaIfkske73Dgp@ravnborg.org>
 <5d4bddb5-bdce-0800-61ad-40fa470ceaf9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d4bddb5-bdce-0800-61ad-40fa470ceaf9@suse.de>
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
Cc: david@lechnology.com, emma@anholt.net, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kamlesh.gurudasani@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 06:37:17PM +0200, Thomas Zimmermann wrote:
> Hi Sam
> 
> Am 10.08.22 um 21:26 schrieb Sam Ravnborg:
> > Hi Thomas,
> > 
> > On Wed, Aug 10, 2022 at 01:20:51PM +0200, Thomas Zimmermann wrote:
> > > Add drm_crtc_helper_mode_valid_static(), which validates a given mode
> > > against a display hardware's mode. Convert simpledrm and use it in a
> > > few other drivers with static modes.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > With the header file fixed,
> 
> The include statement is required for enum drm_mode_status.

Obviously - missed that.

	Sam
