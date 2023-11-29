Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A47FD5FC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1332F10E1B1;
	Wed, 29 Nov 2023 11:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326210E1B1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:48:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so4462005f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 03:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701258508; x=1701863308; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zyIdnLill5s8Gi6A6aB8bdGt72IFodHpeawcy9JUzjs=;
 b=WAQGuov5lSQtNM3T/6GQQb3ic4dfr42qGMiAVxw2FrEOV71UjfBqmJJ0IknUrHCxfd
 Qo1Lwj2KfGnikDlHmtDKJYimwKX2WjPbns0iAcphjjXj6wTk2RGiDbZR9WNEH02sGylV
 o2cMckhOSwQmaKiLQuKWcfetzi35U43MzgW/9DXUAhwb7pHr3EjLTRm99esx1u2e4r0W
 XZRRWYRpZUPi1+xLh59bEUnMODvnFBqrj94QwMnQJoexuH55ivO/cHFPu9AaTFrWrJGr
 wY+rU9tBytzT6WVRlZnj54pK97BvtYaELtmehm7QRahhoN0D3etT9vFN2kgDM+jcSwxy
 e7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701258508; x=1701863308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyIdnLill5s8Gi6A6aB8bdGt72IFodHpeawcy9JUzjs=;
 b=vjNgpP77zj+RePBmKbStM5ggHvEgy6UHfNcNQ422ZXA/cJwI3z+VEXmt3hpwk4FJyE
 /fXgCT0gsBVfspuNiIEfzrdhRxsStdH/fqt/nbKawlCtnssL9PNa3NRXCbvHk3ERmpGJ
 GWU46Ju5oYeqgtLEi4p7uk/80PY+qAXtW3yRf/9mqr8mpnZJIcePKXcU6OllbwiG/su3
 YvXJyty1QzHdBdAbkutw4Quyh0SBxLpg4ISQV7HSgXh0rK4kehXY7opL33Q7juYb8kvo
 /uQDbC/89K7JkeWfOFy7uprqT1hfK/pXsC8Q7GdoIsx7d9LTPDBX6UbWhVnkDlkGs0bX
 mO7Q==
X-Gm-Message-State: AOJu0YxFdCEHkbNcBIFIo1udVhvpls4deVqJKujuB0Jev0asOI01nVPI
 KljxJmvVsNDiHvZqIJwLli4lmg==
X-Google-Smtp-Source: AGHT+IHqk0HGROPXHktYqeT8mu1hMpdiuhwSv3EOOX+B9Ih8lGnKQeDyYOVJ8FAhH9H8exOKx2IMNw==
X-Received: by 2002:a5d:698d:0:b0:333:79d:d10e with SMTP id
 g13-20020a5d698d000000b00333079dd10emr5387764wru.31.1701258508641; 
 Wed, 29 Nov 2023 03:48:28 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w3-20020a5d5443000000b003140f47224csm17716026wrv.15.2023.11.29.03.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 03:48:28 -0800 (PST)
Date: Wed, 29 Nov 2023 14:48:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [bug report] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <2ce08b63-b31a-4a8b-8856-5a246a67b855@suswa.mountain>
References: <af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain>
 <DU2PR01MB8034E29BB2ECDAF13972F484F9BCA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <DU2PR01MB8034C4DEA3CC0BC7FD76A0AEF983A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR01MB8034C4DEA3CC0BC7FD76A0AEF983A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:12:29AM +0000, Flavio Suligoi wrote:
> Hi Dan,
> 
> Can I add the "Reported-by" tag, with your name, in my 2nd vers of
> the commit to fix this bug?

Yeah.  Thanks!  If the bug report is sent to a public mailing list then
there is no need to ask.

regards,
dan carpenter

