Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C37D9EDB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 19:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CA610EA14;
	Fri, 27 Oct 2023 17:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A610EA14
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 17:27:56 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3b2ec9a79bdso1502689b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 10:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698427676; x=1699032476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lT09sGgTrEuTUf24HSAV5+mSvhXBl77PVqX+x8VkCqU=;
 b=OBOfH2KlKGmmxOp72WOmxWluFh08PAfzvcad6gD3+AV5wc4GkNj3rulWUQglg+tXs1
 hZwSZ+naH7Sxf5xZ/ViXyc6HwiFDgj2UjUSHJT24tkyTGndERw+5erwVnxU0Ga5V65Ax
 4FH0duMbNE6qZczB+sXyrtmxvmm8787jNdKSsmmd3/lrjGKbsLTEIy94i5gfvfs9MBcE
 CcGxJCJZDyvt+ZRVZhnQFPE/fsok9GBZHc2q7tpP34HDJlCDu0xDu7d7GS2YMb/KW6g/
 s0PURrzEHpbvmCPD6IFc8VtnQxSnWLh5dVINLCBn8u0LyDu1j5wOz5ewZPsxKdbgGaVK
 ltoA==
X-Gm-Message-State: AOJu0YyWCl5WzChsxDVW/1fJlt1ht26EMraOecGCW5KtxGEc1jDJFPKj
 MWGU04CEv/yM67MhlBEajg==
X-Google-Smtp-Source: AGHT+IHrGTnQFkC61PIza6vsczaA9W1Gzyuq3CCjBuzoKftsPrt/l9cqVYYDl7cqKInXkPJDSawjww==
X-Received: by 2002:a54:4690:0:b0:3a8:432a:ea13 with SMTP id
 k16-20020a544690000000b003a8432aea13mr3693298oic.46.1698427676117; 
 Fri, 27 Oct 2023 10:27:56 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056808021200b003ae165739bbsm361155oie.7.2023.10.27.10.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 10:27:54 -0700 (PDT)
Received: (nullmailer pid 2844872 invoked by uid 1000);
 Fri, 27 Oct 2023 17:27:53 -0000
Date: Fri, 27 Oct 2023 12:27:53 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
Message-ID: <20231027172753.GA2834192-robh@kernel.org>
References: <20231020223029.1667190-1-javierm@redhat.com>
 <169801218855.747717.5658253186246322717.robh@kernel.org>
 <87y1foo1in.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1foo1in.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 11:30:56AM +0200, Javier Martinez Canillas wrote:
> Rob Herring <robh@kernel.org> writes:
> 
> > On Sat, 21 Oct 2023 00:30:17 +0200, Javier Martinez Canillas wrote:
> >> This is a leftover from when the binding schema had the compatible string
> >> property enum as a 'oneOf' child and the '-' was not removed when 'oneOf'
> >> got dropped during the binding review process.
> >> 
> >> Reported-by: Rob Herring <robh@kernel.org>
> >> Closes: https://lore.kernel.org/dri-devel/CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com/
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >> ---
> >> 
> >>  .../devicetree/bindings/display/solomon,ssd132x.yaml      | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >> 
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> 
> Pushed to drm-misc (drm-misc-next). Thanks!

Given what introduced this is before the drm-misc-next-2023-10-19 tag, 
isn't it going into 6.7 and needs to be in the fixes branch? Though that 
doesn't exist yet for 6.7 fixes. I don't understand why that's not done 
as part of the last tag for a cycle. But drm-misc is special.

Rob
