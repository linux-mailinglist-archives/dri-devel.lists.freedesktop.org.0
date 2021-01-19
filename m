Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D562FBD4E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 18:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846C86E872;
	Tue, 19 Jan 2021 17:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CEB6E434;
 Tue, 19 Jan 2021 17:17:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id j18so485991wmi.3;
 Tue, 19 Jan 2021 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jDfcg2jk9678vyfqCi9ZzgnTVl/KKx8sZFeEAsCjw7o=;
 b=n6mHkIO//wutRmgNX4lr/ciwWVZy+6JuZYKJ54L0qY7sVfHWbm36v11++Ad5anXmFD
 3oNOk7JyYktLq/I28e2Fxd5Z0H6/ZVgYMdN0+bT660khO0u7FohlpvyK+5t3deGPvj4A
 GBcUDzfshD8u1jZchiNHxqb+EhBym+eqhwBY9UwAcwIJD6bjAqwkQyYD37/gZtxOcpfa
 JLC1vYhK8c2sO7hYFVqg/F0lq4jGl8c8AtCJ3V9h7qP2LyjrM4BLbDbBTvpeq/ze39Le
 4JWZUuPvxbbOo7+oFAp69YBVUWOOJaG7ttadmG5Qjy1U8UH57rxea3WAUVEvqqxfgmto
 jnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jDfcg2jk9678vyfqCi9ZzgnTVl/KKx8sZFeEAsCjw7o=;
 b=qukrhR265y8nMxHNcmjQ2x5tw1wI5DuEZv2AUZPRuVnT1EqBSoWHk+rVVApMKetQh+
 lhIIhXimvCj/TzgMlGJauvZ8JnrbmXFnoeOxUTuIcyQc7PS2lrXHyus7I2rt7tfgYbbn
 /9j7Y/5J6OqfKHEAtQFPpGmWihk4CZXR8htR5gGkkRSl7Ip2DtZIW/dScL5Sn/Aqpoy/
 JyPEoeI8mB1u9qkV7uS2MwlmnA/5XOszCfrExJKyBzLsGK57tCLxbzdlYZOLfKCI02hO
 Q5DfgIB5m1ugBIanS4J5WvTedmr5CeAISK3oVPD15DrqIu5K1XJHePFR5Vye8Hxr3gWp
 IJ5Q==
X-Gm-Message-State: AOAM532b4ZXBQAzdSVMOvhYH6dpXEaTNtQJNB0TTS6bwN9f6i0FG2ols
 rmNMu1xMjYF5D96ihFqT2d5AUG0kIChKLnVO2rU=
X-Google-Smtp-Source: ABdhPJz4KcPi8xUUZdVpgsj5Q5Kzuwx0SeRT9GeZatHgWdKcTyuECS3DhM1wGV42sCO5C+PU0ZdZZ/DHYtuXPLe38ks=
X-Received: by 2002:a1c:1b51:: with SMTP id b78mr580821wmb.123.1611076634087; 
 Tue, 19 Jan 2021 09:17:14 -0800 (PST)
MIME-Version: 1.0
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-6-git-send-email-isaacm@codeaurora.org>
 <CAF6AEGunsv5r_DmNsMbYwa4KQxRmK9J+5Bd12LYG4pQ=hrCe4Q@mail.gmail.com>
 <20210118213909.GA17971@willie-the-truck>
In-Reply-To: <20210118213909.GA17971@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 19 Jan 2021 09:19:38 -0800
Message-ID: <CAF6AEGutrOnL6dG41ddK37w_RgyV1HHJE_Hyw1t3DAdMtJZfrQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm: Add dependency on io-pgtable-arm format
 module
To: Will Deacon <will@kernel.org>
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Android Kernel Team <kernel-team@android.com>, pdaly@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 1:39 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jan 18, 2021 at 01:16:03PM -0800, Rob Clark wrote:
> > On Mon, Dec 21, 2020 at 4:44 PM Isaac J. Manjarres
> > <isaacm@codeaurora.org> wrote:
> > >
> > > The MSM DRM driver depends on the availability of the ARM LPAE io-pgtable
> > > format code to work properly. In preparation for having the io-pgtable
> > > formats as modules, add a "pre" dependency with MODULE_SOFTDEP() to
> > > ensure that the io-pgtable-arm format module is loaded before loading
> > > the MSM DRM driver module.
> > >
> > > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> >
> > Thanks, I've queued this up locally
>
> I don't plan to make the io-pgtable code modular, so please drop this patch.
>
> https://lore.kernel.org/r/20210106123428.GA1798@willie-the-truck

Ok, done. Thanks

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
