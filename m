Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FE1BEF4B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 06:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD226EB3F;
	Thu, 30 Apr 2020 04:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEEF6EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 04:37:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8A20620025;
 Thu, 30 Apr 2020 06:37:24 +0200 (CEST)
Date: Thu, 30 Apr 2020 06:37:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vitor Massaru Iha <vitor@massaru.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
Message-ID: <20200430043723.GA27272@ravnborg.org>
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
 <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=DAf_8NmfAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=NxUiqei-aeCDQRDTOOgA:9 a=CjuIK1q_8ugA:10 a=-sleECFk_mc0XVijyva9:22
 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: Randy Dunlap <rdunlap@infradead.org>, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 11:27:22PM -0300, Vitor Massaru Iha wrote:
> On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> > On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > > Add missed ":" on kernel-doc function parameter.
> > > 
> > > This patch fixes this warnings from `make htmldocs`:
> > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > > 
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > ---
> > >  drivers/dma-buf/dma-buf.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index ccc9eda1bc28..0756d2155745 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> > >   * calls attach() of dma_buf_ops to allow device-specific attach
> > > functionality
> > >   * @dmabuf:		[in]	buffer to attach device to.
> > >   * @dev:		[in]	device to be attached.
> > > - * @importer_ops	[in]	importer operations for the
> > > attachment
> > > - * @importer_priv	[in]	importer private pointer for the
> > > attachment
> > > + * @importer_ops:	[in]	importer operations for the
> > > attachment
> > > + * @importer_priv:	[in]	importer private pointer for the
> > > attachment
> > >   *
> > >   * Returns struct dma_buf_attachment pointer for this attachment.
> > > Attachments
> > >   * must be cleaned up by calling dma_buf_detach().
> > > 
> > 
> > Sumit said that he would be applying my patch from April 7:
> > https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> > 
> > thanks.
> 
> Sorry. I didn't check if the patch has already been sent.

Sumit - patch from Randy is neither applied to drm-misc-next nor
drm-misc-fixes.
A reminder in case it was lost somewhere.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
