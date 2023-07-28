Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002ED76639D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 07:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7355E10E012;
	Fri, 28 Jul 2023 05:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0010E051
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 05:26:50 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-63d09d886a3so11341556d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1690522010; x=1691126810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
 b=trpErXEJEPDZtUwJrLhT56jOvw/TASEnxJqiim24u87Ey219zXjICSpgcrZjP+hIvC
 YOisNcRp1EFcZBuqaw0v47KkdLVd0rFI+qxA+sXUlebSorcP7hGjMv3NkVKwxd1A+1fM
 +cPBg+wk6aUxXSizYt9OOW8K2HwaRZylnOeA2baYNkYAkyTSt3uSNK4bqSBTUKRlrYKH
 veSyepWn/C4JI0VyBkgwNf9ieJKzWg0hb3tCI/tmQqhFz8s1wdV5XOJi6PQyomubgQDL
 AUwaUxnOfbqg6WW2SXOJHHuKT2fULl3OjCF9EdNHMtPrrV+gZMyo2wDTP0lf87ec5+Bk
 zCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690522010; x=1691126810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
 b=VdpOtr0f/TN/PN/7uJKGgoS7n6Y1Zm4I1acfD0gNyNqRyQmOyedDKHa+mC3lYvaTnq
 daTpD4nm/l1z+cv2VXOGbK2MsH3iDhu6WQC4//TL9qgIqPyGfmYvnEOFb++0zN6RdEEd
 HkXv9Yr1VL3kPHyILIHSIA7xUZGqXdnbQuWgMtJcieKZWdt86KfFGMskGUfAjCdqxJte
 nY/0Q3BbtWKTfOlObBaFa96sjri7MLGktvYro5AecWktR/yPpQcs3tlzo9Pk9Dh7Q71n
 69dfNO7iYaSZmIdchhYy9sYaRUOc1nY03mKual4MiKcq7p64tk5LmoKMdqBIOlI98gxz
 zTWg==
X-Gm-Message-State: ABy/qLbTQt5qpBVk546rUAnbXKW4+tyegWcRMQZgbEq859bNcaVgLfXL
 L1L0zRertxetupuWocdBMX+DuC88Z4hPaw/dWBYLqQ==
X-Google-Smtp-Source: APBJJlGaHKu68l916QbJnESfurRQ8GLdxdUM6h1VlhU7qK1FfkFxQTpsfGqhPqGZxqp+5PbL922CfRISxETZ4hSkBS0=
X-Received: by 2002:ad4:45a9:0:b0:63c:fc39:3c0d with SMTP id
 y9-20020ad445a9000000b0063cfc393c0dmr1353378qvu.62.1690522009771; Thu, 27 Jul
 2023 22:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com>
 <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
In-Reply-To: <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Jul 2023 06:26:39 +0100
Message-ID: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Rob Clark <robdclark@gmail.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniels@collabora.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 david.heidelberg@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 gustavo.padovan@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > I did run into a bit of a chicken vs. egg problem with testing the "in
> > tree" version (compared to earlier versions which kept most of the yml
> > and scripts in a separate tree), is that it actually requires this
> > commit to exist in the branch you want to run CI on.  My earlier
> > workaround of pulling the drm/ci commit in via
> > ${branchname}-external-fixes no longer works.
>
> After unwinding some more gitlab repo settings that were for the
> previous out-of-tree yml setup, I have this working.
>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Acked-by: Rob Clark <robdclark@gmail.com>

And it's also:
Acked-by: Daniel Stone <daniels@collabora.com>

It's been back and forth a few times by now and reviewed pretty
heavily by all the people who are across the CI details. I think the
next step is to answer all the workflow questions by actually getting
it into trees and using it in anger. There was some discussion about
whether this should come in from drm-misc, or the core DRM tree, or a
completely separate pull, but I'm not sure what the conclusion was ...
maintainers, thoughts?

Cheers,
Daniel
