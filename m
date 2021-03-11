Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3985338BDC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 12:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DAF6F5D2;
	Fri, 12 Mar 2021 11:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1263D6F5D2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:52:07 +0000 (UTC)
Date: Thu, 11 Mar 2021 13:40:47 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 5/5] drm/ingenic: Add option to alloc cached GEM buffers
To: Christoph Hellwig <hch@infradead.org>
Message-Id: <ZN4TPQ.4G2MK5P8EC4W2@crapouillou.net>
In-Reply-To: <20210311123040.GD1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-6-paul@crapouillou.net>
 <20210311123040.GD1739082@infradead.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le jeu. 11 mars 2021 =E0 12:30, Christoph Hellwig <hch@infradead.org> a =

=E9crit :
> On Sun, Mar 07, 2021 at 08:28:35PM +0000, Paul Cercueil wrote:
>>  With the module parameter ingenic-drm.cached_gem_buffers, it is =

>> possible
>>  to specify that we want GEM buffers backed by non-coherent memory.
> =

> Shouldn't there be a way to discover this through a DT property?

Good question. My original way of thinking was that as this feature =

speeds up only software rendering, this is really =

application-dependent: a modern desktop where everything is rendered =

via the GPU wouldn't benefit much from it. With that in mind, it is =

fine as a module option.

On the other hand... the "software rendering is faster with =

non-coherent buffers" really is a SoC property, since it is only true =

for some generations of Ingenic SoCs and not others. So it would make =

sense to have a DT property for it.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
