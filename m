Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B397880858A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1710E873;
	Thu,  7 Dec 2023 10:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881BE10E870;
 Thu,  7 Dec 2023 10:31:42 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1feeea75fbfso237711fac.3; 
 Thu, 07 Dec 2023 02:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701945101; x=1702549901; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zi/pEIhfWjcb0S+f3fC8l/5THGcsm7y8cPmxyrZp11k=;
 b=bUnAxx2GqPKmNNmdEsS4WDcQl9VFwM8B11AJOf9acBkTG+ZSpvzM+yMq8Pk28tSb94
 pDL1PBg2u2v36ezN/dyKKdS8KBhCVDLBzcF5PeVoXr1qLkI0NR3vTTx1l3vBXOfi5nPq
 5/JXiccT8ajnhyQYdvKoihkBbbfGrrvm8jgvQ2PQOYWi9B+ZgerSlFTefterKUU3QPT8
 ZAxUrMwUkjlcWOLErG3myA2jMWcr3l1OWIIGi/izrHUdC7trPo7bAn8217vksW+rIxMd
 3SPNDkLcJNRh+vq6aWABfe9K5KF/dPrfAR1pC8W7Ds5XZyEIGmU9B7FC2J2yPAhH+DH+
 gJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701945101; x=1702549901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zi/pEIhfWjcb0S+f3fC8l/5THGcsm7y8cPmxyrZp11k=;
 b=EHU6t9XplTXfco5Zxbxr0/HOzaTBkRQSomI6jmWlp1jiZ+FZPg50tpbQfTMDYLdMVq
 FZ78a/HfkhWTXAgHSrKUwFMsMIomesngv8ecJVak7dygUVhuaLjWS/JYJVxT37RICHCb
 qvAQS30gn+R6NBtAEBW8TVrgqm4yz6MtDUsg/RIAYRpf9wEiTXmhw0oyijJFlwkytVUo
 uPbUpDkkdpunRG/nDJ4gGXTDAgt6AHVL1aXFmACJ2+V6zY1x+hd9TJ5ot2dsE2HKFY1K
 tRIE9kVD1MPqahtUpnfOTWpCIiCBAmcQ2rvKBdBcoOTZ8BhtSfEo9EHCYFgXmf6osXRS
 6yfg==
X-Gm-Message-State: AOJu0YyfitH0ZqmCbXfyuUuWNPkLJd8uCLGL2+gjpfffEPsCFm/9nrVZ
 wksXkVSvC4J1rVa/1Wiisq7MkhAgbYDKHYM4/gg=
X-Google-Smtp-Source: AGHT+IGe6QyAHvJ3dNlq85arW1OxLP1khgdRBaBIUe2kM2NNTkaloF8AsNI1eB+7fHFjWCxnpxhGOi913yIf0ehjm/Y=
X-Received: by 2002:a05:6870:4209:b0:1fa:c334:1e46 with SMTP id
 u9-20020a056870420900b001fac3341e46mr2153417oac.43.1701945101574; Thu, 07 Dec
 2023 02:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20231207074308.393008-1-christian.gmeiner@gmail.com>
 <092107b1490b4c1b4ba5f2b60993e452c932f4a3.camel@pengutronix.de>
In-Reply-To: <092107b1490b4c1b4ba5f2b60993e452c932f4a3.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 7 Dec 2023 11:31:30 +0100
Message-ID: <CAH9NwWd+wdpmY3-N+iDO2L5neeEJqJnarMZG4SQb6-PNrMefug@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: add sensitive state for PE_RT_ADDR_4_PIPE(3, 
 0|1) address
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Am Donnerstag, dem 07.12.2023 um 08:43 +0100 schrieb Christian Gmeiner:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > 0x1540 is the address of 4th render target address pair (two pixel pipes).
> >
> Are there any corresponding TS states for this region?

I will add some more ranges .. Do you want one patch per "region" or
one patch with everything?

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
