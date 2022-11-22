Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C31634936
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 22:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0937710E045;
	Tue, 22 Nov 2022 21:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92610E045
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 21:26:15 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id i12so10993540qvs.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H/3w9yKqqRG++46SYKw/BvQ7OXa5qiQLydJKuGizLjM=;
 b=OEeURiKxi5yR2FfAezt4doRA2iCud9LVWoVbXOvejmapl8ihM9YHEElXzysAANCfxa
 dQbQB24lXf3tDszqiMSczQqra98Kh8OeBOwMzLLYO6eEn5XnslrT3Q8IuV1dSqYl43xU
 Z4o9oM03xmFj1RJeJnOy6MUpYPiJiYbPu9mCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H/3w9yKqqRG++46SYKw/BvQ7OXa5qiQLydJKuGizLjM=;
 b=Hu2tHHf9pjUNDkddnloCIj8+9BFgDjYmEm5KF6NCHAHT17YNeALJcTyZeHnfdlYzPN
 idSElHv9HCuFmAa4txJYxsYoCsL6JgFdwQUGpQAWjijKUSaIdA9dLEsje8+pZdlP3Wf2
 nOtvtpw/z2K+FFRDmh5RSwnIik+iOZfQFDo9ooIgfsXy9oB803mSjoZbblIz1IIDdhXm
 uTcBJbhGIeQpfhkXcOLUVUziR4/JiEpfpxw98J27SbLlWxYaBP9gP0GK7aM0xrPr3o04
 2YCWHahi8/jrr+d35GnT0MzGlm9hNFeWM1ifbTeR1LzPHYHY5rILiQz1Mrz5PM754olh
 gqcg==
X-Gm-Message-State: ANoB5plGZMV0rwlpnbGTBvc/yTnCZWtZo7uDo+AsGakCjkwVWN4WTW+3
 8TQaqbmtQegYZYu/sRWD+uRGYQ==
X-Google-Smtp-Source: AA0mqf6tagH+MzMTfd+Es3fiBHAq8mjPv7ni0PixV/V4F1Bx3v0jsuCgqKjaWc2ULHVGOTrQK7alCA==
X-Received: by 2002:a0c:90f1:0:b0:4c6:8f2e:9a2 with SMTP id
 p104-20020a0c90f1000000b004c68f2e09a2mr22270476qvp.100.1669152374770; 
 Tue, 22 Nov 2022 13:26:14 -0800 (PST)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05622a114e00b003434d3b5938sm8870457qty.2.2022.11.22.13.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 13:26:14 -0800 (PST)
Date: Tue, 22 Nov 2022 16:26:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: git send-email friendly smtp provider anyone?
Message-ID: <20221122212612.sbqv47ecsgiqmhss@meerkat.local>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <182643db-e5f4-2277-a971-0f159849dadf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <182643db-e5f4-2277-a971-0f159849dadf@tronnes.org>
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

On Tue, Nov 22, 2022 at 10:10:47PM +0100, Noralf Trønnes wrote:
> Konstantin found a workaround, so I was able to push the patches.

Yes, this uncovered quite a few bugs -- which is excellent for me, not so
excellent for you. :)

> Here's the result if anyone is interested in seeing the result of using
> b4 and the web endpoint:
> https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org/
> 
> Patchwork gave me a new submitter ID:
> https://patchwork.freedesktop.org/series/111222/

Oooh, I see that patchwork is still not doing the right thing with
X-Original-From. It will only do the substitution when the From email address
is the same as the email address of the list.

https://github.com/getpatchwork/patchwork/blob/main/patchwork/parser.py#L437

There's unfortunately no fix for this that I can do on my end. :(

-K
