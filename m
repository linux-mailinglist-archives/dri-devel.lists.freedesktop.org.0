Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6B4CAD94
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D69910E234;
	Wed,  2 Mar 2022 18:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B577310E234
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjxXLj8rr6mOagH85zE8xjeRN36BLXJyOv2Vow+3Iko=;
 b=SOBLWlsFreRPM9eDqwcF4muymatDR8dAreRea7oVmdcOiR1GJrdqiSLmCKl0M+dz8WdhoR
 7kN4NCR0FCL3Kcf4JwHjZi8yV4EGhDTccHYjgdD7Ik0aHkf3YkoefxXB67AL/V65ZbSSV8
 Mj6+EH3wg3LO31QvJFu59lQUUKivTuY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-ZoWL4YV_NkiTLd2hsiWAAw-1; Wed, 02 Mar 2022 13:29:36 -0500
X-MC-Unique: ZoWL4YV_NkiTLd2hsiWAAw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so1390294ejc.19
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 10:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjxXLj8rr6mOagH85zE8xjeRN36BLXJyOv2Vow+3Iko=;
 b=kIYQMdoR3qR8u8Lnk2kc6IoJMg2pZadDRlHK5EBernJTuEn0vfo3I+HjZdU9+t1OAw
 jzNUDMeGIK1eQihHFK8nNjA0Moq2d/xRfIaH76jJXr4JZYFckgEJr6V7O2VPD9odeBIb
 NDh0r2wL7rMqrJhId3RnmC6rPYJMehpqNrkb0zQsM/ehqatnKO70VtpPUa8S/qpnB6ox
 s9HsdjTuWJlH79/qkghcVKsgsv4niSs33Q7rxP/qBHV2Nk6IMrm0b87qJM/tM/5B9Ezj
 aJcvk3xtW+G9jab9mzFj7b/qUcJBHDsDupzNZc3HIsCy3J1BMKBpUmbryTUh88B6ev5u
 W9Iw==
X-Gm-Message-State: AOAM530KMi61rVaPdo8QYbDTLYugAJkKYafeufxLamzmk+zRertNpibb
 TTeuDx4fXOmxDbHc4sJr6vkSsHhyEZu1rHH9c+X1pgI2FBjLsT6e+KHrVNWmc+vgwX7J3kY4zJp
 QVYndwLGUWmAafDH7Vzh6iyDUJ7GpssBjCJFFmWgxr1VU
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id
 z14-20020a170906434e00b006d0ed9c68bcmr23152260ejm.70.1646245775075; 
 Wed, 02 Mar 2022 10:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHDUcMifYOCkwoFjllRL4kRy+OwEBd4SDygd8H9xrln/fRsbCeSVG7U4y0FcBBR2l+QPrmM5Lpj1qKYIEzkDQ=
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id
 z14-20020a170906434e00b006d0ed9c68bcmr23152246ejm.70.1646245774790; Wed, 02
 Mar 2022 10:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20220302175309.1098827-1-colin.i.king@gmail.com>
In-Reply-To: <20220302175309.1098827-1-colin.i.king@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 2 Mar 2022 19:29:23 +0100
Message-ID: <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
Subject: Re: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
To: Colin Ian King <colin.i.king@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fmartine@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Colin,

Thanks for the patch.

On Wed, Mar 2, 2022 at 6:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Pointer mode is being assigned a value that is never read, it is
> being re-assigned later with a new value. The initialization is
> redundant and can be removed.
>

Indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

