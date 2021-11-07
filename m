Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42BA4472B7
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 12:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6F66F9A0;
	Sun,  7 Nov 2021 11:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96CD6F9A0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 11:27:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id m5so5368998ljp.4
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Nov 2021 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hw3f8A0xcfp+7fY6nrzS0qknZ7hBjGetCtJNzksT3bY=;
 b=UOJL2G1EuqbvTl2obX2pjQi2CKbdJtX1VOat5e8yBVHE/gXvnBqcPSw6kyVR2Pg5RB
 MvF80OX4cuZJiaJnDiJQbDqFvZOpLulRCdjvShi/vgri/+NGZuVFoKz9dXRNvYuJf7e4
 etvX77J7TkcPPPFZJEJiEpCjKSjPe5xCGp6x3SDGog3L37Hk0OEsNRzqjkvL97agl9C2
 JzJaJeJmF0ZB0ROEZqVcizAqJ/wc5JkP+eGpjqfz8EZRBs5F4fuA09wv6k/ZctPaqTI0
 WAs49QB6aBW6bI5JHN0xIH8vmtOsr76596T61ynM2lhtATBjCVnO+fhfSybGZqD4N5EM
 zQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hw3f8A0xcfp+7fY6nrzS0qknZ7hBjGetCtJNzksT3bY=;
 b=njSM0ZOaZWbmt6rQVbkBL6g23VSWffuWJxZhWggKORxY4Hm3Dtp96CK8+6qbp1kGXf
 py2M24Fi4ndbI4pB1cJ0kt3q+6+VYQMqg5W5ZX5PXzl7X6qqs1UM83cHFC/p9gn3ZT9w
 agKDlX/Sc3jyf+jxlEyLwf+CHtL/zwUJgGem1tEVj1C1TBSoAYta0w65U5BqfIENWdTG
 mjNj0LM/6w3mY2Hd1FdMwrrnlxSUSxpGoSUeAe2O62NItkb+ak+bBEu3+EiqNQc4BFof
 4gv53YM7MRAKwGxF9jVH6ugyiqw5BaI/ByLn0Zcn3d8V+4lJDWWejHqa8L/EUJ44yRNP
 WmAQ==
X-Gm-Message-State: AOAM530TclAdIuHlhgTM0QOoGdyzJdneiyJI4sjicCwdawsQ0K1TAGsE
 l0YL1RHLo/iq2dCF9cV2nkw=
X-Google-Smtp-Source: ABdhPJwYd+I1A0Kh2oykxpNkiiKobsvCFTSDJtzYP9pc+/C9cZzw4UvDTLU0siLRKHUJ4YFoUvqCWQ==
X-Received: by 2002:a2e:814b:: with SMTP id t11mr3582438ljg.171.1636284461914; 
 Sun, 07 Nov 2021 03:27:41 -0800 (PST)
Received: from localhost.localdomain ([37.45.143.17])
 by smtp.gmail.com with ESMTPSA id r127sm1450062lff.62.2021.11.07.03.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 03:27:41 -0800 (PST)
Received: from jek by localhost.localdomain with local (Exim 4.95)
 (envelope-from <jekhor@gmail.com>) id 1mjgKq-000DNe-8X;
 Sun, 07 Nov 2021 14:27:40 +0300
Date: Sun, 7 Nov 2021 14:27:40 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Lenovo
 Yoga Book X91F/L
Message-ID: <YYe4LKExKYvLiy/Y@jeknote.loshitsa1.net>
References: <20211106130227.11927-1-hdegoede@redhat.com>
 <YYb6r8+aw1bR9R4z@jeknote.loshitsa1.net>
 <YYemqI7MP/rdKuq9@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYemqI7MP/rdKuq9@ravnborg.org>
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 07, 2021 at 11:12:56AM +0100, Sam Ravnborg wrote:
> Hi Yauhen,
> On Sun, Nov 07, 2021 at 12:59:11AM +0300, Yauhen Kharuzhy wrote:
> > On Sat, Nov 06, 2021 at 02:02:27PM +0100, Hans de Goede wrote:
> > > The Lenovo Yoga Book X91F/L uses a panel which has been mounted
> > > 90 degrees rotated. Add a quirk for this.
> > 
> > Tested on my Yoga Book, works.
> Great - and then it would be prudent that you acknowledge this with:
> Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> A "Tested-by:" is in many cases better than an Acked-by: because you
> actually applied the patch, build it and verified that it works.
> Where an Acked-by: is just to say that you have looked at the patch and
> agrees with the patch.
> 
> So a Tested-by: gives you the credit you deserve here.

Yes, of course. I forgot about such option.

Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>

-- 
Yauhen Kharuzhy
