Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED763BE2E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E339889919;
	Tue, 29 Nov 2022 10:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64C89919
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 10:42:35 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3b5d9050e48so131788097b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qiuHOBfLm8xDKPr5NpNi5uPMZ9QumzIsq4ugxTPstn0=;
 b=p050Ok3UGwXLXE9hFcZfGx5Mm2QsWRICxByxDR/1u4QZnbfvFG6psV+emVzskfbk5z
 89tYazSs4E6fwabgM0W6TmEDHClbFJtHSFhF17gcnpdPZS9JRhwCD4sfbWjdpBUVDvE/
 u2MBnXLQuSH1Q7YPq/ELFwZM+RC5st12uCHwg3aflM9OcA4A1oHN3SBT+SzUZYpH1fae
 5Pe4nEYvKmx5YNIpSXyJeyDZ7P7/SxdxnWcN/6yil7BGC9vs426mxusG24I9ipq3Qi5/
 T/j5+TNGI6ORutVEK309xwiJA4pakZDRpDdJpKhCwJt8i1VpsOg9UfGN8bOg2WVeTREb
 0L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qiuHOBfLm8xDKPr5NpNi5uPMZ9QumzIsq4ugxTPstn0=;
 b=jJUes4lRIzAnPjkr4xcYIlofVFlAvAQBAVGjZbGozUT2tS27YO87Z5ZyDnyZx82U2K
 a4nn1YVwNrh2Klv5fHrYUVEJlblaPMGnRmNlezwrZAzAoaqPRMQaWcO6LAMPJXELwuBv
 pFq38ELKxWrmDbnocopUcPN4NVBElpUeAwpJ3IDwhLYg9mlwQn/sx0wxnxXqmzG4lOAr
 qhLx15MKsBLEX8bZ2+Gv8TEyY9aancpG3R8m4htKxLqaFf1oro7qKAgVK13chiuSHaic
 vM0FScUi3FRFbjZTuO74Ud4JKQViVOJev3lbc7tgAxwv2o1K8X6wDhApyO7mnpjU6MEt
 G5hQ==
X-Gm-Message-State: ANoB5pld0lo0LBYDDvixDwlg/DqW1eMSg7fHUuIz/5mdqzaijy7gqxxs
 oRrnoXBdlHM9kp/hkovvPLFn1s9w4ByVr3tuhxtQlQ==
X-Google-Smtp-Source: AA0mqf6wCMf4LDoq0RWeKfC+T4s70dw2fPJdqZS8dpYQD0aDkLZtEaTaRNMR16bUd5fUPv1By3TVsd4xYQae6EVqobc=
X-Received: by 2002:a81:fc5:0:b0:3c3:5496:49f3 with SMTP id
 188-20020a810fc5000000b003c3549649f3mr11914670ywp.510.1669718554975; Tue, 29
 Nov 2022 02:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20221129101030.57499-1-randy.li@synaptics.com>
In-Reply-To: <20221129101030.57499-1-randy.li@synaptics.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 29 Nov 2022 10:42:24 +0000
Message-ID: <CAPj87rOiLoGCnOio7=g9wd4auMuwSQV8PesD3Svf=gOWJAzwOg@mail.gmail.com>
Subject: Re: [RFC] drm/fourcc: Add a modifier for contiguous memory
To: Hsia-Jun Li <randy.li@synaptics.com>
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
Cc: ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 tzimmermann@suse.de, tfiga@chromium.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Tue, 29 Nov 2022 at 10:11, Hsia-Jun Li <randy.li@synaptics.com> wrote:
> Currently, we assume all the pixel formats are multiple planes, devices
> could support each component has its own memory plane.
> But that may not apply for any device in the world. We could have a
> device without IOMMU then this is not impossible.
>
> Besides, when we export an handle through the PRIME, the upstream
> device(likes a capture card or camera) may not support non-contiguous
> memory. It would be better to allocate the handle in contiguous memory
> at the first time.
>
> We may think the memory allocation is done in user space, we could do
> the trick there. But the dumb_create() sometimes is not the right API
> for that.
>
> "Note that userspace is not allowed to use such objects for render
> acceleration - drivers must create their own private ioctls for such a
> use case."
> "Note that dumb objects may not be used for gpu acceleration, as has
> been attempted on some ARM embedded platforms. Such drivers really must
> have a hardware-specific ioctl to allocate suitable buffer objects."
>
> We need to relay on those device custom APIs then. It would be helpful
> for their library to calculate the right size for contiguous memory. It
> would be useful for the driver supports rendering dumb buffer as well.

As a buffer can only have a single modifier, this isn't practical.
Contiguous needs to be negotiated separately and out of band. See e.g.
dma-heaps for this.

Cheers,
Daniel
