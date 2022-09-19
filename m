Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F415BC2CE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 08:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B00910E2D9;
	Mon, 19 Sep 2022 06:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145D10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:29:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bq9so45909446wrb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=eAWD73qG4IDp+5ccid0Sl6nir7pRRg64d5t1THToUEU=;
 b=of2zgekPNxB96FW6eKa+4ETfj/8YvCmtKnn4L109xXwJpffj+74sp+xbqMIo0NLKYM
 IHIOTP+DF0RKWrBQkNW7XeEaOOB4+oW5tIKiLuQoRzRpGzNZyLTdXqde0lDAxppAzHOM
 FFIDO7waXGw/tEsWtgq918lk0UFpwQ+0N9QtMzm4fV1NXr4Q7YbGjRr4aBs076Cwquru
 mOfTexh5CV484MmNEKRdOZdnbSeQxOJGrf8lQEvU6w9RfmsGO0CxyzEtLxGyUlsCM8tG
 6wLmXwMlHSKcmDzQ+qwacHd6YYSNczr+o6aJnTQUM8Ux1yOzZNS4ERuarLKDKGlMJQo/
 Zk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eAWD73qG4IDp+5ccid0Sl6nir7pRRg64d5t1THToUEU=;
 b=ycW7Den1HqCR+nIYddzSCRrYO9MtipwPt6Uhba1PosGQ2m7vGmoZ+ktkEsmquS3SCI
 VpB4aa11G/762iLTOVWND0P2TibVn+SllvRg/imK6VGAmnx/U6ZIaZApZ3+9EU2NDQAk
 mBcKJ2y5ElII3guhJEw7xTH/WW9CondICJmEb2phkQpf82uSEjOYtXti7KlDTSF+cVlW
 QZD405jkhJXPW2kpRV00/gDRB7iyj9sNX2N4nEBop/fliwiTMB9v11qdmdxSV9dfstV0
 BmB4GbnU9QMR09ZzJI+NhRJAF2uft5W65Mw9zIeU7zEeYhDttj7/PB+iqo7FfumBwJge
 CsLw==
X-Gm-Message-State: ACrzQf1oPL01rzd03fAGEy7XyTFeFvHBoqtmQ/wEUsiar7WrwunZ2+vw
 M7FzuhkQPU/oHZ5kMJKivwQ=
X-Google-Smtp-Source: AMsMyM74Kxl42e/tpsCQffcx34x2F4TJ+pQo9Pdb4rR6FecNxBeuoGim6EklYsKVCnc5JifqLoy0zQ==
X-Received: by 2002:adf:ed41:0:b0:225:3fde:46ea with SMTP id
 u1-20020adfed41000000b002253fde46eamr9530414wro.345.1663568981002; 
 Sun, 18 Sep 2022 23:29:41 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 f18-20020a5d4dd2000000b00228aea99efcsm12904835wru.14.2022.09.18.23.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 23:29:40 -0700 (PDT)
Date: Mon, 19 Sep 2022 08:29:37 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v3 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Message-ID: <20220919062937.GA14706@elementary>
References: <20220828164517.185092-1-jose.exposito89@gmail.com>
 <20220918132240.GA7818@elementary>
 <2436e241-dd04-bcd3-f832-13e5497e0469@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2436e241-dd04-bcd3-f832-13e5497e0469@riseup.net>
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
Cc: davidgow@google.com, magalilemes00@gmail.com, airlied@linux.ie,
 maira.canal@usp.br, dlatypov@google.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 geert@linux-m68k.org, tzimmermann@suse.de, tales.aparecida@gmail.com,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 18, 2022 at 01:26:06PM -0300, Maíra Canal wrote:
> Hi Jose,
> 
> On 9/18/22 10:22, José Expósito wrote:
> > Hi!
> > 
> > On Sun, Aug 28, 2022 at 06:45:14PM +0200, José Expósito wrote:
> >> Hello everyone,
> >>
> >> This series is a follow up on my work adding KUnit test to the XRGB8888
> >> conversion functions. This time RGB888, XRGB2101010 and gray8 are added.
> >>
> >> Best wishes,
> >> Jose
> >>
> >> v1 -> v2:
> >>
> >>     Tested-by: Maíra Canal <mairacanal@riseup.net>
> >>     Reviewed-by: David Gow <davidgow@google.com>
> >>
> >> v2 -> v3:
> >>
> >>     Export symbol drm_fb_xrgb8888_to_xrgb2101010()
> > 
> > This patchset is being in the mailing list for a while. Unless someone
> > has a reason to not merge it, I'd like to push it next week.
> 
> I believe this patchset doesn't apply anymore due to this patch [1],
> that applied a naming convention for the DRM tests. Maybe you could send
> a v3 rebasing the patchset.
> 
> [1]
> https://lore.kernel.org/dri-devel/20220911191756.203118-1-mairacanal@riseup.net/T/#mb794103c8e39cdb76734f4e22ce90806f11d99bc
> 
> Best Regards,
> - Maíra Canal

Thanks for the heads up Maíra, I didn't noticed that you patches were
already merged.

I'll rebase on top of your work and send v4.

Best wishes,
Jose

> > 
> > Thanks,
> > Jose
> >  
> >> José Expósito (3):
> >>   drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
> >>   drm/format-helper: Add KUnit tests for
> >>     drm_fb_xrgb8888_to_xrgb2101010()
> >>   drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()
> >>
> >>  drivers/gpu/drm/drm_format_helper.c           |   1 +
> >>  .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
> >>  2 files changed, 191 insertions(+)
> >>
> >>
> >> base-commit: 61a9fa154d217c13eea90aa5bc635bc4b1fcb66e
> >> -- 
> >> 2.25.1
> >>
