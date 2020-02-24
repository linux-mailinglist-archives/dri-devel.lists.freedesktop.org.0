Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0A16AA03
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 16:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2B36E546;
	Mon, 24 Feb 2020 15:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70F789B06
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 15:26:23 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id y3so3345948uae.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XdsuhHogQeXWeBrPfTpUL8uEnUBH4EoMbjGouTQIvLc=;
 b=DL40WSO6MeeQVER3KNKsJIya7hT7gwx9/yjpAzY7x3144pHHq4XwNAKciTUF8rzMAN
 uoXJEmbQrYKD4+QrdQ1vVSP4k0x5DJrvHx1uEKzrObQ4nwBlSqufUvcxCDxKb+2olRi0
 eJPJ/tGwIQeMxCf1kvJBRxRclKhd6NIEGp4bhkBv17onjAs8ViOlBLgY8j8QNN/TTq2t
 2bk57D6RvhzO79710njDodwE7fQIjzdKM8RuYzYSN0HVcfxfygbtJvp9yQST54J8IPlC
 wzhTI8lXNRAV9z4Yhjro/hkmII1a1UbvIHCdaA6PLrIGGMguZXDqXlbTGuDwNjeF4mXx
 RtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XdsuhHogQeXWeBrPfTpUL8uEnUBH4EoMbjGouTQIvLc=;
 b=WM5+bHzeZCXpuAiSJgdnGmMZo+qBlF5RqNBvlS3ql3J92lRtwBviaGxoXUr7O78x12
 0rMHhPPm5FNWAb6gzu3CNtQEnkRi47rC7naNZcQLfqB/cYcqs8DcMmGVuR7k6eSSPTsc
 Q9x3o6kqWkMUXLgbfTI3mjgXErwmwy61kqz/kIYyphlE5zjbTC6RWcqBCSyjj/1Cgnpw
 nPRFvDzWlhQ1U7T144MDUZUrzqIIJATAPZPMVHP/bax6eJjwuMdoDLAY3todMmd+kAcr
 gXEwee5AK5rZzsiTEe+KRKASs7GZqq+i6GNmvT1qGKK5r6CzTOmoO++OarQnhsznw9Zn
 tOrg==
X-Gm-Message-State: APjAAAUkp0lHC1OyWuIITDzIx4Y8TCvqX399JWLDjPa3ZjSIQS+xAx1Y
 7O20bnl38Il5Z4Zg6XyTsZHEZSyP3GwtydKZ/8pjNnGS
X-Google-Smtp-Source: APXvYqwyam085uKSzpZA5y1scO1q+gcxRMtls2i1I4PMhhVpu4PQNCCjiWwaosU2fN2sRimy3InZxLko5N1prpCfCGc=
X-Received: by 2002:ab0:20a:: with SMTP id 10mr25250256uas.19.1582557982841;
 Mon, 24 Feb 2020 07:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200222152430.2984-4-laurent.pinchart+renesas@ideasonboard.com>
 <20200222175945.GL2363188@phenom.ffwll.local>
In-Reply-To: <20200222175945.GL2363188@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Feb 2020 15:26:05 +0000
Message-ID: <CACvgo53G9-WJyqdBVFFDCwVGkgZmx-WJU1kOuKvLiihWpgFVbg@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/3] drm: rcar_du: Constify drm_driver
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Laurent for sorting this out.

On Sat, 22 Feb 2020 at 17:59, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Feb 22, 2020 at 05:24:30PM +0200, Laurent Pinchart wrote:
> > The drm_driver structure is never modified, make it const. The improves
> > security by avoiding writable function pointers.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> I wonder whether there's some magic somewhere we could do to enlist the
> cocci army to create the constify patches for us ...
>
IIRC some drivers still manually thinker with their struct drm_driver ;-)

That said, the series looks good:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
