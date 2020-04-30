Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2FA1BEE4A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 04:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE1B6E432;
	Thu, 30 Apr 2020 02:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5B6E432
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 02:27:26 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m67so4262599qke.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=n0ueUL4qNH47b8rihpaXCJX1CS3A2QwjcGlCkj6DNLU=;
 b=StXRVF2Z/oF8mgEHbwGRd4ZgjZsl1Cy/jpVXd7mPocE9mQASuyBOR1afSdGwqz+pLD
 TLSZZ6hrfL900AHs6UFdkzuJ6T1ZIk+8KDQvcRKfkMf6iqskQGzMHwIcyp0KTBN/B3Jr
 g3/ic6KlxS4zOurl1rvIPyzp3eTCZukVKBygeVeFutnK0wkK+eLJKsoIADyrDo/uCvih
 rTNF99Bba52PPEijHtMcy1tXNvF6zHwU2dZvDJkYaxB48lBe5mwH4Ei+O/6Idefys5Rh
 Cmsk5oB1YL4dIxX9vuDKpKwwnFbv6l0RYfgogeXgN9var+eGCXLr6FRuw71Dv55AOOnH
 qk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=n0ueUL4qNH47b8rihpaXCJX1CS3A2QwjcGlCkj6DNLU=;
 b=JFyA7Fyjp/R4U57/urW+WX3kbWIskdZnS5yeznGNADO8tqdmm2OuJPyUOzVEj7hFzD
 3ba+/4KObchoqfft5HkCgFOYaQmQl3jxZZ1XFD0hw28Qjdk4K+jb5fxVH2HE+cLaUUKN
 D9i2/QbwL03VS9QzpuWADOwR7Xq7y9QtEmtzdQbHzxIhCCPFgT/iCpeL7zVt5/1mqPow
 gYLJAyJEjq/iRyO7ZP87w8fFInSkFjpnLZjwnxSfl2oRt//eSzHMcKPCrTdooLRAXZQJ
 WPcf4ghCjLJmG9l4o7l93I2xz/pQdCNx/0Euf8aRT4fx4fp/Ttqp9j03XFWp1oGfLQ1j
 dWKQ==
X-Gm-Message-State: AGi0PuahsKsuBuqV3g4lPxLlUpR/hrl0RxQEDACXLZ5OKP67+8qndSdg
 6gm37XVYC3bBW6kj3CEvK+ju7g==
X-Google-Smtp-Source: APiQypJIgieYBZmgtgtmw8KT3AWQ292kizhBLwc90lYViUzaNYyqOUctQH/KIfh3FW1L9bc3b6KCrg==
X-Received: by 2002:a37:a312:: with SMTP id m18mr1455117qke.251.1588213645884; 
 Wed, 29 Apr 2020 19:27:25 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id o33sm953420qtj.62.2020.04.29.19.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 19:27:25 -0700 (PDT)
Message-ID: <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
From: Vitor Massaru Iha <vitor@massaru.org>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Date: Wed, 29 Apr 2020 23:27:22 -0300
In-Reply-To: <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > Add missed ":" on kernel-doc function parameter.
> > 
> > This patch fixes this warnings from `make htmldocs`:
> > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  drivers/dma-buf/dma-buf.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index ccc9eda1bc28..0756d2155745 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> >   * calls attach() of dma_buf_ops to allow device-specific attach
> > functionality
> >   * @dmabuf:		[in]	buffer to attach device to.
> >   * @dev:		[in]	device to be attached.
> > - * @importer_ops	[in]	importer operations for the
> > attachment
> > - * @importer_priv	[in]	importer private pointer for the
> > attachment
> > + * @importer_ops:	[in]	importer operations for the
> > attachment
> > + * @importer_priv:	[in]	importer private pointer for the
> > attachment
> >   *
> >   * Returns struct dma_buf_attachment pointer for this attachment.
> > Attachments
> >   * must be cleaned up by calling dma_buf_detach().
> > 
> 
> Sumit said that he would be applying my patch from April 7:
> https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> 
> thanks.

Sorry. I didn't check if the patch has already been sent.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
