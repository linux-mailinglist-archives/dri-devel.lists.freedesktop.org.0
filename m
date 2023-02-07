Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187F968DD91
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 17:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3102610E549;
	Tue,  7 Feb 2023 16:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E669610E549
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 16:04:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so14028626wrb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mkf6lOjY+w6DriQTsiaHaBfCPRbIUyjacQUodaIbLxU=;
 b=IUBq3RMtPA3k2MKRTgAfydlMP2qwP0EC81gv4qLy8dAyOBq6pIXbsZ67OTGzT90+qw
 ZAMttaxC9lrUZIQzT9IRp01AeJktYdQLMVNZuH9U4iNDZ2qRLSUJtcHr/MYgQ3Yrquq9
 XYwK7y6inyycbsI07PRq87GMq0tGE062k1JN9+4vhrekZ+j3PDg6T/kjF23V31T+Wa/N
 btSMmWetssqTLRpbKS+q8CNKaHnioeI7FBfNsoF+vOP1PcbvNWNn2aWA1sn0nDuTbVXv
 PeheqzRFdrkj9Hvit6RfZ93rT+bzJNdiBc0Y2uibhh3sLv01uUdfz3mSPBXye/LL9cKC
 kV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkf6lOjY+w6DriQTsiaHaBfCPRbIUyjacQUodaIbLxU=;
 b=2O2y3BOsT5AGzVWXzpGtK2K/RxqAwa2xHIToiH2UrQHjMNhAfqMmFRaSbUDq60YMdl
 Ui865oq/oPfHZFZ6L1e38aywQu2kXT23asbKJvAaU+6aYoQJinGCNYEw5by5NJe6zzI4
 VrxpHCjU38n4IttSXIFeVXk7L3wZ9/P6AcVVxL8fdR9IX6fbqtyPCkQbDxpF7MlBN5dI
 ny+7CB2/ZIvTn15GVM7WyF9/9UJsljlCJ0vw+MkmJAOqkwTw1LwsN4Lc/utyIkzz5U61
 w9d4DpgR1qKcd9Newfy1RboAw7h+ddV2ScV9/3VAbPXE0i/h+aBXaOaboLziJ5XHHpVV
 VCOA==
X-Gm-Message-State: AO0yUKVpNj2Ltvb2/SEK6IAVHAWF3Ke7Jl62ocN7s8XETOJpXolFH8US
 XElEHivMLrOlXicNkqeVxCnRVw==
X-Google-Smtp-Source: AK7set9LgoQq1EFwiHlPQBez/yjb5wqI/qwX7KEaVYJBXi2mBz0UnHVgxLE673PKnV0Mh116yXa5lA==
X-Received: by 2002:adf:e0c1:0:b0:2bf:960b:7282 with SMTP id
 m1-20020adfe0c1000000b002bf960b7282mr3532660wri.44.1675785888336; 
 Tue, 07 Feb 2023 08:04:48 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 bj24-20020a0560001e1800b002bded7da2b8sm11685999wrb.102.2023.02.07.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 08:04:47 -0800 (PST)
Date: Tue, 7 Feb 2023 16:04:45 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] backlight: hx8357: switch to using gpiod API
Message-ID: <Y+J2nRyDpOE0ihfj@aspen.lan>
References: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
 <Y+DmBGiq9kvRBHLY@aspen.lan> <Y+HQfDtiqUso7e9k@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+HQfDtiqUso7e9k@google.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 08:15:56PM -0800, Dmitry Torokhov wrote:
> On Mon, Feb 06, 2023 at 11:35:32AM +0000, Daniel Thompson wrote:
> > On Tue, Jan 31, 2023 at 02:57:06PM -0800, Dmitry Torokhov wrote:
> > > +				dev_info(&spi->dev, "im gpio[%d] is not here yet, deferring the probe\n",
> > > +					 i);
> > > +			} else {
> > > +				dev_err(&spi->dev, "failed to request im gpio[%d]: %d\n",
> > > +					i, ret);
> > >  			}
> >
> > These last two clauses should be updated to return dev_err_probe(...)
> > instead.
> >
> > With that change:
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> So you want to actually suppress the deferral message unless debug
> printks are enabled? So you want this to read:
>
>
> 		if (ret) {
> 			if (ret == -ENOENT) {
> 				if (i == 0)
> 					break;
>
> 				dev_err(&spi->dev, "Missing im gpios[%d]\n", i);
> 				return -EINVAL;
> 			}
>
> 			return dev_err_probe(&spi->dev, ret,
> 					     "failed to request im gpio[%d]\n", i);
> 		}
>
> Did I get it right?

LGTM.


Daniel.
