Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5D8BBAA3
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 13:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D50610EAA1;
	Sat,  4 May 2024 11:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cm4HmZL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF09710EAA1
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 11:18:09 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso5682121fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714821488; x=1715426288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yv9FzWOzBDzyrTcS40BSQArXvrw2k2j9CKdjQ6IcHqo=;
 b=Cm4HmZL10Vv+q5egmrKZN++JsOLwcHYWD9M0B4nifcFEA5kdxgoIF1k2gAujWwnCwL
 lPwTxg/d9hsArPb8iSgr264jFhBpCuZyYpAcX31oHIh2EMq+C2VnMIoF/RK9eCor3HDC
 jV2floW/ZDW4UQB5VkCfPMcNiiA93a3BIGSdK5zunFjZZPbTiwNEFJfLqcvJ0uumG9kR
 5wXarY/8H909/qCUukmzpu3PZ4MIVogupUuxPtlOQz8+4C3MytnIswjeKcaSkkpIePgm
 dAkX98NxaPvb9Qvo0LSNOTynvGV9sIIMFN92NDgAabBY73FGn44JW0qDiZViNxczz5E1
 Dr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714821488; x=1715426288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yv9FzWOzBDzyrTcS40BSQArXvrw2k2j9CKdjQ6IcHqo=;
 b=uSCjfuIHKPvYjgqjBmP4wtdXBlipO7nKZtyBQTdy1eiQjw6XI3coT0djy6bsKe9zG1
 idIgQDQJrHy4/o0Zuj7C4JJ1ztFCZSeSmoob3tB0cV/6TYeAvVWUS3cZgB/5v9Q4kcjp
 yEHoBmfl8rdG7bMnpMmt+Akb+tGI8P8iFMc4WuDzCPTcirHzl5zIt6wQQoU3k84g4Z42
 Tj3Vui4jednKMX/9ZZdfbrZDsaQwBMwKYKOtT+pqsYTn4F+P6t46EMHL/n3jCRPn2Gwn
 1IqTP5j2baLsdeEoK6BBY3E4n7tgfXj8T1lg7pYL2hL31GOXu4eo3eLrJHwLlsHOi8C9
 5PbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs4jjmy4idin0Urxp+R/EGoIUAdPVFJcmSSYJJ+EiIyljB55Nksdh8DYPieBxIfdjlwnj5WtqNlyis3ugfCKNalo9jLJ6szxcoe/IK1zsU
X-Gm-Message-State: AOJu0Yzrc5ZVs/uEWntfZC6Fdu+twpmz4tNiv172q53fM+THOWfEO+Oz
 XRMCDg1zXfJoDbKchVOuLYA+3BaBIBeCeGNONbCTp4XFbKbqLXr1kkhY4jiAvqg=
X-Google-Smtp-Source: AGHT+IEggVHErInNqsEkGN4lf9Fm25s9yd+oVBzpPNb90IQ2CCo7mKtWyU3ysBaUz2WYQTnosuIkqw==
X-Received: by 2002:a2e:9dd4:0:b0:2e2:2791:9842 with SMTP id
 x20-20020a2e9dd4000000b002e227919842mr3499876ljj.44.1714821487428; 
 Sat, 04 May 2024 04:18:07 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 je8-20020a05600c1f8800b0041bf28aa11dsm8916105wmb.42.2024.05.04.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 04:18:07 -0700 (PDT)
Date: Sat, 4 May 2024 14:17:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ashok Kumar <ashokemailat@yahoo.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
Subject: Re: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
Message-ID: <45366e52-47e7-4e9d-a2a2-7eede9d3b450@moroto.mountain>
References: <ZjRDUO6/M+RDCcQJ.ref@c> <ZjRDUO6/M+RDCcQJ@c>
 <c8d24241-1763-f7b7-4491-2e5aa3ea3be@inria.fr>
 <1389558595.6771301.1714753224419@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389558595.6771301.1714753224419@mail.yahoo.com>
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

On Fri, May 03, 2024 at 04:20:24PM +0000, Ashok Kumar wrote:
> 
> Is there a list of exceptions to the checkpatch information that we can ignore in general.
> 

For Greg's subsystems ignore the warning about extra parentheses.
You can search on lore for if a patch has been patch has been sent
before.  Otherwise ignore checkpatch if it tells you to do something
that makes the code less readable.

regards,
dan carpenter

