Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF6375ABF3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19B110E59F;
	Thu, 20 Jul 2023 10:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F4C10E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:29:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fc03d990daso1013895e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1689848975; x=1690453775;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=55ldkBN7Z9rmeZAoOny3CqxP4h68H/R8XHjCRpEpvaM=;
 b=To/aqJ+AR8e5dWEecXLmVyKzJv7p/eXCLLd8C+JTITCgvgX10gO3bPy9mTfjfApmKC
 pxsQe0Zi0t9ZTJKAnnPaXOSY+2KgC+undQtxxu7OXKGlWVpCoprWFOsxf+W4mnSLiDLC
 pAgi2NsmcZku6fKLA/jCVUWBjUWpmQMelRwLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689848975; x=1690453775;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55ldkBN7Z9rmeZAoOny3CqxP4h68H/R8XHjCRpEpvaM=;
 b=P+vUcpdlE8gLBYC4zZgUxhOMYYnlfttBjaH/LKEGvvQFavdHgl+8xynujy0KtAQ60J
 VkKHYuOHTTxvTBj4b6aRXJd0AQ0IoG4IbMA8MFzaSSou2vsSKXvjxIJ1bp7B0EIhm2a7
 VLXQ6JfM0GulyGPkGTtrf/L/x0LbL5WfuCZRmd29l55bS9YVAYdGTdL/N+UgVsFMnGZn
 uo94pqx9LBpjtxwI13l0BsDknBcnGk9FB6IUufVbeeb/Jabt4szwgbOyt5dDYJ8ISh7M
 4Y9DG4eP/ye+uRtq7maN9QP69PgqE0WCpjHtf9a+Ax9P7SQtAHjaibGKWz17PiKyHEcb
 XHMw==
X-Gm-Message-State: ABy/qLblKx1PLjeeN7XA84MuwF1YMMU80q6OK2HgC66C7t96bvy50GBN
 k0rtxdsTcomj/aNQCk0xttBKzg==
X-Google-Smtp-Source: APBJJlGt+6m30H+euMcgCia5xz8EHhxIYsHnKz/Fj04bqSKh9ChxaTbMBvaixRVxb9X8NJRNSY8UQQ==
X-Received: by 2002:a05:600c:354f:b0:3fa:9587:8fc1 with SMTP id
 i15-20020a05600c354f00b003fa95878fc1mr1968458wmq.1.1689848974989; 
 Thu, 20 Jul 2023 03:29:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a7bcd0e000000b003fc01f7b415sm3582137wmj.39.2023.07.20.03.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 03:29:34 -0700 (PDT)
Date: Thu, 20 Jul 2023 12:29:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH] accel/habanalabs: add more debugfs stub helpers
Message-ID: <ZLkMjL8Aebipv4QR@phenom.ffwll.local>
Mail-Followup-To: Oded Gabbay <ogabbay@kernel.org>,
 Tomer Tayar <ttayar@habana.ai>, Arnd Bergmann <arnd@kernel.org>,
 Ohad Sharabi <osharabi@habana.ai>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Ofir Bitton <obitton@habana.ai>
References: <20230609120636.3969045-1-arnd@kernel.org>
 <b3a3e2f8-51d8-f8ce-95ce-1180f80cc2d2@habana.ai>
 <CAFCwf122kE8sNksXivPA+E=BWzjroKowwqDJrHVMNj-o3oJq0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf122kE8sNksXivPA+E=BWzjroKowwqDJrHVMNj-o3oJq0A@mail.gmail.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: Arnd Bergmann <arnd@kernel.org>, Ohad Sharabi <osharabi@habana.ai>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 11, 2023 at 12:50:31PM +0300, Oded Gabbay wrote:
> On Fri, Jun 9, 2023 at 4:37 PM Tomer Tayar <ttayar@habana.ai> wrote:
> >
> > On 09/06/2023 15:06, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Two functions got added with normal prototypes for debugfs, but not
> > > alternative when building without it:
> > >
> > > drivers/accel/habanalabs/common/device.c: In function 'hl_device_init':
> > > drivers/accel/habanalabs/common/device.c:2177:14: error: implicit declaration of function 'hl_debugfs_device_init'; did you mean 'hl_debugfs_init'? [-Werror=implicit-function-declaration]
> > > drivers/accel/habanalabs/common/device.c:2305:9: error: implicit declaration of function 'hl_debugfs_device_fini'; did you mean 'hl_debugfs_remove_file'? [-Werror=implicit-function-declaration]
> > >
> > > Add stubs for these as well.
> > >
> > > Fixes: 553311fc7b76e ("accel/habanalabs: expose debugfs files later")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks,
> > Reviewed-by: Tomer Tayar <ttayar@habana.ai>
> 
> Thanks,
> Applied to -fixes.

As requested applied to drm-fixes, hopeful for the next one your drm-misc
account issue is fixed.
-Daniel

> Oded
> >
> > > ---
> > >   drivers/accel/habanalabs/common/habanalabs.h | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
> > > index d92ba2e30e310..2f027d5a82064 100644
> > > --- a/drivers/accel/habanalabs/common/habanalabs.h
> > > +++ b/drivers/accel/habanalabs/common/habanalabs.h
> > > @@ -3980,6 +3980,15 @@ static inline void hl_debugfs_fini(void)
> > >   {
> > >   }
> > >
> > > +static inline int hl_debugfs_device_init(struct hl_device *hdev)
> > > +{
> > > +     return 0;
> > > +}
> > > +
> > > +static inline void hl_debugfs_device_fini(struct hl_device *hdev)
> > > +{
> > > +}
> > > +
> > >   static inline void hl_debugfs_add_device(struct hl_device *hdev)
> > >   {
> > >   }
> >
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
