Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311A967D48
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 03:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85710E1CF;
	Mon,  2 Sep 2024 01:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EUnmZzHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8540410E1CF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 01:23:21 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-27018df4ff3so2379987fac.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 18:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725240200; x=1725845000; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u/xe9QZ+gYCeSq3BZh2r9ujizGNk/decUAVyH1Yg/YA=;
 b=EUnmZzHhqYd48fY75ACTX1s6GC1K/iQS3aP/hQ/tk6Xy1+FC7xdgwxi51cI8Kz/mXT
 hIu2UizDwQFpFq28mpBJRvj+IYtxajgrzaJ6QfUoKuksbRWVl0ha8N31hS/OUD6w1U4D
 M62jp1pglMOA+mka/dKfdZHCkhjoEN3/EJ/ZFvJbHRE92aUdFXS0bTgytgP3nJQyQIAU
 aZiALey3RrKgVwPkUb+6x66mmdBH2Ilhjw3XOyJInLcZVY+PmBnQtiPOabaD3izN1S6r
 MU+QkSg4ZYZiFDtDDvW2DEjmPiRuzvNhUGrvssTFMVmlMwDHrH7ss1M8Pl4fRfF7pPPE
 FbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725240200; x=1725845000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/xe9QZ+gYCeSq3BZh2r9ujizGNk/decUAVyH1Yg/YA=;
 b=TjICpxgdM0RbsVIFDE+OBLzcRdVR9OAprQJ2YzKUQX6Bx+FnxTxQuwVxh4f0NmrHhD
 XwPG5MSWyXQxp1hzlJHU7+klOa17Kkivn+lAHfKjw/2Ncd1svbdMI2UOaNBULftoylbH
 vmXAXeqY1mxVGol4lcG2Z1jQl3FGKipMDYVet+6IFui2atQFN1Crom6EOZTbjHgXums3
 ogDvNHtCdos/9bvBdjk5SneF652w/tcbn4edHRJo8D1R9wgMa/XxHW3NBDSCA6UXbG8H
 YjF2svCT5yjVwhwm5COhwqSifuzK7YVfGCNI+NBou05BtJE8I5yd7+NcXz9zDDUFT8dG
 f4Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt4DkZ8SGmGVokY59r7J541MxqCW6SVjs5KMzZnFrcCsRdNlxaHABjfRRAtM9Q2UZ3qfBrRZHjezM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznkZQgPGZhwkW9qFshD4FHhvJuUmRLTsk5IelCFrXhWef9HBoT
 f5WK3E9pJY+Q6xHZ+kX+XHG1G2Trr9q/n/YHwjo+Dk89cmH2swfN
X-Google-Smtp-Source: AGHT+IH6KvwfF320D8xw/jut+hpZ9VMsVm9fprd9ay7D3ASB+9t79VFPwlYZxN0fUjpgiNxSLJSNJg==
X-Received: by 2002:a05:6870:9e98:b0:254:affe:5a05 with SMTP id
 586e51a60fabf-277d044346cmr6761684fac.21.1725240200505; 
 Sun, 01 Sep 2024 18:23:20 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e56d9716sm6038692b3a.174.2024.09.01.18.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 18:23:19 -0700 (PDT)
Date: Mon, 2 Sep 2024 09:23:15 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, thierry.reding@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: devicetree: Fix typo in lvds.yaml
Message-ID: <ZtUTg0C81FwChfDh@visitorckw-System-Product-Name>
References: <20240901133046.962263-1-eleanor15x@gmail.com>
 <20240901151745.GB6713@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901151745.GB6713@pendragon.ideasonboard.com>
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

On Sun, Sep 01, 2024 at 06:17:45PM +0300, Laurent Pinchart wrote:
> Hi Yu-Chun,
> 
> Thank you for the patch.
> 
> On Sun, Sep 01, 2024 at 09:30:46PM +0800, Yu-Chun Lin wrote:
> > Corrected the spelling in the description of LVDS Display Common
> > Properties.
> > 
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
LGTM. Feel free to add:

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

> > ---
> >  Documentation/devicetree/bindings/display/lvds.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
> > index 224db4932011..b74efbea3be2 100644
> > --- a/Documentation/devicetree/bindings/display/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/lvds.yaml
> > @@ -16,7 +16,7 @@ maintainers:
> >  description:
> >    This binding extends the data mapping defined in lvds-data-mapping.yaml.
> >    It supports reversing the bit order on the formats defined there in order
> > -  to accomodate for even more specialized data formats, since a variety of
> > +  to accommodate for even more specialized data formats, since a variety of
> >    data formats and layouts is used to drive LVDS displays.
> >  
> >  properties:
> 
> -- 
> Regards,
> 
> Laurent Pinchart
