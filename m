Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776E19D602
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 13:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D4E6E0FA;
	Fri,  3 Apr 2020 11:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013C56E0FA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 11:46:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c7so8139875wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z4qKFg6qXiNpdW9Pcge07URxEO1f5F1p0WXHLjizMek=;
 b=cy0xGlAQCTV/PM6ifc1OO1V5FvGLvtNYEZO+HbG8tYM54s+gAqPm4ORNDjdKSXReC8
 MJzCdiQt4deFeu/7xCrD8ivzBosAwex55PpoXBpQvqwHm1P+pSLvxk14N4wJJtNQlFS8
 Tse8mAdJ43/j5goZZEBblM/M3/fe8RHWMLaAhDk4dYZ3RVqgFlhddSMH0QjwauU95uzD
 MEo8Bb9Z7F1+Rho5FivNBOA9FuYeOaPf+KlrloSPCXtAMtK+8FfwQwLFycPjPLmJFzD8
 EF9x01UeNB7/cxm+NnEBow5LOcfs+7jytKvRDkrzKfjSM1gvmu4OMnEY9KAmpnp4myuE
 PBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z4qKFg6qXiNpdW9Pcge07URxEO1f5F1p0WXHLjizMek=;
 b=AmOwO7i/uBQ+gNTdtWCrn+MU6QmqdG4s5a+0VawQqb6Zk84zgHEi3B40DQ+HKR/bE6
 8k279Ew4qONTBWGPw/uu7uvTFGqUkyGv4ngYwvgv8tOVzBp+uxoRXXuFEznRm7B/Ljkv
 wAKbf59gFUl2FgyKgmKJxoRirM8iaRALC73VzsSzIVpoygyIqJnGPEMbDTdhhK5IfbpD
 RR3giw+QrGu1H5PVBcWNfy+nK9YQETlyDqVdAy+1FUbW6p5KSb5o5ftkiEyPFHAS48Cr
 /JxKpoU1Uwck4mHY6nFICetX6R+UB4tUQLIot4A1SSnKtt4pW07kJaX2fT8ZU9K8NkIe
 XzNQ==
X-Gm-Message-State: AGi0Puat3PwqSj8z1IFKA2fjtv4IGQIzlOnOFB0rWCYzbfcZTP8zuZzz
 sZS5cd50vDGT6Ilkug3B0THCCA==
X-Google-Smtp-Source: APiQypLGVZe/sOG4rt6Fih9z1DA1NrDQgRLiqudSb6Y23oGtTFFmse8DqJw+/x115r+9L2PbKAni/g==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr8490276wrw.196.1585914414310; 
 Fri, 03 Apr 2020 04:46:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t81sm10970106wmb.15.2020.04.03.04.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 04:46:53 -0700 (PDT)
Date: Fri, 3 Apr 2020 12:46:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kgunda@codeaurora.org
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200403114651.m6rholzufzqinanc@holly.lan>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
 <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
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
Cc: mark.rutland@arm.com, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 04:45:49PM +0530, kgunda@codeaurora.org wrote:
> On 2020-03-31 23:24, Rob Herring wrote:
> > On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
> > > diff --git
> > > a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > new file mode 100644
> > > index 0000000..8a388bf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > @@ -0,0 +1,184 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Binding for Qualcomm Technologies, Inc. WLED driver
> > > +
> > > +maintainers:
> > > +  - Lee Jones <lee.jones@linaro.org>
> > 
> > Should be the h/w owner (you), not who applies patches.
> > 
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.
> <snip>
> will address in next post.

If you agree on all points raised I doubt there is any need for a point
by point reply since everyone who reads it will have to scroll down
simply to find out that you agree on all points.

Better just to acknowledge the feedback and reply to the first one
saying you'll agree on all points and will address all feedback in the
next revision (and then trim the reply to keep it short).


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
