Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38814F2E7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 20:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA6D6E233;
	Fri, 31 Jan 2020 19:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2936E233
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 19:44:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so10041888wrw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 11:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RarQJzuUBIgOP/3zXhghNNJqfbcx6d3l7S7iIPaJvjc=;
 b=LBLUVZgDe5TdIfnqY4+d1Q5poOL0kOL7b5L7S2OLpKwwrZxqh/zp3k3X5+HqVtI583
 hIATNc5Ayy3tORPoIInrt86nDxDYkDcSKMDINtlbvWAZNJ/YiRDtrxofXXafJ6Sl6VVw
 DJ/N1R1KEdOzCVEv1SarZO9K1y8DittuGytOzQ4o7LSUrQiC/RxQ6Zc/hVc0t/+0jiQd
 Yg9Xqzl51NbVBJQYzkGg2cALm/ka9e7bWEHZAejMH6rKr4mo0yvbTx7HL2pySM07eEbn
 lAudeyHvvP+kFYC+ieGHfkEpfTszjgV5Q5zChare7EbcpznXDlvmKfpKWldqaGbAA3zn
 hSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RarQJzuUBIgOP/3zXhghNNJqfbcx6d3l7S7iIPaJvjc=;
 b=aKMGyaB0xMSSJuQiUCNY415RF78cT8JzOhwSsfnOOqOoSG2cpLilkYmql5vsFQKTHz
 3PFeZzxEiYR5UPipiPMkM+mAQ0ls7Yp6yCcoUcXXJD1dc0l/atRJVcmFUhTckFS1t90h
 qjzik/wPtKDYW1BGNXHrvgob69CW9cMyY2EIYU/9W4hY48oQ2HCJSHV4ihC4OYuRiAKJ
 BRTm+WzExUzQlHPrrp8Gq6UPAy0hXa9NxxRWkKAJoUNMSOHC011eA6rU+nnneKqz8Vzw
 I2lw4pJBaScgB/Bvj9KIzW/Afj3jbNe1ksPVpLCC/UxeCh7reaZWaKgxtoRwNxHwO5e1
 BBMQ==
X-Gm-Message-State: APjAAAVuoCku8tb6cjFvjtaf/v5nZoJH49woKcxAUyGYwAYhZhhuCMdv
 a/XYV/J6/zshPwaaM6hjbfGckPCqLAXm8VOhvwx7xA==
X-Google-Smtp-Source: APXvYqyJIK0xPmzzhGtkODVfiU1LQvpP2Aex56zsLQORZC3Qmr2Prl0q9p6A+//JinxHypmURBZw6G9AI39FtbmG5lA=
X-Received: by 2002:a5d:608e:: with SMTP id w14mr42139wrt.256.1580499896564;
 Fri, 31 Jan 2020 11:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20200122233617.12725-1-juston.li@intel.com>
 <20200122233617.12725-2-juston.li@intel.com>
In-Reply-To: <20200122233617.12725-2-juston.li@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 31 Jan 2020 19:44:16 +0000
Message-ID: <CAPj87rM1vtDi0BCj9pGtfT9i3UUJtNWwrOSHzQThFS=tG=qPfQ@mail.gmail.com>
Subject: Re: [PATCH v3 libdrm 2/2] Add drmModeGetFB2
To: Juston Li <juston.li@intel.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Juston,

On Thu, 23 Jan 2020 at 00:37, Juston Li <juston.li@intel.com> wrote:
> +drm_public void drmModeFreeFB2(drmModeFB2Ptr ptr)
> +{
> +       if (!ptr)
> +               return;
> +
> +       /* we might add more frees later. */
> +       drmFree(ptr);

I do not recognise this comment, and since free(NULL) is defined to be
safe, this entire function can be defined as drmFree(ptr) without the
comment or early return.

I would like this to be changed before merging. After the revision,
this patch is:
Signed-off-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
