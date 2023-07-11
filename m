Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9274EB5E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E5C10E356;
	Tue, 11 Jul 2023 10:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20110E356;
 Tue, 11 Jul 2023 10:03:39 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b8b8de2c6bso4861447a34.0; 
 Tue, 11 Jul 2023 03:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689069818; x=1691661818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+EdWg+i/tz1eYpH9ck9/qmxGmzdGcH8THqJbinUddk=;
 b=NyI0NAaMqg06KA6hwBSQgBEB85LCB8gClAXi9s9KdtyJxX2aBORKelElCulIdppHS6
 B2KpbjTxVS2+wUc9g/u+o+ZwR99AGXRU021BosfNDYuk/lbxfTcwf4poeCIl1pjSfmvJ
 5jkEpuK/djrhv1A7k5tWeHiTtBppXhqwoEPSSNpCFuvfRbFDru0owVW8nZGMH4e28CJA
 37otT/of6vfb688RtJjgE4uuPquRo2iO+FPZYJPBc0xkoWD8nJuSeik7gJXt88UxhuU5
 ynGI8Mdwz40F9nADl3/OzgmP0F+m9xzz5dHEj+Nekn9xjmNXbRk7FYYufVHEanQb1xEP
 DNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689069818; x=1691661818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+EdWg+i/tz1eYpH9ck9/qmxGmzdGcH8THqJbinUddk=;
 b=e/16PJ7OamGAglrnNOrxfjQsyLG9C2/ijSk/0QxqWVNe7/0UvXmPm+88ouF7/mTQAn
 a5qu5eMwM0azjnWzNNOsirAUQu12qiVuEh47WJAqLTTHHqIC+6fcrXrKS7IwkRpxBP3a
 mfy/daolMv98TkL/OR8PSs9q43VV8Ewcdu1cDjGwVDLwsT3QejCKhod47ipei0l8tL8U
 gwpXNMMT7gp8zDETFycd83nD3PwiLx3P7X32XSHyhaAzG4cnmpjgwcprF9/Ohe6QlNE2
 8DdJr00lfL0WCyD9CrDuTa4gaJkKOgX0JRyaJGqLsjJa/iLoqO1Fesg8p0Vc+Lmb1zQP
 GswQ==
X-Gm-Message-State: ABy/qLbNRU+gaZ3k5RsMmFhujozk5oVgO8fp20B7OWrwuRS+5TyNOh9S
 rldfexqVPbwwfClI9bpfB3/ZAtM3NxL0oA5SnRQ=
X-Google-Smtp-Source: APBJJlGGsUuf+V3qoT11Pogf+mqcTAutGtQX8L+sFbR9xMxcqCOg1dWiYkpNfhV8TDJxJAkM3OI/WYW3QCrNv2zauGo=
X-Received: by 2002:a05:6870:420f:b0:1a5:4e57:e5d1 with SMTP id
 u15-20020a056870420f00b001a54e57e5d1mr19457972oac.49.1689069818163; Tue, 11
 Jul 2023 03:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
 <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
 <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
 <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
In-Reply-To: <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Jul 2023 12:03:27 +0200
Message-ID: <CANiq72kg_2PxmSnyj_X7Rak0-fmPP+W-+2EKFjyXCetw7w+mGA@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Robin van der Gracht <robin@protonic.nl>, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> I'd like to take the patchset into drm-misc. It's part of a larger
> cleanup of the fbdev modules and its interfaces.

Sounds good, thanks!

Cheers,
Miguel
