Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922A19003E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C0389DEA;
	Mon, 23 Mar 2020 21:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282289DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:27:14 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id j69so14798262ila.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Lw7508pxSwFWdZ6GgiPhJPtehr+dVa5xWRm6kEQBC3U=;
 b=PWBCSoDOavw9hvHj/OMBv5mwRMPsML6u+x/EhA/GxVtQLYVUB7akQnjQfQeWINsVsR
 8wBAfNwxUWtMBYpvZHqkLssn/UQLBhuTbYGeTE0cfLphH44RfjcHyYXeT//6rqzMxlPV
 3cgchAIpugr1WLVYXs7hkksU/eLNgKy+l/QCqtZEte+tkFGCLtwj+8VTzvfD8RqjBEs8
 S4NuuhsVECUztSuC7PvWCEPLnk9dYOw5ysRituMui51Bfb9EepEJ1DUz2FTT5ndqs6KW
 8l0OftF2U8bNnOIx8y8Z/CmDyTpgBF0JBPf9S/sCoHJ5TYcGdSNRrChhnMyEZmVz82ej
 yBuA==
X-Gm-Message-State: ANhLgQ37J8Fc4jRd3RKbnbplR3Knm8sQnmXljswxBrhWbAMfkpqx/+Sx
 pRvJQruLTJBVXBKDSTihFg==
X-Google-Smtp-Source: ADFU+vs2Uyo1ZpCwKXkQd76bn4sXAFZC1wLEqEru6Weyzn2F3XdHL9ui98NABrGBYJblP8ZmXm+p3w==
X-Received: by 2002:a92:b61d:: with SMTP id s29mr22883085ili.66.1584998834315; 
 Mon, 23 Mar 2020 14:27:14 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id p76sm983942iod.13.2020.03.23.14.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 14:27:13 -0700 (PDT)
Received: (nullmailer pid 14521 invoked by uid 1000);
 Mon, 23 Mar 2020 21:27:11 -0000
Date: Mon, 23 Mar 2020 15:27:11 -0600
From: Rob Herring <robh@kernel.org>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH 1/2] drm/panel: Add Starry KR070PE2T
Message-ID: <20200323212711.GA6856@bogus>
References: <20200310102725.14591-1-dev@pascalroeleven.nl>
 <20200310102725.14591-2-dev@pascalroeleven.nl>
 <20200310185422.GA22095@ravnborg.org>
 <280a128711458950b55b070dbf6f07a1@pascalroeleven.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <280a128711458950b55b070dbf6f07a1@pascalroeleven.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 11:23:27AM +0100, Pascal Roeleven wrote:
> On 2020-03-10 19:54, Sam Ravnborg wrote:
> > A few things to improve.
> > 
> > The binding should be a separate patch.
> > subject - shall start with dt-bindings:
> > Shall be sent to deveicetree mailing list.
> 
> Hi Sam,
> 
> Thank you very much for your review.
> I did consider this. The reason I combined the patches, is that the binding
> depends on the display so I thought they were related in some way. Didn't
> know the correct procedure to handle this. I will split them apart in v2.

FYI, checkpatch.pl will tell you both bindings should be a separate 
patch and that they should be in DT schema format.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
