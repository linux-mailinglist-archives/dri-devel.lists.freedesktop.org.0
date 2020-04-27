Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157301BBE00
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2CF6E3F3;
	Tue, 28 Apr 2020 12:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825606E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:29:43 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r7so12776956edo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3u0dV855unI4O3p8peLsDTUicXAYlb28KnCe8UM7MUs=;
 b=Zlu6VfX2l+7goUVTDjG0v+TCcX75zOZGXqTIdVxBqOlF54VJrT09yWSCdeAt86pL5e
 IR3ssFL9phUIY4cr04VSZ8exPUkcdWgSSislA+X+jcvoelNI6YDI8O1ynEGTXy/+IQdl
 UPD7Nxcf6CE4y3EFj1kwkIMoz8P6STCkLLXBL1NDVVgq6pEkeCJavGgsTDm5zz8XPufO
 Xthx3bO2cYdQ7/GMIVxOyZ3zFuN09avlPFWfLgklAq/pa+vAdO84iaowsDdqhgFsw5eR
 vB8tdAjJvjxu1VLa2ioiMjRM7dS5j/VYyUqdPE/ZPXr3XaSfXaUk3r82WSJY9C+8qGId
 KrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3u0dV855unI4O3p8peLsDTUicXAYlb28KnCe8UM7MUs=;
 b=D6vJ5QzLxNtLMiE8AzgypPbpIWm15PUa95UmNNGA+luSkPLNVGQUhn3lto9GwBsCCK
 PFXeoe4oci1+FpYAHloKzM8jwcEcE/5Bmau1Qu66VndF0YWr5eUm9jta1F563wZeZMbU
 lTLhFJ6vF4PTz3sRx6L1xjpiyMi+1W/pRXygus1vXNO3p9+dx7LnfQIr+sga1AFp+7Gz
 MYzM45qMYvw4vcQeJka5U2n4Ds18uk5oBhD+pjFrmGwjRv0yFQVkPwSA2tn4w3nRzYt1
 XlbDvK5j7uGSLVYVySM4IwTjMCsLpt2AGXGfSa+BZ7ti4zJ03zabkQ8HcA6CcTprB8iT
 k0/Q==
X-Gm-Message-State: AGi0PuZvfYwSFRYPDwGCUKzZfOU2x7WeFLd906GulGDDC90UFDtFtaIQ
 MQ42l54ou2yTsxWU0+UdhkU=
X-Google-Smtp-Source: APiQypKbYjp0Ad9RAw21UP4Z6Nd2JIoYOrwLCpAUf/+Tg0yEq9TchOmQsbsVdRSuZVn7vzuOqKCM7w==
X-Received: by 2002:a05:6402:391:: with SMTP id
 o17mr17630403edv.71.1587976182020; 
 Mon, 27 Apr 2020 01:29:42 -0700 (PDT)
Received: from localhost
 (ipv6-80adf4751ff4da96.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:80ad:f475:1ff4:da96])
 by smtp.gmail.com with ESMTPSA id r26sm1976873edw.34.2020.04.27.01.29.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 01:29:40 -0700 (PDT)
Date: Mon, 27 Apr 2020 10:29:39 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: enabled inversion
Message-ID: <20200427082939.GB18436@portage>
References: <1586424250-25897-1-git-send-email-oliver.graute@gmail.com>
 <20200409101517.GO2001@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409101517.GO2001@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 gregkh@linuxfoundation.org, Oliver Graute <oliver.graute@kococonnector.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/20, Dan Carpenter wrote:
> On Thu, Apr 09, 2020 at 11:24:05AM +0200, Oliver Graute wrote:
> > From: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > Enable inversion mode
> 
> What the heck is an inversion mode and why would you want it?


Should I name it:

Enable MIPI_DCS_ENTER_INVERT_MODE

Best Regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
