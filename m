Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7C92F643
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 09:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0710EC30;
	Fri, 12 Jul 2024 07:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y+P9mpOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B9910EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 07:31:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 247D0CE140D;
 Fri, 12 Jul 2024 07:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB80C3277B;
 Fri, 12 Jul 2024 07:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1720769490;
 bh=J6L70/0E91iG7uWlu2BCX4sUocMyTLY/ZH60hrueklk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y+P9mpOvYdW3/S5b7axG8utyPbXFPSg/IAkOgrQHaWl0r1nhlUiu9C9kqMG/M0dKb
 0d6k9QEQ8rK46FZPp7aSqapIU2xjOzMXXeGfPcuN51p1V6FAQFwqAbaVCxUA3OTenE
 5XG1T7IvdKnuOssww09/L7ipNDWwM/EigRv9Z7sk=
Date: Fri, 12 Jul 2024 09:31:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] agp: uninorth: add missing MODULE_DESCRIPTION() macro
Message-ID: <2024071209-squatting-nacho-60b0@gregkh>
References: <20240615-md-powerpc-drivers-char-agp-v1-1-b79bfd07da42@quicinc.com>
 <99d6c483-9291-4bd0-8e62-76022abb762c@quicinc.com>
 <7b7e2952-fb54-48b0-93bc-f96c04e5cdd3@quicinc.com>
 <ce7863a7-f84e-42f0-9aa5-54b43edcd260@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce7863a7-f84e-42f0-9aa5-54b43edcd260@quicinc.com>
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

On Thu, Jul 11, 2024 at 01:27:23PM -0600, Jeffrey Hugo wrote:
> On 7/11/2024 12:19 PM, Jeff Johnson wrote:
> > On 6/28/24 20:14, Jeff Johnson wrote:
> > > On 6/15/2024 2:01 PM, Jeff Johnson wrote:
> > > > With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> > > > WARNING: modpost: missing MODULE_DESCRIPTION() in
> > > > drivers/char/agp/uninorth-agp.o
> > > > 
> > > > Add the missing invocation of the MODULE_DESCRIPTION() macro.
> > > > 
> > > > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > > > ---
> > > >   drivers/char/agp/uninorth-agp.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/char/agp/uninorth-agp.c
> > > > b/drivers/char/agp/uninorth-agp.c
> > > > index 84411b13c49f..b8d7115b8c9e 100644
> > > > --- a/drivers/char/agp/uninorth-agp.c
> > > > +++ b/drivers/char/agp/uninorth-agp.c
> > > > @@ -726,4 +726,5 @@ MODULE_PARM_DESC(aperture,
> > > >            "\t\tDefault: " DEFAULT_APERTURE_STRING "M");
> > > >   MODULE_AUTHOR("Ben Herrenschmidt & Paul Mackerras");
> > > > +MODULE_DESCRIPTION("Apple UniNorth & U3 AGP support");
> > > >   MODULE_LICENSE("GPL");
> > > > 
> > > > ---
> > > > base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> > > > change-id: 20240615-md-powerpc-drivers-char-agp-db644db58c24
> > > 
> > > Following up to see if anything else is needed from me. Hoping to
> > > see this in
> > > linux-next so I can remove it from my tracking spreadsheet :)
> > 
> > I still don't see this in linux-next.
> > Adding Greg KH since he's picked up many of these fixes.
> > Hope to have all of these warnings fixed tree-wide in 6.11.
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Dave, this seems like a trivial fix that is stuck, but normally routed
> through DRM.  I hope I'm not over stepping, but I think I'll drop this in
> drm-misc-next on the 19th if there isn't any other activity.

I can take it now, otherwise you will miss the 6.11-rc1 merge window.

thanks,

greg k-h
