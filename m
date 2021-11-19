Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E033C456BE3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 09:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185A56F8BE;
	Fri, 19 Nov 2021 08:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 522 seconds by postgrey-1.36 at gabe;
 Fri, 19 Nov 2021 07:02:52 UTC
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4E16F487
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 07:02:52 +0000 (UTC)
Received: from [172.16.68.9] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 72E5F20181;
 Fri, 19 Nov 2021 14:54:03 +0800 (AWST)
Message-ID: <483e616cb69c780f6102ae058a26704a0443d38f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] drm/aspeed: Fix vga_pw sysfs output
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Oskar Senft <osk@google.com>
Date: Fri, 19 Nov 2021 14:54:01 +0800
In-Reply-To: <20211117010145.297253-1-joel@jms.id.au>
References: <20211117010145.297253-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 19 Nov 2021 08:52:47 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrew Jeffery <andrew@aj.id.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joel,

> Before the drm driver had support for this file there was a driver
> that exposed the contents of the vga password register to userspace.
> It would present the entire register instead of interpreting it.
> 
> The drm implementation chose to mask of the lower bit, without
> explaining why. This breaks the existing userspace, which is looking
> for 0xa8 in the lower byte.
> 
> Change our implementation to expose the entire register.

As a userspace consumer of this:

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Thanks!


Jeremy

