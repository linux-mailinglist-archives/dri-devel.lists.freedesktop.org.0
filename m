Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019EF57BCA8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 19:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D349142D;
	Wed, 20 Jul 2022 17:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372939142E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sdCd3kj16b9Yv+eRtEWDNXSnNK4TcrFZzY9OWD3GAwI=;
 b=tBd8pH8/aqWF6x+tkPSfX7mk7Z/EJhJihKu6EXNrex+0K9v4+dzgqHeAQmQ5oroEGNz+HIqkeTkWc
 Pv5GjyCQUvwwyvgo+Cd6YHXzcl/9MQRYJq0rfkRJveKmd47lzn0B2ia6ptwtqfA9IvKH76RKiverwn
 V+vxVndUKPEVXw69wnCPA4hpJF6PT1Rxj49MtGpp57AMQJdftMNH/Ij/9oaVDqSAO5kf0z14unxfHo
 BYvDr6IKr+jJsSduJwkUaz8memldrV6iBE/7goKcZOPO6DgA5Wye1QSoIanLTwjigKlgzvMY6cZbLh
 tKokXcA231dTqdBR77s6v5+4GFmaCTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sdCd3kj16b9Yv+eRtEWDNXSnNK4TcrFZzY9OWD3GAwI=;
 b=ANUXDNNwirRb9bNdtz+c+dwdD7UNhRwllMMCrkq1J6ThP8xFOak0iDzL5FqvPOGaZOxwjAfCc/jao
 hu9yU7BBQ==
X-HalOne-Cookie: faf91dba2bacfa6772f150608f48f8f73229d226
X-HalOne-ID: 93b333c6-0851-11ed-823f-d0431ea8bb10
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 93b333c6-0851-11ed-823f-d0431ea8bb10;
 Wed, 20 Jul 2022 17:29:58 +0000 (UTC)
Date: Wed, 20 Jul 2022 19:29:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v5 4/4] drm/todo: remove task to rename CMA
 helpers
Message-ID: <Ytg7lLFs0CjviNAE@ravnborg.org>
References: <20220720153128.526876-1-dakr@redhat.com>
 <20220720153532.527458-2-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720153532.527458-2-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 05:35:32PM +0200, Danilo Krummrich wrote:
> Both, GEM and FB, CMA helpers were renamed to "GEM DMA" and "FB DMA",
> hence the task can be removed.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

It is good to see that someone picks up a task fro the todo list!
Thanks for doing this tedious job.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
