Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2D7A24D7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 19:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E650A10E659;
	Fri, 15 Sep 2023 17:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F306C10E651
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694799174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iRbWt1YTt0h4sdUmK03Vi+q52/EZN5SzHkBsDxopwQ=;
 b=biVaaXNg3dY2s0Fcp5PeLWFiePscsdY4wZvaY8ZdVbFCiAVGMGLJD6DahQWdVZPrO4hdGx
 qTrT/Ob4KujIjGtYVijVWmctXzux/E94bVN2f5D45+LTFT+AvSPf0It8KDlp25YW9Dc6Zd
 bYBZJgC4dJi4R76+8mctdM3AzZUw30c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-a8ROaK4NMACgoN1XR3tG4w-1; Fri, 15 Sep 2023 13:32:52 -0400
X-MC-Unique: a8ROaK4NMACgoN1XR3tG4w-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-770538a2946so326810885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694799172; x=1695403972;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3iRbWt1YTt0h4sdUmK03Vi+q52/EZN5SzHkBsDxopwQ=;
 b=uLjMy23JuTOeDd0JkbmmEqVXNLTMV5LnRwJ0B4JFTgz3pPn0T/xdgWwN9+YNj+S1re
 J6Kjl0lwxsYBSjIuyKoTU2nMgUwtB/BnP9kAWk2NPVQxMxj9XJeAo1/vJg+Mp95025s5
 qZqlYBMvBeXLO+p6Zp1g7a9fysJfRiZQuLOU92uqysENQVaXf0E+6PNBwzYdkVNW6DWT
 V0JkondUFj9ClrwkW4jxz9e1Yq6FCi5cmdDVO18S/l35xmayZUHovggNv6t3Ch8p+47d
 y18eqhPk3slYoYhIb1srXYma7K7+3qHF9/9yf1wP+pd8eel4T9+bpenuMbwKV90+5L+o
 ceqA==
X-Gm-Message-State: AOJu0YwYh/tU3n6TZXvHvWx1U4Oc/4M/Pwje8q8jIRmVtDE8PfwPs6YA
 Addt+5FRFGDfyuY+lSpL642HwaoVz49T8pH44mbxZI/7KcDzk3Y6abr4uoqnKGAaz/AwUmniuhJ
 XEZXmZ3+WAsXW0t07jZ2lEgSRY601
X-Received: by 2002:a05:620a:450b:b0:76c:a9fb:6d07 with SMTP id
 t11-20020a05620a450b00b0076ca9fb6d07mr2820429qkp.2.1694799171850; 
 Fri, 15 Sep 2023 10:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBX46w8bl1e85ceIF07jVSYpOO67r7UYVTVMH7Dqpa2+cz1AIiLu9iLVGSZRmJCWMnZIaqw==
X-Received: by 2002:a05:620a:450b:b0:76c:a9fb:6d07 with SMTP id
 t11-20020a05620a450b00b0076ca9fb6d07mr2820408qkp.2.1694799171623; 
 Fri, 15 Sep 2023 10:32:51 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 pa9-20020a05620a830900b00767d572d651sm1364433qkn.87.2023.09.15.10.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:32:51 -0700 (PDT)
Message-ID: <43da274f22acaae8b917f51f6e62376928163e8f.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/pm: refactor deprecated strncpy
From: Lyude Paul <lyude@redhat.com>
To: Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Date: Fri, 15 Sep 2023 13:32:50 -0400
In-Reply-To: <202309142158.59A6C62F@keescook>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
 <202309142158.59A6C62F@keescook>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice catch!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push in just a moment

On Thu, 2023-09-14 at 21:59 -0700, Kees Cook wrote:
> On Thu, Sep 14, 2023 at 10:17:08PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [=
1].
> >=20
> > We should prefer more robust and less ambiguous string interfaces.
> >=20
> > A suitable replacement is `strscpy` [2] due to the fact that it guarant=
ees
> > NUL-termination on the destination buffer without unnecessarily NUL-pad=
ding.
> >=20
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>=20
> The "- 1" use in the original code is strong evidence for this being a
> sane conversion. :)
>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

