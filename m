Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D685AF6C8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 23:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E76E10EAFB;
	Tue,  6 Sep 2022 21:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E1E10EAFB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 21:27:31 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id 130so13173545ybz.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=OZhi8ZUrZL4q5WcJB62U8kYyW//mZYMgCUiG2KDTe/4=;
 b=odqdvPQkAj/RWdieDgoXHz9tUr/0iwH6Og5cY0gsfZo4BydtaTkHNVKu7uwx/gnG3l
 K7PQHpOIPqSbvxGcqRjRsLShM1kSa9O/49sdn1944IuwTsYtbnwDcVymTPXOdApIVzMc
 Y6qvoY3/OZPAR+RrMPwowGPW8s7YGZmLD5h4zSJobdJQvqWm/IaqWKMbYU4xItWQrtbz
 zDSAbeyrwVwDIR7y5kiuW8e8If5l7mw8Lmor7k0pIqaIUEbU7r8qLbFNy8ORpKPcJOW9
 rOSWQh5mRkiVbsFjSh2AaAIVbx1SngPVL6+EjAYr+8o09XoSNO/WW+Tq26p/HGiqN1Zz
 IRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OZhi8ZUrZL4q5WcJB62U8kYyW//mZYMgCUiG2KDTe/4=;
 b=yy7c1+qMfCxG/cb+egDr8zzg92nc9fuKt7ZPGXN3NDcPR8xxX8Ku8S/t4UjkKSDIlK
 52/hKqrt9ABOo6/GTcmt1cffTTC3wTqFKzLDmDXuoWp7L4yjBvnsv9QcwJHgvP2x5jqj
 aKP6cDneyK4cR27l/0GajIwYxAJM8NJxpg2z8VIjiD4GZ0jZiJBcQ+nlw225icNRNBnn
 VDxTyNdWubnHurLX39Xm7vLS6yYGtfDGs8AnDvx/+iQfpFquU1x+FXhfWYhq7mv/D2ql
 AjE5Sk4mb4s6TfZJmzxUK020EASLw5zxptAPqi1RcBWs6HBpIzCimVHNAqxjXUJyZWqY
 ETUQ==
X-Gm-Message-State: ACgBeo1XnVxihLmKKTx4F6e5MaHwKi9hdprisyWGNBmC2dgDscGeUl/F
 D59QAQM2ArNZ+IZVpnjJTX23NDuch+158Eo7Fwk=
X-Google-Smtp-Source: AA6agR7wf/gc2LuBqbM8UmMdSlmBKmIYqD6S5YaTHXXkssBCDbxPCAhe4HdkuGDEmseN0Yt0wCYEYroDY8MIC846q7U=
X-Received: by 2002:a5b:845:0:b0:683:6ed7:b3b6 with SMTP id
 v5-20020a5b0845000000b006836ed7b3b6mr488653ybq.183.1662499650909; Tue, 06 Sep
 2022 14:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <YxducgSzR6/zyHD7@debian>
In-Reply-To: <YxducgSzR6/zyHD7@debian>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Tue, 6 Sep 2022 22:26:55 +0100
Message-ID: <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
To: Igor Torrente <igormtorrente@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.
>
> The errors in mips and xtensa are:
>
> ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>
> The error in arm is:
>
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>
>
> Trying to do a git bisect to find out the offending commit.

git bisect points to 396369d67549 ("drm: vkms: Add support to the
RGB565 format")


-- 
Regards
Sudip
