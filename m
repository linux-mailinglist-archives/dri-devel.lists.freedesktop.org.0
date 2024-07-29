Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1193FA2C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 18:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94C10E423;
	Mon, 29 Jul 2024 15:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XhR154si";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CB410E423
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 15:59:58 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2610623f445so2448467fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722268797; x=1722873597; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rKORujp1kv0/6IBUNhxzZiJOGLH+iRzT6G5ZfGPNOlo=;
 b=XhR154siC7/dYPkadAOTQUZRcuCgzBVC3x9TwcF7Bfg6+Jw9XbmtZicHu7OTPsA4fg
 4AqiYeetx+4r9l6WGcvHOwAK0ZZIMKjU0t8N01tTezn6MOnr6CbgqBPtgo7KDoIlQXMt
 IopSBlFeP5Bq0touMQSwYOBPlJsDxUBDoYayY/VbpTN2UgdnFHOVIayy4TF3HkNiMXbz
 bTTKZF6jRudguu0s4xJTm+Hu3IV/r6tL9p2GdgWq+0qRrKETKkK4UO8WiRjFKyG7Of01
 bcDKEafSFkUI2Y5Mfvo+QfjT6A7lcyMCxn0Ufq9ZHfqWqZ46bXfMxuefpNhf9hX/SIPS
 iVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722268797; x=1722873597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKORujp1kv0/6IBUNhxzZiJOGLH+iRzT6G5ZfGPNOlo=;
 b=HU8iU29sm9z2bmaGFAVVScir28nLV0ZkA/hNbhxYef6jZnCbne0rQJ3y7899i4K6ug
 GPziz3Ex6k3I42648ikThxcRIhnhF07JLWsxnayRNlbVFV6VbitA8FFmVIXmgFSIFvyd
 OfhGxGqbbHoQS7FH1nYsjgRJbO32jhYFzmO+dbPsBm4V211YnK4754oqzjqRkyBdfjZD
 vZ/RY59fnzA8EH6vxpHMlZv52oT29AxUKkdmK1wE5dsrd1sCIZss4EJn8wvti8JI0X9S
 d+x2UQXqYmSoH4MsLhnaRfHwgab02QQgb3Y16WPEdFX886qzOnojipDtur9DaWFNuwar
 JBqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM1nRPh9cwuyBFHQU79jmw+Im6f2tKx+z1BdL/96PZIQkjZa7RWRGonTQEZFKPtvAIENq6knt5G9+OCeyuJ6UEe0Nkh1v28tmL0kzWVg2I
X-Gm-Message-State: AOJu0YwbfjoyiSQIpSt2qf1MPNv/LDi/mclZKqxr4ECHA32l+1j4uAfk
 TN3nnA0XPwEzWvYcEFPMIOOqsmQx5eNfESN0qpI5KhXHSvfPa0tkaAFejfqut5Q=
X-Google-Smtp-Source: AGHT+IEIHagVgO9pv8gb/zQ7JpvS63INgCNeENDNmOULmSa/KXAfqwBHzEaMxKrukT2FJXfnEI3QZA==
X-Received: by 2002:a05:6870:c152:b0:260:ffaf:8126 with SMTP id
 586e51a60fabf-267d4cfd510mr10157250fac.9.1722268797401; 
 Mon, 29 Jul 2024 08:59:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-264fb59ec30sm1895997fac.0.2024.07.29.08.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 08:59:57 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:59:54 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
Message-ID: <ac4c6712-c47b-4414-9640-3018bf09e8fa@suswa.mountain>
References: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
 <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
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

On Mon, Jul 29, 2024 at 10:13:17AM +0200, Helge Deller wrote:
> On 7/28/24 20:29, Christophe JAILLET wrote:
> > If an error occurs after request_mem_region(), a corresponding
> > release_mem_region() should be called, as already done in the remove
> > function.
> 
> True.
> 
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> I think we can drop this "Fixes" tag, as it gives no real info.
> 

If we're backporting patches then these tags really are useful.  As
I've been doing more and more backporting, I've come to believe this
more firmly.

I don't necessarily think this patch is worth backporting, but leaving
the Fixes tag off doesn't mean it won't happen.  People quite often
leave the Fixes tags off of real fixes by mistake so AUTOSEL could still
pick it up.  You'd have to add:
Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > *Not* even compile tested only.
> 
> Ok.
> 
> > I don't know on what architecture it relies on.
> 
> HP300 are old HP machines with an m68k CPU.
> Not sure if someone still has such a machine :-)
> 

It surprised me how many patches we backport for ancient stuff.  But I
guess the risk/reward equation still works because if the code isn't
used there the risk is very small.

regards,
dan carpenter

