Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E0678C45
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BA310E035;
	Mon, 23 Jan 2023 23:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEA410E034
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 23:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674518061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNxk5DC/yGhXC60vpQiNIfe/JhxgHiPlqLfRlRn3ULE=;
 b=Bz7Y73GlIuv8dRCg2mv/4HTK+pPUrnA991HgEWeLf3W18ldBMeHmyvb2kRzn38XrWF48mm
 uh5QaUfm9G5MFswCoxPayJCyuYmymEBYwrz6AdSn/D03JU5ceGnIoCQX+2FMnjgSRhMFqk
 0tM4AYoT0DJ6KgIcTKiMWVPDXcgHedA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-OaVaZeRxP02LxJu_929ZfA-1; Mon, 23 Jan 2023 18:54:20 -0500
X-MC-Unique: OaVaZeRxP02LxJu_929ZfA-1
Received: by mail-lf1-f70.google.com with SMTP id
 f17-20020ac25091000000b004b565e69540so5685229lfm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNxk5DC/yGhXC60vpQiNIfe/JhxgHiPlqLfRlRn3ULE=;
 b=LfkhavxtSr+uRm9IWuJPfTL0Vln8AUEfZtFm4D5Kqg9gHuJAKAzIsADAWjyrTmItS9
 TAz0qA9Vj/sNmeNNZMrljL1lmckr0DNtocsJVP6PD0xkb6R0RHA6eb5pkbYh0Q30UWD9
 7CJr3td8jWze+O9kNTeIgMTrYs8+jJVcNukxarfDKw5LlLVZHogZQXnmUYDPahZ1DCGU
 ulfISJYhOB25u+skgWI2+uQfcCGX6/p4wk9vglryecgkx5FEpT98QMPU/um5KPDnFpCM
 dod/+FzXjxdVVJDuzo+dN0KcKOnuw0H4sRYY+F3y7r+bjm4nSGjja53/KLoLU4JLPEhx
 XjYg==
X-Gm-Message-State: AFqh2kpCiXJc1GjurC60VyCYwRmiXUFVOSLlswJhudMjbUpLmpcBugd+
 ohsyDZbgpe9gEUPQhx4+du7nANCUi8oTQsPlwMsZ2YhZjGwNvJw2P/+SrFUP8UPFe6JibzSGgR6
 EMG8hSxaHgcc1lZpPsZp6bDVyJxAQU5kpDGgrxPkhenFw
X-Received: by 2002:a2e:9446:0:b0:283:9a0a:a0f7 with SMTP id
 o6-20020a2e9446000000b002839a0aa0f7mr1967698ljh.81.1674518058541; 
 Mon, 23 Jan 2023 15:54:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNP8GPUIGSSJRf1EmIBEmZDEGtcqTHSreBbrxLLxfFznJMgOAqy0X72jFZfRkQokwUrc7DclRouJIA55tCoMM=
X-Received: by 2002:a2e:9446:0:b0:283:9a0a:a0f7 with SMTP id
 o6-20020a2e9446000000b002839a0aa0f7mr1967695ljh.81.1674518058318; Mon, 23 Jan
 2023 15:54:18 -0800 (PST)
MIME-Version: 1.0
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
 <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
 <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
 <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
In-Reply-To: <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 24 Jan 2023 00:54:07 +0100
Message-ID: <CA+hFU4wQ14fn-giuL6oxMmXfg0WPPrXcHHeT5-7tagP54xuXFg@mail.gmail.com>
Subject: Re: [ANNOUNCE] pixfmtdb
To: Simon Ser <contact@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: wayland-devel <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 11:43 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, January 23rd, 2023 at 21:25, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > Why is the TF defined for GL formats and both the primaries and TF for
> > Vulkan formats? The only exception here should be sRGB formats. Where
> > did you get the information from?
>
> This is what upstream dfdutils does [1]. Can you explain why you think
> it should be undefined instead of linear?

The channels have no meaning. You can put whatever you want in there.
It doesn't have to be linear, it doesn't have to be colors and
especially not colors with specific primaries. It's only when it's
used to form an image that the TF and primaries are known. Vulkan
specifically requires you to explicitly provide this information to
the WSI and YCC samplers (generally everywhere where knowing them is
required) and never assumes that certain pixel formats imply certain
TFs and primaries (exception being the sRGB variants).


(See also https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#_issues_26,
Q 23)

The problem here seems to be that the Data Format spec describes more
than the pixel format. If you want to share an image, the TF and
primaries are essential but they are not an inherent part of the pixel
format of the image. So yeah, I think what dfdutils does is...
probably not wrong but not what you're after.

>
> I was wondering what to do for DRM formats regarding these. I think it
> would be worthwhile to do like Vulkan: set TF = linear, primaries =
> BT.709, pre-multiplied alpha = yes. These are the things KMS assume
> when there is no override (ie, when there is no KMS property saying
> otherwise).

Please no. All undefined is absolutely the right thing to do. Adding
any more meaning to pixel formats is a horrible idea. The KMS
properties are also not an override, they describe the image and the
description has default values.

>
> [1]: https://github.com/KhronosGroup/dfdutils/blob/5cd41cbdf63e80b00c085c6906a1152709e4c0f2/createdfd.c#L47
>

