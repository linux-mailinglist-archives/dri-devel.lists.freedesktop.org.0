Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CD30FCDC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7B6E9A8;
	Thu,  4 Feb 2021 19:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170576E116
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:15:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bl23so7026209ejb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 10:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sHPNpNqRTc3lgTTnJatrn/4jH2bI7C52VyBZqixyw2g=;
 b=gaN16r/UUj+zzbzPB11XW7ssMApTMkYDt3TmgYzvAeTZiRDxNHC0Oja+qS2df1AKKN
 Q690eEXFKXP3i3xfnkfddvO0fP7a0GlHaHfe0ulN9NPhKyc66AJ2/YrpGoo2SDnjaZZ8
 ew2VrJO7jdThs9mHsz16Ps4nmQRXhkyhIOts4rXol1CLRHITrd6SwbodDY9fOu8Qsr9O
 GYQk3KRh12tzFvwr1s3CPIH/TRTyLR96aG6Dw5Y9Ob4orjSSLEgQVP5yhW6Zktouw8PN
 34jMMF8VwCPzMye13PCbMbDL/0j3pbKW9rYJdVu2nEfRkDJ/L+nLuURXbAzNFk/oHTfW
 b7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sHPNpNqRTc3lgTTnJatrn/4jH2bI7C52VyBZqixyw2g=;
 b=q3UNndo2ICWKY80otIwPQ7PdaedlV/rfw7xrBPFd2KhuQ802mGfbiWetzDFCQn/Fr0
 fNHqZ9qqIiRAl1GvHM6F+t6xfdcLCNnOjIEpy85Lt91cVUWuP2qDiwkw56m39vWB4oN4
 G2+4Hi2vZAArWwWRw8eyHKoppWbUXYGRo7x3YAwj55WQ5NxY70P4nRpWO4luXpDLwu/E
 vIjnLB49jeMgqw5aIFEVcqZUIhv7jyAdNDQtPieMrUXuGZrZFhsCEp/UfZDtQqWlmLAZ
 yEb8ZegNZ0na35Zd7tyh3W5SLSAcJq+kWmXV362yboniSXq7yAIMkSpQL3Irru8yN6P1
 5mrA==
X-Gm-Message-State: AOAM530CYFg7+uO6TkPPBQRHsZ9coxTPLQnswy5BRqTvXaF0/PwlpgTA
 84UxSHFeYgldBTzKAkd+gwM=
X-Google-Smtp-Source: ABdhPJzt+oRbAoMs96bM72e8WIvvfb7+n4R3t18vC8R15kZ6WcsGDXWfZjToNyYr4maLekp/7eY1Qw==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr366735eji.376.1612462554565; 
 Thu, 04 Feb 2021 10:15:54 -0800 (PST)
Received: from localhost
 (ipv6-163808adb974b8b7.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:1638:8ad:b974:b8b7])
 by smtp.gmail.com with ESMTPSA id f6sm2881926edk.13.2021.02.04.10.15.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 10:15:53 -0800 (PST)
Date: Thu, 4 Feb 2021 19:15:41 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210204181541.GA13054@portage>
References: <1612287314-5384-1-git-send-email-oliver.graute@gmail.com>
 <20210202175910.ycnf7ehk2i4u3f5o@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202175910.ycnf7ehk2i4u3f5o@pengutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/21, Marco Felsch wrote:
> Hi Oliver,
> 
> On 21-02-02 18:35, Oliver Graute wrote:
> > Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> > to panel-simple.
> > 
> > The panel spec from Variscite can be found at:
> > https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf
> > 
> > Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
> > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > ---
> > 
> > v3:
> > 
> > - added flags
> > - added delay
> 
> Thanks, did you test the changes?
> I just picked it from the datasheet.

yes, it didn't break anything. 

Best regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
