Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46D634093
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE6310E3F2;
	Tue, 22 Nov 2022 15:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BD810E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:51:25 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id cz18so4016537qvb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 07:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zEFNHUyLUEbyu4qT1zUf5LJn5/2APYPQvsP3GKgKfiQ=;
 b=Pkc6P4W3LxVcw/WQufFoYOJKMktfq8Bx3TWo4VgNUGskNLTugz0Hw1jOOlXT8qplG4
 1GoKzR3RkSimoc2fGczFkWkknXHEjHp2gUzsSh0XBNhOzg91hsrwAnzOM6GFiJr/X9Gr
 0ru4Mqvt4BfhKv9zgzHrAc8rKwLec7+0mIvUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zEFNHUyLUEbyu4qT1zUf5LJn5/2APYPQvsP3GKgKfiQ=;
 b=U0kVAFbloDVYw65EFB6YgPuqIkUZ9H8Ns3QXliGA7dJOIQUUbfY1p+sJ/hLBXKDMly
 eJV6FTUIPRqvxVHJOPTGU1C4w1Y/mhnrnW9qpLkHDS9ZG6awG7ZM+1UGmzmcELx+J8nR
 N777l9pvsLaAM/Ek+j/IVxgFea3WeQJiEoU75gL+lS22iseWixzQT1w/Br90TPmBAkGj
 8rDXXti5OdlqiitclS+UBdqDnGuQpap+qrpNb/4NdGPUyVP3AFuFFmHsHixNkTkJS1di
 Yx/sNNkx8uIOvcmel6Q/LFQNegrYpaGr+xXxMAB4gQYUrXDWvpyy2vhZQABRVZiFeRf5
 s3fQ==
X-Gm-Message-State: ANoB5pmL0wPsV51QM25thX/yFJ0bbi+fQF0Y3G+6m6PfWGrGmuXDTSw+
 UCzp2mB4Yy52GD2xB5Ao01SOkQ==
X-Google-Smtp-Source: AA0mqf6ZXjTL75zqXqXjUk2/vAK4va4H6sjpXe9bq6HfTmQdZILStThXhdag4hPyZuBSd1czltVftA==
X-Received: by 2002:ad4:43eb:0:b0:4bb:7ad8:deae with SMTP id
 f11-20020ad443eb000000b004bb7ad8deaemr5934336qvu.92.1669132284990; 
 Tue, 22 Nov 2022 07:51:24 -0800 (PST)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
 by smtp.gmail.com with ESMTPSA id
 u8-20020ac80508000000b0039cc47752casm8242733qtg.77.2022.11.22.07.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 07:51:24 -0800 (PST)
Date: Tue, 22 Nov 2022 10:51:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: git send-email friendly smtp provider anyone?
Message-ID: <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 07:13:28PM +0100, Noralf Trønnes wrote:
> > Otherwise, you might consider using:
> > https://b4.docs.kernel.org/en/latest/contributor/send.html#authenticating-with-the-web-submission-endpoint
> > 
> 
> That's an interesting option. I did briefly look at b4 a few months back
> but it looked like it was under heavy development so I figured I'd wait
> before trying it out. I think I'll give b4 a spin to see how it works, I
> wonder how it handles patch changelogs.

I'd be happy to help set this up for you -- to date, this service hasn't been
used beyond a few test posts.

-K
